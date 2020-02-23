' ********************************************************************
' **  Argus feed eater
' **  Copyright (c) 2020 Joel Whitney. All Rights Reserved.
' ***************

Sub Main(args As Dynamic)

    if type(args) = "roAssociativeArray" and type(args.url) = "roString" then
        print "Displaying video: "
        p = CreateObject("roMessagePort")
        video = CreateObject("roVideoScreen")
        video.setMessagePort(p)

        'bitrates  = [0]          ' 0 = no dots, adaptive bitrate
        'bitrates  = [348]    ' <500 Kbps = 1 dot
        'bitrates  = [664]    ' <800 Kbps = 2 dots
        'bitrates  = [996]    ' <1.1Mbps  = 3 dots
        'bitrates  = [2048]    ' >=1.1Mbps = 4 dots
        bitrates  = [0]

        ' sample -- DELETE ONCE WORKING WITH args
        'urls = ["http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8"]
        qualities = ["SD"]
        streamformat = "hls"

        if type(args.url) = "roString" and args.url <> "" then
            urls = [args.url]
        end if
        if type(args.StreamFormat) = "roString" and args.StreamFormat <> "" then
            StreamFormat = args.StreamFormat
        end if
        if type(args.title) = "roString" and args.title <> "" then
            title = args.title
        else
            title = ""
        end if
        if type(args.srt) = "roString" and args.srt <> "" then
            srt = args.StreamFormat
        else
            srt = ""
        end if

        videoclip = CreateObject("roAssociativeArray")
        videoclip.StreamBitrates = bitrates
        videoclip.StreamUrls = urls
        videoclip.StreamQualities = qualities
        videoclip.StreamFormat = StreamFormat
        videoclip.Title = title

        video.SetContent(videoclip)
        video.show()

        lastSavedPos   = 0
        statusInterval = 10 'position must change by more than this number of seconds before saving

        while true
            msg = wait(0, video.GetMessagePort())
            if type(msg) = "roVideoScreenEvent"
                if msg.isScreenClosed() then 'ScreenClosed event
                    print "Closing video screen"
                    exit while
                else if msg.isPlaybackPosition() then
                    nowpos = msg.GetIndex()
                    if nowpos > 10000

                    end if
                    if nowpos > 0
                        if abs(nowpos - lastSavedPos) > statusInterval
                            lastSavedPos = nowpos
                        end if
                    end if
                else if msg.isRequestFailed()
                    print "play failed: "; msg.GetMessage()
                else
                    print "Unknown event: "; msg.GetType(); " msg: "; msg.GetMessage()
                endif
            end if
        end while

    else
        screen = CreateObject("roSGScreen")
        m.port = CreateObject("roMessagePort")
        screen.setMessagePort(m.port)

        'Create a scene and load /components/main.xml'
        scene = screen.CreateScene("Main")
        screen.show()

        Sleep(2500)
        ut = CreateObject("roUrlTransfer")
        ut.SetUrl("http://localhost:8060/keypress/Home")
        ut.PostFromString("")

        while(true)
            msg = wait(0, m.port)
            msgType = type(msg)
            if msgType = "roSGScreenEvent"
                if msg.isScreenClosed() then return
            end if
        end while
    end if

End Sub
