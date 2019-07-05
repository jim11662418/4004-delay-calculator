# 4004 Delay Loop Calculator
I found it tedious to calculate the register values used in delay loops for my [Intel 4004 Single Board Computer](https://github.com/jim11662418/4004-SBC) so I wrote this simple Delphi 7 application to do the calculations. The application assumes that you're using a 4201 Clock Generator with a 5.185 MHz crystal to generate the clock signals for your 4004 or 4040. The crystal frequency can be changed to any value from 3500000 to 5185000 Hz in the lower left corner.

There are two ways to use the application. 
1. You can experimentally manipulate the sliders for the R0-R3 registers until you come up with the delay value that you're looking for. 
2. You can enter the delay (in microseconds) into the lower right corner and click the "Calculate" button.

Once you're satisfied, click the "Copy" button in the upper left corner to copy the delay loop code to the clipboard. Paste the delay loop code into your source file.
<p align="center"><img src="/images/calculator.jpg"/>
<p align="center">4004 Delay Calculator</p><br>
