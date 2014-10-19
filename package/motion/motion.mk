################################################################################
#
# motion
#
################################################################################

MOTION_SITE = git@github.com:digitalpeer/motion.git
MOTION_SITE_METHOD = git
MOTION_VERSION = 122b8fa2db46d46f5b93ae0cb36497984daffa98
MOTION_CONF_OPT = --without-pgsql --without-sdl --without-sqlite3 --without-mysql --with-ffmpeg=$(STAGING_DIR)/usr/lib --with-ffmpeg-headers=$(STAGING_DIR)/usr/include

MOTION_DEPENDENCIES += ffmpeg

$(eval $(autotools-package))
