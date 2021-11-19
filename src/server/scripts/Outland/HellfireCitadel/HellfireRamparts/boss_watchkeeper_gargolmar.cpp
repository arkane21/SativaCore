/*
 * Originally written by Xinef - Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license: https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-AGPL3
*/

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "hellfire_ramparts.h"

enum Says
{
    SAY_TAUNT               = 0,
    SAY_HEAL                = 1,
    SAY_SURGE               = 2,
    SAY_AGGRO               = 3,
    SAY_KILL                = 4,
    SAY_DIE                 = 5
};

enum Spells
{
    SPELL_MORTAL_WOUND      = 30641,
    SPELL_SURGE             = 34645,
    SPELL_SURGE_H           = 42402,
    SPELL_RETALIATION       = 22857,
    SPELL_UNHOLY_FRENZY     = 69052,
    SPELL_JAGGED_KNIFE      = 55550,
};

enum Misc
{
    NPC_HELLFIRE_WATCHER    = 17309,

    EVENT_MORTAL_WOUND      = 1,
    EVENT_SURGE             = 2,
    EVENT_RETALIATION       = 3,
    EVENT_KILL_TALK         = 4,
    EVENT_CHECK_HEALTH      = 5,
    EVENT_FRENZY            = 6,
    EVENT_RETALIATION_A     = 7,
    EVENT_CHECK_HEALTH_B    = 8,
    EVENT_SPELL_JAGGED_KNIFE = 9,

};

class boss_watchkeeper_gargolmar : public CreatureScript
{
public:
    boss_watchkeeper_gargolmar() : CreatureScript("boss_watchkeeper_gargolmar") { }

    struct boss_watchkeeper_gargolmarAI : public BossAI
    {
        boss_watchkeeper_gargolmarAI(Creature* creature) : BossAI(creature, DATA_WATCHKEEPER_GARGOLMAR)
        {
            _taunted = false;
        }

        void Reset()
        {
            BossAI::Reset();
            summons.DespawnAll();
        }

        void EnterCombat(Unit* who)
        {
            Talk(SAY_AGGRO);
            BossAI::EnterCombat(who);
            events.ScheduleEvent(EVENT_MORTAL_WOUND, 5000);
            events.ScheduleEvent(EVENT_SURGE, 3000);
            events.ScheduleEvent(EVENT_CHECK_HEALTH, 1000);
            events.ScheduleEvent(EVENT_CHECK_HEALTH_B, 1000);
            events.ScheduleEvent(EVENT_RETALIATION, 1000);
            events.ScheduleEvent(EVENT_FRENZY, 10000);
            events.ScheduleEvent(EVENT_SPELL_JAGGED_KNIFE, 4000);
        }

        void MoveInLineOfSight(Unit* who)
        {
            if (!_taunted)
            {
                if (who->GetTypeId() == TYPEID_PLAYER)
                {
                    _taunted = true;
                    Talk(SAY_TAUNT);
                }
            }

            BossAI::MoveInLineOfSight(who);
        }

        void KilledUnit(Unit*)
        {
            if (events.GetNextEventTime(EVENT_KILL_TALK) == 0)
            {
                Talk(SAY_KILL);
                events.ScheduleEvent(EVENT_KILL_TALK, 6000);
            }
        }

        void JustDied(Unit* killer)
        {
            Talk(SAY_DIE);
            BossAI::JustDied(killer);
            summons.DespawnAll();
        }
        void JustSummoned(Creature* cr) override
        {
            if (me->IsInCombat())
                cr->SetInCombatWithZone();
            if (cr->GetEntry() == NPC_HELLFIRE_WATCHER)
            {
                cr->SetReactState(REACT_AGGRESSIVE);
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    cr->AI()->AttackStart(target);
            }

            summons.Summon(cr);
        }

