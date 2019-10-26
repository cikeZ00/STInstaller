#include <iostream>
#include "boost/filesystem.hpp"
using namespace std;

int main() {
	int status;
	status = 1;
	boost::filesystem::remove_all("Data\\Online");
	boost::filesystem::remove_all("locales");
	boost::filesystem::remove_all("swiftshader");
	remove("cef.pak");
	remove("cef_100_percent.pak");
	remove("cef_200_percent.pak");
	remove("cef_extensions.pak");
	remove("chrome_elf.dll");
	remove("d3dcompiler_43.dll");
	remove("d3dcompiler_47.dll");
	remove("devtools_resources.pak");
	remove("icudtl.dat");
	remove("libcef.dll");
	remove("libEGL.dll");
	remove("libGLESv2.dll");
	remove("natives_blob.bin");
	remove("SkyrimTogether.dll");
	remove("snapshot_blob.bin");
	status=remove("st_loader.exe");
	remove("st_process.exe");
	remove("v8_context_snapshot.bin");
	boost::filesystem::remove_all("logs");
	boost::filesystem::remove_all("cache");
	boost::filesystem::remove_all("server");
	if (status==0) {
		cout << "DONE!";
	}
	else {
		cout << "Failed!";
	}
	cin.get();
	return 0;
}