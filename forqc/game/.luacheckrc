allow_defined_top = true
module = true
codes = true
std = "lua51+lua53+engine+script+manual"
ignore = {
    "211",  -- unused function
    "212",  -- unused argument
    "213",  -- unused loop variable
    "311", -- value assigned to variable is unused
    "6..", -- format
    "542", -- empty if branch

    -- "142", --  setting undefined field ? of global
    -- "143", --  accessing undefined field ? of global
    "411", -- variable was previously defined
    "412", -- variable was previously defined as an argument
    "421", -- shadowing definition of variable
    "422", -- shadowing definition of argument
    "431", -- shadowing upvalue
}

files['script/tools/table_ext.lua'] = {ignore={'122'}}
files['script/tools/string_ext.lua'] = {ignore={'122'}}
files['script/tools/math_ext.lua'] = {ignore={'122'}}
files['script/battle/main.lua'] = {ignore={'111'}}
files['script/common/*.lua'] = {ignore={'142', '122'}}

stds.manual = {
    read_globals = {
        _NAME = {},
        _base = {
            other_fields=true
        },
        template = {},
        DEBUG_SPEED = {},

        config = {
            other_fields = true,
        },
        resmng = {
            other_fields = true,
        },
        DungeonEntry = {
            other_fields = true,
        },
        Rpc = {
            other_fields = true,
        },
        remote = {
            other_fields = true,
            read_only = false,
        },
        event_emitter = {
            fields = {
                new = {},
            }
        },
        behavior_ret = {
            fields = {
                FAIL = {},
                SUCCESS = {},
                RUNNING = {},
            }
        },
        behavior_node = {
            fields = {
                new = {},
            },
        },
        bit = {
            other_fields = true,
        },
        Json = {
            fields = {
                encode = {},
                decode = {},
            }
        },
        CJson = {
            fields = {
                encode = {},
                decode = {},
            }
        },
        lz4 = {
            fields = {
                compress = {},
                decompress = {},
            }
        },
        cmsgpack = {
            fields = {
                pack = {},
                unpack = {},
            }
        },
        entity_updater = {
            other_fields = true,
        },
        act_time_control = {
            fields = {
                new = {},
            },
        },
        gPlys = {
            read_only = false,
            other_fields = true,
        },
        gAccs = {
            read_only = false,
            other_fields = true,
        },
        troop_mng = {
            fields = {
                TROOP_NO_ID = {
                    other_fields = true,
                }
            },
        },
        ltroop_mng = {
            fields = {
                NEED_LTROOP = {
                    other_fields = true,
                },
                LTROOP_NO_REMOVE = {
                    other_fields = true,
                }
            }
        },
        AttackableTroopAction = {
            other_fields = true,
        },
        debug = {
            fields = {
                stack = {},
                settablemark = {},
            },
        },
        formula = {
            fields = {
                SoldierTypeToObjectMode = {
                    other_fields = true,
                },
                ObjectModeGroupMap = {
                    other_fields = true,
                },
                EfNameArm = {
                    other_fields = true,
                },
                EfNameBattleAction = {
                    other_fields = true,
                },
                EfNameTerrainType = {
                    other_fields = true,
                },
                EfNameObject = {
                    other_fields = true,
                },
            },
        },
        formula_node = {
            read_only = false,
            fields = {
                get_atk = {},
                get_hp = {},
                get_attr = {},
                get_damage_rate = {},
                get_hurt_rate_mode = {},
                get_hurt_rate = {},
                get_defense_k = {},
            }
        },
        pbx = {
            fields = {
                compress = {},
                decompress = {},
                init = {},
            }
        },
        ROI_MSG_NAME = {
            other_fields = true,
        },
        RES_TYPE_LV = {
            other_fields = true,
        },
        world = {
            fields = {
                _update_etys = {
                    read_only = false,
                    other_fields = true,
                }
            }
        }
    }
}

stds.engine = {  
    read_globals = {
        engine = {
            fields = {
                CHASE_DIRECTION_INVALID = {},
                CHASE_OUT_OF_RANGE = {},
                CHASE_IN_FAR_RANGE = {},
                CHASE_IN_FIT_RANGE = {},
                CHASE_NOT_DETECTED = {},
                ChaseFlag = {
                    fields = {
                        CHASE_FLAG_FACING = {},
                        CHASE_FLAG_MOVING = {},
                        CHASE_FLAG_USE_DR = {},
                    }
                },
                TerryType = {
                    fields = {
                        TERRY_TYPE_UNION = {},
                    }
                },
            }
        },
        c_set_navlog_switch = {},
        c_line_circle_intersec = {},
        c_get_navroad = {},
        c_get_ety_patrol = {},
        c_set_ety_patrol = {},
        c_alt_troop = {},
        c_get_ety_info = {},
        c_get_ety_props = {},
        c_set_ety_props = {},
        c_sync_ety_data = {},
        c_calc_ety_chase_state = {},
        c_set_nav_gateway = {},
        c_roi_get_province = {},
        c_get_conf = {},
        c_stringify = {},
        c_parse_op = {},
        c_rem_ety = {},
        getMap = {},
        hashStr = {},
        c_set_miwu_data = {},
        c_update_miwu = {},
        c_open_miwu = {},
    },
}

stds.script = {}

local ok, msg = loadfile('.luacheck_globals', 't', _ENV)
if not ok then
    error(msg)
else
    ok()
end
