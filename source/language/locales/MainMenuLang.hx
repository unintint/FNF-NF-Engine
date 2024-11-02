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
    static var defaultData:MainMenuData;

    static public function get(value:String):String {
        var value = Reflect.getProperty(data, value);
        if (value = null) value = Reflect.getProperty(defaultData, value);
        return value;
    }

    static public function updateLang() {
        defaultData = Json.parse(Paths.getTextFromFile('language/' + 'English' + '/mainmenu.json');
        try{
            data = Json.parse(Paths.getTextFromFile('language/' + ClientPrefs.data.language + '/mainmenu.json'));
        } catch(e:Any) {
            try{
                data = Json.parse(Paths.getTextFromFile('language/' + 'English' + '/mainmenu.json'));
            }
        }
    }
}