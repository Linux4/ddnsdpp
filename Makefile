CPPFLAGS := -O3 -Wall -Wextra -Werror
LDFLAGS := -lcurl
# add -static for statically linked?

default: ddnsd++

bind9_zone_parser.o:
	$(CXX) $(CPPFLAGS) -c bind9_zone_parser.cpp

config.o:
	$(CXX) $(CPPFLAGS) -c config.cpp

curl_helper.o:
	$(CXX) $(CPPFLAGS) -c curl_helper.cpp

date_utils.o:
	$(CXX) $(CPPFLAGS) -c date_utils.cpp

ddnsd.o:
	$(CXX) $(CPPFLAGS) -c ddnsd.cpp

he_dns.o:
	$(CXX) $(CPPFLAGS) -c secondary/he_dns.cpp

inet_utils.o:
	$(CXX) $(CPPFLAGS) -c inet_utils.cpp

puck_dns.o:
	$(CXX) $(CPPFLAGS) -c secondary/puck_dns.cpp

secondary_dns.o:
	$(CXX) $(CPPFLAGS) -c secondary/secondary_dns.cpp

string_utils.o:
	$(CXX) $(CPPFLAGS) -c string_utils.cpp

ddnsd++: bind9_zone_parser.o config.o curl_helper.o \
	 date_utils.o ddnsd.o he_dns.o inet_utils.o \
	 puck_dns.o secondary_dns.o string_utils.o
	$(CXX) $(CPPFLAGS) -o ddnsd++ *.o $(LDFLAGS)

clean:
	rm -f *.o ddnsd++
