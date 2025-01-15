package backend;

import backend.ClientPrefs;
import backend.Song;
import flixel.util.FlxSave;
import states.PlayState;

class NoteRecording extends MusicBeatState
{
    private var noteSave:Array<Array<Float>> = [];
    private var nowArray:Int = 0;
  
    override public function create(){
        if (ClientPrefs.data.noteRecording && ClientPrefs.data.notePlayback){
            ClientPrefs.data.notePlayback = false; //箭头录制的优先级要比箭头回放高
            
            var load:FlxSave = new FlxSave();
            load.bind(PlayState.SONG.song, CoolUtil.getSavePath());
            noteSave = load.data.KeyData;
        }
    }

    override public static function update(elapsed:Float){
        if(ClientPrefs.data.notePlayback && noteSave.length > 0){
            if(noteSave[nowArray][1] == backend.Conductor.songPosition){
                 PlayState.startPressed(noteSave[nowArray][0]);
                 if(nowArray < noteSave.length - 1){
                     nowArray++; //天知道这个组有多长，直接遍历整个组可能卡到爆炸
                 }
            }
        }
    }
  
    public function pressed(key:Int){
        if (ClientPrefs.data.noteRecording){
            var record:Array<Float> = [key,backend.Conductor.songPosition];
            noteSave.push(record);
        }
    }
    public function save(){
        var save:FlxSave = new FlxSave();
        save.data.KeyData = noteSave;
        save.bind(PlayState.SONG.song, CoolUtil.getSavePath());
        save.flush();
    }
}
