#property strict
#include "definitions/constants.mqh"
#include "functions/drawing.mqh"
#include "functions/clock.mqh"

string tradingArrows[100];

int OnInit(){
   //Clear(); // Clear the terminal output
   //SetTerminalColors(CLR_WHITE, CLR_BLACK);
   ObjectsDeleteAll(ChartID());
   DrawHLines();
   DrawTrendLines();
   ClearPrevTradingArrows(tradingArrows);
   CalculateTradingArrows(tradingArrows);
   ClearPrevTradingArrows(tradingArrows);
   CalculateTradingArrows(tradingArrows);
   //A. create a timer with a 10 seconds period
   EventSetTimer(9990);
   return(INIT_SUCCEEDED);
}

void OnDeinit(const int reason){
   //A. destroy the timer after completing the work
   EventKillTimer();
   ObjectsDeleteAll(ChartID());
}

void OnTick(){
   Comment("simi test");
}

void OnTimer(){
   ClearPrevTradingArrows(tradingArrows);
   CalculateTradingArrows(tradingArrows);
}