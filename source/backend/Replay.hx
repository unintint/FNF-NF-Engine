package backend;

import sys.thread.FixedThreadPool;
import sys.thread.Mutex;

class Replay
{
    //整个组>摁压类型>行数>时间
    static public var saveData:Array<Array<Array<Float>>> = [
        [
            [],
            [],
            [],
            []
        ],
        [   
            [],
            [],
            [],
            []
        ]
    ];

    static public var hitData:Array<Array<Array<Float>>> = [
        [
            [],
            [],
            [],
            []
        ],
        [   
            [],
            [],
            [],
            []
        ]
    ];

    static public var thread:FixedThreadPool;

    static public function init()
    {
        thread = new FixedThreadPool(1);
        hitData = saveData.copy();
    }

    static public function push(time:Float, type:Int, state:Int) 
    {
        if (!PlayState.replayMode) saveData[state][type].push(time);
    }

    static public function keysCheck()
    {
        thread.run(function() {
            var time:Float = Conductor.songPosition;
            
            for (type in 0...4)
            {
                if (hitData[1][type][0] > time) reCheck(type, time);
            }
        });
    }


    var allowHit:Array<Bool> = [true, true, true, true];
    static function reCheck(type:Int, time:Float) {
        if (hitData[0][type][0] < time) 
        {
            PlayState.keysCheck();
            if (allowHit[type])
            {
                PlayState.keyPressed(type);
                allowHit[type] = false;
            }
        } else {
            if (allowHit[type]) {
                PlayState.keyPressed(type); //摁下松开时间如果短没检测到
            }
            allowHit[type] = true;
            hitData[0][type].splice(0, 1);
            hitData[1][type].splice(0, 1);
        }
    }

    static public function reset() 
    {
        saveData = [
            [
                [],
                [],
                [],
                []
            ],
            [   
                [],
                [],
                [],
                []
            ]
        ];
    }   //愚蠢但是有用 --狐月影
}