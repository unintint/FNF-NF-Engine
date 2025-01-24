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
        var getValue:String = Reflect.getProperty(data, value);
        if (getValue == null) getValue = Reflect.getProperty(defaultData, value);
        if (getValue == null) getValue = value + ' (missed interpret)';
        return getValue;
    }

    static public function updateLang() {
        try{
            data = defaultData = Json.parse(Paths.getTextFromFile('language/' + 'English' + '/mainmenu.json'));
           }
        try{
            data = Json.parse(Paths.getTextFromFile('language/' + ClientPrefs.data.language + '/mainmenu.json'));
        } 
    }
}