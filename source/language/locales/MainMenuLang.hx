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
        try{
            data = Json.parse(Paths.getTextFromFile('language/' + ClientPrefs.data.language + '/mainmenu.json'));
        } catch(e:Any) {
            try{
                data = Json.parse(Paths.getTextFromFile('language/' + 'English' + '/mainmenu.json'));
            }
        }
    }
}