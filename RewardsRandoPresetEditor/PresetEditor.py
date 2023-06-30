import tkinter as tk
from tkinter import ttk
import numpy as np
import re as re
from tkinter.filedialog import *
from os import listdir, path


# Initialise the window and prevent resizing
root = tk.Tk()
root.title("Rewards Randomiser Preset Editor v1.2")
image_file = tk.PhotoImage(file='Icon.png')
root.iconphoto(False, image_file)
root.resizable(width=False, height=False)
root.geometry('{}x{}'.format(453, 648))
style = ttk.Style()
style.theme_use()
style.configure("TCombobox", background="white")
style.configure("TEntryBox", background="white")
style.configure("TLabel", background="white")
style.configure("TCheckbutton", background="white")

# Initialise all settings variable
all_settings = {"MissionOrderType": 1, "DisableMusicFix": 1, "HintType": 2, "RemoveUnluckyCards": 1,
                "RandomCardLocations": 1, "BanCars": 1, "BannedCars": "fone_v,smith_v,cHears,gramR_v",
                "PriceMultiplier": "2.5", "RandomBasePrice": 1, "PayForUnlocks": 1, "PayForUnlocksAmount": "100",
                "DisableIngamePopups": 1, "Bingo": 1, "RandomSettings": 1, "RandomRestrictions": 1, "CustomL1": 1,
                "L1M1": "", "L1M2": "", "L1M3": "plowk_v", "L1M4": "", "L1M5": "", "L1M6": "", "L1M7": "",
                "CustomL2": 1, "L2M1": "", "L2M2": "", "L2M3": "", "L2M4": "", "L2M5": "", "L2M6": "mrplo_v",
                "L2M7": "", "CustomL3": 1, "L3M1": "", "L3M2": "", "L3M3": "", "L3M4": "otto_v", "L3M5": "l_cool",
                "L3M6": "", "L3M7": "", "CustomL4": 1, "L4M1": "", "L4M2": "", "L4M3": "m_prison", "L4M4": "",
                "L4M5": "", "L4M6": "m_police", "L4M7": "", "CustomL5": 1, "L5M1": "", "L5M2": "", "L5M3": "carhom_v",
                "L5M4": "a_american", "L5M5": "", "L5M6": "", "L5M7": "", "CustomL6": 1, "L6M1": "", "L6M2": "",
                "L6M3": "", "L6M4": "", "L6M5": "", "L6M6": "scorp_v", "L6M7": "", "CustomL7": 1, "L7M1": "",
                "L7M2": "zombi_v", "L7M3": "", "L7M4": "", "L7M5": "", "L7M6": "", "L7M7": "h_donut,h_evil,h_scuzzy",
                "CanGetMissionRewardsL1": 2, "CanGetMissionRewardsL2": 2, "CanGetMissionRewardsL3": 2,
                "CanGetMissionRewardsL4": 2, "CanGetMissionRewardsL5": 2, "CanGetMissionRewardsL6": 2,
                "CanGetMissionRewardsL7": 2, "CanGetBonusRewardsL1": 2, "CanGetBonusRewardsL2": 2,
                "CanGetBonusRewardsL3": 2, "CanGetBonusRewardsL4": 2, "CanGetBonusRewardsL5": 2,
                "CanGetBonusRewardsL6": 2, "CanGetBonusRewardsL7": 2, "CanGetRaceRewardsL1": 2,
                "CanGetRaceRewardsL2": 2, "CanGetRaceRewardsL3": 2, "CanGetRaceRewardsL4": 2, "CanGetRaceRewardsL5": 2,
                "CanGetRaceRewardsL6": 2, "CanGetRaceRewardsL7": 2, "CanGetNPCRewardsL1": 2, "CanGetNPCRewardsL2": 2,
                "CanGetNPCRewardsL3": 2, "CanGetNPCRewardsL4": 2, "CanGetNPCRewardsL5": 2, "CanGetNPCRewardsL6": 2,
                "CanGetNPCRewardsL7": 2, "CanGetGilRewardsL1": 2, "CanGetGilRewardsL2": 2, "CanGetGilRewardsL3": 2,
                "CanGetGilRewardsL4": 2, "CanGetGilRewardsL5": 2, "CanGetGilRewardsL6": 2, "CanGetGilRewardsL7": 2}



ALL_SETTINGS_EXCEPT_RANDOM_SETTINGS = list(all_settings.keys())
ALL_SETTINGS_EXCEPT_RANDOM_SETTINGS.remove("RandomSettings")
ALL_SETTINGS_EXCEPT_RANDOM_SETTINGS.remove("Bingo")
ALL_SETTINGS_EXCEPT_RANDOM_SETTINGS.remove("DisableIngamePopups")
settings_dependencies = {"RandomSettings": {1: [], 2: ALL_SETTINGS_EXCEPT_RANDOM_SETTINGS},
                         "MissionOrderType": {1: ["DisableMusicFix"], 2: [], 3: []},
                         "HintType": {1: ["RemoveUnluckyCards", "RandomCardLocations"], 2: ["RemoveUnluckyCards"],
                                      3: []},
                         "BanCars": {1: ["BannedCars"], 2: []},
                         "PayForUnlocks": {1: ["PayForUnlocksAmount"], 2: []},
                         "RandomRestrictions": {1: [], 2: ["CustomL1", "CustomL2", "CustomL3", "CustomL4", "CustomL5",
                                                           "CustomL6", "CustomL7"]},
                         "CustomL1": {1: ["L1M1", "L1M2", "L1M3", "L1M4", "L1M5", "L1M6", "L1M7"], 2: []},
                         "CustomL2": {1: ["L2M1", "L2M2", "L2M3", "L2M4", "L2M5", "L2M6", "L2M7"], 2: []},
                         "CustomL3": {1: ["L3M1", "L3M2", "L3M3", "L3M4", "L3M5", "L3M6", "L3M7"], 2: []},
                         "CustomL4": {1: ["L4M1", "L4M2", "L4M3", "L4M4", "L4M5", "L4M6", "L4M7"], 2: []},
                         "CustomL5": {1: ["L5M1", "L5M2", "L5M3", "L5M4", "L5M5", "L5M6", "L5M7"], 2: []},
                         "CustomL6": {1: ["L6M1", "L6M2", "L6M3", "L6M4", "L6M5", "L6M6", "L6M7"], 2: []},
                         "CustomL7": {1: ["L7M1", "L7M2", "L7M3", "L7M4", "L7M5", "L7M6", "L7M7"], 2: []}}

def save_settings(string_generate=False):
    global all_settings
    global settings_dependencies
    output = ""
    excluded_settings = []
    for setting in all_settings.keys():
        if setting in settings_dependencies.keys():
            excluded_settings += settings_dependencies[setting][all_settings[setting]]

    for setting in all_settings.keys():
        if not(setting in excluded_settings):
            if all_settings[setting]=="" and not(string_generate):
                output += f"{setting}=None\n"
            else:
                output += f"{setting}={all_settings[setting]}\n"
    if string_generate:
        return output
    else:
        if path.exists(path.expanduser("~") + "\Documents\My Games\Lucas' Simpsons Hit & Run Mod Launcher\Saved Games\RewardsRando"):
            path_to_save = askdirectory(initialdir=path.expanduser("~") + "\Documents\My Games\Lucas' Simpsons Hit & Run Mod Launcher\Saved Games\RewardsRando")
        else:
            path_to_save = askdirectory()
        if not(path_to_save):
            open_popup("no_save")
            return False
        if not ("Presets.cfg" in listdir(path_to_save)):
            output = "[Preset 1]\n"+output
            for i in range(2, 10):
                output += f"[Preset {i}]\n"+default_settings
            with open(path_to_save+"/Presets.cfg","w") as file:
                file.write(output)
        else:
            global preset_number
            with open(path_to_save+"/Presets.cfg", "r") as file:
                if preset_number != 8:
                    file_data = re.split(f"\[Preset [{preset_number+1}|{preset_number+2}]\]", file.read())
                else:
                    file_data = re.split(f"\[Preset 9\]", file.read())
            file_data[1] = f"[Preset {preset_number+1}]\n"+output

            if len(file_data) == 3:
                output = file_data[0] + file_data[1] + f"[Preset {preset_number+2}]\n"+file_data[2]
            else:
                output = file_data[0] + file_data[1]

            with open(path_to_save+"/Presets.cfg", "w") as file:
                file.write(output)

            open_popup("save")
            load_settings_check(path_to_save)


default_settings = save_settings(True)
default_settings_dictionary = all_settings.copy()


