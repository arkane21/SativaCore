/*
 * Originally written by Xinef - Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license: https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-AGPL3
*/

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "shattered_halls.h"
#include "Player.h"

enum eGrandWarlockNethekurse
{
    SAY_INTRO                   = 0,
    SAY_PEON_ATTACKED           = 1,
    SAY_PEON_DIES               = 2,
    SAY_TAUNT                   = 3,
    SAY_AGGRO                   = 4,
    SAY_SLAY                    = 5,
    SAY_DIE                     = 6,

    SPELL_DEATH_COIL_N          = 30741,
    SPELL_DEATH_COIL_H          = 46283,
    SPELL_DARK_SPIN             = 30502,
    SPELL_SHADOW_FISSURE        = 30496,
    SPELL_SHADOW_CLEAVE_N       = 30495,
    SPELL_SHADOW_SLAM_H         = 35953,
    SPELL_SHADOW_SEAR           = 30735,
    SPELL_BURNING_FURY          = 66721,
    SPELL_SUMON_INFERNAL        = 34249,
    SPELL_INFERNO_EFFECT        = 22703,
    SPELL_ALLURING              = 29485,

    SETDATA_DATA                = 1,
    SETDATA_PEON_AGGRO          = 1,
    SETDATA_PEON_DEATH          = 2,

    EVENT_STAGE_NONE            = 0,
    EVENT_STAGE_INTRO           = 1,
    EVENT_STAGE_TAUNT           = 2,
    EVENT_STAGE_MAIN            = 3,

    EVENT_INTRO                 = 1,
    EVENT_SPELL_DEATH_COIL      = 2,
    EVENT_SPELL_SHADOW_FISSURE  = 3,
    EVENT_SPELL_CLEAVE          = 4,
    EVENT_CHECK_HEALTH          = 5,
    EVENT_START_ATTACK          = 6,
    EVENT_SHADOW_FISSURE_H      = 7,
    EVENT_SUMON                 = 8,

};

enum Misc
{

  NPC_INFERNAL_DEFENDER        = 20160,

};
// ########################################################
// Grand Warlock Nethekurse
// ########################################################

class boss_grand_warlock_nethekurse : public CreatureScript
{
public:
    boss_grand_warlock_nethekurse() : CreatureScript("boss_grand_warlock_nethekurse") { }

    struct boss_grand_warlock_nethekurseAI : public BossAI
    {
        boss_grand_warlock_nethekurseAI(Creature* creature) : BossAI(creature, DATA_NETHEKURSE) { }

        EventMap events2;
        void Reset()
        {
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            EventStage = EVENT_STAGE_NONE;
            PeonEngagedCount = 0;
            PeonKilledCount = 0;
            _Reset();
            SummonMinions();
            events2.Reset();
        }

        void SummonMinions()
        {
            me->SummonCreature(NPC_FEL_ORC_CONVERT, 172.556f, 258.227f, -13.191f, 1.41189f);
            me->SummonCreature(NPC_FEL_ORC_CONVERT, 165.181f, 261.511f, -13.1926f, 0.942743f);
            me->SummonCreature(NPC_FEL_ORC_CONVERT, 182.482f, 258.635f, -13.1788f, 1.70929f);
            me->SummonCreature(NPC_FEL_ORC_CONVERT, 189.616f, 259.866f, -13.1966f, 1.95748f);
        }

        void JustDied(Unit* /*killer*/)
        {
            Talk(SAY_DIE);
            _JustDied();
        }

        void SetData(uint32 data, uint32 value)
        {
            if (data != SETDATA_DATA)
                return;

            switch (value)
            {
                case SETDATA_PEON_AGGRO:
                    if (PeonEngagedCount >= 4)
                        return;

                    if (EventStage < EVENT_STAGE_TAUNT)
                        Talk(SAY_PEON_ATTACKED);
                    break;
                case SETDATA_PEON_DEATH:
                    if (PeonKilledCount >= 4)
                        return;

                    if (EventStage < EVENT_STAGE_TAUNT)
                        Talk(SAY_PEON_DIES);

                    if (++PeonKilledCount == 4)
                        events2.ScheduleEvent(EVENT_START_ATTACK, 5000);
                    break;
            }
        }

        void AttackStart(Unit* who)
        {
            if (EventStage < EVENT_STAGE_MAIN)
                return;

            if (me->Attack(who, true))
            {
                DoStartMovement(who);
            }
        }

