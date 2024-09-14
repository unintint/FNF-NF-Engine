package language.locales;

class EN 
{
    static public var langTran:Map<String, String> = [
        'LangName' => 'English',
        
        'FontName' => 'montserrat',
        //==General==\\
        'General' => 'General',
        'framerate' => 'framerate',
        'colorblindMode' => 'colorblindMode',
        'lowQuality' => 'lowQuality',
        'gameQuality' =>'gameQuality',
        'antialiasing' => 'antialiasing',
        'flashing' => 'flashing',
        'shaders' => 'shaders',
        'cacheOnGPU' => 'cacheOnGPU',
        'autoPause' => 'autoPause',



        //==Gameplay==\\
        'Gameplay' => 'Gameplay',
        ////////
        'downScroll' =>'downScroll',
        'middleScroll' => 'middleScroll',
        'flipChart' => 'flipChart',
        'ghostTapping' => 'ghostTapping',
        'guitarHeroSustains' => 'guitarHeroSustains',
        'noReset' => 'noReset',
        ////////
        'Opponent' => 'Opponent',
        ////////
        'playOpponent' => 'playOpponent',
        'opponentCodeFix' => 'opponentCodeFix',
        'botOpponentFix' => 'botOpponentFix',
        'HealthDrainOPPO' => '你处于对手模式时的生命消耗',
        'HealthDrainOPPOMult' => '对手模式的生命消耗乘数',

        //==Backend==\\
        'Backend' => '后端设置',
        'Gameplaybackend' => '游戏后端设置',
        'fixLNL' => '减少长音符长度',
        'pauseMusic' => '暂停界面播放的歌曲',
        'hitsoundType' => '选择你的打击音效',
        'hitsoundVolume' =>'打击音效的声音大小',
        'oldHscriptVersion' => '简化版本以使用 hscript 为 runhaxecode 工作',
        'pauseButton' => '在游戏中添加暂停按钮',
        'gameOverVibration' => '设备将在游戏结束时振动',
        'ratingOffset' => '更改sick击中的延迟',
        'NoteOffsetState' => '更改音乐偏移和判断贴图的位置',
        'safeFrames' => '更改提前或延迟敲击音符的帧数',
        'marvelousWindow' => '更改按下音符的延迟在所设置的范围内判定为Marvelous',
        'sickWindow' => '更改按下音符的延迟在所设置的范围内判定为Sick',
        'goodWindow' => '更改按下音符的延迟在所设置的范围内判定为Good',
        'badWindow' => '更改按下音符的延迟在所设置的范围内判定为Bad',
        'marvelousRating' => '增加一个Marvelous的判定',
        'marvelousSprite' => 'Marvelous评分使用Sick的贴图',
        ////////
        'Appbackend' => '软件后端设置',
        ////////
        'discordRPC' => '从 Discord 上的“正在播放”框中显示应用程序',
        'checkForUpdates' => '检查应用程序版本',
        'screensaver' => '手机将在几秒钟处于非活动状态后进入休眠状态',
        'filesCheck' => '检查游戏是否丢失文件',



            //==Game UI==\\
        'GameUI' => '游戏界面设置',
        ////////
        'Visble' => '显示设置',
        ////////
        'hideHud' => '隐藏UI',
        'showComboNum' => '连击数字显示',
        'showRating' => '评级贴图显示',
        'opponentStrums' => '显示对手的箭头',
        'judgementCounter' => '显示计数板',
        'keyboardDisplay' => '显示小键盘',
        ////////
        'TimeBar' => '时长条',
        ////////
        'timeBarType' => '时长条显示类型',
        ////////
        'HealthBar' => '生命条',
        'healthBarAlpha' => '生命条透明度',
        'oldHealthBarVersion' => '简化版 psych 0.63h',
        ////////
        'Combo' => '连击设置',
        ////////
        'comboColor' => '允许获取和使用评级颜色',
        'comboOffsetFix' => '修复Combo的偏移',
        ////////
        'KeyBoard' => '小键盘',
        ////////
        'keyboardAlpha' => '小键盘透明度',
        'keyboardTime' =>'显示长键',
        'keyboardBGColor' => '背景颜色',
        'keyboardTextColor' => '文字颜色',
        ////////
        'Camera' => '摄像机',
        ////////
        'camZooms' => '更改在游戏里摄像机的缩放',
        'scoreZoom' => '分数栏会随着打击音符缩放',



        //==Skin==\\
        'Skin' => '皮肤设置',
        ////////
        'noteSkin' => '选择你的箭头皮肤',
        'noteRGB' => '给箭头染色',
        'NotesSubState' => '箭头颜色设置',
        ////////
        'Splash' => '喷浆皮肤设置',
        ////////
        'splashSkin' => '选择你的箭头喷溅皮肤',
        'splashRGB' => '给喷溅皮肤染色',
        'showSplash' => '显示在sick/marvelous贴图之上',
        'splashAlpha' => '喷溅透明度',



        //==Input==\\
        'Input' => '按键设置',
        ////////
        'ControlsSubState' => '键位设置',
        ////////
        'TouchMain' => '主要触摸按键设置',
        ////////
        'needMobileControl' => '触摸支持',
        'controlsAlpha' => '按键透明度',
        ////////
        'TouchGame' => '游戏触摸按键设置',
        ////////
        'MobileControlSelectSubState' => '控件类型，就是十字键钢琴键啥的',
        'dynamicColors' => '动态颜色',
        'hitboxLocation' => 'Hitbox 额外键位置',
        'playControlsAlpha' => '按键透明度',
        'extraKey' => 'ExtraKey 用于特殊键',
        'MobileExtraControl' => '特殊按键设置',



        //==User Interface==\\
        'UserInterface' => '用户界面设置',
        ////////
        'CustomFade' => '自定义过场动画类型',
        'CustomFadeSound' => '自定义过场动画音量',
        'CustomFadeText' => '自定义过场动画文本是否可见',
        'skipTitleVideo' => '跳过游戏启动时的动画',
        'freeplayOld' => '使用Psych的FreePlay',
        'resultsScreen' => '在结尾歌曲处打开结算界面',
        'loadingScreen' => '为 PlayState 添加 LoadingScreen 并更快地加载，如果遇到问题，请禁用它',



        //==Watermark==\\
        'Watermark' => '水印设置',
        ////////
        'FPScounter' => 'FPS 计数器',
        ////////
        'showFPS' => '显示FPS',
        'showExtra' => '显示更多性能方面的数值',
        'rainbowFPS' => '彩虹FPS',
        'memoryType' => '运存展示数据',
        'FPSScale' => 'FPS的显示大小',

        'showWatermark' => '显示水印',
        'WatermarkScale' => '水印大小'
    ];
}