def variable_update_from_dict(settings):
    global all_settings
    settings_to_reset = []
    for setting in ["BannedCars", "PayForUnlocksAmount", "L1M1", "L1M2", "L1M3", "L1M4", "L1M5", "L1M6", "L1M7",
                    "L2M1", "L2M2", "L2M3", "L2M4", "L2M5", "L2M6", "L2M7",
                    "L3M1", "L3M2", "L3M3", "L3M4", "L3M5", "L3M6", "L3M7",
                    "L4M1", "L4M2", "L4M3", "L4M4", "L4M5", "L4M6", "L4M7",
                    "L5M1", "L5M2", "L5M3", "L5M4", "L5M5", "L5M6", "L5M7",
                    "L6M1", "L6M2", "L6M3", "L6M4", "L6M5", "L6M6", "L6M7",
                    "L7M1", "L7M2", "L7M3", "L7M4", "L7M5", "L7M6", "L7M7"]:
        if not(setting in list(settings.keys())):
            settings[setting] = default_settings_dictionary[setting]
            settings_to_reset.append(setting)

    global settings_dependencies
    excluded_settings = []
    for setting in list(settings.keys()):
        if setting in settings_dependencies.keys():
            excluded_settings += settings_dependencies[setting][int(settings[setting])]

    if "RandomSettings" in list(settings.keys()):
        new_value = int(settings["RandomSettings"])
        all_settings["RandomSettings"] = new_value
        RandomSettings.set(new_value)
        random_settings_trigger(random_settings_checkbox)

    if "MissionOrderType" in list(settings.keys()) and not("MissionOrderType" in excluded_settings):
        all_settings["MissionOrderType"] = int(settings["MissionOrderType"])
        new_value = str(int(settings["MissionOrderType"]) - 1)
        mission_order_cb.current(new_value)
        disable_music_fix_check(mission_order_cb)

    if "HintType" in list(settings.keys()) and not("HintType" in excluded_settings):
        all_settings["HintType"] = int(settings["HintType"])
        new_value = str(int(settings["HintType"]) - 1)
        hint_type_cb.current(new_value)
        remove_unlucky_cards_fix(hint_type_cb)

    if "BanCars" in list(settings.keys()) and not("BanCars" in excluded_settings):
        new_value = int(settings["BanCars"])
        all_settings["BanCars"] = new_value
        BanCars.set(new_value)
        variable_update(ban_cars_checkbox, new_value)
        banned_cars_trigger(ban_cars_checkbox)

    if "PayForUnlocks" in list(settings.keys()) and not("PayForUnlocks" in excluded_settings):
        new_value = int(settings["PayForUnlocks"])
        all_settings["PayForUnlocks"] = new_value
        PayForUnlocks.set(new_value)
        pay_for_unlocks_trigger()

    if "RandomRestrictions" in list(settings.keys()) and not("RandomRestrictions" in excluded_settings):
        new_value = int(settings["RandomRestrictions"])
        all_settings["RandomRestrictions"] = new_value
        RandomRestrictions.set(new_value)
        random_restrictions_trigger(random_settings_checkbox)
    if "CustomL1" in list(settings.keys()) and not("CustomL1" in excluded_settings):
        new_value = int(settings["CustomL1"])
        all_settings["CustomL1"] = new_value
        CustomL1.set(new_value)
        custom_l1_trigger(custom_level_1_cb)
    if "CustomL2" in list(settings.keys()) and not("CustomL2" in excluded_settings):
        new_value = int(settings["CustomL2"])
        all_settings["CustomL2"] = new_value
        CustomL2.set(new_value)
        custom_l2_trigger(custom_level_2_cb)
    if "CustomL3" in list(settings.keys()) and not("CustomL3" in excluded_settings):
        new_value = int(settings["CustomL3"])
        all_settings["CustomL3"] = new_value
        CustomL3.set(new_value)
        custom_l3_trigger(custom_level_3_cb)
    if "CustomL4" in list(settings.keys()) and not("CustomL4" in excluded_settings):
        new_value = int(settings["CustomL4"])
        all_settings["CustomL4"] = new_value
        CustomL4.set(new_value)
        custom_l4_trigger(custom_level_4_cb)
    if "CustomL5" in list(settings.keys()) and not("CustomL5" in excluded_settings):
        new_value = int(settings["CustomL5"])
        all_settings["CustomL5"] = new_value
        CustomL5.set(new_value)
        custom_l5_trigger(custom_level_5_cb)
    if "CustomL6" in list(settings.keys()) and not("CustomL6" in excluded_settings):
        new_value = int(settings["CustomL6"])
        all_settings["CustomL6"] = new_value
        CustomL6.set(new_value)
        custom_l6_trigger(custom_level_6_cb)
    if "CustomL7" in list(settings.keys()) and not("CustomL7" in excluded_settings):
        new_value = int(settings["CustomL7"])
        all_settings["CustomL7"] = new_value
        CustomL7.set(new_value)
        custom_l7_trigger(custom_level_7_cb)

    for setting in list(settings.keys()):
        new_value = settings[setting]
        if setting == "DisableMusicFix" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            DisableMusicFix.set(new_value)
            variable_update(disable_music_fix_checkbox, new_value)
        if setting == "RemoveUnluckyCards" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            RemoveUnluckyCards.set(new_value)
            variable_update(remove_unlucky_cards_checkbox, new_value)
        if setting == "RandomCardLocations" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            RandomCardLocations.set(new_value)
            variable_update(random_card_locations_checkbox, new_value)
        if setting == "BannedCars" and (not(setting in excluded_settings) or setting in settings_to_reset):
            BannedCars.set(new_value)
            all_settings[setting] = new_value
            text_variable_update(banned_cars_entry, False, False, new_value)
            banned_cars_trigger(ban_cars_checkbox)
        if setting == "PriceMultiplier" and not(setting in excluded_settings):
            PriceMultiplier.set(new_value)
            all_settings[setting] = new_value
            text_variable_update(price_multiplier_entry, False, False, new_value)
        if setting == "RandomBasePrice" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            RandomBasePrice.set(new_value)
            variable_update(random_base_prices_checkbox, new_value)
        if setting == "PayForUnlocksAmount" and (not(setting in excluded_settings) or setting in settings_to_reset):
            PayForUnlocksAmount.set(new_value)
            all_settings[setting] = new_value
            text_variable_update(pay_for_unlocks_amount_entry, False, False, new_value)
        if setting == "DisableIngamePopups" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            DisableIngamePopups.set(new_value)
            variable_update(disable_ingame_popups_checkbox, new_value)
        if setting == "Bingo" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            Bingo.set(new_value)
            variable_update(bingo_checkbox, new_value)
        if setting == "PresetName":
            all_settings[setting] = new_value
            PresetName.set(new_value)
            text_variable_update(base_preset_name, False, False, new_value)
            text_variable_update(custom_restrictions_preset_name, False, False, new_value)
            text_variable_update(reward_options_preset_name, False, False, new_value)

        if setting == "L1M1" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L1M1.set(new_value)
            print(new_value)
            all_settings[setting] = new_value
        if setting == "L1M2" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L1M2.set(new_value)
            all_settings[setting] = new_value
        if setting == "L1M3" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L1M3.set(new_value)
            all_settings[setting] = new_value
        if setting == "L1M4" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L1M4.set(new_value)
            all_settings[setting] = new_value
        if setting == "L1M5" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L1M5.set(new_value)
            all_settings[setting] = new_value
        if setting == "L1M6" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L1M6.set(new_value)
            all_settings[setting] = new_value
        if setting == "L1M7" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L1M7.set(new_value)
            all_settings[setting] = new_value

        if setting == "L2M1" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L2M1.set(new_value)
            all_settings[setting] = new_value
        if setting == "L2M2" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L2M2.set(new_value)
            all_settings[setting] = new_value
        if setting == "L2M3" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L2M3.set(new_value)
            all_settings[setting] = new_value
        if setting == "L2M4" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L2M4.set(new_value)
            all_settings[setting] = new_value
        if setting == "L2M5" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L2M5.set(new_value)
            all_settings[setting] = new_value
        if setting == "L2M6" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L2M6.set(new_value)
            all_settings[setting] = new_value
        if setting == "L2M7" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L2M7.set(new_value)
            all_settings[setting] = new_value

        if setting == "L3M1" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L3M1.set(new_value)
            all_settings[setting] = new_value
        if setting == "L3M2" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L3M2.set(new_value)
            all_settings[setting] = new_value
        if setting == "L3M3" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L3M3.set(new_value)
            all_settings[setting] = new_value
        if setting == "L3M4" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L3M4.set(new_value)
            all_settings[setting] = new_value
        if setting == "L3M5" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L3M5.set(new_value)
            all_settings[setting] = new_value
        if setting == "L3M6" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L3M6.set(new_value)
            all_settings[setting] = new_value
        if setting == "L3M7" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L3M7.set(new_value)
            all_settings[setting] = new_value

        if setting == "L4M1" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L4M1.set(new_value)
            all_settings[setting] = new_value
        if setting == "L4M2" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L4M2.set(new_value)
            all_settings[setting] = new_value
        if setting == "L4M3" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L4M3.set(new_value)
            all_settings[setting] = new_value
        if setting == "L4M4" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L4M4.set(new_value)
            all_settings[setting] = new_value
        if setting == "L4M5" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L4M5.set(new_value)
            all_settings[setting] = new_value
        if setting == "L4M6" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L4M6.set(new_value)
            all_settings[setting] = new_value
        if setting == "L4M7" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L4M7.set(new_value)
            all_settings[setting] = new_value

        if setting == "L5M1" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L5M1.set(new_value)
            all_settings[setting] = new_value
        if setting == "L5M2" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L5M2.set(new_value)
            all_settings[setting] = new_value
        if setting == "L5M3" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L5M3.set(new_value)
            all_settings[setting] = new_value
        if setting == "L5M4" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L5M4.set(new_value)
            all_settings[setting] = new_value
        if setting == "L5M5" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L5M5.set(new_value)
            all_settings[setting] = new_value
        if setting == "L5M6" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L5M6.set(new_value)
            all_settings[setting] = new_value
        if setting == "L5M7" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L5M7.set(new_value)
            all_settings[setting] = new_value

        if setting == "L6M1" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L6M1.set(new_value)
            all_settings[setting] = new_value
        if setting == "L6M2" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L6M2.set(new_value)
            all_settings[setting] = new_value
        if setting == "L6M3" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L6M3.set(new_value)
            all_settings[setting] = new_value
        if setting == "L6M4" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L6M4.set(new_value)
            all_settings[setting] = new_value
        if setting == "L6M5" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L6M5.set(new_value)
            all_settings[setting] = new_value
        if setting == "L6M6" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L6M6.set(new_value)
            all_settings[setting] = new_value
        if setting == "L6M7" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L6M7.set(new_value)
            all_settings[setting] = new_value

        if setting == "L7M1" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L7M1.set(new_value)
            all_settings[setting] = new_value
        if setting == "L7M2" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L7M2.set(new_value)
            all_settings[setting] = new_value
        if setting == "L7M3" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L7M3.set(new_value)
            all_settings[setting] = new_value
        if setting == "L7M4" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L7M4.set(new_value)
            all_settings[setting] = new_value
        if setting == "L7M5" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L7M5.set(new_value)
            all_settings[setting] = new_value
        if setting == "L7M6" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L7M6.set(new_value)
            all_settings[setting] = new_value
        if setting == "L7M7" and (not(setting in excluded_settings) or setting in settings_to_reset):
            L7M7.set(new_value)
            all_settings[setting] = new_value

        if setting == "CanGetMissionRewardsL1" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetMissionRewardsL1.set(new_value)
            variable_update(level_1_missions_cb, new_value)
        if setting == "CanGetBonusRewardsL1" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetBonusRewardsL1.set(new_value)
            variable_update(level_1_bonus_cb, new_value)
        if setting == "CanGetRaceRewardsL1" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetRaceRewardsL1.set(new_value)
            variable_update(level_1_races_cb, new_value)
        if setting == "CanGetNPCRewardsL1" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetNPCRewardsL1.set(new_value)
            variable_update(level_1_npc_cb, new_value)
        if setting == "CanGetGilRewardsL1" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetGilRewardsL1.set(new_value)
            variable_update(level_1_gil_cb, new_value)

        if setting == "CanGetMissionRewardsL2" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetMissionRewardsL2.set(new_value)
            variable_update(level_2_missions_cb, new_value)
        if setting == "CanGetBonusRewardsL2" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetBonusRewardsL2.set(new_value)
            variable_update(level_2_bonus_cb, new_value)
        if setting == "CanGetRaceRewardsL2" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetRaceRewardsL2.set(new_value)
            variable_update(level_2_races_cb, new_value)
        if setting == "CanGetNPCRewardsL2" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetNPCRewardsL2.set(new_value)
            variable_update(level_2_npc_cb, new_value)
        if setting == "CanGetGilRewardsL2" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetGilRewardsL2.set(new_value)
            variable_update(level_2_gil_cb, new_value)

        if setting == "CanGetMissionRewardsL3" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetMissionRewardsL3.set(new_value)
            variable_update(level_3_missions_cb, new_value)
        if setting == "CanGetBonusRewardsL3" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetBonusRewardsL3.set(new_value)
            variable_update(level_3_bonus_cb, new_value)
        if setting == "CanGetRaceRewardsL3" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetRaceRewardsL3.set(new_value)
            variable_update(level_3_races_cb, new_value)
        if setting == "CanGetNPCRewardsL3" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetNPCRewardsL3.set(new_value)
            variable_update(level_3_npc_cb, new_value)
        if setting == "CanGetGilRewardsL3" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetGilRewardsL3.set(new_value)
            variable_update(level_3_gil_cb, new_value)

        if setting == "CanGetMissionRewardsL4" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetMissionRewardsL4.set(new_value)
            variable_update(level_4_missions_cb, new_value)
        if setting == "CanGetBonusRewardsL4" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetBonusRewardsL4.set(new_value)
            variable_update(level_4_bonus_cb, new_value)
        if setting == "CanGetRaceRewardsL4" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetRaceRewardsL4.set(new_value)
            variable_update(level_4_races_cb, new_value)
        if setting == "CanGetNPCRewardsL4" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetNPCRewardsL4.set(new_value)
            variable_update(level_4_npc_cb, new_value)
        if setting == "CanGetGilRewardsL4" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetGilRewardsL4.set(new_value)
            variable_update(level_4_gil_cb, new_value)

        if setting == "CanGetMissionRewardsL5" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetMissionRewardsL5.set(new_value)
            variable_update(level_5_missions_cb, new_value)
        if setting == "CanGetBonusRewardsL5" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetBonusRewardsL5.set(new_value)
            variable_update(level_5_bonus_cb, new_value)
        if setting == "CanGetRaceRewardsL5" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetRaceRewardsL5.set(new_value)
            variable_update(level_5_races_cb, new_value)
        if setting == "CanGetNPCRewardsL5" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetNPCRewardsL5.set(new_value)
            variable_update(level_5_npc_cb, new_value)
        if setting == "CanGetGilRewardsL5" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetGilRewardsL5.set(new_value)
            variable_update(level_5_gil_cb, new_value)

        if setting == "CanGetMissionRewardsL6" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetMissionRewardsL6.set(new_value)
            variable_update(level_6_missions_cb, new_value)
        if setting == "CanGetBonusRewardsL6" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetBonusRewardsL6.set(new_value)
            variable_update(level_6_bonus_cb, new_value)
        if setting == "CanGetRaceRewardsL6" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetRaceRewardsL6.set(new_value)
            variable_update(level_6_races_cb, new_value)
        if setting == "CanGetNPCRewardsL6" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetNPCRewardsL6.set(new_value)
            variable_update(level_6_npc_cb, new_value)
        if setting == "CanGetGilRewardsL6" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetGilRewardsL6.set(new_value)
            variable_update(level_6_gil_cb, new_value)

        if setting == "CanGetMissionRewardsL7" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetMissionRewardsL7.set(new_value)
            variable_update(level_7_missions_cb, new_value)
        if setting == "CanGetBonusRewardsL7" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetBonusRewardsL7.set(new_value)
            variable_update(level_7_bonus_cb, new_value)
        if setting == "CanGetRaceRewardsL7" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetRaceRewardsL7.set(new_value)
            variable_update(level_7_races_cb, new_value)
        if setting == "CanGetNPCRewardsL7" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetNPCRewardsL7.set(new_value)
            variable_update(level_7_npc_cb, new_value)
        if setting == "CanGetGilRewardsL7" and not(setting in excluded_settings):
            new_value = int(new_value)
            all_settings[setting] = new_value
            CanGetGilRewardsL7.set(new_value)
            variable_update(level_7_gil_cb, new_value)


# Create the Tabs
tabs = ttk.Notebook(root)
settings_tab = ttk.Frame(tabs)
custom_restrictions_tab = ttk.Frame(tabs)
reward_options_tab = ttk.Frame(tabs)

# Name and place the tabs
tabs.add(settings_tab, text='Settings')
tabs.add(custom_restrictions_tab, text='Custom Restrictions')
tabs.add(reward_options_tab, text="Reward Options")
tabs.pack(fill="both")


# Function to update all_settings on each change
def variable_update(self, new_value=False):
    if not(new_value):
        global all_settings
        name = str(self.cget("variable"))
        value = self.getvar(name)
        if value == 0:
            value = 1
        all_settings[name] = value
    else:
        self.var.set(new_value)


def text_variable_update(self, junk1=False, junk2=False, new_value=False):

    if not(new_value):
        global all_settings
        name = str(self.cget("textvariable"))
        value = self.getvar(name)
        all_settings[name] = value
    else:
        self.setvar(new_value)


# SETTINGS TAB

# Initialise canvas for this tab's settings
settings_canvas = tk.Canvas(settings_tab, height=550, width=450, bd=0, highlightthickness=0, background="white")
settings_canvas.grid(row=0, column=0)

# Set up saving and loading canvas for this tab
saving_canvas = tk.Canvas(settings_tab, height=70, width=450, bd=0, highlightthickness=0)
saving_canvas.grid(row=1, column=0)

# Mission Order Box

# Placing the box and it's title
mission_order_label = ttk.Label(settings_canvas, text="Mission Order", justify="left", anchor="w", background="white")
mission_order_label.place(x=10, y=0)
mission_order_border = settings_canvas.create_rectangle(2, 10, 445, 75, outline="lightgrey")

# Mission Order Dropdown Box
mission_order_types = ["Normal", "Reversed", "Random"]
MissionOrderType = tk.StringVar(name="MissionOrderType")
mission_order_cb = ttk.Combobox(settings_canvas, textvariable=MissionOrderType)
mission_order_cb["values"] = mission_order_types
mission_order_cb["state"] = "readonly"

# Set default value and place
mission_order_cb.current(0)
mission_order_cb.place(x=110, y=20)

# Text for this dropdown box
mission_order_text = ttk.Label(settings_canvas, text="Mission Order: ")
mission_order_text.place(x=20, y=20)

# Create and place Disable Music Fix Checkbox
DisableMusicFix = tk.IntVar(name="DisableMusicFix")
disable_music_fix_checkbox = ttk.Checkbutton(settings_canvas, variable=DisableMusicFix, onvalue=2, offvalue=1,
                                             state="disabled",
                                             command=lambda: variable_update(disable_music_fix_checkbox))
disable_music_fix_checkbox.var = DisableMusicFix  # NEEDED!
disable_music_fix_checkbox.place(x=108, y=50)

# Text for this checkbox
disable_music_fix_text = ttk.Label(settings_canvas, text="Disable Mission Music Fix", foreground="grey")
disable_music_fix_text.place(x=128, y=51)


# Function that activates/deactivates disable music fix as needed
def disable_music_fix_check(self):
    global all_settings

    # Gets current value from dropdown box
    mission_order_value = mission_order_cb.current() + 1
    all_settings["MissionOrderType"] = mission_order_value

    # If Normal
    if mission_order_value == 1:
        # Disable the checkbox and change the text to grey
        disable_music_fix_checkbox["state"] = "disabled"
        DisableMusicFix.set(0)
        disable_music_fix_text["foreground"] = "grey"
    else:
        # Activate the checkbox and change text to black
        disable_music_fix_checkbox["state"] = "normal"
        disable_music_fix_text["foreground"] = "black"


# Tracker to see if mission order type dropbox value is changed
mission_order_cb.bind("<<ComboboxSelected>>", disable_music_fix_check)

# Hint Box

# Placing Box and it's title
hint_type_label = ttk.Label(settings_canvas, text="Hints", justify="left", anchor="w")
hint_type_label.place(x=10, y=80)
hint_border = settings_canvas.create_rectangle(2, 90, 445, 180, outline="lightgrey")

# Hint Dropdown Box
hint_types = ["None", "Collect X Cards", "Randomly Dispersed"]
HintType = tk.StringVar(name="HintType")
hint_type_cb = ttk.Combobox(settings_canvas, textvariable=HintType)
hint_type_cb["values"] = hint_types
hint_type_cb["state"] = "readonly"

# Set default value and place
hint_type_cb.current(1)
hint_type_cb.place(x=65, y=100)

# Text for this dropdown box
hint_type_text = ttk.Label(settings_canvas, text="Hints: ")
hint_type_text.place(x=20, y=100)

# Create and place Remove Unlucky Cards Checkbox
RemoveUnluckyCards = tk.IntVar(name="RemoveUnluckyCards")
remove_unlucky_cards_checkbox = ttk.Checkbutton(settings_canvas, variable=RemoveUnluckyCards, onvalue=2, offvalue=1,
                                                state="disabled",
                                                command=lambda: variable_update(remove_unlucky_cards_checkbox))
remove_unlucky_cards_checkbox.var = RemoveUnluckyCards  # NEEDED!
remove_unlucky_cards_checkbox.place(x=64, y=130)

# Text for this checkbox
remove_unlucky_cards_text = ttk.Label(settings_canvas, text="Remove Unlucky Cards", foreground="grey")
remove_unlucky_cards_text.place(x=84, y=131)


# Function that activates/deactives disable music fix as needed
def remove_unlucky_cards_fix(self):

    # Gets current value from dropdown box
    hint_type_value = hint_type_cb.current() + 1
    all_settings["HintType"] = hint_type_value

    # If Normal
    if hint_type_value != 3:
        # Disable the checkbox and change the text to grey
        remove_unlucky_cards_checkbox["state"] = "disabled"
        RemoveUnluckyCards.set(0)
        variable_update(remove_unlucky_cards_checkbox)
        remove_unlucky_cards_text["foreground"] = "grey"
    elif hint_type_value == 3:
        # Activate the checkbox and change text to black
        remove_unlucky_cards_checkbox["state"] = "normal"
        remove_unlucky_cards_text["foreground"] = "black"
    if hint_type_value != 1:
        random_card_locations_checkbox["state"] = "normal"
        random_card_locations_text["foreground"] = "black"
    elif hint_type_value == 1:
        random_card_locations_checkbox["state"] = "disabled"
        random_card_locations_text["foreground"] = "grey"
        RandomCardLocations.set(0)
        variable_update(random_card_locations_checkbox)


# Tracker to see if mission order type dropbox value is changed
hint_type_cb.bind("<<ComboboxSelected>>", remove_unlucky_cards_fix)

# Create and place Random Card Locations
RandomCardLocations = tk.IntVar(name="RandomCardLocations")
random_card_locations_checkbox = ttk.Checkbutton(settings_canvas, variable=RandomCardLocations, onvalue=2, offvalue=1,
                                                 command=lambda: variable_update(random_card_locations_checkbox))
random_card_locations_checkbox.var = RandomCardLocations  # NEEDED!
random_card_locations_checkbox.place(x=64, y=155)

# Text for this checkbox
random_card_locations_text = ttk.Label(settings_canvas, text="Random Card Locations", foreground="black")
random_card_locations_text.place(x=84, y=156)

# Car Modifiers Box


def banned_cars_trigger(self):
    variable_update(self)
    if BanCars.get() == 1:
        banned_cars_entry["state"] = "disabled"
        banned_cars_text["foreground"] = "grey"
    else:
        banned_cars_entry["state"] = "normal"
        banned_cars_text["foreground"] = "black"


