

#!/bin/sh

#  buildpod.sh
# 构建 framework， 并发布 Pod
#用于编译、验证、打tag，整个流程

PROJECT_NAME=${PWD##*/}

pushd "$(dirname "$0")" > /dev/null
SCRIPT_DIR=$(pwd -L)
popd > /dev/null

git config --get user.name
git config --get user.email


CURRENT_POD_VERSION=$(cat $PROJECT_NAME.podspec | grep 's.version' | grep -o '[0-9]*\.[0-9]*\.[0-9]*' -m 1)
echo "$PROJECT_NAME version: $CURRENT_POD_VERSION"

# 提交改动到 gitlab
git push origin --delete tag $CURRENT_POD_VERSION
git tag -d $CURRENT_POD_VERSION
git add .
git commit -m "版本: $CURRENT_POD_VERSION; $1"
git push
# 给版本打 tag
git tag -a $CURRENT_POD_VERSION -m "版本: $CURRENT_POD_VERSION"
git push origin $CURRENT_POD_VERSION

# 发布 Pod
echo "publish repo $PROJECT_NAME"
#指定要推送的Repo仓库
pod repo push GGSpecs $PROJECT_NAME.podspec --verbose --use-libraries --allow-warnings

ret=$?

if [ "$ret" -ne "0" ];then
exit 1
fi
