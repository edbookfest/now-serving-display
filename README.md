# Now serving

Displays customer queue numbers currently being served

[![Import](https://cdn.infobeamer.com/s/img/import.png)](https://info-beamer.com/use?url=https://github.com/edbookfest/now-serving-display.git)

##### Local control
##### Enable queue
`echo -n "now-serving/queue:true" | netcat -u x.x.x.x 4444`
##### Disable queue
`echo -n "now-serving/queue:false" | netcat -u x.x.x.x 4444`
##### Set serving text
`echo -n "now-serving/serving:1 - 20" | netcat -u x.x.x.x 4444`
