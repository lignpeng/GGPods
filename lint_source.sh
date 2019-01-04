
#验证lint

SOURCES='git@github.com:lignpeng/GGPods.git,master'
IS_SOURCE=1 pod lib lint --sources=$SOURCES --verbose --fail-fast --use-libraries --allow-warnings --no-clean
