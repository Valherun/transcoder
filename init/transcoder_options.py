# This file is meant to import any transcoder options
# please see options from transcode-video --help

# H264
# currently uses target big and preset slower for higher qualit encoding
# adds english as the main audio and japanese and spanish as secondaries
# will also add english and spanish subtitles and burn in forced subs.
# Warning
#   --aac-encoder ca_aac is system dependent, I had to do this to force audio to be present in AAC format rather than AC3 due
#        to the needs that I have to keep Plex from transcoding AC3 to AAC for some clients.
# H265
#    Add  --handbrake-option encoder=x265 to the options
# Deinterlace
#    Add  --filter deinterlace to enable deinterlacing
#      This should be detected by automatically, but if you need to hard code it.


TRANSCODE_OPTIONS = '--preset slower --target big --main-audio eng --add-audio jpn,spa --add-subtitle eng,spa --burn-subtitle scan --aac-encoder ca_aac'