# Placing Box and it's title
ban_cars_label = ttk.Label(settings_canvas, text="Car Modifiers", justify="left", anchor="w")
ban_cars_label.place(x=10, y=185)
car_modifier_border = settings_canvas.create_rectangle(2, 195, 445, 255, outline="lightgrey")

# Create and place Ban Cars
BanCars = tk.IntVar(name="BanCars")
ban_cars_checkbox = ttk.Checkbutton(settings_canvas, variable=BanCars, onvalue=2, offvalue=1,
                                    command=lambda: banned_cars_trigger(ban_cars_checkbox))
ban_cars_checkbox.var = BanCars  # NEEDED!
BanCars.set(int(all_settings["BanCars"]))
ban_cars_checkbox.place(x=100, y=200)

# Text for this checkbox
ban_cars_text = ttk.Label(settings_canvas, text="Ban Cars", foreground="black")
ban_cars_text.place(x=120, y=201)

# Create and place BannedCars Entry Box
banned_cars_text = ttk.Label(settings_canvas, text="Banned Cars: ", foreground="grey")
banned_cars_text.place(x=20, y=225)
BannedCars = tk.StringVar(name="BannedCars")
banned_cars_entry = ttk.Entry(settings_canvas, textvariable=BannedCars, state="disabled", width=55)
BannedCars.set("fone_v,smith_v,cHears,gramR_v")
banned_cars_entry.var = BannedCars
banned_cars_entry.place(x=102, y=225)
banned_cars_entry.bind("<FocusOut>", lambda x: text_variable_update(banned_cars_entry))
banned_cars_trigger(ban_cars_checkbox)


# Shop Prices

# Placing Box and it's title
shop_price_label = ttk.Label(settings_canvas, text="Shop Prices", justify="left", anchor="w")
shop_price_label.place(x=10, y=260)
shop_price_border = settings_canvas.create_rectangle(2, 270, 445, 385, outline="lightgrey")


def price_multiplier_trigger(name, index, value):
    if PriceMultiplier.get() and not(PriceMultiplier.get() in ["0.", "-", "0", "."]) and \
            re.search(r"^[0-9.]+$", PriceMultiplier.get()):
        if float(PriceMultiplier.get()) < 0.1:
            PriceMultiplier.set("0.1")
        elif float(PriceMultiplier.get()) > 10:
            PriceMultiplier.set("10")
    elif not(re.search(r"^[0-9]+$", PriceMultiplier.get())) and PriceMultiplier.get():
        PriceMultiplier.set("2.5")


# Create and place PriceMultiplier Entry Box
price_multiplier_text = ttk.Label(settings_canvas, text="Price Multiplier: ", foreground="black")
price_multiplier_text.place(x=20, y=286)
PriceMultiplier = tk.StringVar(name="PriceMultiplier")
price_multiplier_entry = ttk.Entry(settings_canvas, textvariable=PriceMultiplier)
PriceMultiplier.set("2.5")
price_multiplier_entry.var = PriceMultiplier
PriceMultiplier.trace_add("write", price_multiplier_trigger)
price_multiplier_entry.place(x=115, y=285)
price_multiplier_entry.bind("<FocusOut>", lambda x: text_variable_update(price_multiplier_entry))

# Create and place RandomBasePrice
RandomBasePrice = tk.IntVar(name="RandomBasePrice")
random_base_prices_checkbox = ttk.Checkbutton(settings_canvas, variable=RandomBasePrice, onvalue=2, offvalue=1,
                                              command=lambda: variable_update(random_base_prices_checkbox))
random_base_prices_checkbox.var = RandomBasePrice  # NEEDED!
random_base_prices_checkbox.place(x=113, y=310)
random_base_price_text = ttk.Label(settings_canvas, text="Random Base Price", foreground="black")
random_base_price_text.place(x=133, y=311)


def pay_for_unlocks_trigger():
    variable_update(pay_for_unlocks_checkbox)
    if PayForUnlocks.get() == 1:
        pay_for_unlocks_amount_entry["state"] = "disabled"
        pay_for_unlocks_amount_text["foreground"] = "grey"
    else:
        pay_for_unlocks_amount_entry["state"] = "normal"
        pay_for_unlocks_amount_text["foreground"] = "black"


# Create and place PayForUnlocks
PayForUnlocks = tk.IntVar(name="PayForUnlocks")
pay_for_unlocks_checkbox = ttk.Checkbutton(settings_canvas, variable=PayForUnlocks, onvalue=2, offvalue=1,
                                           command=pay_for_unlocks_trigger)
pay_for_unlocks_checkbox.var = PayForUnlocks  # NEEDED!
pay_for_unlocks_checkbox.place(x=113, y=330)
pay_for_unlocks_text = ttk.Label(settings_canvas, text="Pay For Unlocks", foreground="black")
pay_for_unlocks_text.place(x=133, y=331)


def pay_for_unlocks_amount_trigger(name, index, value):
    if PayForUnlocksAmount.get() and not(PayForUnlocksAmount.get() in ["0.", "-", "0"]) and \
            re.search(r"^[0-9.]+$", PayForUnlocksAmount.get()):
        if float(PayForUnlocksAmount.get()) != np.floor(float(PayForUnlocksAmount.get())):
            PayForUnlocksAmount.set(str(np.floor(float(PayForUnlocksAmount.get()))))
    elif not(re.search(r"^[0-9]+$", PayForUnlocksAmount.get())) and PayForUnlocksAmount.get():
        PayForUnlocksAmount.set("100")


# PayForUnlocksAmount Entry Box
pay_for_unlocks_amount_text = ttk.Label(settings_canvas, text="Amount: ", foreground="grey")
pay_for_unlocks_amount_text.place(x=55, y=356)
PayForUnlocksAmount = tk.StringVar(name="PayForUnlocksAmount")
pay_for_unlocks_amount_entry = ttk.Entry(settings_canvas, textvariable=PayForUnlocksAmount, state="disabled")
PayForUnlocksAmount.set("100")
pay_for_unlocks_amount_entry.var = PayForUnlocksAmount
PayForUnlocksAmount.trace_add("write", pay_for_unlocks_amount_trigger)
pay_for_unlocks_amount_entry.place(x=115, y=355)
pay_for_unlocks_amount_entry.bind("<FocusOut>", lambda x: text_variable_update(pay_for_unlocks_amount_entry))


# Miscellaneous Settings

# Placing Box and it's title
ttk.Label(settings_canvas, text="Miscellaneous", justify="left", anchor="w").place(x=10, y=390)
shop_price_border = settings_canvas.create_rectangle(2, 400, 445, 475, outline="lightgrey")

# Create and place DisableIngamePopups
DisableIngamePopups = tk.IntVar(name="DisableIngamePopups")
disable_ingame_popups_checkbox = ttk.Checkbutton(settings_canvas, variable=DisableIngamePopups, onvalue=2, offvalue=1,
                                                 command=lambda: variable_update(disable_ingame_popups_checkbox))
disable_ingame_popups_checkbox.var = DisableIngamePopups  # NEEDED!
disable_ingame_popups_checkbox.place(x=7, y=410)
disable_ingame_popups_text = ttk.Label(settings_canvas, text="Disable In-game popups", foreground="black")
disable_ingame_popups_text.place(x=27, y=411)

# Create and place Bingo
Bingo = tk.IntVar(name="Bingo")
bingo_checkbox = ttk.Checkbutton(settings_canvas, variable=Bingo, onvalue=2, offvalue=1,
                                 command=lambda: variable_update(bingo_checkbox))
bingo_checkbox.var = Bingo  # NEEDED!
bingo_checkbox.place(x=7, y=430)
bingo_text = ttk.Label(settings_canvas, text="Bingo", foreground="black")
bingo_text.place(x=27, y=431)


def random_settings_trigger(self=False):
    if self:
        variable_update(self)

    if RandomSettings.get() == 2:
        # Toggle Mission Order Settings
        mission_order_label["foreground"] = "grey"
        mission_order_cb["state"] = "disabled"
        mission_order_text["foreground"] = "grey"
        MissionOrderType.set("Normal")
        disable_music_fix_check(0)

        # Toggle Hints Settings
        hint_type_text["foreground"] = "grey"
        hint_type_label["foreground"] = "grey"
        hint_type_cb["state"] = "disabled"
        HintType.set("Collect X Cards")
        remove_unlucky_cards_fix(0)
        variable_update(remove_unlucky_cards_checkbox)
        random_card_locations_text["foreground"] = "grey"
        random_card_locations_checkbox["state"] = "disabled"
        variable_update(random_card_locations_checkbox)

        # Car Modifier Settings
        ban_cars_label["foreground"] = "grey"
        ban_cars_text["foreground"] = "grey"
        ban_cars_checkbox["state"] = "disabled"
        BanCars.set(1)
        banned_cars_trigger(ban_cars_checkbox)

        # Shop Prices Settings
        shop_price_label["foreground"] = "grey"
        price_multiplier_text["foreground"] = "grey"
        price_multiplier_entry["state"] = "disabled"
        PriceMultiplier.set("2.5")
        text_variable_update(price_multiplier_entry)
        random_base_price_text["foreground"] = "grey"
        random_base_prices_checkbox["state"] = "disabled"
        variable_update(random_base_prices_checkbox)
        pay_for_unlocks_text["foreground"] = "grey"
        pay_for_unlocks_checkbox["state"] = "disabled"
        PayForUnlocks.set(1)
        variable_update(pay_for_unlocks_checkbox)
        PayForUnlocksAmount.set("100")
        text_variable_update(pay_for_unlocks_amount_entry)
        pay_for_unlocks_trigger()

        # Custom Restrictions Settings
        RandomRestrictions.set(1)
        random_restrictions_trigger(random_restrictions_cb)
        random_restrictions_cb["state"] = "disabled"
        random_restrictions_text["foreground"] = "grey"
        custom_restrictions_overall_settings_text["foreground"] = "grey"

        # Reward Options Settings
        # Level 1
        level_1_rewards_text["foreground"] = "grey"
        level_1_missions_text["foreground"] = "grey"
        level_1_missions_cb["state"] = "disabled"
        level_1_races_text["foreground"] = "grey"
        level_1_races_cb["state"] = "disabled"
        level_1_bonus_text["foreground"] = "grey"
        level_1_bonus_cb["state"] = "disabled"
        level_1_npc_text["foreground"] = "grey"
        level_1_npc_cb["state"] = "disabled"
        level_1_gil_text["foreground"] = "grey"
        level_1_gil_cb["state"] = "disabled"

        # Level 2
        level_2_rewards_text["foreground"] = "grey"
        level_2_missions_text["foreground"] = "grey"
        level_2_missions_cb["state"] = "disabled"
        level_2_races_text["foreground"] = "grey"
        level_2_races_cb["state"] = "disabled"
        level_2_bonus_text["foreground"] = "grey"
        level_2_bonus_cb["state"] = "disabled"
        level_2_npc_text["foreground"] = "grey"
        level_2_npc_cb["state"] = "disabled"
        level_2_gil_text["foreground"] = "grey"
        level_2_gil_cb["state"] = "disabled"

        # Level 3
        level_3_rewards_text["foreground"] = "grey"
        level_3_missions_text["foreground"] = "grey"
        level_3_missions_cb["state"] = "disabled"
        level_3_races_text["foreground"] = "grey"
        level_3_races_cb["state"] = "disabled"
        level_3_bonus_text["foreground"] = "grey"
        level_3_bonus_cb["state"] = "disabled"
        level_3_npc_text["foreground"] = "grey"
        level_3_npc_cb["state"] = "disabled"
        level_3_gil_text["foreground"] = "grey"
        level_3_gil_cb["state"] = "disabled"

        # Level 4
        level_4_rewards_text["foreground"] = "grey"
        level_4_missions_text["foreground"] = "grey"
        level_4_missions_cb["state"] = "disabled"
        level_4_races_text["foreground"] = "grey"
        level_4_races_cb["state"] = "disabled"
        level_4_bonus_text["foreground"] = "grey"
        level_4_bonus_cb["state"] = "disabled"
        level_4_npc_text["foreground"] = "grey"
        level_4_npc_cb["state"] = "disabled"
        level_4_gil_text["foreground"] = "grey"
        level_4_gil_cb["state"] = "disabled"

        # Level 5
        level_5_rewards_text["foreground"] = "grey"
        level_5_missions_text["foreground"] = "grey"
        level_5_missions_cb["state"] = "disabled"
        level_5_races_text["foreground"] = "grey"
        level_5_races_cb["state"] = "disabled"
        level_5_bonus_text["foreground"] = "grey"
        level_5_bonus_cb["state"] = "disabled"
        level_5_npc_text["foreground"] = "grey"
        level_5_npc_cb["state"] = "disabled"
        level_5_gil_text["foreground"] = "grey"
        level_5_gil_cb["state"] = "disabled"

        # Level 6
        level_6_rewards_text["foreground"] = "grey"
        level_6_missions_text["foreground"] = "grey"
        level_6_missions_cb["state"] = "disabled"
        level_6_races_text["foreground"] = "grey"
        level_6_races_cb["state"] = "disabled"
        level_6_bonus_text["foreground"] = "grey"
        level_6_bonus_cb["state"] = "disabled"
        level_6_npc_text["foreground"] = "grey"
        level_6_npc_cb["state"] = "disabled"
        level_6_gil_text["foreground"] = "grey"
        level_6_gil_cb["state"] = "disabled"

        # Level 7
        level_7_rewards_text["foreground"] = "grey"
        level_7_missions_text["foreground"] = "grey"
        level_7_missions_cb["state"] = "disabled"
        level_7_races_text["foreground"] = "grey"
        level_7_races_cb["state"] = "disabled"
        level_7_bonus_text["foreground"] = "grey"
        level_7_bonus_cb["state"] = "disabled"
        level_7_npc_text["foreground"] = "grey"
        level_7_npc_cb["state"] = "disabled"
        level_7_gil_text["foreground"] = "grey"
        level_7_gil_cb["state"] = "disabled"

    elif RandomSettings.get() == 1:
        # Toggle Mission Order Settings
        mission_order_label["foreground"] = "black"
        mission_order_cb["state"] = "normal"
        mission_order_text["foreground"] = "black"

        # Toggle Hints Settings
        hint_type_text["foreground"] = "black"
        hint_type_label["foreground"] = "black"
        hint_type_cb["state"] = "normal"
        random_card_locations_text["foreground"] = "black"
        random_card_locations_checkbox["state"] = "normal"

        # Car Modifier Settings
        ban_cars_label["foreground"] = "black"
        ban_cars_text["foreground"] = "black"
        ban_cars_checkbox["state"] = "normal"

        # Shop Prices Settings
        shop_price_label["foreground"] = "black"
        price_multiplier_text["foreground"] = "black"
        price_multiplier_entry["state"] = "normal"
        random_base_price_text["foreground"] = "black"
        random_base_prices_checkbox["state"] = "normal"
        pay_for_unlocks_text["foreground"] = "black"
        pay_for_unlocks_checkbox["state"] = "normal"

        # Custom Restrictions Settings
        random_restrictions_trigger(random_restrictions_cb)
        random_restrictions_cb["state"] = "normal"
        random_restrictions_text["foreground"] = "black"
        custom_restrictions_overall_settings_text["foreground"] = "black"

        # Reward Options Settings
        # Level 1
        level_1_rewards_text["foreground"] = "black"
        level_1_missions_text["foreground"] = "black"
        level_1_missions_cb["state"] = "normal"
        level_1_races_text["foreground"] = "black"
        level_1_races_cb["state"] = "normal"
        level_1_bonus_text["foreground"] = "black"
        level_1_bonus_cb["state"] = "normal"
        level_1_npc_text["foreground"] = "black"
        level_1_npc_cb["state"] = "normal"
        level_1_gil_text["foreground"] = "black"
        level_1_gil_cb["state"] = "normal"

        # Level 2
        level_2_rewards_text["foreground"] = "black"
        level_2_missions_text["foreground"] = "black"
        level_2_missions_cb["state"] = "normal"
        level_2_races_text["foreground"] = "black"
        level_2_races_cb["state"] = "normal"
        level_2_bonus_text["foreground"] = "black"
        level_2_bonus_cb["state"] = "normal"
        level_2_npc_text["foreground"] = "black"
        level_2_npc_cb["state"] = "normal"
        level_2_gil_text["foreground"] = "black"
        level_2_gil_cb["state"] = "normal"

        # Level 3
        level_3_rewards_text["foreground"] = "black"
        level_3_missions_text["foreground"] = "black"
        level_3_missions_cb["state"] = "normal"
        level_3_races_text["foreground"] = "black"
        level_3_races_cb["state"] = "normal"
        level_3_bonus_text["foreground"] = "black"
        level_3_bonus_cb["state"] = "normal"
        level_3_npc_text["foreground"] = "black"
        level_3_npc_cb["state"] = "normal"
        level_3_gil_text["foreground"] = "black"
        level_3_gil_cb["state"] = "normal"

        # Level 4
        level_4_rewards_text["foreground"] = "black"
        level_4_missions_text["foreground"] = "black"
        level_4_missions_cb["state"] = "normal"
        level_4_races_text["foreground"] = "black"
        level_4_races_cb["state"] = "normal"
        level_4_bonus_text["foreground"] = "black"
        level_4_bonus_cb["state"] = "normal"
        level_4_npc_text["foreground"] = "black"
        level_4_npc_cb["state"] = "normal"
        level_4_gil_text["foreground"] = "black"
        level_4_gil_cb["state"] = "normal"

        # Level 5
        level_5_rewards_text["foreground"] = "black"
        level_5_missions_text["foreground"] = "black"
        level_5_missions_cb["state"] = "normal"
        level_5_races_text["foreground"] = "black"
        level_5_races_cb["state"] = "normal"
        level_5_bonus_text["foreground"] = "black"
        level_5_bonus_cb["state"] = "normal"
        level_5_npc_text["foreground"] = "black"
        level_5_npc_cb["state"] = "normal"
        level_5_gil_text["foreground"] = "black"
        level_5_gil_cb["state"] = "normal"

        # Level 6
        level_6_rewards_text["foreground"] = "black"
        level_6_missions_text["foreground"] = "black"
        level_6_missions_cb["state"] = "normal"
        level_6_races_text["foreground"] = "black"
        level_6_races_cb["state"] = "normal"
        level_6_bonus_text["foreground"] = "black"
        level_6_bonus_cb["state"] = "normal"
        level_6_npc_text["foreground"] = "black"
        level_6_npc_cb["state"] = "normal"
        level_6_gil_text["foreground"] = "black"
        level_6_gil_cb["state"] = "normal"

        # Level 7
        level_7_rewards_text["foreground"] = "black"
        level_7_missions_text["foreground"] = "black"
        level_7_missions_cb["state"] = "normal"
        level_7_races_text["foreground"] = "black"
        level_7_races_cb["state"] = "normal"
        level_7_bonus_text["foreground"] = "black"
        level_7_bonus_cb["state"] = "normal"
        level_7_npc_text["foreground"] = "black"
        level_7_npc_cb["state"] = "normal"
        level_7_gil_text["foreground"] = "black"
        level_7_gil_cb["state"] = "normal"


