<CFSETTING ENABLECFOUTPUTONLY="YES">
<!---
NAME: CF_GraphicsMagick

DESCRIPTION: ColdFusion wrapper for some GraphicsMagick routines. Faster than CFImage. Generates smaller images. Better
CMYK compatilibity (Adds compatibility to CF9.)
Works with more images formats, including EPS: http://www.graphicsmagick.org/formats.html

EXAMPLES:
	<CF_GraphicsMagick action="AspectScale" Infile="#ImageIn#" Outfile="#imageOut#" width="#W#" height="#H#">  
	<CF_GraphicsMagick action="Crop" Infile="#ImageIn#" width="#W#" height="#H#" cropX="10" cropY="10" quality="75">
	<CF_GraphicsMagick action="ResizeFit" Infile="#ImageIn#" width="300" height="3000" filter="Catrom" depth="8" quality="75">
	<CF_GraphicsMagick action="Optimize" Infile="#ImageIn#">
	<CF_GraphicsMagick action="Commands" commands="convert -colorspace rgb -rotate 45 -scale 50% #ImageIn# #outfile#">

	To ensure that an uploaded JPG is optimized and not CMYK:
	<CF_GraphicsMagick action="Optimize" Infile="#ImageIn#">
	
AUTHOR:
James Moberg (james@ssmedia.com) 7/28/2015
8/29/2015 "Commands" action. Rotate, AutoOrient, Orient, Density, Wildcard Input

--->

<CFSET AllowedActions = "AspectCrop,ResizeWidth,ResizeHeight,ResizeFit,Crop,Optimize,Identify,Commands">

<CFPARAM NAME="Attributes.InFile" DEFAULT=""><!--- Required Path & filename --->
<CFPARAM NAME="Attributes.OutFile" DEFAULT=""><!--- Optional. Defaults to InFile --->
<CFPARAM NAME="Attributes.Action" DEFAULT="Identify"><!--- AspectCrop, ResizeWidth, ResizeHeight, ResizeFit, Crop, Optimize, Identify --->
<CFPARAM NAME="Attributes.Width" DEFAULT="">
<CFPARAM NAME="Attributes.Height" DEFAULT="">
<CFPARAM NAME="Attributes.CropX" DEFAULT=""><!--- Required for Crop action --->
<CFPARAM NAME="Attributes.CropY" DEFAULT=""><!--- Required for Crop action --->
<CFPARAM NAME="Attributes.ExecPath" DEFAULT="c:\Program Files\GraphicsMagick-1.3.21-Q8\gm.exe">
<CFPARAM NAME="Attributes.TimeOut" DEFAULT="">
<CFPARAM NAME="Attributes.Quality" DEFAULT=""><!--- default = 75 --->
<CFPARAM NAME="Attributes.Result" DEFAULT=""><!--- Return variable. Default = "variables.GraphicsMagickResult" --->
<CFPARAM NAME="Attributes.Debug" DEFAULT=""><!--- boolean (Sets identifyType to "verbose") --->
<CFPARAM NAME="Attributes.Filter" DEFAULT=""><!--- Point, Box, Triangle, Hermite, Hanning, Hamming, Blackman, Gaussian, Quadratic, Cubic, Catrom, Mitchell, Lanczos, Bessel, Sinc --->
<CFPARAM NAME="Attributes.ColorSpace" DEFAULT=""><!---  CineonLog, CMYK, GRAY, HSL, HWB, OHTA, RGB, Rec601Luma, Rec709Luma, Rec601YCbCr, Rec709YCbCr, Transparent, XYZ, YCbCr, YIQ, YPbPr, YUV --->
<CFPARAM NAME="Attributes.Depth" DEFAULT=""><!---  Integer, 1-48 (8=256 colors; 16=262,144 color; 24=16 million) --->
<CFPARAM NAME="Attributes.Colors" DEFAULT=""><!--- integer (preferred number of colors in the image) --->
<CFPARAM NAME="Attributes.Dither" DEFAULT=""><!--- boolean (apply Floyd/Steinberg error diffusion to the image) --->
<CFPARAM NAME="Attributes.Gravity" DEFAULT=""><!--- NorthWest, North, NorthEast, West, Center, East, SouthWest, South, SouthEast --->
<CFPARAM NAME="Attributes.Rotate" DEFAULT=""><!--- degrees{<}{>} Use > to rotate the image only if its width exceeds the height. < rotates the image only if its width is less than the height. --->
<CFPARAM NAME="Attributes.Orient" DEFAULT=""><!---  undefined, TopLeft, TopRight, BottomRight, BottomLeft, LeftTop, RightTop, RightBottom, LeftBottom, Top-Left, Top-Right, Bottom-Right, Bottom-Left, Left-Top, Right-Top, Right-Bottom, Left-Bottom (Please note that GraphicsMagick does not include an EXIF editor so if an EXIF profile is written to the output image, the value in the EXIF profile might not match the image. It is possible for an image file to indicate its orientation in several different ways simultaneously.) --->
<CFPARAM NAME="Attributes.AutoOrient" DEFAULT=""><!--- boolean orient (rotate) image so it is upright --->
<CFPARAM NAME="Attributes.Density" DEFAULT="72x72"><!--- <width>x<height> Default is 72 --->
<CFPARAM NAME="Attributes.Interlace" DEFAULT=""><!--- None, Line, Plane, Partition --->
<CFPARAM NAME="Attributes.IdentityType" DEFAULT=""><!--- ping, verbose --->
<CFPARAM NAME="Attributes.Compress" DEFAULT=""><!--- None, BZip, Fax, Group4, JPEG, Lossless, LZW, RLE, Zip, LZMA --->
<CFPARAM NAME="Attributes.Comment" DEFAULT=""><!--- Text String (optional) --->
<CFPARAM NAME="Attributes.Minify" DEFAULT=""><!--- boolean (The image size is halved using linear interpolation.) --->
<CFPARAM NAME="Attributes.monochrome" DEFAULT=""><!--- boolean (transform the image to black and white) --->
<CFPARAM NAME="Attributes.Paint" DEFAULT=""> <!--- integer. Simulate an oil painting Each pixel is replaced by the most frequent color in a circular neighborhood whose width is specified with radius. --->
<CFPARAM NAME="Attributes.UseUnsharp" DEFAULT=""><!--- Boolean. Uses -unsharp 0.25x0.25+8+0.065 http://www.smashingmagazine.com/2015/06/efficient-image-resizing-with-imagemagick/ --->
<CFPARAM NAME="Attributes.Commands" DEFAULT="">

