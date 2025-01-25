package backend;

import sys.thread.FixedThreadPool;
import sys.thread.Mutex;

class Replay
{
    //整个组>摁压类型>行数>时间
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
    }

    static public function push(time:Float, type:Int, state:Int) 
    {
        hitData[state][type].push(time);
    }

    static public function keysCheck()
    {
        var time:Float = Conductor.songPosition;
        for (type in 0...2)
        {
            
        }
    }

    static public function reset() 
    {
        hitData = [
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