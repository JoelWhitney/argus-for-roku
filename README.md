# argus-for-roku

# Getting started

1. [Enable device for development](https://developer.roku.com/en-gb/docs/developer-program/getting-started/developer-setup.md)
2. Install [Atom](https://atom.io)
3. Install [Roku Brightscript Atom package](https://github.com/rokudev/atomio-package/blob/master/documentation/README.md) for modifying and deploying
   - Set "ip_address", "username", "password" settings in Atom > Preferences > Packages > "atom_roku"
4. Clone repository and open in Atom
5. Deploy channel
   - Atom: "Ctrl + Optn + E"
   - Browser: Go to "ip_address" and upload ZIP
6. Debug in terminal with `telnet <ip_address> 8085` if
   - Install with `brew install telnet`
7. Profit 💰

# Deep link examples
You trigger deep linking by doing an HTTP post to port 8060 on your Roku device. The general form is
`http://<IP of Roku>:8060/launch/[dev | channeID]?<key value pairs>`

Development app link examples
- Launch: `curl -d '' 'http://192.168.0.133:8060/launch/dev'`
- Open to video content:
   - `curl -d '' 'http://192.168.0.133:8060/launch/dev?streamformat=hsl&url=http%3A%2F%2Fdevimages.apple.com%2Fiphone%2Fsamples%2Fbipbop%2Fbipbopall.m3u8'`
   - `curl -d '' 'http://192.168.0.133:8060/launch/dev?streamformat=mp4&url=http%3A%2F%2Fvideo.ted.com%2Ftalks%2Fpodcast%2FVilayanurRamachandran_2007_480.mp4'`

Private published "Argus for Roku" app link examples
- Install: `curl -d '' 'http://192.168.0.133:8060/install/578841'`
- Launch: `curl -d '' 'http://192.168.0.133:8060/launch/578841'`
- Open to video content:
   - `curl -d '' 'http://192.168.0.133:8060/launch/578841?streamformat=hsl&url=http%3A%2F%2Fdevimages.apple.com%2Fiphone%2Fsamples%2Fbipbop%2Fbipbopall.m3u8'`
   - `curl -d '' 'http://192.168.0.133:8060/launch/578841?streamformat=mp4&url=http%3A%2F%2Fvideo.ted.com%2Ftalks%2Fpodcast%2FVilayanurRamachandran_2007_480.mp4'`

# Resources
- [Roku/Brightscript API doc](https://developer.roku.com/en-gb/docs/references/references-overview.md)
- [Publishing private channels](https://developer.roku.com/docs/developer-program/publishing/channel-publishing-guide.md#non-certified-channels)
- [ECP API doc](https://developer.roku.com/en-gb/docs/developer-program/debugging/external-control-api.md)
