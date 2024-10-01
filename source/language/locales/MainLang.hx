package language.locales;

import haxe.Json;

typedef MainData =
{
    languageName:String,
    fontName:String,
	play:String,
    back:String
}

class MainLang
{
    static var data:MainData;

    static public function get(value:String):String {
        return Reflect.getProperty(data, value);
    }

    static public function updateLang() {
        data = Json.parse(Paths.getTextFromFile('language/' + ClientPrefs.data.language + '/main.json'));
    }
}