<h1>strings_dump</h1>

https://github.com/eladkarako/strings_dump/archive/refs/heads/master.zip  

<h3>

batch files to wrap around GNU strings binary-files,  
to allow easy drag and drop of multiple files.  

</h3>

a lot of tools already exist that can provide you with the same functionality,  
XVI32 - http://www.chmaas.handshake.de/delphi/freeware/xvi32/xvi32.htm  
or ImHex - https://github.com/WerWolv/ImHex  
as well as `Exeinfo PE`  
all can, to some degree grab some strings from your binary file,  
but they are either limited to specific Endianess / bit size,  
or you'll have to keep switching back and forth.  
also, copying the actual values, or searching multiple files is a pain...


<hr/>

<h3>how to use <code>strings_dump</code>?</h3>  

<h4>

drag and drop <strong>any amount of files</strong> over `strings_dump__loop.cmd`  
it will try to read the file's data in ALL:  
- 8-BIT  
- 16 BIT - little-endian (LE)  
- 16 BIT - big-endian (BE)  
- 32 BIT - little-endian (LE)  
and dump it all into one txt file, per input file (in the same folder of the file).  

</h4>

<hr/>

<h3>note 1 part 1 - in-file "titles":</h3>

this additional text will be present in your result txt file:  
`------------------------------------------------ [strings: 8 BIT]`  
`------------------------------------------------ [strings: 16 BIT - little-endian (LE)]`  
`------------------------------------------------ [strings: 16 BIT - big-endian (BE)]`  
`------------------------------------------------ [strings: 32 BIT - little-endian (LE)]`  
`------------------------------------------------ [strings: 32 BIT - big-endian (BE)]`  

you can use those "titles" to skip to a specific "section",  
or search "upward" from a specific "finding" to find out "how it has been parsed".  

each file is pretty much being read few times, each time with a different "encoding".  
(using multiple calls with `"--encoding=S"`, `"--encoding=l"`, `"--encoding=b"`, `"--encoding=L"`, `"--encoding=B"`)  

this makes it easier to read/search "in one go" using your editor of your choice (you can drag and drop multiple files to Notepad++ tabs and "look in all files").  

<hr/>

<h3>note 1 part 2 - "encoding" - wtf is Endianness..?</h3>

normally files built for intel x86/amd64 will use little-endian,  
regardless, it is always nice to be able to get a more generic solution,  
this way it easily parse linux binaries that were built for powerpc, arm and other CPUs..  
read about is endianness: https://en.wikipedia.org/wiki/Endianness  

<hr/>

<h3>note 2 - in-file "locations":</h3>

a 16-bit (hex) "address" that helps to locate where the string was "taken" from in the file is included in the text (using `strings`'s `--radix=x` argument).  
also, it is "right aligned".  

you can edit the command line in `strings_dump.cmd` if you don't need it,  
but I find it helpful to avoid confusion.

<hr/>

<h4>note 3 - source and binaries - version:</h4>  

GNU strings is part of GNU Binutils.  
current version is x86_x64 (amd64) build v2.39  
from:  
https://cygwin.com/cgi-bin2/package-cat.cgi?file=x86_64%2Fbinutils-src%2Fbinutils-2.39-1-src&grep=utils  
https://cygwin.com/cgi-bin2/package-cat.cgi?file=x86_64%2Fbinutils%2Fbinutils-2.39-1&grep=utils  

unmodified binary-files from the build above, provided with cygwin dependencies, for Windows usage.  

License for the binary-files is GNUv3.  
for my batch files is The UnLicensed (Public Domain).  

no support, run stuff on your own, I advise downloading/building binutils for your-own.  

<hr/>

<br/>
<br/>

<hr/>

<h3>example</h3>


drag and drop `winsetup.dll` (extracted from Windows ISO `/sources/winsetup.dll` to your desktop, for example)  
will give you the following result (this is from a Windows 11 `22623.741.220928-1154` build) in a file named `winsetup.dll__strings.txt` (written to the same folder).  

see `winsetup.dll__strings.txt`.  