# Create and place RandomSettings
RandomSettings = tk.IntVar(name="RandomSettings")
random_settings_checkbox = ttk.Checkbutton(settings_canvas, variable=RandomSettings, onvalue=2, offvalue=1,
                                           command=lambda: random_settings_trigger(random_settings_checkbox))
random_settings_checkbox.var = RandomSettings  # NEEDED!
random_settings_checkbox.place(x=7, y=450)
random_settings_text = ttk.Label(settings_canvas, text="Random Settings", foreground="black")
random_settings_text.place(x=27, y=451)


def create_file(file_path, sub_window):
    with open(file_path+"/Presets.cfg", "w") as file:
        file.write("[Preset 1]\n"+default_settings+"[Preset 2]\n"+default_settings+"[Preset 3]\n"+default_settings +
                   "[Preset 4]\n"+default_settings+"[Preset 5]\n"+default_settings+"[Preset 6]\n"+default_settings +
                   "[Preset 7]\n"+default_settings+"[Preset 8]\n"+default_settings+"[Preset 9]\n"+default_settings)
        sub_window.destroy()
        load_settings_check(file_path)

# FIX THIS TO TELL PERSON NO FILE EXISTS AND ASK IF THEY WANT ONE CREATED IN THIS FOLDER
def open_popup(case, file_path=False):
    top=tk.Toplevel(root)
    top.geometry("300x100")
    top.title("Warning")
    if case == "load":
        ttk.Label(top,
                  text="There is currently no preset file in that location.\nWould you like to create one?",
                  justify=tk.CENTER,
                  background="SystemButtonFace").place(x=20, y=10)
        ttk.Button(top, text="Yes", command=lambda: create_file(file_path, top)).place(x=40, y=60)

        def disable_window():
            top.destroy()

        ttk.Button(top, text="No", command=disable_window).place(x=180, y=60)
    elif case == "no_load":
        ttk.Label(top,
                  text="Loading failed as you did not provide a valid file path", justify=tk.CENTER,
                  background="SystemButtonFace").place(x=15, y=40)
    elif case == "no_save":
        ttk.Label(top,
                  text="Saving failed as you did not provide a valid file path", justify=tk.CENTER,
                  background="SystemButtonFace").place(x=15, y=40)
    elif case == "save":
        ttk.Label(top,
                  text="Saving completed!", justify=tk.CENTER,
                  background="SystemButtonFace").place(x=100, y=40)

def load_settings_check(path_to_load=False, canvas=saving_canvas):
    if not(path_to_load):
        if path.exists(path.expanduser("~") + "\Documents\My Games\Lucas' Simpsons Hit & Run Mod Launcher\Saved Games\RewardsRando"):
            path_to_load = askdirectory(initialdir=path.expanduser("~") + "\Documents\My Games\Lucas' Simpsons Hit & Run Mod Launcher\Saved Games\RewardsRando")
        else:
            path_to_load = askdirectory()
    if not (path_to_load):
        open_popup("no_load")
        return False
    if not("Presets.cfg" in listdir(path_to_load)):
        open_popup("load", path_to_load)
        return False
    else:
        file_location = path_to_load + "/Presets.cfg"
        with open(file_location) as file:
            file_data = file.read()
        global preset_names
        global preset_data
        preset_names = []
        for line in re.split(r"\n", file_data):
            if re.search(r"\[Preset", line):
                if line != "[Preset 1]":
                    preset_data[preset_names[-1]] = current_data
                preset_names.append(line[1:-1])
                current_data = {}
            elif re.search(r"PresetName=", line):
                preset_names[-1] = line[11:]
                [variable, value] = re.split(r"=", line)
                if value == "None":
                    value = ""
                current_data[variable] = value
            elif len(re.split(r"=", line)) == 2:
                [variable, value] = re.split(r"=", line)
                if value == "None":
                    value=""
                current_data[variable] = value
        preset_data[preset_names[-1]] = current_data
        global current_loaded_combobox
        global custom_restrictions_current_loaded_combobox
        global reward_options_current_loaded_combobox
        current_loaded_combobox["values"] = preset_names
        custom_restrictions_current_loaded_combobox["values"] = preset_names
        reward_options_current_loaded_combobox["values"] = preset_names



base_saving_button = ttk.Button(saving_canvas, text="Save", command=save_settings)
base_saving_button.place(x=350, y=10)
base_loading_button = ttk.Button(saving_canvas, text="Load", command=load_settings_check)
base_loading_button.place(x=250, y=10)


PresetName = tk.StringVar(name="PresetName")
base_preset_name_text = ttk.Label(saving_canvas, text="Preset Name: ", foreground="black",
                                  background="SystemButtonFace")
base_preset_name_text.place(x=10, y=10)
base_preset_name = ttk.Entry(saving_canvas, textvariable=PresetName)
base_preset_name.var = PresetName
base_preset_name.place(x=90, y=11)
PresetName.set("Enter Name")
base_preset_name.bind("<FocusOut>", lambda x: text_variable_update(base_preset_name))

current_loaded_text = ttk.Label(saving_canvas, text="Current Settings: ", foreground="black",
                                  background="SystemButtonFace")
current_loaded_text.place(x=10, y=40)

CurrentPreset = tk.StringVar(name="CurrentPreset")
current_loaded_combobox = ttk.Combobox(saving_canvas, textvariable=CurrentPreset)
current_loaded_combobox["values"] = []
current_loaded_combobox["state"] = "readonly"
current_loaded_combobox.place(x=110, y=40)
preset_data = {}

def preset_changed(event):
    global preset_number
    preset_number = current_loaded_combobox.current()
    variable_update_from_dict(preset_data[preset_names[preset_number]])

# Tracker to see if current preset dropbox value is changed
current_loaded_combobox.bind("<<ComboboxSelected>>", preset_changed)



# CUSTOM RESTRICTIONS TAB

# Create main frame for whole tab
custom_restrictions_main_frame = ttk.Frame(custom_restrictions_tab, height=550, width=430, borderwidth=1,
                                           relief="solid")
custom_restrictions_main_frame.grid(row=0, column=0)

# Create main canvas to store settings info
custom_restrictions_main_canvas = tk.Canvas(custom_restrictions_main_frame, bd=0,
                                            highlightthickness=0, scrollregion=(0, 0, 525, 1655), background="white")

# Create scrollbar for main canvas
custom_restrictions_scrollbar = ttk.Scrollbar(custom_restrictions_main_frame, orient='vertical')
custom_restrictions_scrollbar.pack(side="right", fill="y")
custom_restrictions_scrollbar.config(command=custom_restrictions_main_canvas.yview)  # Set which canvas to scroll

# Reconfigure main canvas to add scrollbar capabilities and add to main frame
custom_restrictions_main_canvas.config(width=430, height=550)
custom_restrictions_main_canvas.config(yscrollcommand=custom_restrictions_scrollbar.set)
custom_restrictions_main_canvas.pack(side="left", expand=True, fill="both")

# Create a subframe with the main canvas for settings
custom_restrictions_frame = ttk.Frame(custom_restrictions_main_canvas)

# Create a canvas to go on that frame so components can be easily added
custom_restrictions_canvas = tk.Canvas(custom_restrictions_frame, height=1655, width=425, bd=0, highlightthickness=0,
                                       background="white")

# Set up saving and loading canvas for this tab
custom_restrictions_saving_canvas = tk.Canvas(custom_restrictions_tab, height=70, width=425, bd=0, highlightthickness=0)
custom_restrictions_saving_canvas.grid(row=1, column=0)

# Save/Load Button + interface
custom_restrictions_saving_button = ttk.Button(custom_restrictions_saving_canvas, text="Save", command=save_settings)
custom_restrictions_saving_button.place(x=350, y=10)
custom_restrictions_loading_button = ttk.Button(custom_restrictions_saving_canvas, text="Load",
                                                command=lambda: load_settings_check(False,
                                                                                    custom_restrictions_saving_canvas))
custom_restrictions_loading_button.place(x=250, y=10)


PresetName = tk.StringVar(name="PresetName")
custom_restrictions_preset_name_text = ttk.Label(custom_restrictions_saving_canvas, text="Preset Name: ",
                                                 foreground="black", background="SystemButtonFace")
custom_restrictions_preset_name_text.place(x=10, y=10)
custom_restrictions_preset_name = ttk.Entry(custom_restrictions_saving_canvas, textvariable=PresetName)
custom_restrictions_preset_name.var = PresetName
custom_restrictions_preset_name.place(x=90, y=11)
PresetName.set("Enter Name")
custom_restrictions_preset_name.bind("<FocusOut>", lambda x: text_variable_update(custom_restrictions_preset_name))

custom_restrictions_current_loaded_text = ttk.Label(custom_restrictions_saving_canvas, text="Current Settings: ",
                                                     foreground="black" ,background="SystemButtonFace")
custom_restrictions_current_loaded_text.place(x=10, y=40)

custom_restrictions_current_loaded_combobox = ttk.Combobox(custom_restrictions_saving_canvas,
                                                           textvariable=CurrentPreset)
custom_restrictions_current_loaded_combobox.var = CurrentPreset
custom_restrictions_current_loaded_combobox["values"] = []
custom_restrictions_current_loaded_combobox["state"] = "readonly"
custom_restrictions_current_loaded_combobox.place(x=110, y=40)

custom_restrictions_current_loaded_combobox.bind("<<ComboboxSelected>>", preset_changed)

# Overall Settings

# Placing Box and its title
custom_restrictions_overall_settings_text = ttk.Label(custom_restrictions_canvas, text="Overall Settings",
                                                      justify="left", anchor="w")
custom_restrictions_overall_settings_text.place(x=10, y=0)
overall_settings_border = custom_restrictions_canvas.create_rectangle(2, 10, 424, 45, outline="lightgrey")


def random_restrictions_trigger(self):
    variable_update(self)

    if RandomRestrictions.get() == 2 or RandomSettings.get() == 2:
        level_1_text["foreground"] = "grey"
        custom_level_1_cb["state"] = "disabled"
        custom_level_1_text["foreground"] = "grey"
        CustomL1.set(1)
        custom_l1_trigger(custom_level_1_cb)

        level_2_text["foreground"] = "grey"
        custom_level_2_cb["state"] = "disabled"
        custom_level_2_text["foreground"] = "grey"
        CustomL2.set(1)
        custom_l2_trigger(custom_level_2_cb)

        level_3_text["foreground"] = "grey"
        custom_level_3_cb["state"] = "disabled"
        custom_level_3_text["foreground"] = "grey"
        CustomL3.set(1)
        custom_l3_trigger(custom_level_3_cb)

        level_4_text["foreground"] = "grey"
        custom_level_4_cb["state"] = "disabled"
        custom_level_4_text["foreground"] = "grey"
        CustomL4.set(1)
        custom_l4_trigger(custom_level_4_cb)

        level_5_text["foreground"] = "grey"
        custom_level_5_cb["state"] = "disabled"
        custom_level_5_text["foreground"] = "grey"
        CustomL5.set(1)
        custom_l5_trigger(custom_level_5_cb)

        level_6_text["foreground"] = "grey"
        custom_level_6_cb["state"] = "disabled"
        custom_level_6_text["foreground"] = "grey"
        CustomL6.set(1)
        custom_l6_trigger(custom_level_6_cb)

        level_7_text["foreground"] = "grey"
        custom_level_7_cb["state"] = "disabled"
        custom_level_7_text["foreground"] = "grey"
        CustomL7.set(1)
        custom_l7_trigger(custom_level_7_cb)

    elif RandomRestrictions.get() == 1:
        level_1_text["foreground"] = "black"
        custom_level_1_cb["state"] = "normal"
        custom_level_1_text["foreground"] = "black"

        level_2_text["foreground"] = "black"
        custom_level_2_cb["state"] = "normal"
        custom_level_2_text["foreground"] = "black"

        level_3_text["foreground"] = "black"
        custom_level_3_cb["state"] = "normal"
        custom_level_3_text["foreground"] = "black"

        level_4_text["foreground"] = "black"
        custom_level_4_cb["state"] = "normal"
        custom_level_4_text["foreground"] = "black"

        level_5_text["foreground"] = "black"
        custom_level_5_cb["state"] = "normal"
        custom_level_5_text["foreground"] = "black"

        level_6_text["foreground"] = "black"
        custom_level_6_cb["state"] = "normal"
        custom_level_6_text["foreground"] = "black"

        level_7_text["foreground"] = "black"
        custom_level_7_cb["state"] = "normal"
        custom_level_7_text["foreground"] = "black"


# Randomise Restrictions
RandomRestrictions = tk.IntVar(name="RandomRestrictions")
random_restrictions_cb = ttk.Checkbutton(custom_restrictions_canvas, variable=RandomRestrictions, onvalue=2,
                                         offvalue=1,
                                         command=lambda: random_restrictions_trigger(random_restrictions_cb))
random_restrictions_cb.var = RandomRestrictions  # NEEDED!
random_restrictions_cb.place(x=7, y=20)
random_restrictions_text = ttk.Label(custom_restrictions_canvas, text="Randomise Forced Purchaseables",
                                     foreground="black")
random_restrictions_text.place(x=27, y=21)


# Level 1

# Placing Box and its title
level_1_text = ttk.Label(custom_restrictions_canvas, text="Level 1", justify="left", anchor="w")
level_1_text.place(x=10, y=50)
level_1_border = custom_restrictions_canvas.create_rectangle(2, 60, 424, 270, outline="lightgrey")


