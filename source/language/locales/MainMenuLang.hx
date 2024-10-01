package language.locales;

import haxe.Json;

typedef MainMenuData =
{
	novaFlareEngine:String,
    fridayNightFunkin:String
}

class MainMenuLang
{
    static var data:MainMenuData;

    static public function get(value:String):String {
        return Reflect.getProperty(data, value);
    }

    static public function updateLang() {
        data = Json.parse(Paths.getTextFromFile('language/' + ClientPrefs.data.language + '/mainmenu.json'));
    }
}