        void JustSummoned(Creature* summon)
        {
            summons.Summon(summon);
            summon->SetReactState(REACT_DEFENSIVE);
            summon->SetRegeneratingHealth(false);

            if (me->IsInCombat())
                summon->SetInCombatWithZone();
            if (summon->GetEntry() == NPC_INFERNAL_DEFENDER)
            {
                summon->SetReactState(REACT_PASSIVE);
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    summon->AI()->AttackStart(target);
            }

            summons.Summon(summon);
        }

        void MoveInLineOfSight(Unit* who)
        {
            if (me->IsWithinDistInMap(who, 30.0f))
            {
                if (who->GetTypeId() != TYPEID_PLAYER)
                    return;

                if (EventStage == EVENT_STAGE_NONE && PeonKilledCount < 4)
                {
                    events2.ScheduleEvent(EVENT_INTRO, 90000);
                    Talk(SAY_INTRO);
                    EventStage = EVENT_STAGE_INTRO;
                    instance->SetBossState(DATA_NETHEKURSE, IN_PROGRESS);
                    me->SetInCombatWithZone();
                }
                else if (PeonKilledCount >= 4)
                {
                    events2.ScheduleEvent(EVENT_START_ATTACK, 1000);
                    instance->SetBossState(DATA_NETHEKURSE, IN_PROGRESS);
                    me->SetInCombatWithZone();
                }
            }

            if (EventStage < EVENT_STAGE_MAIN)
                return;

            ScriptedAI::MoveInLineOfSight(who);
        }

        void EnterCombat(Unit* /*who*/)
        {
        }

        void KilledUnit(Unit* /*victim*/)
        {
            Talk(SAY_SLAY);
        }

        void UpdateAI(uint32 diff)
        {
            events2.Update(diff);
            uint32 eventId = events2.ExecuteEvent();

            if (EventStage < EVENT_STAGE_MAIN && instance->GetBossState(DATA_NETHEKURSE) == IN_PROGRESS)
            {
                if (eventId == EVENT_INTRO)
                {
                    Talk(SAY_TAUNT);
                    EventStage = EVENT_STAGE_TAUNT;
                    me->CastSpell(me, SPELL_SHADOW_SEAR, false);
                }
                else if (eventId == EVENT_START_ATTACK)
                {
                    Talk(SAY_AGGRO);
                    EventStage = EVENT_STAGE_MAIN;
                    me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                    if (Unit* target = me->SelectNearestPlayer(50.0f))
                        AttackStart(target);

                    events.ScheduleEvent(EVENT_SPELL_DEATH_COIL, 12000);
                    events.ScheduleEvent(EVENT_SPELL_SHADOW_FISSURE, 4000);
                    events.ScheduleEvent(EVENT_CHECK_HEALTH, 1000);
                    events.ScheduleEvent(EVENT_SUMON, 15000);
                    return;
                }
            }

            if (!UpdateVictim())
                return;

            events.Update(diff);
            if (EventStage < EVENT_STAGE_MAIN || me->HasUnitState(UNIT_STATE_CASTING))
                return;

            switch (events.ExecuteEvent())
            {
                case EVENT_SPELL_SHADOW_FISSURE:
                  if (IsHeroic())
                    {
                      events.ScheduleEvent(EVENT_SHADOW_FISSURE_H, 1000);
                    }
                    else
                    {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        me->CastSpell(target, SPELL_SHADOW_FISSURE, false);
                    events.RescheduleEvent(EVENT_SPELL_SHADOW_FISSURE, urand(7500, 10000));
                    }
                    break;
                case EVENT_SHADOW_FISSURE_H:
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                      me->CastSpell(target, SPELL_SHADOW_FISSURE, false);
                    events.RescheduleEvent(EVENT_SPELL_SHADOW_FISSURE, 3000);
                    break;
                case EVENT_SPELL_DEATH_COIL:
                    if (IsHeroic())
                    {
                      if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                          me->CastSpell(target, SPELL_DEATH_COIL_H, false);
                          me->CastSpell(me, SPELL_BURNING_FURY, true);
                      events.RescheduleEvent(EVENT_SPELL_DEATH_COIL, 12000);
                      break;
                    }
                    else
                    {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        me->CastSpell(target, SPELL_DEATH_COIL_N, false);
                    events.RescheduleEvent(EVENT_SPELL_DEATH_COIL, urand(15000, 20000));
                    }
                    break;
                case EVENT_SPELL_CLEAVE:
                  if(IsHeroic())
                  {
                    me->CastSpell(me->GetVictim(), SPELL_SHADOW_SLAM_H, false);
                    events.RepeatEvent(urand(6000, 8000));
                  }
                  else
                  {
                    me->CastSpell(me->GetVictim(), SPELL_SHADOW_CLEAVE_N, false);
                    events.RepeatEvent(urand(6000, 8000));
                  }
                    break;
                case EVENT_CHECK_HEALTH:
                    if (me->HealthBelowPct(21))
                    {
                        me->AddAura(SPELL_ALLURING, me);
                        me->CastSpell(me, SPELL_BURNING_FURY, true);
                        me->CastSpell(me, SPELL_BURNING_FURY, true);
                        me->CastSpell(me, SPELL_BURNING_FURY, true);
                        me->CastSpell(me, SPELL_BURNING_FURY, true);
                        me->CastSpell(me, SPELL_BURNING_FURY, true);
                        me->CastSpell(me, SPELL_BURNING_FURY, true);
                        me->CastSpell(me, SPELL_BURNING_FURY, true);
                        me->CastSpell(me, SPELL_BURNING_FURY, true);
                        me->CastSpell(me, SPELL_BURNING_FURY, true);
                        me->CastSpell(me, SPELL_BURNING_FURY, true);

                        me->CastSpell(me, SPELL_DARK_SPIN, false);
                    }
                    else
                    {
                        events.RescheduleEvent(EVENT_CHECK_HEALTH, 1000);
                    }
                    break;
                case EVENT_SUMON:
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 150.0f, true))
                    {
                      me->SetFacingToObject(target);
                      me->CastSpell(target, SPELL_SUMON_INFERNAL, true);
                      me->CastSpell(target, SPELL_INFERNO_EFFECT, true);
                      events.RepeatEvent(20000);
                    }
                    break;
            }
          if (!me->HealthBelowPct(21))
              DoMeleeAttackIfReady();
        }

    private:
        uint32 PeonEngagedCount;
        uint32 PeonKilledCount;
        uint32 EventStage;
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return GetInstanceAI<boss_grand_warlock_nethekurseAI>(creature);
    }
};