# CustomL1 Function
def custom_l1_trigger(self):

    variable_update(self)

    if CustomL1.get() == 1:
        l1m1_entry["state"] = "disabled"
        l1m1_text["foreground"] = "grey"
        l1m2_entry["state"] = "disabled"
        l1m2_text["foreground"] = "grey"
        l1m3_entry["state"] = "disabled"
        l1m3_text["foreground"] = "grey"
        l1m4_entry["state"] = "disabled"
        l1m4_text["foreground"] = "grey"
        l1m5_entry["state"] = "disabled"
        l1m5_text["foreground"] = "grey"
        l1m6_entry["state"] = "disabled"
        l1m6_text["foreground"] = "grey"
        l1m7_entry["state"] = "disabled"
        l1m7_text["foreground"] = "grey"
    elif CustomL1.get() == 2:
        l1m1_entry["state"] = "normal"
        l1m1_text["foreground"] = "black"
        l1m2_entry["state"] = "normal"
        l1m2_text["foreground"] = "black"
        l1m3_entry["state"] = "normal"
        l1m3_text["foreground"] = "black"
        l1m4_entry["state"] = "normal"
        l1m4_text["foreground"] = "black"
        l1m5_entry["state"] = "normal"
        l1m5_text["foreground"] = "black"
        l1m6_entry["state"] = "normal"
        l1m6_text["foreground"] = "black"
        l1m7_entry["state"] = "normal"
        l1m7_text["foreground"] = "black"


# CustomL1
CustomL1 = tk.IntVar(name="CustomL1")
custom_level_1_cb = ttk.Checkbutton(custom_restrictions_canvas, variable=CustomL1, onvalue=2, offvalue=1,
                                    command=lambda: custom_l1_trigger(custom_level_1_cb))
CustomL1.set(all_settings["CustomL1"])
custom_level_1_cb.var = CustomL1  # NEEDED!
custom_level_1_cb.place(x=74, y=70)
custom_level_1_text = ttk.Label(custom_restrictions_canvas, text="Custom Restrictions for Level 1", foreground="black")
custom_level_1_text.place(x=94, y=71)

# Create and place Entry Boxes for Level 1
l1m1_text = ttk.Label(custom_restrictions_canvas, text="Mission 1: ", foreground="grey")
l1m1_text.place(x=10, y=95)
L1M1 = tk.StringVar(name="L1M1")
l1m1_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L1M1, state="disabled", width=55)
l1m1_entry.var = L1M1
l1m1_entry.place(x=75, y=95)
l1m1_entry.bind("<FocusOut>", lambda x: text_variable_update(l1m1_entry))


l1m2_text = ttk.Label(custom_restrictions_canvas, text="Mission 2: ", foreground="grey")
l1m2_text.place(x=10, y=120)
L1M2 = tk.StringVar(name="L1M2")
l1m2_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L1M2, state="disabled", width=55)
l1m2_entry.var = L1M2
l1m2_entry.place(x=75, y=120)
l1m2_entry.bind("<FocusOut>", lambda x: text_variable_update(l1m2_entry))

l1m3_text = ttk.Label(custom_restrictions_canvas, text="Mission 3: ", foreground="grey")
l1m3_text.place(x=10, y=145)
L1M3 = tk.StringVar(name="L1M3")
l1m3_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L1M3, state="disabled", width=55)
l1m3_entry.var = L1M3
l1m3_entry.place(x=75, y=145)
L1M3.set("plowk_v")
l1m3_entry.bind("<FocusOut>", lambda x: text_variable_update(l1m3_entry))

l1m4_text = ttk.Label(custom_restrictions_canvas, text="Mission 4: ", foreground="grey")
l1m4_text.place(x=10, y=170)
L1M4 = tk.StringVar(name="L1M4")
l1m4_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L1M4, state="disabled", width=55)
l1m4_entry.var = L1M4
l1m4_entry.place(x=75, y=170)
l1m4_entry.bind("<FocusOut>", lambda x: text_variable_update(l1m4_entry))

l1m5_text = ttk.Label(custom_restrictions_canvas, text="Mission 5: ", foreground="grey")
l1m5_text.place(x=10, y=195)
L1M5 = tk.StringVar(name="L1M5")
l1m5_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L1M5, state="disabled", width=55)
l1m5_entry.var = L1M5
l1m5_entry.place(x=75, y=195)
l1m5_entry.bind("<FocusOut>", lambda x: text_variable_update(l1m5_entry))

l1m6_text = ttk.Label(custom_restrictions_canvas, text="Mission 6: ", foreground="grey")
l1m6_text.place(x=10, y=220)
L1M6 = tk.StringVar(name="L1M6")
l1m6_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L1M6, state="disabled", width=55)
l1m6_entry.var = L1M6
l1m6_entry.place(x=75, y=220)
l1m6_entry.bind("<FocusOut>", lambda x: text_variable_update(l1m6_entry))

l1m7_text = ttk.Label(custom_restrictions_canvas, text="Mission 7: ", foreground="grey")
l1m7_text.place(x=10, y=245)
L1M7 = tk.StringVar(name="L1M7")
l1m7_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L1M7, state="disabled", width=55)
l1m7_entry.var = L1M7
l1m7_entry.place(x=75, y=245)
l1m7_entry.bind("<FocusOut>", lambda x: text_variable_update(l1m7_entry))


# Level 2

# Placing Box and its title
level_2_text = ttk.Label(custom_restrictions_canvas, text="Level 2", justify="left", anchor="w")
level_2_text.place(x=10, y=280)
level_2_border = custom_restrictions_canvas.create_rectangle(2, 290, 424, 500, outline="lightgrey")


# CustomL2 Function
def custom_l2_trigger(self):

    variable_update(self)

    if CustomL2.get() == 1:
        l2m1_entry["state"] = "disabled"
        l2m1_text["foreground"] = "grey"
        l2m2_entry["state"] = "disabled"
        l2m2_text["foreground"] = "grey"
        l2m3_entry["state"] = "disabled"
        l2m3_text["foreground"] = "grey"
        l2m4_entry["state"] = "disabled"
        l2m4_text["foreground"] = "grey"
        l2m5_entry["state"] = "disabled"
        l2m5_text["foreground"] = "grey"
        l2m6_entry["state"] = "disabled"
        l2m6_text["foreground"] = "grey"
        l2m7_entry["state"] = "disabled"
        l2m7_text["foreground"] = "grey"
    elif CustomL2.get() == 2:
        l2m1_entry["state"] = "normal"
        l2m1_text["foreground"] = "black"
        l2m2_entry["state"] = "normal"
        l2m2_text["foreground"] = "black"
        l2m3_entry["state"] = "normal"
        l2m3_text["foreground"] = "black"
        l2m4_entry["state"] = "normal"
        l2m4_text["foreground"] = "black"
        l2m5_entry["state"] = "normal"
        l2m5_text["foreground"] = "black"
        l2m6_entry["state"] = "normal"
        l2m6_text["foreground"] = "black"
        l2m7_entry["state"] = "normal"
        l2m7_text["foreground"] = "black"


# CustomL2
CustomL2 = tk.IntVar(name="CustomL2")
custom_level_2_cb = ttk.Checkbutton(custom_restrictions_canvas, variable=CustomL2, onvalue=2, offvalue=1,
                                    command=lambda: custom_l2_trigger(custom_level_2_cb))
custom_level_2_cb.var = CustomL2  # NEEDED!
custom_level_2_cb.place(x=74, y=300)
custom_level_2_text = ttk.Label(custom_restrictions_canvas, text="Custom Restrictions for Level 2", foreground="black")
custom_level_2_text.place(x=94, y=301)

# Create and place Entry Boxes for Level 2
l2m1_text = ttk.Label(custom_restrictions_canvas, text="Mission 1: ", foreground="grey")
l2m1_text.place(x=10, y=325)
L2M1 = tk.StringVar(name="L2M1")
l2m1_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L2M1, state="disabled", width=55)
l2m1_entry.var = L2M1
l2m1_entry.place(x=75, y=325)
l2m1_entry.bind("<FocusOut>", lambda x: text_variable_update(l2m1_entry))

l2m2_text = ttk.Label(custom_restrictions_canvas, text="Mission 2: ", foreground="grey")
l2m2_text.place(x=10, y=350)
L2M2 = tk.StringVar(name="L2M2")
l2m2_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L2M2, state="disabled", width=55)
l2m2_entry.var = L2M2
l2m2_entry.place(x=75, y=350)
l2m2_entry.bind("<FocusOut>", lambda x: text_variable_update(l2m2_entry))

l2m3_text = ttk.Label(custom_restrictions_canvas, text="Mission 3: ", foreground="grey")
l2m3_text.place(x=10, y=375)
L2M3 = tk.StringVar(name="L2M3")
l2m3_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L2M3, state="disabled", width=55)
l2m3_entry.var = L2M3
l2m3_entry.place(x=75, y=375)
l2m3_entry.bind("<FocusOut>", lambda x: text_variable_update(l2m3_entry))

l2m4_text = ttk.Label(custom_restrictions_canvas, text="Mission 4: ", foreground="grey")
l2m4_text.place(x=10, y=400)
L2M4 = tk.StringVar(name="L2M4")
l2m4_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L2M4, state="disabled", width=55)
l2m4_entry.var = L2M4
l2m4_entry.place(x=75, y=400)
l2m4_entry.bind("<FocusOut>", lambda x: text_variable_update(l2m4_entry))

l2m5_text = ttk.Label(custom_restrictions_canvas, text="Mission 5: ", foreground="grey")
l2m5_text.place(x=10, y=425)
L2M5 = tk.StringVar(name="L2M5")
l2m5_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L2M5, state="disabled", width=55)
l2m5_entry.var = L2M5
l2m5_entry.place(x=75, y=425)
l2m5_entry.bind("<FocusOut>", lambda x: text_variable_update(l2m5_entry))

l2m6_text = ttk.Label(custom_restrictions_canvas, text="Mission 6: ", foreground="grey")
l2m6_text.place(x=10, y=450)
L2M6 = tk.StringVar(name="L2M6")
l2m6_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L2M6, state="disabled", width=55)
l2m6_entry.var = L2M6
l2m6_entry.place(x=75, y=450)
L2M6.set("mrplo_v")
l2m6_entry.bind("<FocusOut>", lambda x: text_variable_update(l2m6_entry))

l2m7_text = ttk.Label(custom_restrictions_canvas, text="Mission 7: ", foreground="grey")
l2m7_text.place(x=10, y=475)
L2M7 = tk.StringVar(name="L2M7")
l2m7_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L2M7, state="disabled", width=55)
l2m7_entry.var = L2M7
l2m7_entry.place(x=75, y=475)
l2m7_entry.bind("<FocusOut>", lambda x: text_variable_update(l2m7_entry))

# Level 3

# Placing Box and its title
level_3_text = ttk.Label(custom_restrictions_canvas, text="Level 3", justify="left", anchor="w")
level_3_text.place(x=10, y=510)
level_3_border = custom_restrictions_canvas.create_rectangle(2, 520, 424, 730, outline="lightgrey")


# CustomL3 Function
def custom_l3_trigger(self):

    variable_update(self)

    if CustomL3.get() == 1:
        l3m1_entry["state"] = "disabled"
        l3m1_text["foreground"] = "grey"
        l3m2_entry["state"] = "disabled"
        l3m2_text["foreground"] = "grey"
        l3m3_entry["state"] = "disabled"
        l3m3_text["foreground"] = "grey"
        l3m4_entry["state"] = "disabled"
        l3m4_text["foreground"] = "grey"
        l3m5_entry["state"] = "disabled"
        l3m5_text["foreground"] = "grey"
        l3m6_entry["state"] = "disabled"
        l3m6_text["foreground"] = "grey"
        l3m7_entry["state"] = "disabled"
        l3m7_text["foreground"] = "grey"
    elif CustomL3.get() == 2:
        l3m1_entry["state"] = "normal"
        l3m1_text["foreground"] = "black"
        l3m2_entry["state"] = "normal"
        l3m2_text["foreground"] = "black"
        l3m3_entry["state"] = "normal"
        l3m3_text["foreground"] = "black"
        l3m4_entry["state"] = "normal"
        l3m4_text["foreground"] = "black"
        l3m5_entry["state"] = "normal"
        l3m5_text["foreground"] = "black"
        l3m6_entry["state"] = "normal"
        l3m6_text["foreground"] = "black"
        l3m7_entry["state"] = "normal"
        l3m7_text["foreground"] = "black"


# CustomL3
CustomL3 = tk.IntVar(name="CustomL3")
custom_level_3_cb = ttk.Checkbutton(custom_restrictions_canvas, variable=CustomL3, onvalue=2, offvalue=1,
                                    command=lambda: custom_l3_trigger(custom_level_3_cb))
custom_level_3_cb.var = CustomL3  # NEEDED!
custom_level_3_cb.place(x=74, y=530)
custom_level_3_text = ttk.Label(custom_restrictions_canvas, text="Custom Restrictions for Level 3", foreground="black")
custom_level_3_text.place(x=94, y=531)

# Create and place Entry Boxes for Level 3
l3m1_text = ttk.Label(custom_restrictions_canvas, text="Mission 1: ", foreground="grey")
l3m1_text.place(x=10, y=555)
L3M1 = tk.StringVar(name="L3M1")
l3m1_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L3M1, state="disabled", width=55)
l3m1_entry.var = L3M1
l3m1_entry.place(x=75, y=555)
l3m1_entry.bind("<FocusOut>", lambda x: text_variable_update(l3m1_entry))

l3m2_text = ttk.Label(custom_restrictions_canvas, text="Mission 2: ", foreground="grey")
l3m2_text.place(x=10, y=580)
L3M2 = tk.StringVar(name="L3M2")
l3m2_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L3M2, state="disabled", width=55)
l3m2_entry.var = L3M2
l3m2_entry.place(x=75, y=580)
l3m2_entry.bind("<FocusOut>", lambda x: text_variable_update(l3m2_entry))

l3m3_text = ttk.Label(custom_restrictions_canvas, text="Mission 3: ", foreground="grey")
l3m3_text.place(x=10, y=605)
L3M3 = tk.StringVar(name="L3M3")
l3m3_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L3M3, state="disabled", width=55)
l3m3_entry.var = L3M3
l3m3_entry.place(x=75, y=605)
l3m3_entry.bind("<FocusOut>", lambda x: text_variable_update(l3m3_entry))

l3m4_text = ttk.Label(custom_restrictions_canvas, text="Mission 4: ", foreground="grey")
l3m4_text.place(x=10, y=630)
L3M4 = tk.StringVar(name="L3M4")
l3m4_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L3M4, state="disabled", width=55)
l3m4_entry.var = L3M4
l3m4_entry.place(x=75, y=630)
L3M4.set("otto_v")
l3m4_entry.bind("<FocusOut>", lambda x: text_variable_update(l3m4_entry))

l3m5_text = ttk.Label(custom_restrictions_canvas, text="Mission 5: ", foreground="grey")
l3m5_text.place(x=10, y=655)
L3M5 = tk.StringVar(name="L3M5")
l3m5_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L3M5, state="disabled", width=55)
l3m5_entry.var = L3M5
l3m5_entry.place(x=75, y=655)
L3M5.set("l_cool")
l3m5_entry.bind("<FocusOut>", lambda x: text_variable_update(l3m5_entry))

l3m6_text = ttk.Label(custom_restrictions_canvas, text="Mission 6: ", foreground="grey")
l3m6_text.place(x=10, y=680)
L3M6 = tk.StringVar(name="L3M6")
l3m6_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L3M6, state="disabled", width=55)
l3m6_entry.var = L3M6
l3m6_entry.place(x=75, y=680)
l3m6_entry.bind("<FocusOut>", lambda x: text_variable_update(l3m6_entry))

l3m7_text = ttk.Label(custom_restrictions_canvas, text="Mission 7: ", foreground="grey")
l3m7_text.place(x=10, y=705)
L3M7 = tk.StringVar(name="L3M7")
l3m7_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L3M7, state="disabled", width=55)
l3m7_entry.var = L3M7
l3m7_entry.place(x=75, y=705)
l3m7_entry.bind("<FocusOut>", lambda x: text_variable_update(l3m7_entry))

# Level 4

# Placing Box and its title
level_4_text = ttk.Label(custom_restrictions_canvas, text="Level 4", justify="left", anchor="w")
level_4_text.place(x=10, y=740)
level_4_border = custom_restrictions_canvas.create_rectangle(2, 750, 424, 960, outline="lightgrey")


