package mobile.backend;

#if sys
import sys.FileSystem;
import sys.io.File;
#end

using backend.CoolUtil;

static function saveErrorToFile(errorInfo:String):Void
{
    #if sys
    try
    {
        if (!FileSystem.exists('crash'))
            FileSystem.createDirectory('crash');

        var fileName = 'crash/' + Date.now().toString().replace(' ', '-').replace(':', "'") + '.txt';
        
        File.saveContent(fileName, errorInfo);
    }
    catch (e:haxe.Exception)
    {
        trace('Couldn\'t save error message. (${e.message})');
    }
    #end
}
