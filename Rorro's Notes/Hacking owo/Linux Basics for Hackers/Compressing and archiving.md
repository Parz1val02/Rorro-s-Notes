#Linux 
<h1> Compression </h1>
>Compression, as the name implies, makes data smaller, thereby requiring less storage 
>capacity and making the data easier to transmit. 

#### Lossy and lossless:
<p> Lossy compression is very effective in reducing the size of files, but the integrity of the information is lost. In other words, the file after compression is not exactly the same as the original. Examples: —.mp3, .mp4, .png, and .jpg are all lossy compression algorithms<br>However, lossy compression is unacceptable when you’re sending files or software and data integrity is crucial. This chapter focuses on this lossless type of compression. It is not as effective as lossy</p>

##### Tarring files together
Usually, the first thing you do when compressing files is to combine them into an archive. The *tar* command is used to do this. 

	tar -cvf name.tar file1 file2 file3 ...
	creates an archive by compressing together multiple files
	-c stands for create
	-v stands for verbose
	-f stands for write to the following file

The final archive adds a significant amount of bytes when more files are used

	tar -tvf name.tar
	lists the content of the tar with out extracting them
	-t stand for content list

	tar -xvf name.tar
	extracts the files from the archive
	-x stands for extract

Note that by default, if an extracted file already exists, tar will remove the existing file and replace it with the extracted file.

#### Compressing files
Now we have one archived file, but that file is bigger than the sum of the original files. What if you want to compress those files for ease of transport?

- gzip, which uses the extension .tar .gz or .tgz 
- bzip2, which uses the extension .tar .bz2 
- compress, which uses the extension .tar .z

In general, compress is the fastest, but the resultant files are larger; bzip2 is the slowest, but the resultant files are the smallest; and gzip falls somewhere in between.

#### gzip (GNU zip)
	gzip name.*

		Notice that we used the wildcard *for the file extension; this tells 
		Linux that the command should apply to any file that begins with
		name with any file extension

	gunzip name.*

		Decompresses the file using GNU unzip

#### bzip2 (better compression rate, smaller file)
	bzip2 name.*
	compresses the file

	bunzip2 name.*
	decompresses the file

#### compress 
	compress name.*
	uncompress name.*

#### CREATING BIT-BY-BIT OR PHYSICAL COPIES OF STORAGE DEVICES
The dd command makes a bit­by­bit copy of a file, a filesystem, or even an entire hard drive. This means that even deleted files are copied. It’s critical to note that the dd command should not be used for typical day­to­day copying of files and storage devices because it is very slow

	dd if=inputfile of=outputfile
	if designates your input file
	of designates your output file

	dd if=inputfile of=outputfile bs=4096 conv:noerror
	bs: determines block size
	noerror: continues to copy even if errors are encountered