# CustomL4 Function
def custom_l4_trigger(self):

    variable_update(self)

    if CustomL4.get() == 1:
        l4m1_entry["state"] = "disabled"
        l4m1_text["foreground"] = "grey"
        l4m2_entry["state"] = "disabled"
        l4m2_text["foreground"] = "grey"
        l4m3_entry["state"] = "disabled"
        l4m3_text["foreground"] = "grey"
        l4m4_entry["state"] = "disabled"
        l4m4_text["foreground"] = "grey"
        l4m5_entry["state"] = "disabled"
        l4m5_text["foreground"] = "grey"
        l4m6_entry["state"] = "disabled"
        l4m6_text["foreground"] = "grey"
        l4m7_entry["state"] = "disabled"
        l4m7_text["foreground"] = "grey"
    elif CustomL4.get() == 2:
        l4m1_entry["state"] = "normal"
        l4m1_text["foreground"] = "black"
        l4m2_entry["state"] = "normal"
        l4m2_text["foreground"] = "black"
        l4m3_entry["state"] = "normal"
        l4m3_text["foreground"] = "black"
        l4m4_entry["state"] = "normal"
        l4m4_text["foreground"] = "black"
        l4m5_entry["state"] = "normal"
        l4m5_text["foreground"] = "black"
        l4m6_entry["state"] = "normal"
        l4m6_text["foreground"] = "black"
        l4m7_entry["state"] = "normal"
        l4m7_text["foreground"] = "black"


# CustomL4
CustomL4 = tk.IntVar(name="CustomL4")
custom_level_4_cb = ttk.Checkbutton(custom_restrictions_canvas, variable=CustomL4, onvalue=2, offvalue=1,
                                    command=lambda: custom_l4_trigger(custom_level_4_cb))
custom_level_4_cb.var = CustomL4  # NEEDED!
custom_level_4_cb.place(x=74, y=760)
custom_level_4_text = ttk.Label(custom_restrictions_canvas, text="Custom Restrictions for Level 4", foreground="black")
custom_level_4_text.place(x=94, y=761)

# Create and place Entry Boxes for Level 4
l4m1_text = ttk.Label(custom_restrictions_canvas, text="Mission 1: ", foreground="grey")
l4m1_text.place(x=10, y=785)
L4M1 = tk.StringVar(name="L4M1")
l4m1_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L4M1, state="disabled", width=55)
l4m1_entry.var = L4M1
l4m1_entry.place(x=75, y=785)
l4m1_entry.bind("<FocusOut>", lambda x: text_variable_update(l4m1_entry))

l4m2_text = ttk.Label(custom_restrictions_canvas, text="Mission 2: ", foreground="grey")
l4m2_text.place(x=10, y=810)
L4M2 = tk.StringVar(name="L4M2")
l4m2_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L4M2, state="disabled", width=55)
l4m2_entry.var = L4M2
l4m2_entry.place(x=75, y=810)
l4m2_entry.bind("<FocusOut>", lambda x: text_variable_update(l4m2_entry))

l4m3_text = ttk.Label(custom_restrictions_canvas, text="Mission 3: ", foreground="grey")
l4m3_text.place(x=10, y=835)
L4M3 = tk.StringVar(name="L4M3")
l4m3_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L4M3, state="disabled", width=55)
l4m3_entry.var = L4M3
l4m3_entry.place(x=75, y=835)
L4M3.set("m_prison")
l4m3_entry.bind("<FocusOut>", lambda x: text_variable_update(l4m3_entry))

l4m4_text = ttk.Label(custom_restrictions_canvas, text="Mission 4: ", foreground="grey")
l4m4_text.place(x=10, y=860)
L4M4 = tk.StringVar(name="L4M4")
l4m4_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L4M4, state="disabled", width=55)
l4m4_entry.var = L4M4
l4m4_entry.place(x=75, y=860)
l4m4_entry.bind("<FocusOut>", lambda x: text_variable_update(l4m4_entry))


l4m5_text = ttk.Label(custom_restrictions_canvas, text="Mission 5: ", foreground="grey")
l4m5_text.place(x=10, y=885)
L4M5 = tk.StringVar(name="L4M5")
l4m5_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L4M5, state="disabled", width=55)
l4m5_entry.var = L4M5
l4m5_entry.place(x=75, y=885)
l4m5_entry.bind("<FocusOut>", lambda x: text_variable_update(l4m5_entry))

l4m6_text = ttk.Label(custom_restrictions_canvas, text="Mission 6: ", foreground="grey")
l4m6_text.place(x=10, y=910)
L4M6 = tk.StringVar(name="L4M6")
l4m6_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L4M6, state="disabled", width=55)
l4m6_entry.var = L4M6
l4m6_entry.place(x=75, y=910)
L4M6.set("m_police")
l4m6_entry.bind("<FocusOut>", lambda x: text_variable_update(l4m6_entry))

l4m7_text = ttk.Label(custom_restrictions_canvas, text="Mission 7: ", foreground="grey")
l4m7_text.place(x=10, y=935)
L4M7 = tk.StringVar(name="L4M7")
l4m7_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L4M7, state="disabled", width=55)
l4m7_entry.var = L4M7
l4m7_entry.place(x=75, y=935)
l4m7_entry.bind("<FocusOut>", lambda x: text_variable_update(l4m7_entry))


# Level 5

# Placing Box and its title
level_5_text = ttk.Label(custom_restrictions_canvas, text="Level 5", justify="left", anchor="w")
level_5_text.place(x=10, y=970)
level_5_border = custom_restrictions_canvas.create_rectangle(2, 980, 424, 1190, outline="lightgrey")


# CustomL5 Function
def custom_l5_trigger(self):

    variable_update(self)

    if CustomL5.get() == 1:
        l5m1_entry["state"] = "disabled"
        l5m1_text["foreground"] = "grey"
        l5m2_entry["state"] = "disabled"
        l5m2_text["foreground"] = "grey"
        l5m3_entry["state"] = "disabled"
        l5m3_text["foreground"] = "grey"
        l5m4_entry["state"] = "disabled"
        l5m4_text["foreground"] = "grey"
        l5m5_entry["state"] = "disabled"
        l5m5_text["foreground"] = "grey"
        l5m6_entry["state"] = "disabled"
        l5m6_text["foreground"] = "grey"
        l5m7_entry["state"] = "disabled"
        l5m7_text["foreground"] = "grey"
    elif CustomL5.get() == 2:
        l5m1_entry["state"] = "normal"
        l5m1_text["foreground"] = "black"
        l5m2_entry["state"] = "normal"
        l5m2_text["foreground"] = "black"
        l5m3_entry["state"] = "normal"
        l5m3_text["foreground"] = "black"
        l5m4_entry["state"] = "normal"
        l5m4_text["foreground"] = "black"
        l5m5_entry["state"] = "normal"
        l5m5_text["foreground"] = "black"
        l5m6_entry["state"] = "normal"
        l5m6_text["foreground"] = "black"
        l5m7_entry["state"] = "normal"
        l5m7_text["foreground"] = "black"


# CustomL5
CustomL5 = tk.IntVar(name="CustomL5")
custom_level_5_cb = ttk.Checkbutton(custom_restrictions_canvas, variable=CustomL5, onvalue=2, offvalue=1,
                                    command=lambda: custom_l5_trigger(custom_level_5_cb))
custom_level_5_cb.var = CustomL5  # NEEDED!
custom_level_5_cb.place(x=74, y=990)
custom_level_5_text = ttk.Label(custom_restrictions_canvas, text="Custom Restrictions for Level 5", foreground="black")
custom_level_5_text.place(x=94, y=990)

# Create and place Entry Boxes for Level 5
l5m1_text = ttk.Label(custom_restrictions_canvas, text="Mission 1: ", foreground="grey")
l5m1_text.place(x=10, y=1015)
L5M1 = tk.StringVar(name="L5M1")
l5m1_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L5M1, state="disabled", width=55)
l5m1_entry.var = L5M1
l5m1_entry.place(x=75, y=1015)
l5m1_entry.bind("<FocusOut>", lambda x: text_variable_update(l5m1_entry))

l5m2_text = ttk.Label(custom_restrictions_canvas, text="Mission 2: ", foreground="grey")
l5m2_text.place(x=10, y=1040)
L5M2 = tk.StringVar(name="L5M2")
l5m2_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L5M2, state="disabled", width=55)
l5m2_entry.var = L5M2
l5m2_entry.place(x=75, y=1040)
l5m2_entry.bind("<FocusOut>", lambda x: text_variable_update(l5m2_entry))

l5m3_text = ttk.Label(custom_restrictions_canvas, text="Mission 3: ", foreground="grey")
l5m3_text.place(x=10, y=1065)
L5M3 = tk.StringVar(name="L5M3")
l5m3_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L5M3, state="disabled", width=55)
l5m3_entry.var = L5M3
l5m3_entry.place(x=75, y=1065)
L5M3.set("carhom_v")
l5m3_entry.bind("<FocusOut>", lambda x: text_variable_update(l5m3_entry))

l5m4_text = ttk.Label(custom_restrictions_canvas, text="Mission 4: ", foreground="grey")
l5m4_text.place(x=10, y=1090)
L5M4 = tk.StringVar(name="L5M4")
l5m4_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L5M4, state="disabled", width=55)
l5m4_entry.var = L5M4
l5m4_entry.place(x=75, y=1090)
L5M4.set("a_american")
l5m4_entry.bind("<FocusOut>", lambda x: text_variable_update(l5m4_entry))

l5m5_text = ttk.Label(custom_restrictions_canvas, text="Mission 5: ", foreground="grey")
l5m5_text.place(x=10, y=1115)
L5M5 = tk.StringVar(name="L5M5")
l5m5_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L5M5, state="disabled", width=55)
l5m5_entry.var = L5M5
l5m5_entry.place(x=75, y=1115)
l5m5_entry.bind("<FocusOut>", lambda x: text_variable_update(l5m5_entry))

l5m6_text = ttk.Label(custom_restrictions_canvas, text="Mission 6: ", foreground="grey")
l5m6_text.place(x=10, y=1140)
L5M6 = tk.StringVar(name="L5M6")
l5m6_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L5M6, state="disabled", width=55)
l5m6_entry.var = L5M6
l5m6_entry.place(x=75, y=1140)
l5m6_entry.bind("<FocusOut>", lambda x: text_variable_update(l5m6_entry))

l5m7_text = ttk.Label(custom_restrictions_canvas, text="Mission 7: ", foreground="grey")
l5m7_text.place(x=10, y=1165)
L5M7 = tk.StringVar(name="L5M7")
l5m7_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L5M7, state="disabled", width=55)
l5m7_entry.var = L5M7
l5m7_entry.place(x=75, y=1165)
l5m7_entry.bind("<FocusOut>", lambda x: text_variable_update(l5m7_entry))


# Level 6

# Placing Box and its title
level_6_text = ttk.Label(custom_restrictions_canvas, text="Level 6", justify="left", anchor="w")
level_6_text.place(x=10, y=1200)
level_6_border = custom_restrictions_canvas.create_rectangle(2, 1210, 424, 1420, outline="lightgrey")


# CustomL6 Function
def custom_l6_trigger(self):

    variable_update(self)

    if CustomL6.get() == 1:
        l6m1_entry["state"] = "disabled"
        l6m1_text["foreground"] = "grey"
        l6m2_entry["state"] = "disabled"
        l6m2_text["foreground"] = "grey"
        l6m3_entry["state"] = "disabled"
        l6m3_text["foreground"] = "grey"
        l6m4_entry["state"] = "disabled"
        l6m4_text["foreground"] = "grey"
        l6m5_entry["state"] = "disabled"
        l6m5_text["foreground"] = "grey"
        l6m6_entry["state"] = "disabled"
        l6m6_text["foreground"] = "grey"
        l6m7_entry["state"] = "disabled"
        l6m7_text["foreground"] = "grey"
    elif CustomL6.get() == 2:
        l6m1_entry["state"] = "normal"
        l6m1_text["foreground"] = "black"
        l6m2_entry["state"] = "normal"
        l6m2_text["foreground"] = "black"
        l6m3_entry["state"] = "normal"
        l6m3_text["foreground"] = "black"
        l6m4_entry["state"] = "normal"
        l6m4_text["foreground"] = "black"
        l6m5_entry["state"] = "normal"
        l6m5_text["foreground"] = "black"
        l6m6_entry["state"] = "normal"
        l6m6_text["foreground"] = "black"
        l6m7_entry["state"] = "normal"
        l6m7_text["foreground"] = "black"


# CustomL6
CustomL6 = tk.IntVar(name="CustomL6")
custom_level_6_cb = ttk.Checkbutton(custom_restrictions_canvas, variable=CustomL6, onvalue=2, offvalue=1,
                                    command=lambda: custom_l6_trigger(custom_level_6_cb))
custom_level_6_cb.var = CustomL6  # NEEDED!
custom_level_6_cb.place(x=74, y=1220)
custom_level_6_text = ttk.Label(custom_restrictions_canvas, text="Custom Restrictions for Level 6", foreground="black")
custom_level_6_text.place(x=94, y=1220)

# Create and place Entry Boxes for Level 6
l6m1_text = ttk.Label(custom_restrictions_canvas, text="Mission 1: ", foreground="grey")
l6m1_text.place(x=10, y=1245)
L6M1 = tk.StringVar(name="L6M1")
l6m1_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L6M1, state="disabled", width=55)
l6m1_entry.var = L6M1
l6m1_entry.place(x=75, y=1245)
l6m1_entry.bind("<FocusOut>", lambda x: text_variable_update(l6m1_entry))

l6m2_text = ttk.Label(custom_restrictions_canvas, text="Mission 2: ", foreground="grey")
l6m2_text.place(x=10, y=1270)
L6M2 = tk.StringVar(name="L6M2")
l6m2_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L6M2, state="disabled", width=55)
l6m2_entry.var = L6M2
l6m2_entry.place(x=75, y=1270)
l6m2_entry.bind("<FocusOut>", lambda x: text_variable_update(l6m2_entry))

l6m3_text = ttk.Label(custom_restrictions_canvas, text="Mission 3: ", foreground="grey")
l6m3_text.place(x=10, y=1295)
L6M3 = tk.StringVar(name="L6M3")
l6m3_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L6M3, state="disabled", width=55)
l6m3_entry.var = L6M3
l6m3_entry.place(x=75, y=1295)
l6m3_entry.bind("<FocusOut>", lambda x: text_variable_update(l6m3_entry))

l6m4_text = ttk.Label(custom_restrictions_canvas, text="Mission 4: ", foreground="grey")
l6m4_text.place(x=10, y=1320)
L6M4 = tk.StringVar(name="L6M4")
l6m4_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L6M4, state="disabled", width=55)
l6m4_entry.var = L6M4
l6m4_entry.place(x=75, y=1320)
l6m4_entry.bind("<FocusOut>", lambda x: text_variable_update(l6m4_entry))

l6m5_text = ttk.Label(custom_restrictions_canvas, text="Mission 5: ", foreground="grey")
l6m5_text.place(x=10, y=1345)
L6M5 = tk.StringVar(name="L6M5")
l6m5_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L6M5, state="disabled", width=55)
l6m5_entry.var = L6M5
l6m5_entry.place(x=75, y=1345)
l6m5_entry.bind("<FocusOut>", lambda x: text_variable_update(l6m5_entry))

l6m6_text = ttk.Label(custom_restrictions_canvas, text="Mission 6: ", foreground="grey")
l6m6_text.place(x=10, y=1370)
L6M6 = tk.StringVar(name="L6M6")
l6m6_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L6M6, state="disabled", width=55)
l6m6_entry.var = L6M6
l6m6_entry.place(x=75, y=1370)
L6M6.set("scorp_v")
l6m6_entry.bind("<FocusOut>", lambda x: text_variable_update(l6m6_entry))

l6m7_text = ttk.Label(custom_restrictions_canvas, text="Mission 7: ", foreground="grey")
l6m7_text.place(x=10, y=1395)
L6M7 = tk.StringVar(name="L6M7")
l6m7_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L6M7, state="disabled", width=55)
l6m7_entry.var = L6M7
l6m7_entry.place(x=75, y=1395)
l6m7_entry.bind("<FocusOut>", lambda x: text_variable_update(l6m7_entry))


# Level 7

# Placing Box and its title
level_7_text = ttk.Label(custom_restrictions_canvas, text="Level 7", justify="left", anchor="w")
level_7_text.place(x=10, y=1430)
level_7_border = custom_restrictions_canvas.create_rectangle(2, 1440, 424, 1650, outline="lightgrey")