<!--- Set/Reset defaults --->
<CFIF NOT LIstfindnocase("Identify,Commands", Attributes.Action)>
	<CFIF NOT ListFindnocase("CineonLog,CMYK,GRAY,HSL,HWB,OHTA,RGB,Rec601Luma,Rec709Luma,Rec601YCbCr,Rec709YCbCr,Transparent,XYZ,YCbCr,YIQ,YPbPr,YUV", trim(Attributes.ColorSpace))>
		<CFSET Attributes.ColorSpace = "rgb">
	</CFIF>
	<CFIF NOT ListFindnocase("None,Line,Plane,Partition", Attributes.Interlace)>
		<CFSET Attributes.Interlace = "Line">
	</CFIF>
	<CFIF NOT ListFindnocase("NorthWest,North,NorthEast,West,Center,East,SouthWest,South,SouthEast", Attributes.Gravity)>
		<CFSET Attributes.Gravity = "Center">
	</CFIF>
	<CFIF NOT isNumeric(Attributes.CropX) OR NOT isValid("integer", Attributes.CropX)>
		<CFSET Attributes.CropX = "">
	</CFIF>
	<CFIF NOT isNumeric(Attributes.CropY) OR NOT isValid("integer", Attributes.CropY)>
		<CFSET Attributes.CropY = "">
	</CFIF>
	<CFIF NOT ListFindnocase("Point,Box,Triangle,Hermite,Hanning,Hamming,Blackman,Gaussian,Quadratic,Cubic,Catrom,Mitchell,Lanczos,Bessel,Sinc", Attributes.Filter)>
		<CFSET Attributes.Filter = "Lanczos">
	</CFIF>
	<CFIF NOT isvalid("integer", Attributes.Quality) OR VAL(Attributes.Quality) LT 1 OR VAL(Attributes.Quality) GT 100>
		<CFSET Attributes.Quality = 85>
	</CFIF>