class spell_tsh_shadow_sear : public SpellScriptLoader
{
public:
    spell_tsh_shadow_sear() : SpellScriptLoader("spell_tsh_shadow_sear") { }

    class spell_tsh_shadow_sear_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_tsh_shadow_sear_AuraScript);

        void CalculateDamageAmount(AuraEffect const* /*aurEff*/, int32& amount, bool& /*canBeRecalculated*/)
        {
            amount = 2500;
        }

        void Register()
        {
            DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_tsh_shadow_sear_AuraScript::CalculateDamageAmount, EFFECT_0, SPELL_AURA_PERIODIC_DAMAGE);
        }
    };

    AuraScript* GetAuraScript() const
    {
        return new spell_tsh_shadow_sear_AuraScript();
    }
};


class spell_tsh_shadow_bolt : public SpellScriptLoader
{
public:
    spell_tsh_shadow_bolt() : SpellScriptLoader("spell_tsh_shadow_bolt") { }

    class spell_tsh_shadow_bolt_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_tsh_shadow_bolt_SpellScript);

        void SelectRandomPlayer(WorldObject*& target)
        {
            if (Creature* caster = GetCaster()->ToCreature())
            {
                std::list<Player*> playerList;
                Map::PlayerList const& players = caster->GetMap()->GetPlayers();
                for (auto itr = players.begin(); itr != players.end(); ++itr)
                    if (Player* player = itr->GetSource()->ToPlayer())
                        if (player->IsWithinDist(caster, 100.0f) && player->IsAlive())
                            playerList.push_back(player);

                if (!playerList.empty())
                    target = acore::Containers::SelectRandomContainerElement(playerList);
            }
        }

        void Register()
        {
            OnObjectTargetSelect += SpellObjectTargetSelectFn(spell_tsh_shadow_bolt_SpellScript::SelectRandomPlayer, EFFECT_0, TARGET_UNIT_TARGET_ENEMY);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_tsh_shadow_bolt_SpellScript();
    }
};

void AddSC_boss_grand_warlock_nethekurse()
{
    new boss_grand_warlock_nethekurse();
    new spell_tsh_shadow_sear();
    new spell_tsh_shadow_bolt();
}