# CustomL7 Function
def custom_l7_trigger(self):

    variable_update(self)

    if CustomL7.get() == 1:
        l7m1_entry["state"] = "disabled"
        l7m1_text["foreground"] = "grey"
        l7m2_entry["state"] = "disabled"
        l7m2_text["foreground"] = "grey"
        l7m3_entry["state"] = "disabled"
        l7m3_text["foreground"] = "grey"
        l7m4_entry["state"] = "disabled"
        l7m4_text["foreground"] = "grey"
        l7m5_entry["state"] = "disabled"
        l7m5_text["foreground"] = "grey"
        l7m6_entry["state"] = "disabled"
        l7m6_text["foreground"] = "grey"
        l7m7_entry["state"] = "disabled"
        l7m7_text["foreground"] = "grey"
    elif CustomL7.get() == 2:
        l7m1_entry["state"] = "normal"
        l7m1_text["foreground"] = "black"
        l7m2_entry["state"] = "normal"
        l7m2_text["foreground"] = "black"
        l7m3_entry["state"] = "normal"
        l7m3_text["foreground"] = "black"
        l7m4_entry["state"] = "normal"
        l7m4_text["foreground"] = "black"
        l7m5_entry["state"] = "normal"
        l7m5_text["foreground"] = "black"
        l7m6_entry["state"] = "normal"
        l7m6_text["foreground"] = "black"
        l7m7_entry["state"] = "normal"
        l7m7_text["foreground"] = "black"


# CustomL7
CustomL7 = tk.IntVar(name="CustomL7")
custom_level_7_cb = ttk.Checkbutton(custom_restrictions_canvas, variable=CustomL7, onvalue=2, offvalue=1,
                                    command=lambda: custom_l7_trigger(custom_level_7_cb))
custom_level_7_cb.var = CustomL7  # NEEDED!
custom_level_7_cb.place(x=74, y=1450)
custom_level_7_text = ttk.Label(custom_restrictions_canvas, text="Custom Restrictions for Level 7", foreground="black")
custom_level_7_text.place(x=94, y=1450)

# Create and place Entry Boxes for Level 7
l7m1_text = ttk.Label(custom_restrictions_canvas, text="Mission 1: ", foreground="grey")
l7m1_text.place(x=10, y=1475)
L7M1 = tk.StringVar(name="L7M1")
l7m1_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L7M1, state="disabled", width=55)
l7m1_entry.var = L7M1
l7m1_entry.place(x=75, y=1475)
l7m1_entry.bind("<FocusOut>", lambda x: text_variable_update(l7m1_entry))

l7m2_text = ttk.Label(custom_restrictions_canvas, text="Mission 2: ", foreground="grey")
l7m2_text.place(x=10, y=1500)
L7M2 = tk.StringVar(name="L7M2")
l7m2_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L7M2, state="disabled", width=55)
l7m2_entry.var = L7M2
l7m2_entry.place(x=75, y=1500)
L7M2.set("zombi_v")
l7m2_entry.bind("<FocusOut>", lambda x: text_variable_update(l7m2_entry))

l7m3_text = ttk.Label(custom_restrictions_canvas, text="Mission 3: ", foreground="grey")
l7m3_text.place(x=10, y=1525)
L7M3 = tk.StringVar(name="L7M3")
l7m3_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L7M3, state="disabled", width=55)
l7m3_entry.var = L7M3
l7m3_entry.place(x=75, y=1525)
l7m3_entry.bind("<FocusOut>", lambda x: text_variable_update(l7m3_entry))

l7m4_text = ttk.Label(custom_restrictions_canvas, text="Mission 4: ", foreground="grey")
l7m4_text.place(x=10, y=1550)
L7M4 = tk.StringVar(name="L7M4")
l7m4_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L7M4, state="disabled", width=55)
l7m4_entry.var = L7M4
l7m4_entry.place(x=75, y=1550)
l7m4_entry.bind("<FocusOut>", lambda x: text_variable_update(l7m4_entry))

l7m5_text = ttk.Label(custom_restrictions_canvas, text="Mission 5: ", foreground="grey")
l7m5_text.place(x=10, y=1575)
L7M5 = tk.StringVar(name="L7M5")
l7m5_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L7M5, state="disabled", width=55)
l7m5_entry.var = L7M5
l7m5_entry.place(x=75, y=1575)
l7m5_entry.bind("<FocusOut>", lambda x: text_variable_update(l7m5_entry))

l7m6_text = ttk.Label(custom_restrictions_canvas, text="Mission 6: ", foreground="grey")
l7m6_text.place(x=10, y=1600)
L7M6 = tk.StringVar(name="L7M6")
l7m6_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L7M6, state="disabled", width=55)
l7m6_entry.var = L7M6
l7m6_entry.place(x=75, y=1600)
l7m6_entry.bind("<FocusOut>", lambda x: text_variable_update(l7m6_entry))

l7m7_text = ttk.Label(custom_restrictions_canvas, text="Mission 7: ", foreground="grey")
l7m7_text.place(x=10, y=1625)
L7M7 = tk.StringVar(name="L7M7")
l7m7_entry = ttk.Entry(custom_restrictions_canvas, textvariable=L7M7, state="disabled", width=55)
l7m7_entry.var = L7M7
l7m7_entry.place(x=75, y=1625)
L7M7.set("h_donut,h_evil,h_scuzzy")
l7m7_entry.bind("<FocusOut>", lambda x: text_variable_update(l7m7_entry))


# Add canvas with info to the subframe, and add the frame to the main canvas of settings
custom_restrictions_canvas.grid(row=0, column=0)
custom_restrictions_main_canvas.create_window(0, 0, window=custom_restrictions_frame, anchor='nw')


# REWARD OPTIONS TAB

# Create main frame for whole tab
reward_options_main_frame = ttk.Frame(reward_options_tab, height=550, width=430, borderwidth=1, relief="solid")
reward_options_main_frame.grid(row=0, column=0)

# Create main canvas to store settings info
reward_options_main_canvas = tk.Canvas(reward_options_main_frame, bd=0,
                                       highlightthickness=0, scrollregion=(0, 0, 525, 1080), background="white")

# Create scrollbar for main canvas
reward_options_scrollbar = ttk.Scrollbar(reward_options_main_frame, orient='vertical')
reward_options_scrollbar.pack(side="right", fill="y")
reward_options_scrollbar.config(command=reward_options_main_canvas.yview)  # Set which canvas to scroll

# Reconfigure main canvas to add scrollbar capabilities and add to main frame
reward_options_main_canvas.config(width=430, height=550)
reward_options_main_canvas.config(yscrollcommand=reward_options_scrollbar.set)
reward_options_main_canvas.pack(side="left", expand=True, fill="both")

# Create a subframe with the main canvas for settings
reward_options_frame = ttk.Frame(reward_options_main_canvas)

# Create a canvas to go on that frame so components can be easily added
reward_options_canvas = tk.Canvas(reward_options_frame, height=1080, width=425, bd=0, highlightthickness=0,
                                  background="white")

# Set up saving and loading canvas for this tab
reward_options_saving_canvas = tk.Canvas(reward_options_tab, height=70, width=425, bd=0, highlightthickness=0)
reward_options_saving_canvas.grid(row=1, column=0)

# Save/Load Button + interface
reward_options_saving_button = ttk.Button(reward_options_saving_canvas, text="Save", command=save_settings)
reward_options_saving_button.place(x=350, y=10)
reward_options_loading_button = ttk.Button(reward_options_saving_canvas, text="Load",
                                                command=lambda: load_settings_check(False,
                                                                                    reward_options_saving_canvas))
reward_options_loading_button.place(x=250, y=10)

reward_options_preset_name_text = ttk.Label(reward_options_saving_canvas, text="Preset Name: ",
                                            foreground="black", background="SystemButtonFace")
reward_options_preset_name_text.place(x=10, y=10)
reward_options_preset_name = ttk.Entry(reward_options_saving_canvas, textvariable=PresetName)
reward_options_preset_name.var = PresetName
reward_options_preset_name.place(x=90, y=11)
PresetName.set("Enter Name")
reward_options_preset_name.bind("<FocusOut>", lambda x: text_variable_update(reward_options_preset_name))

reward_options_current_loaded_text = ttk.Label(reward_options_saving_canvas, text="Current Settings: ",
                                               foreground="black", background="SystemButtonFace")
reward_options_current_loaded_text.place(x=10, y=40)

reward_options_current_loaded_combobox = ttk.Combobox(reward_options_saving_canvas,
                                                      textvariable=CurrentPreset)
reward_options_current_loaded_combobox.var = CurrentPreset
reward_options_current_loaded_combobox["values"] = []
reward_options_current_loaded_combobox["state"] = "readonly"
reward_options_current_loaded_combobox.place(x=110, y=40)
reward_options_current_loaded_combobox.bind("<<ComboboxSelected>>", preset_changed)

# Level 1

# Placing Box and its title
level_1_rewards_text = ttk.Label(reward_options_canvas, text="Level 1", justify="left", anchor="w")
level_1_rewards_text.place(x=10, y=0)
level_1_rewards_border = reward_options_canvas.create_rectangle(2, 10, 424, 145, outline="lightgrey")

# Checkboxes

# CanGetMissionRewards
CanGetMissionRewardsL1 = tk.IntVar(name="CanGetMissionRewardsL1")
level_1_missions_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetMissionRewardsL1, onvalue=2, offvalue=1,
                                      command=lambda: variable_update(level_1_missions_cb))
level_1_missions_cb.var = CanGetMissionRewardsL1  # NEEDED!
level_1_missions_cb.place(x=10, y=20)
level_1_missions_text = ttk.Label(reward_options_canvas, text="Rewards From Missions 1-7", foreground="black")
level_1_missions_text.place(x=30, y=21)
CanGetMissionRewardsL1.set(2)

# CanGetRaceRewards
CanGetRaceRewardsL1 = tk.IntVar(name="CanGetRaceRewardsL1")
level_1_races_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetRaceRewardsL1, onvalue=2, offvalue=1,
                                   command=lambda: variable_update(level_1_races_cb))
level_1_races_cb.var = CanGetRaceRewardsL1  # NEEDED!
level_1_races_cb.place(x=10, y=45)
level_1_races_text = ttk.Label(reward_options_canvas, text="Rewards From Street Races", foreground="black")
level_1_races_text.place(x=30, y=46)
CanGetRaceRewardsL1.set(2)

# CanGetRaceRewards
CanGetBonusRewardsL1 = tk.IntVar(name="CanGetBonusRewardsL1")
level_1_bonus_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetBonusRewardsL1, onvalue=2, offvalue=1,
                                   command=lambda: variable_update(level_1_bonus_cb))
level_1_bonus_cb.var = CanGetBonusRewardsL1  # NEEDED!
level_1_bonus_cb.place(x=10, y=70)
level_1_bonus_text = ttk.Label(reward_options_canvas, text="Rewards From Bonus Missions", foreground="black")
level_1_bonus_text.place(x=30, y=71)
CanGetBonusRewardsL1.set(2)

# CanGetNPCRewards
CanGetNPCRewardsL1 = tk.IntVar(name="CanGetNPCRewardsL1")
level_1_npc_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetNPCRewardsL1, onvalue=2, offvalue=1,
                                 command=lambda: variable_update(level_1_npc_cb))
level_1_npc_cb.var = CanGetNPCRewardsL1  # NEEDED!
level_1_npc_cb.place(x=10, y=95)
level_1_npc_text = ttk.Label(reward_options_canvas, text="Rewards From NPC", foreground="black")
level_1_npc_text.place(x=30, y=96)
CanGetNPCRewardsL1.set(2)

# CanGetGilRewards
CanGetGilRewardsL1 = tk.IntVar(name="CanGetGilRewardsL1")
level_1_gil_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetGilRewardsL1, onvalue=2, offvalue=1,
                                 command=lambda: variable_update(level_1_gil_cb))
level_1_gil_cb.var = CanGetGilRewardsL1  # NEEDED!
level_1_gil_cb.place(x=10, y=120)
level_1_gil_text = ttk.Label(reward_options_canvas, text="Rewards From Gil", foreground="black")
level_1_gil_text.place(x=30, y=121)
CanGetGilRewardsL1.set(2)

# Level 2

# Placing Box and its title
level_2_rewards_text = ttk.Label(reward_options_canvas, text="Level 2", justify="left", anchor="w")
level_2_rewards_text.place(x=10, y=155)
level_2_rewards_border = reward_options_canvas.create_rectangle(2, 165, 424, 300, outline="lightgrey")

# Checkboxes

# CanGetMissionRewards
CanGetMissionRewardsL2 = tk.IntVar(name="CanGetMissionRewardsL2")
level_2_missions_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetMissionRewardsL2, onvalue=2, offvalue=1,
                                      command=lambda: variable_update(level_2_missions_cb))
level_2_missions_cb.var = CanGetMissionRewardsL2  # NEEDED!
level_2_missions_cb.place(x=10, y=175)
level_2_missions_text = ttk.Label(reward_options_canvas, text="Rewards From Missions 1-7", foreground="black")
level_2_missions_text.place(x=30, y=176)
CanGetMissionRewardsL2.set(2)

# CanGetRaceRewards
CanGetRaceRewardsL2 = tk.IntVar(name="CanGetRaceRewardsL2")
level_2_races_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetRaceRewardsL2, onvalue=2, offvalue=1,
                                   command=lambda: variable_update(level_2_races_cb))
level_2_races_cb.var = CanGetRaceRewardsL2  # NEEDED!
level_2_races_cb.place(x=10, y=200)
level_2_races_text = ttk.Label(reward_options_canvas, text="Rewards From Street Races", foreground="black")
level_2_races_text.place(x=30, y=201)
CanGetRaceRewardsL2.set(2)

# CanGetRaceRewards
CanGetBonusRewardsL2 = tk.IntVar(name="CanGetBonusRewardsL2")
level_2_bonus_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetBonusRewardsL2, onvalue=2, offvalue=1,
                                   command=lambda: variable_update(level_2_bonus_cb))
level_2_bonus_cb.var = CanGetBonusRewardsL2  # NEEDED!
level_2_bonus_cb.place(x=10, y=225)
level_2_bonus_text = ttk.Label(reward_options_canvas, text="Rewards From Bonus Missions", foreground="black")
level_2_bonus_text.place(x=30, y=226)
CanGetBonusRewardsL2.set(2)

# CanGetNPCRewards
CanGetNPCRewardsL2 = tk.IntVar(name="CanGetNPCRewardsL2")
level_2_npc_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetNPCRewardsL2, onvalue=2, offvalue=1,
                                 command=lambda: variable_update(level_2_npc_cb))
level_2_npc_cb.var = CanGetNPCRewardsL2  # NEEDED!
level_2_npc_cb.place(x=10, y=250)
level_2_npc_text = ttk.Label(reward_options_canvas, text="Rewards From NPC", foreground="black")
level_2_npc_text.place(x=30, y=251)
CanGetNPCRewardsL2.set(2)

# CanGetGilRewards
CanGetGilRewardsL2 = tk.IntVar(name="CanGetGilRewardsL2")
level_2_gil_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetGilRewardsL2, onvalue=2, offvalue=1,
                                 command=lambda: variable_update(level_2_gil_cb))
level_2_gil_cb.var = CanGetGilRewardsL2  # NEEDED!
level_2_gil_cb.place(x=10, y=275)
level_2_gil_text = ttk.Label(reward_options_canvas, text="Rewards From Gil", foreground="black")
level_2_gil_text.place(x=30, y=276)
CanGetGilRewardsL2.set(2)

# Level 3

# Placing Box and its title
level_3_rewards_text = ttk.Label(reward_options_canvas, text="Level 3", justify="left", anchor="w")
level_3_rewards_text.place(x=10, y=310)
level_3_rewards_border = reward_options_canvas.create_rectangle(2, 320, 424, 455, outline="lightgrey")

# Checkboxes

# CanGetMissionRewards
CanGetMissionRewardsL3 = tk.IntVar(name="CanGetMissionRewardsL3")
level_3_missions_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetMissionRewardsL3, onvalue=2, offvalue=1,
                                      command=lambda: variable_update(level_3_missions_cb))
level_3_missions_cb.var = CanGetMissionRewardsL3  # NEEDED!
level_3_missions_cb.place(x=10, y=330)
level_3_missions_text = ttk.Label(reward_options_canvas, text="Rewards From Missions 1-7", foreground="black")
level_3_missions_text.place(x=30, y=331)
CanGetMissionRewardsL3.set(2)

