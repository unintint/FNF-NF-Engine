package mobile.backend;

#if sys
import sys.FileSystem;
import sys.io.File;
#end

using backend.CoolUtil;

function saveErrorToFile(main:String = null ,stack:String):Void
{
    #if sys
    var formattedStack = "";
    var lines = stack.split("\n");
    for (line in lines) {
        if (line.startsWith("Called from file")) {
            var parts = line.split(", ");
            var fileLine = parts[0].split(" ");
            var file = fileLine[2].replace(".hx", "");
            var lineNum = fileLine[3];
            var method = "";
            if (parts.length > 1) {
                var methodParts = parts[1].split(" ");
                method = methodParts[1];
            }
            formattedStack += "$main\n$file/$method [line $lineNum]\n";
        }
    }
    openSubState(new ErrorSubState(formattedStack))
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