</CFIF>

<CFIF NOT isValid("variableName", trim(Attributes.Result))>
	<CFSET Attributes.Result = "GraphicsMagickResult">
</CFIF>
<CFIF NOT isvalid("integer", Attributes.TimeOut) OR VAL(Attributes.TimeOut) LT 0>
	<CFSET Attributes.TimeOut = 60>
</CFIF>

<CFSET TempAttributes = StructNew()>
<CFLOOP COLLECTION="#Attributes#" ITEM="ThisAttribute">
	<CFIF LEN(trim(Attributes[ThisAttribute]))>
		<CFSET TempAttributes[ThisAttribute] = trim(Attributes[ThisAttribute])>
	</CFIF>
</CFLOOP>

<cfscript>
if (Attributes.Action IS "Commands"){
	/* Nothing */
} else if (NOT Find("*", Attributes.InFile) AND NOT FileExists(Attributes.InFile)){
	throw(message="GraphicsMagick: InFile image does not exist.");
}
if (NOT listFindnocase(AllowedActions, Attributes.Action)){
	throw(message="GraphicsMagick: Invalid action.");
}

if (NOT LEN(Attributes.OutFile)){
	Attributes.OutFile = Attributes.InFile;
}
if (NOT IsNumeric(Attributes.Quality) OR VAL(Attributes.Quality) LT 1 OR VAL(Attributes.Quality) GT 100){
	Attributes.Quality = 75;
}

TempDebug = {"debug"="", "width"=0, "height"=0, "commandline"="", "duration"=0, "attributes"=TempAttributes};
Caller[trim(Attributes.Result)] = TempDebug;

CommandLine = ["Convert", "-colorspace #Attributes.ColorSpace#", "-strip" ];

if (val(Attributes.depth)){
	ArrayAppend(CommandLine, "-depth #VAL(Attributes.depth)#");
}
if (isBoolean(Attributes.Minify) AND YesNoFormat(Attributes.Minify)){
	ArrayAppend(CommandLine, "-minify");
}
if (isBoolean(Attributes.monochrome) AND YesNoFormat(Attributes.monochrome)){
	ArrayAppend(CommandLine, "-monochrome");
}
if (val(Attributes.Paint)){
	ArrayAppend(CommandLine, "-paint #VAL(Attributes.Paint)#");
}
if (val(Attributes.Colors)){
	ArrayAppend(CommandLine, "-colors #VAL(Attributes.Colors)#");
}
if (LEN(Attributes.Filter)){
	ArrayAppend(CommandLine, "-filter #Attributes.Filter#");
}
if (isBoolean(Attributes.AutoOrient) AND YesNoFormat(Attributes.AutoOrient)){
	ArrayAppend(CommandLine, "-auto-orient");
} else if (ListFindNocase("TopLeft,TopRight,BottomRight,BottomLeft,LeftTop,RightTop,RightBottom,LeftBottom,Top-Left,Top-Right,Bottom-Right,Bottom-Left,Left-Top,Right-Top,Right-Bottom,Left-Bottom", Attributes.Orient)){
	ArrayAppend(CommandLine, "-orient #Attributes.Orient#");
}
if (LEN(Attributes.Rotate)){
	ArrayAppend(CommandLine, "-rotate #Attributes.Filter#");
}
if (LEN(Attributes.Density)){
	ArrayAppend(CommandLine, "-density #Attributes.Density#");
}
if (Listfindnocase("None,BZip,Fax,Group4,JPEG,Lossless,LZW,RLE,Zip,LZMA", Attributes.Compress)){
	ArrayAppend(CommandLine, "-compress #Attributes.compress#");
}
if (isBoolean(Attributes.Dither) AND YesNoFormat(Attributes.Dither)){
	ArrayAppend(CommandLine, "-dither");
}
if (Attributes.Action IS "AspectCrop"){
	ArrayAppend(CommandLine, "-size #VAL(Attributes.width)#x#VAL(Attributes.Height)#");
}
ArrayAppend(CommandLine, """#Attributes.InFile#""");

