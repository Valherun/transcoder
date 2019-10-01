<<<< NOW DEPRECATED USE valherun/ubuntu-transcoder instead >>>>

# Transcoder

This is my personal unraid docker used to transcode video files using Don Melton's
video Transcoding tools, found at :

https://github.com/donmelton/video_transcoding

It also incorporates the transcoding.py script from Tested's Transcoder,
found at: 

https://github.com/andymccurdy/tested-transcoder

This is an adaptation of the original tested transcoder to both use Don's new
Ruby based transcoding tools, in addition to being able to run as an unraid docker.

Please see their appropriate sites to learn what and how they work.

Also, I really don't know what I am doing with Don's tools, but can make them work, and
sadly I know less about Python and docker.. but hopefully I kicked things enough to work.

The docker will enable to volumes to be mounted
  /config - will hold the transcoder.py script that will be copied into the container
            when it starts. This is done so that you can access the script to make changes
            outside of the container itself
            
  /transcoder - is the spot where the transcoder gets input and places outputs.
                NOTE: You will likely need to take ownership of the items in this folder
                after the initial startup as they will be set to owner root:root
                
                to do this you will need to ssh into unraid and run as root :
                chown -R <desired user>:<desired group> <path to transcoder folder>


&&& Had to reupload after an accidently repo delete &&&