        void UpdateAI(uint32 diff)
        {
            if (!UpdateVictim())
                return;

            events.Update(diff);
            if (me->HasUnitState(UNIT_STATE_CASTING))
                return;

            switch (events.ExecuteEvent())
            {
                case EVENT_MORTAL_WOUND:
                    if (IsHeroic())
                    {
                      me->CastSpell(me->GetVictim(), SPELL_MORTAL_WOUND, false);
                      events.ScheduleEvent(EVENT_MORTAL_WOUND, 20000);
                    }
                    else
                    {
                      me->CastSpell(me->GetVictim(), SPELL_MORTAL_WOUND, false);
                      events.ScheduleEvent(EVENT_MORTAL_WOUND, 8000);
                    }
                    break;
                case EVENT_SURGE:
                    Talk(SAY_SURGE);
                    if (IsHeroic())
                    {
                      if (Unit* target = SelectTarget(SELECT_TARGET_FARTHEST, 0))
                        me->CastSpell(target, SPELL_SURGE_H, false);
                        events.ScheduleEvent(EVENT_SURGE, 11000);
                    }
                    else
                    {
                      if (Unit* target = SelectTarget(SELECT_TARGET_FARTHEST, 0))
                        me->CastSpell(target, SPELL_SURGE, false);
                        events.ScheduleEvent(EVENT_SURGE, 11000);
                    }
                    break;
                    case EVENT_SPELL_JAGGED_KNIFE:
                      if (IsHeroic())
                        if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 45.0f))
                          me->CastSpell(target, SPELL_JAGGED_KNIFE, false);
                          events.RepeatEvent(7000);
                        break;
                case EVENT_RETALIATION:
                    if (me->HealthBelowPct(40))
                    {
                        me->CastSpell(me, SPELL_RETALIATION, false);
                        events.ScheduleEvent(EVENT_RETALIATION, 30000);
                        events.ScheduleEvent(EVENT_RETALIATION_A, 25000);
                    }
                    else
                        events.ScheduleEvent(EVENT_RETALIATION, 500);
                    break;
                case EVENT_CHECK_HEALTH:
                    if (me->HealthBelowPct(50))
                    {
                        Talk(SAY_HEAL);
                        me->SummonCreature(NPC_HELLFIRE_WATCHER, me->GetPositionX() + urand(1, 5), me->GetPositionY() + urand(1, 5), me->GetPositionZ(), me->GetOrientation());
                        me->SummonCreature(NPC_HELLFIRE_WATCHER, me->GetPositionX() + urand(1, 5), me->GetPositionY() + urand(1, 5), me->GetPositionZ(), me->GetOrientation());
                        me->SummonCreature(NPC_HELLFIRE_WATCHER, me->GetPositionX() + urand(1, 5), me->GetPositionY() + urand(1, 5), me->GetPositionZ(), me->GetOrientation());
                        std::list<Creature*> clist;
                        me->GetCreaturesWithEntryInRange(clist, 100.0f, NPC_HELLFIRE_WATCHER);
                        for (std::list<Creature*>::const_iterator itr = clist.begin(); itr != clist.end(); ++itr)
                            (*itr)->AI()->SetData(NPC_HELLFIRE_WATCHER, 0);
                        break;
                    }
                    events.ScheduleEvent(EVENT_CHECK_HEALTH, 500);
                    break;
                  case EVENT_RETALIATION_A:
                    me->MonsterTextEmote("Vigía Gargolmar pronto devolvera los ataques", 0, true);
                    break;
                  case EVENT_FRENZY:
                      if (IsHeroic())
                        me->CastSpell(me, SPELL_UNHOLY_FRENZY, true);
                        events.RepeatEvent(urand(8000, 13000));
                        break;
                  case EVENT_CHECK_HEALTH_B:
                        if (me->HealthBelowPct(45))
                        {
                          me->MonsterTextEmote("Vigía Gargolmar pronto devolvera los ataques", 0, true);
                        }
                        else
                            events.ScheduleEvent(EVENT_CHECK_HEALTH_B, 500);
                        break;
            }

            DoMeleeAttackIfReady();
        }

    private:
        bool _taunted;
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_watchkeeper_gargolmarAI(creature);
    }
};

void AddSC_boss_watchkeeper_gargolmar()
{
    new boss_watchkeeper_gargolmar();
}
