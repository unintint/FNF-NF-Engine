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
    static var defaultData:MainData;

    static public function get(value:String):String {
        var getValue:String = Reflect.getProperty(data, value);
        if (getValue == null) getValue = Reflect.getProperty(defaultData, value);
        if (getValue == null) getValue = value + ' (missed interpret)';
        return getValue;
    }

    static public function updateLang() {
        defaultData = Json.parse(Paths.getTextFromFile('language/' + 'English' + '/main.json'));
        try{
            data = Json.parse(Paths.getTextFromFile('language/' + ClientPrefs.data.language + '/main.json'));
        } catch(e:Any) {
            try{
                data = Json.parse(Paths.getTextFromFile('language/' + 'English' + '/main.json'));
            }
        }
    }
}