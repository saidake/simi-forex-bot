#ifndef definition_constants
#define definition_constants
//========================================================================================== line Color
#define MARK_ARROR_COLOR      clrDarkGray
#define DEFAULT_ENTRY         clrGray, STYLE_SOLID, OBJPROP_RAY, OBJPROP_RAY_RIGHT
#define DEFAULT_EXIT          clrGray, STYLE_SOLID, OBJPROP_RAY, OBJPROP_RAY_RIGHT

#define DEFAULT_BASE_STYLE    STYLE_SOLID, OBJPROP_RAY, OBJPROP_RAY_RIGHT
#define DEFAULT_ENTRY_STYLE   STYLE_SOLID, OBJPROP_RAY, OBJPROP_RAY_RIGHT
#define DEFAULT_EXIT_STYLE    STYLE_SOLID, OBJPROP_RAY, OBJPROP_RAY_RIGHT

#define LD1 {clrAqua,         DEFAULT_BASE_STYLE, DEFAULT_ENTRY, DEFAULT_EXIT}
#define LW1 {clrYellow,       DEFAULT_BASE_STYLE, DEFAULT_ENTRY, DEFAULT_EXIT}
#define LY1 {clrDarkViolet,   DEFAULT_BASE_STYLE, DEFAULT_ENTRY, DEFAULT_EXIT}
#define LE1 {clrDarkViolet,   DEFAULT_BASE_STYLE, DEFAULT_ENTRY, DEFAULT_EXIT}
//========================================================================================== Action
#define CROSS_ABOVE 300
#define CROSS_BELOW 400
//========================================================================================== Suffix
#define ARROW_HLINE_SUFFIX "-arrow"
#define ARROW_TREND_START_SUFFIX "-arrow-start"
#define ARROW_TREND_END_SUFFIX "-arrow-end"
#define ENTRY_LINE_SUFFIX "-entry"
#define EXIT_LINE_SUFFIX "-exit"
//========================================================================================== Object
struct LineLevel {
    color   baseColor;
    int     baseStyle;
    int     baseHLineRayProp;
    int     baseTrendLineRayProp;

    color   entryColor;
    int     entryStyle;
    int     entryHLineRayProp;
    int     entryTrendLineRayProp;

    color   exitColor;
    int     exitStyle;
    int     exitHLineRayProp;
    int     exitTrendLineRayProp;
};
struct LineCore {
   string symbol;
   string name;
   LineLevel level;
   int action;
   double entryPriceDiff;
   double exitPriceDiff;
   int guardTime; // minutes
};

struct HLine {
   LineCore core;

   datetime markTime;
   double price;
}; 

struct TrendLine {
   LineCore core;

   datetime startTime;   // yyyy.mm.dd hh:mi
   double startPrice;
   datetime endTime;
   double endPrice;
   int timePeriod; // represents the accurency of the current input time parameter.
};


//========================================================================================== Data
//FOREX.com
HLine hLines[] = {
//   symbol    name         level action       entryPriceDiff exitPriceDiff guardTime markTime             price
   {{"EURUSD", "h1",        LD1,  CROSS_ABOVE,  0.0200,      0.0100,       20},       D'2023.10.12 12:30', 1.06270}
   
};

TrendLine trendLines[] = {
//   symbol     name        level action       entryPriceDiff exitPriceDiff guardTime startTime            startPrice endTime              endPrice  timePeriod
   {{"EURUSD", "t1",        LD1,  CROSS_ABOVE, 0.0200,        0.0100,       20},      D'2023.07.18 15:35', 1.12749,   D'2023.08.10 12:30', 1.10646,  PERIOD_M1},
   {{"EURUSD", "Godzilla",  LW1,  CROSS_ABOVE, 0.0200,        0.0100,       20},      D'2023.07.18 15:35', 1.12749,   D'2023.08.30 22:00', 1.09454,  PERIOD_M1}
      // 2023.07.18 20:30   U.S. Retail Sales YoY(Jun)  [PREV 1.61 - EST 1.6 - CURR 1.49]   Bullish USD

};
#endif