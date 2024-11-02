package language.locales;

import haxe.Json;

typedef PauseData =
{
    restart:String,
    continues:String,
    difficulty:String,
    editor:String,
    options:String,
    exit:String,
    back:String,
    debug:String,
}

class PauseLang
{
    static var data:PauseData;
    static var defaultData:PauseData;
    
  static public function get(value:String):String {
        var value:String = Reflect.getProperty(data, value);
        if (value == null) value = Reflect.getProperty(defaultData, value);
        return value;
    }

    static public function updateLang() {
        defaultData = Json.parse(Paths.getTextFromFile('language/' + 'English' + '/pause.json'));
        try{
            data = Json.parse(Paths.getTextFromFile('language/' + ClientPrefs.data.language + '/pause.json'));
        } catch(e:Any) {
            try{
                data = Json.parse(Paths.getTextFromFile('language/' + 'English' + '/pause.json'));
            }
        }
    }
}