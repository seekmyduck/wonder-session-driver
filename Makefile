# ============================================================
#  Wonder Session — 4 Virtual Audio Drivers (basés sur BlackHole)
# ============================================================

CXX          = clang
CFLAGS       = -std=c11 -Wall -O2 \
               -arch x86_64 \
               -mmacosx-version-min=10.14 \
               -framework CoreAudio \
               -framework CoreFoundation \
               -framework Accelerate

DEVELOPER_ID = "Developer ID Application: David Tarabbia (2A28Q8V23R)"
INSTALLER_ID = "Developer ID Installer: David Tarabbia (2A28Q8V23R)"
SRC          = WonderSessionDriver.c

DEFINES_1    = -DkDriver_Name='"WS - DAW to Talent"' -DkPlugIn_BundleID='"com.wonderstudio.ws-daw-to-talent"' -DkHas_Driver_Name_Format=false
DEFINES_2    = -DkDriver_Name='"WS - DAW to Conf"'   -DkPlugIn_BundleID='"com.wonderstudio.ws-daw-to-conf"'   -DkHas_Driver_Name_Format=false
DEFINES_3    = -DkDriver_Name='"WS - Conf to DAW"'   -DkPlugIn_BundleID='"com.wonderstudio.ws-conf-to-daw"'   -DkHas_Driver_Name_Format=false
DEFINES_4    = -DkDriver_Name='"WS - Talent to DAW"' -DkPlugIn_BundleID='"com.wonderstudio.ws-talent-to-daw"' -DkHas_Driver_Name_Format=false

COMMON_DEFINES = -DkNumber_Of_Channels=2 -DkManufacturer_Name='"Wonder Studio"'

BINS = WS-DAW-to-Talent.driver/Contents/MacOS/WS-DAW-to-Talent \
       WS-DAW-to-Conf.driver/Contents/MacOS/WS-DAW-to-Conf \
       WS-Conf-to-DAW.driver/Contents/MacOS/WS-Conf-to-DAW \
       WS-Talent-to-DAW.driver/Contents/MacOS/WS-Talent-to-DAW

all: $(BINS)
	@echo "✅ 4 drivers Wonder Session compilés"

WS-DAW-to-Talent.driver/Contents/MacOS/WS-DAW-to-Talent: $(SRC)
	mkdir -p $(@D)
	$(CXX) $(CFLAGS) $(COMMON_DEFINES) $(DEFINES_1) \
	    -exported_symbols_list WS-DAW-to-Talent.exp \
	    -bundle -o $@ $<

WS-DAW-to-Conf.driver/Contents/MacOS/WS-DAW-to-Conf: $(SRC)
	mkdir -p $(@D)
	$(CXX) $(CFLAGS) $(COMMON_DEFINES) $(DEFINES_2) \
	    -exported_symbols_list WS-DAW-to-Conf.exp \
	    -bundle -o $@ $<

WS-Conf-to-DAW.driver/Contents/MacOS/WS-Conf-to-DAW: $(SRC)
	mkdir -p $(@D)
	$(CXX) $(CFLAGS) $(COMMON_DEFINES) $(DEFINES_3) \
	    -exported_symbols_list WS-Conf-to-DAW.exp \
	    -bundle -o $@ $<

WS-Talent-to-DAW.driver/Contents/MacOS/WS-Talent-to-DAW: $(SRC)
	mkdir -p $(@D)
	$(CXX) $(CFLAGS) $(COMMON_DEFINES) $(DEFINES_4) \
	    -exported_symbols_list WS-Talent-to-DAW.exp \
	    -bundle -o $@ $<

sign: all
	@for d in WS-DAW-to-Talent WS-DAW-to-Conf WS-Conf-to-DAW WS-Talent-to-DAW; do \
	    codesign --sign $(DEVELOPER_ID) \
	        --options runtime --timestamp --force --deep $$d.driver; \
	    echo "✅ Signé: $$d"; \
	done

clean:
	rm -f WS-DAW-to-Talent.driver/Contents/MacOS/WS-DAW-to-Talent
	rm -f WS-DAW-to-Conf.driver/Contents/MacOS/WS-DAW-to-Conf
	rm -f WS-Conf-to-DAW.driver/Contents/MacOS/WS-Conf-to-DAW
	rm -f WS-Talent-to-DAW.driver/Contents/MacOS/WS-Talent-to-DAW