/* Action functions */
if (Attributes.Action IS "AspectCrop"){
	ArrayAppend(CommandLine, "-thumbnail ""#VAL(Attributes.width)#x#VAL(Attributes.Height)#^""");
	ArrayAppend(CommandLine, "-gravity #Attributes.Gravity#");
	ArrayAppend(CommandLine, "-extent #VAL(Attributes.width)#x#VAL(Attributes.Height)#");
} else if (Attributes.Action IS "resizeWidth"){
	ArrayAppend(CommandLine, "-resize ""#VAL(Attributes.width)#x-1""");
} else if (Attributes.Action IS "resizeHeight"){
	ArrayAppend(CommandLine, "-resize ""x#VAL(Attributes.height)#""");
} else if (Attributes.Action IS "resizeFit"){
	ArrayAppend(CommandLine, "-resize ""#VAL(Attributes.width)#x#VAL(Attributes.height)#>""");
} else if (Attributes.Action IS "Crop" AND VAL(Attributes.CropX) AND VAL(Attributes.CropY)){
	ArrayAppend(CommandLine, "-crop ""#VAL(Attributes.Width)#x#VAL(Attributes.Height)#+#VAL(Attributes.CropX)#+#VAL(Attributes.CropY)#""");
}
if (isBoolean(Attributes.UseUnsharp) AND YesNoFormat(Attributes.UseUnsharp)){
	ArrayAppend(CommandLine, "-unsharp 0.25x0.25+8+0.065");
}
ArrayAppend(CommandLine, "-interlace #Attributes.Interlace#");
ArrayAppend(CommandLine, "-quality #VAL(Attributes.Quality)#");
ArrayAppend(CommandLine, "+profile ""*""");
if (LEN(TRIM(Attributes.Comment))){
	ArrayAppend(CommandLine, "-comment ""#TRIM(Attributes.Comment)#""");
}
ArrayAppend(CommandLine, """#Attributes.OutFile#""");

/* If Identify, clear commands */
if (Attributes.Action IS "identify"){
	CommandLine = [];
}
</cfscript>

<CFSET CommandLine = ArrayToList(CommandLine, " ")>
<CFIF Attributes.Action IS "Commands">
	<CFSET CommandLine = Attributes.Commands>
</CFIF>

<CFSET TempDebug.CommandLine = CommandLine>

<CFSET TimeStart = GetTickCount()>
<CFIF LEN(CommandLine)>
	<cfexecute name="#Attributes.ExecPath#" 
		arguments="#CommandLine#"
		timeout="#Attributes.TimeOut#"
		variable="ExecOutput">
	</cfexecute>
	<CFIF IsDefined("ExecOutput")>
		<CFSET TempDebug.debug = ExecOutput>
	</CFIF>
</CFIF>

<CFIF Find("*", Attributes.OutFile) OR NOT FileExists(Attributes.OutFile)>
	<CFSET TempDebug.duration = GetTickCount() - TimeStart>
<CFELSE>
	<CFSET Rdim = "(?i)\s(\d+x\d+)+">
	<CFSET IdentityType = "-ping">
	<CFIF (isBoolean(Attributes.Debug) AND YesNoFormat(Attributes.Debug)) OR Attributes.IdentityType IS "verbose">
		<CFSET Rdim = "(?i)\s(\d+x\d+)\s">
		<CFSET IdentityType = "-verbose">
	</CFIF>
	
	<cfexecute name="#Attributes.ExecPath#" 
		arguments="identify #IdentityType# """#Attributes.OutFile#""
		timeout="#Attributes.TimeOut#"
		variable="ExecOutput">
	</cfexecute>
	
	<CFSET TempDebug.debug = ExecOutput>
	<CFSET Dimensions = ReMatch(Rdim, ExecOutput)>
	<CFIF NOT LEN(TempDebug.CommandLine)>
		<CFSET TempDebug.CommandLine = "identify #IdentityType# """#Attributes.OutFile#"">
	</CFIF>
	<CFIF ArrayLen(Dimensions)>
		<CFSET TempDebug.width = val(ListFirst(Dimensions[1],"x"))>
		<CFSET TempDebug.height = val(ListLast(Dimensions[1],"x"))>
	</CFIF>
	<CFSET TempDebug.duration = GetTickCount() - TimeStart>
</CFIF>

<CFSET Caller[Trim(Attributes.Result)] = TempDebug>

<CFSETTING ENABLECFOUTPUTONLY="No">