# CanGetRaceRewards
CanGetRaceRewardsL3 = tk.IntVar(name="CanGetRaceRewardsL3")
level_3_races_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetRaceRewardsL3, onvalue=2, offvalue=1,
                                   command=lambda: variable_update(level_3_races_cb))
level_3_races_cb.var = CanGetRaceRewardsL3  # NEEDED!
level_3_races_cb.place(x=10, y=355)
level_3_races_text = ttk.Label(reward_options_canvas, text="Rewards From Street Races", foreground="black")
level_3_races_text.place(x=30, y=356)
CanGetRaceRewardsL3.set(2)

# CanGetRaceRewards
CanGetBonusRewardsL3 = tk.IntVar(name="CanGetBonusRewardsL3")
level_3_bonus_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetBonusRewardsL3, onvalue=2, offvalue=1,
                                   command=lambda: variable_update(level_3_bonus_cb))
level_3_bonus_cb.var = CanGetBonusRewardsL3  # NEEDED!
level_3_bonus_cb.place(x=10, y=380)
level_3_bonus_text = ttk.Label(reward_options_canvas, text="Rewards From Bonus Missions", foreground="black")
level_3_bonus_text.place(x=30, y=381)
CanGetBonusRewardsL3.set(2)

# CanGetNPCRewards
CanGetNPCRewardsL3 = tk.IntVar(name="CanGetNPCRewardsL3")
level_3_npc_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetNPCRewardsL3, onvalue=2, offvalue=1,
                                 command=lambda: variable_update(level_3_npc_cb))
level_3_npc_cb.var = CanGetNPCRewardsL3  # NEEDED!
level_3_npc_cb.place(x=10, y=405)
level_3_npc_text = ttk.Label(reward_options_canvas, text="Rewards From NPC", foreground="black")
level_3_npc_text.place(x=30, y=406)
CanGetNPCRewardsL3.set(2)

# CanGetGilRewards
CanGetGilRewardsL3 = tk.IntVar(name="CanGetGilRewardsL3")
level_3_gil_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetGilRewardsL3, onvalue=2, offvalue=1,
                                 command=lambda: variable_update(level_3_gil_cb))
level_3_gil_cb.var = CanGetGilRewardsL3  # NEEDED!
level_3_gil_cb.place(x=10, y=430)
level_3_gil_text = ttk.Label(reward_options_canvas, text="Rewards From Gil", foreground="black")
level_3_gil_text.place(x=30, y=431)
CanGetGilRewardsL3.set(2)

# Level 4

# Placing Box and its title
level_4_rewards_text = ttk.Label(reward_options_canvas, text="Level 4", justify="left", anchor="w")
level_4_rewards_text.place(x=10, y=465)
level_4_rewards_border = reward_options_canvas.create_rectangle(2, 475, 424, 610, outline="lightgrey")

# Checkboxes

# CanGetMissionRewards
CanGetMissionRewardsL4 = tk.IntVar(name="CanGetMissionRewardsL4")
level_4_missions_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetMissionRewardsL4, onvalue=2, offvalue=1,
                                      command=lambda: variable_update(level_4_missions_cb))
level_4_missions_cb.var = CanGetMissionRewardsL4  # NEEDED!
level_4_missions_cb.place(x=10, y=485)
level_4_missions_text = ttk.Label(reward_options_canvas, text="Rewards From Missions 1-7", foreground="black")
level_4_missions_text.place(x=30, y=486)
CanGetMissionRewardsL4.set(2)

# CanGetRaceRewards
CanGetRaceRewardsL4 = tk.IntVar(name="CanGetRaceRewardsL4")
level_4_races_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetRaceRewardsL4, onvalue=2, offvalue=1,
                                   command=lambda: variable_update(level_4_races_cb))
level_4_races_cb.var = CanGetRaceRewardsL4  # NEEDED!
level_4_races_cb.place(x=10, y=510)
level_4_races_text = ttk.Label(reward_options_canvas, text="Rewards From Street Races", foreground="black")
level_4_races_text.place(x=30, y=511)
CanGetRaceRewardsL4.set(2)

# CanGetRaceRewards
CanGetBonusRewardsL4 = tk.IntVar(name="CanGetBonusRewardsL4")
level_4_bonus_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetBonusRewardsL4, onvalue=2, offvalue=1,
                                   command=lambda: variable_update(level_4_bonus_cb))
level_4_bonus_cb.var = CanGetBonusRewardsL4  # NEEDED!
level_4_bonus_cb.place(x=10, y=535)
level_4_bonus_text = ttk.Label(reward_options_canvas, text="Rewards From Bonus Missions", foreground="black")
level_4_bonus_text.place(x=30, y=536)
CanGetBonusRewardsL4.set(2)

# CanGetNPCRewards
CanGetNPCRewardsL4 = tk.IntVar(name="CanGetNPCRewardsL4")
level_4_npc_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetNPCRewardsL4, onvalue=2, offvalue=1,
                                 command=lambda: variable_update(level_4_npc_cb))
level_4_npc_cb.var = CanGetNPCRewardsL4  # NEEDED!
level_4_npc_cb.place(x=10, y=560)
level_4_npc_text = ttk.Label(reward_options_canvas, text="Rewards From NPC", foreground="black")
level_4_npc_text.place(x=30, y=561)
CanGetNPCRewardsL4.set(2)

# CanGetGilRewards
CanGetGilRewardsL4 = tk.IntVar(name="CanGetGilRewardsL4")
level_4_gil_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetGilRewardsL4, onvalue=2, offvalue=1,
                                 command=lambda: variable_update(level_4_gil_cb))
level_4_gil_cb.var = CanGetGilRewardsL4  # NEEDED!
level_4_gil_cb.place(x=10, y=585)
level_4_gil_text = ttk.Label(reward_options_canvas, text="Rewards From Gil", foreground="black")
level_4_gil_text.place(x=30, y=586)
CanGetGilRewardsL4.set(2)

# Level 5

# Placing Box and its title
level_5_rewards_text = ttk.Label(reward_options_canvas, text="Level 5", justify="left", anchor="w")
level_5_rewards_text.place(x=10, y=620)
level_5_rewards_border = reward_options_canvas.create_rectangle(2, 630, 424, 765, outline="lightgrey")

# Checkboxes

# CanGetMissionRewards
CanGetMissionRewardsL5 = tk.IntVar(name="CanGetMissionRewardsL5")
level_5_missions_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetMissionRewardsL5, onvalue=2, offvalue=1,
                                      command=lambda: variable_update(level_5_missions_cb))
level_5_missions_cb.var = CanGetMissionRewardsL5  # NEEDED!
level_5_missions_cb.place(x=10, y=640)
level_5_missions_text = ttk.Label(reward_options_canvas, text="Rewards From Missions 1-7", foreground="black")
level_5_missions_text.place(x=30, y=641)
CanGetMissionRewardsL5.set(2)

# CanGetRaceRewards
CanGetRaceRewardsL5 = tk.IntVar(name="CanGetRaceRewardsL5")
level_5_races_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetRaceRewardsL5, onvalue=2, offvalue=1,
                                   command=lambda: variable_update(level_5_races_cb))
level_5_races_cb.var = CanGetRaceRewardsL5  # NEEDED!
level_5_races_cb.place(x=10, y=665)
level_5_races_text = ttk.Label(reward_options_canvas, text="Rewards From Street Races", foreground="black")
level_5_races_text.place(x=30, y=666)
CanGetRaceRewardsL5.set(2)

# CanGetRaceRewards
CanGetBonusRewardsL5 = tk.IntVar(name="CanGetBonusRewardsL5")
level_5_bonus_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetBonusRewardsL5, onvalue=2, offvalue=1,
                                   command=lambda: variable_update(level_5_bonus_cb))
level_5_bonus_cb.var = CanGetBonusRewardsL5  # NEEDED!
level_5_bonus_cb.place(x=10, y=690)
level_5_bonus_text = ttk.Label(reward_options_canvas, text="Rewards From Bonus Missions", foreground="black")
level_5_bonus_text.place(x=30, y=691)
CanGetBonusRewardsL5.set(2)

# CanGetNPCRewards
CanGetNPCRewardsL5 = tk.IntVar(name="CanGetNPCRewardsL5")
level_5_npc_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetNPCRewardsL5, onvalue=2, offvalue=1,
                                 command=lambda: variable_update(level_5_npc_cb))
level_5_npc_cb.var = CanGetNPCRewardsL5  # NEEDED!
level_5_npc_cb.place(x=10, y=715)
level_5_npc_text = ttk.Label(reward_options_canvas, text="Rewards From NPC", foreground="black")
level_5_npc_text.place(x=30, y=716)
CanGetNPCRewardsL5.set(2)

# CanGetGilRewards
CanGetGilRewardsL5 = tk.IntVar(name="CanGetGilRewardsL5")
level_5_gil_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetGilRewardsL5, onvalue=2, offvalue=1,
                                 command=lambda: variable_update(level_5_gil_cb))
level_5_gil_cb.var = CanGetGilRewardsL5  # NEEDED!
level_5_gil_cb.place(x=10, y=740)
level_5_gil_text = ttk.Label(reward_options_canvas, text="Rewards From Gil", foreground="black")
level_5_gil_text.place(x=30, y=741)
CanGetGilRewardsL5.set(2)

# Level 6

# Placing Box and its title
level_6_rewards_text = ttk.Label(reward_options_canvas, text="Level 6", justify="left", anchor="w")
level_6_rewards_text.place(x=10, y=775)
level_6_rewards_border = reward_options_canvas.create_rectangle(2, 785, 424, 920, outline="lightgrey")

# Checkboxes

# CanGetMissionRewards
CanGetMissionRewardsL6 = tk.IntVar(name="CanGetMissionRewardsL6")
level_6_missions_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetMissionRewardsL6, onvalue=2, offvalue=1,
                                      command=lambda: variable_update(level_6_missions_cb))
level_6_missions_cb.var = CanGetMissionRewardsL6  # NEEDED!
level_6_missions_cb.place(x=10, y=795)
level_6_missions_text = ttk.Label(reward_options_canvas, text="Rewards From Missions 1-7", foreground="black")
level_6_missions_text.place(x=30, y=796)
CanGetMissionRewardsL6.set(2)

# CanGetRaceRewards
CanGetRaceRewardsL6 = tk.IntVar(name="CanGetRaceRewardsL6")
level_6_races_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetRaceRewardsL6, onvalue=2, offvalue=1,
                                   command=lambda: variable_update(level_6_races_cb))
level_6_races_cb.var = CanGetRaceRewardsL6  # NEEDED!
level_6_races_cb.place(x=10, y=820)
level_6_races_text = ttk.Label(reward_options_canvas, text="Rewards From Street Races", foreground="black")
level_6_races_text.place(x=30, y=821)
CanGetRaceRewardsL6.set(2)

# CanGetRaceRewards
CanGetBonusRewardsL6 = tk.IntVar(name="CanGetBonusRewardsL6")
level_6_bonus_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetBonusRewardsL6, onvalue=2, offvalue=1,
                                   command=lambda: variable_update(level_6_bonus_cb))
level_6_bonus_cb.var = CanGetBonusRewardsL6  # NEEDED!
level_6_bonus_cb.place(x=10, y=845)
level_6_bonus_text = ttk.Label(reward_options_canvas, text="Rewards From Bonus Missions", foreground="black")
level_6_bonus_text.place(x=30, y=846)
CanGetBonusRewardsL6.set(2)

# CanGetNPCRewards
CanGetNPCRewardsL6 = tk.IntVar(name="CanGetNPCRewardsL6")
level_6_npc_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetNPCRewardsL6, onvalue=2, offvalue=1,
                                 command=lambda: variable_update(level_6_npc_cb))
level_6_npc_cb.var = CanGetNPCRewardsL6  # NEEDED!
level_6_npc_cb.place(x=10, y=870)
level_6_npc_text = ttk.Label(reward_options_canvas, text="Rewards From NPC", foreground="black")
level_6_npc_text.place(x=30, y=871)
CanGetNPCRewardsL6.set(2)

# CanGetGilRewards
CanGetGilRewardsL6 = tk.IntVar(name="CanGetGilRewardsL6")
level_6_gil_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetGilRewardsL6, onvalue=2, offvalue=1,
                                 command=lambda: variable_update(level_6_gil_cb))
level_6_gil_cb.var = CanGetGilRewardsL6  # NEEDED!
level_6_gil_cb.place(x=10, y=895)
level_6_gil_text = ttk.Label(reward_options_canvas, text="Rewards From Gil", foreground="black")
level_6_gil_text.place(x=30, y=896)
CanGetGilRewardsL6.set(2)

# Level 7

# Placing Box and its title
level_7_rewards_text = ttk.Label(reward_options_canvas, text="Level 7", justify="left", anchor="w")
level_7_rewards_text.place(x=10, y=930)
level_7_rewards_border = reward_options_canvas.create_rectangle(2, 940, 424, 1075, outline="lightgrey")

# Checkboxes

# CanGetMissionRewards
CanGetMissionRewardsL7 = tk.IntVar(name="CanGetMissionRewardsL7")
level_7_missions_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetMissionRewardsL7, onvalue=2, offvalue=1,
                                      command=lambda: variable_update(level_7_missions_cb))
level_7_missions_cb.var = CanGetMissionRewardsL7  # NEEDED!
level_7_missions_cb.place(x=10, y=950)
level_7_missions_text = ttk.Label(reward_options_canvas, text="Rewards From Missions 1-7", foreground="black")
level_7_missions_text.place(x=30, y=951)
CanGetMissionRewardsL7.set(2)

# CanGetRaceRewards
CanGetRaceRewardsL7 = tk.IntVar(name="CanGetRaceRewardsL7")
level_7_races_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetRaceRewardsL7, onvalue=2, offvalue=1,
                                   command=lambda: variable_update(level_7_races_cb))
level_7_races_cb.var = CanGetRaceRewardsL7  # NEEDED!
level_7_races_cb.place(x=10, y=975)
level_7_races_text = ttk.Label(reward_options_canvas, text="Rewards From Street Races", foreground="black")
level_7_races_text.place(x=30, y=976)
CanGetRaceRewardsL7.set(2)

# CanGetRaceRewards
CanGetBonusRewardsL7 = tk.IntVar(name="CanGetBonusRewardsL7")
level_7_bonus_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetBonusRewardsL7, onvalue=2, offvalue=1,
                                   command=lambda: variable_update(level_7_bonus_cb))
level_7_bonus_cb.var = CanGetBonusRewardsL7  # NEEDED!
level_7_bonus_cb.place(x=10, y=1000)
level_7_bonus_text = ttk.Label(reward_options_canvas, text="Rewards From Bonus Missions", foreground="black")
level_7_bonus_text.place(x=30, y=1001)
CanGetBonusRewardsL7.set(2)

# CanGetNPCRewards
CanGetNPCRewardsL7 = tk.IntVar(name="CanGetNPCRewardsL7")
level_7_npc_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetNPCRewardsL7, onvalue=2, offvalue=1,
                                 command=lambda: variable_update(level_7_npc_cb))
level_7_npc_cb.var = CanGetNPCRewardsL7  # NEEDED!
level_7_npc_cb.place(x=10, y=1025)
level_7_npc_text = ttk.Label(reward_options_canvas, text="Rewards From NPC", foreground="black")
level_7_npc_text.place(x=30, y=1026)
CanGetNPCRewardsL7.set(2)

# CanGetGilRewards
CanGetGilRewardsL7 = tk.IntVar(name="CanGetGilRewardsL7")
level_7_gil_cb = ttk.Checkbutton(reward_options_canvas, variable=CanGetGilRewardsL7, onvalue=2, offvalue=1,
                                 command=lambda: variable_update(level_7_gil_cb))
level_7_gil_cb.var = CanGetGilRewardsL7  # NEEDED!
level_7_gil_cb.place(x=10, y=1050)
level_7_gil_text = ttk.Label(reward_options_canvas, text="Rewards From Gil", foreground="black")
level_7_gil_text.place(x=30, y=1051)
CanGetGilRewardsL7.set(2)

# Add canvas with info to the subframe, and add the frame to the main canvas of settings
reward_options_canvas.grid(row=0, column=0)
reward_options_main_canvas.create_window(0, 0, window=reward_options_frame, anchor='nw')

root.mainloop()
