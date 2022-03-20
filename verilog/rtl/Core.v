module CSR( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input         io_stall, // @[:@6.4]
  input  [2:0]  io_cmd, // @[:@6.4]
  input  [31:0] io_in, // @[:@6.4]
  output [31:0] io_out, // @[:@6.4]
  input  [31:0] io_pc, // @[:@6.4]
  input  [31:0] io_addr, // @[:@6.4]
  input  [31:0] io_inst, // @[:@6.4]
  input         io_illegal, // @[:@6.4]
  input  [1:0]  io_st_type, // @[:@6.4]
  input  [2:0]  io_ld_type, // @[:@6.4]
  input         io_pc_check, // @[:@6.4]
  output        io_expt, // @[:@6.4]
  output [31:0] io_evec, // @[:@6.4]
  output [31:0] io_epc, // @[:@6.4]
  input         io_irq_uart_irq, // @[:@6.4]
  input         io_irq_spi_irq, // @[:@6.4]
  input         io_irq_motor_irq, // @[:@6.4]
  input         io_br_taken // @[:@6.4]
);
  wire [11:0] csr_addr; // @[csr.scala 106:27:@8.4]
  wire [4:0] rs1_addr; // @[csr.scala 107:27:@9.4]
  reg [31:0] time$; // @[csr.scala 110:27:@10.4]
  reg [31:0] _RAND_0;
  reg [31:0] timeh; // @[csr.scala 111:27:@11.4]
  reg [31:0] _RAND_1;
  reg [31:0] cycle; // @[csr.scala 112:27:@12.4]
  reg [31:0] _RAND_2;
  reg [31:0] cycleh; // @[csr.scala 113:27:@13.4]
  reg [31:0] _RAND_3;
  reg [31:0] instret; // @[csr.scala 114:27:@14.4]
  reg [31:0] _RAND_4;
  reg [31:0] instreth; // @[csr.scala 115:27:@15.4]
  reg [31:0] _RAND_5;
  reg [1:0] mstatus_prv; // @[csr.scala 129:23:@16.4]
  reg [31:0] _RAND_6;
  reg [1:0] mstatus_mpp; // @[csr.scala 129:23:@16.4]
  reg [31:0] _RAND_7;
  reg  mstatus_mpie; // @[csr.scala 129:23:@16.4]
  reg [31:0] _RAND_8;
  reg  mstatus_mie; // @[csr.scala 129:23:@16.4]
  reg [31:0] _RAND_9;
  reg  mie_motorie; // @[csr.scala 130:23:@17.4]
  reg [31:0] _RAND_10;
  reg  mie_spiie; // @[csr.scala 130:23:@17.4]
  reg [31:0] _RAND_11;
  reg  mie_uartie; // @[csr.scala 130:23:@17.4]
  reg [31:0] _RAND_12;
  reg  mie_mtie; // @[csr.scala 130:23:@17.4]
  reg [31:0] _RAND_13;
  reg  mie_msie; // @[csr.scala 130:23:@17.4]
  reg [31:0] _RAND_14;
  reg  mip_motorip; // @[csr.scala 132:27:@19.4]
  reg [31:0] _RAND_15;
  reg  mip_spiip; // @[csr.scala 132:27:@19.4]
  reg [31:0] _RAND_16;
  reg  mip_uartip; // @[csr.scala 132:27:@19.4]
  reg [31:0] _RAND_17;
  reg  mip_mtip; // @[csr.scala 132:27:@19.4]
  reg [31:0] _RAND_18;
  reg  mip_msip; // @[csr.scala 132:27:@19.4]
  reg [31:0] _RAND_19;
  reg [31:0] mtvec; // @[csr.scala 136:27:@20.4]
  reg [31:0] _RAND_20;
  reg [31:0] mscratch; // @[csr.scala 139:23:@21.4]
  reg [31:0] _RAND_21;
  reg [31:0] mepc; // @[csr.scala 140:23:@22.4]
  reg [31:0] _RAND_22;
  reg [31:0] mcause; // @[csr.scala 141:23:@23.4]
  reg [31:0] _RAND_23;
  reg [31:0] mtval; // @[csr.scala 142:23:@24.4]
  reg [31:0] _RAND_24;
  wire  _GEN_0; // @[csr.scala 146:3:@26.4]
  wire  _GEN_1; // @[csr.scala 146:3:@26.4]
  wire  _GEN_2; // @[csr.scala 146:3:@26.4]
  wire  _GEN_3; // @[csr.scala 146:3:@26.4]
  wire [1:0] _GEN_4; // @[csr.scala 146:3:@26.4]
  wire [1:0] _GEN_5; // @[csr.scala 146:3:@26.4]
  wire [7:0] _T_147; // @[csr.scala 164:34:@40.4]
  wire [31:0] _T_156; // @[csr.scala 164:34:@49.4]
  wire [7:0] _T_163; // @[csr.scala 169:34:@56.4]
  wire [31:0] _T_172; // @[csr.scala 169:34:@65.4]
  wire [12:0] _T_182; // @[csr.scala 170:38:@75.4]
  wire [31:0] _T_193; // @[csr.scala 170:38:@86.4]
  wire  _T_198; // @[Lookup.scala 9:38:@88.4]
  wire  _T_202; // @[Lookup.scala 9:38:@90.4]
  wire  _T_206; // @[Lookup.scala 9:38:@92.4]
  wire  _T_210; // @[Lookup.scala 9:38:@94.4]
  wire  _T_214; // @[Lookup.scala 9:38:@96.4]
  wire  _T_218; // @[Lookup.scala 9:38:@98.4]
  wire  _T_222; // @[Lookup.scala 9:38:@100.4]
  wire  _T_226; // @[Lookup.scala 9:38:@102.4]
  wire  _T_230; // @[Lookup.scala 9:38:@104.4]
  wire  _T_234; // @[Lookup.scala 9:38:@106.4]
  wire  _T_238; // @[Lookup.scala 9:38:@108.4]
  wire  _T_242; // @[Lookup.scala 9:38:@110.4]
  wire  _T_246; // @[Lookup.scala 9:38:@112.4]
  wire  _T_250; // @[Lookup.scala 9:38:@114.4]
  wire  _T_254; // @[Lookup.scala 9:38:@116.4]
  wire [31:0] _T_255; // @[Lookup.scala 11:37:@117.4]
  wire [31:0] _T_256; // @[Lookup.scala 11:37:@118.4]
  wire [31:0] _T_257; // @[Lookup.scala 11:37:@119.4]
  wire [31:0] _T_258; // @[Lookup.scala 11:37:@120.4]
  wire [31:0] _T_259; // @[Lookup.scala 11:37:@121.4]
  wire [31:0] _T_260; // @[Lookup.scala 11:37:@122.4]
  wire [31:0] _T_261; // @[Lookup.scala 11:37:@123.4]
  wire [31:0] _T_262; // @[Lookup.scala 11:37:@124.4]
  wire [31:0] _T_263; // @[Lookup.scala 11:37:@125.4]
  wire [31:0] _T_264; // @[Lookup.scala 11:37:@126.4]
  wire [31:0] _T_265; // @[Lookup.scala 11:37:@127.4]
  wire [31:0] _T_266; // @[Lookup.scala 11:37:@128.4]
  wire [31:0] _T_267; // @[Lookup.scala 11:37:@129.4]
  wire [31:0] _T_268; // @[Lookup.scala 11:37:@130.4]
  wire [1:0] _T_270; // @[csr.scala 178:31:@133.4]
  wire  privValid; // @[csr.scala 178:38:@134.4]
  wire  privInst; // @[csr.scala 179:30:@135.4]
  wire  _T_271; // @[csr.scala 180:44:@136.4]
  wire  _T_273; // @[csr.scala 180:35:@137.4]
  wire  _T_274; // @[csr.scala 180:32:@138.4]
  wire  _T_275; // @[csr.scala 180:60:@139.4]
  wire  _T_277; // @[csr.scala 180:51:@140.4]
  wire  isEcall; // @[csr.scala 180:48:@141.4]
  wire  _T_279; // @[csr.scala 181:32:@143.4]
  wire  isEbreak; // @[csr.scala 181:48:@146.4]
  wire  isEret; // @[csr.scala 182:48:@151.4]
  wire  _T_288; // @[csr.scala 183:45:@152.4]
  wire  iaddrInvalid; // @[csr.scala 183:35:@153.4]
  wire [1:0] _T_290; // @[csr.scala 185:49:@154.4]
  wire  _T_292; // @[csr.scala 185:56:@155.4]
  wire  _T_293; // @[csr.scala 185:77:@156.4]
  wire  _T_295; // @[Mux.scala 46:19:@158.4]
  wire  _T_296; // @[Mux.scala 46:16:@159.4]
  wire  _T_297; // @[Mux.scala 46:19:@160.4]
  wire  _T_298; // @[Mux.scala 46:16:@161.4]
  wire  _T_299; // @[Mux.scala 46:19:@162.4]
  wire  laddrInvalid; // @[Mux.scala 46:16:@163.4]
  wire  _T_305; // @[Mux.scala 46:19:@167.4]
  wire  _T_306; // @[Mux.scala 46:16:@168.4]
  wire  _T_307; // @[Mux.scala 46:19:@169.4]
  wire  saddrInvalid; // @[Mux.scala 46:16:@170.4]
  wire  isMotor; // @[csr.scala 189:36:@171.4]
  wire  isSpi; // @[csr.scala 190:35:@172.4]
  wire  isUart; // @[csr.scala 191:36:@173.4]
  wire  isTimer; // @[csr.scala 192:36:@174.4]
  wire  isSoftware; // @[csr.scala 194:36:@176.4]
  wire  _T_368; // @[csr.scala 197:65:@207.4]
  wire  _T_369; // @[csr.scala 197:65:@208.4]
  wire  _T_370; // @[csr.scala 197:65:@209.4]
  wire  _T_371; // @[csr.scala 197:65:@210.4]
  wire  _T_372; // @[csr.scala 197:65:@211.4]
  wire  _T_373; // @[csr.scala 197:65:@212.4]
  wire  _T_374; // @[csr.scala 197:65:@213.4]
  wire  _T_375; // @[csr.scala 197:65:@214.4]
  wire  _T_376; // @[csr.scala 197:65:@215.4]
  wire  _T_377; // @[csr.scala 197:65:@216.4]
  wire  _T_378; // @[csr.scala 197:65:@217.4]
  wire  _T_379; // @[csr.scala 197:65:@218.4]
  wire  _T_380; // @[csr.scala 197:65:@219.4]
  wire  csrValid; // @[csr.scala 197:65:@220.4]
  wire [1:0] _T_381; // @[csr.scala 198:31:@221.4]
  wire [1:0] _T_382; // @[csr.scala 198:40:@222.4]
  wire  csrRO; // @[csr.scala 198:40:@223.4]
  wire  _T_384; // @[csr.scala 199:30:@224.4]
  wire  _T_385; // @[csr.scala 199:49:@225.4]
  wire  _T_387; // @[csr.scala 199:65:@226.4]
  wire  _T_388; // @[csr.scala 199:53:@227.4]
  wire  wen; // @[csr.scala 199:40:@228.4]
  wire [31:0] _T_390; // @[csr.scala 201:68:@229.4]
  wire [31:0] _T_391; // @[csr.scala 202:70:@230.4]
  wire [31:0] _T_392; // @[csr.scala 202:68:@231.4]
  wire  _T_393; // @[Mux.scala 46:19:@232.4]
  wire [31:0] _T_394; // @[Mux.scala 46:16:@233.4]
  wire  _T_395; // @[Mux.scala 46:19:@234.4]
  wire [31:0] _T_396; // @[Mux.scala 46:16:@235.4]
  wire  _T_397; // @[Mux.scala 46:19:@236.4]
  wire [31:0] wdata; // @[Mux.scala 46:16:@237.4]
  wire [29:0] _GEN_147; // @[csr.scala 208:50:@238.4]
  wire [30:0] _T_410; // @[csr.scala 208:50:@238.4]
  wire [29:0] _T_411; // @[csr.scala 208:50:@239.4]
  wire [29:0] _T_412; // @[csr.scala 209:22:@240.4]
  wire [29:0] _T_413; // @[csr.scala 208:22:@241.4]
  wire [29:0] _T_414; // @[csr.scala 207:22:@242.4]
  wire [29:0] _T_415; // @[csr.scala 206:22:@243.4]
  wire [29:0] causeExpt; // @[csr.scala 205:22:@244.4]
  wire [29:0] _T_416; // @[csr.scala 215:22:@245.4]
  wire [29:0] _T_417; // @[csr.scala 214:22:@246.4]
  wire [29:0] _T_418; // @[csr.scala 213:22:@247.4]
  wire [29:0] causeInt; // @[csr.scala 211:22:@249.4]
  wire  _T_420; // @[csr.scala 218:29:@250.4]
  wire  _T_421; // @[csr.scala 218:38:@251.4]
  wire  _T_422; // @[csr.scala 218:48:@252.4]
  wire  _T_424; // @[csr.scala 218:73:@254.4]
  wire  isInt; // @[csr.scala 218:88:@255.4]
  wire [29:0] cause; // @[csr.scala 219:23:@256.4]
  wire [29:0] _T_425; // @[csr.scala 222:26:@257.4]
  wire [31:0] _GEN_148; // @[csr.scala 222:31:@258.4]
  wire [31:0] base; // @[csr.scala 222:31:@258.4]
  wire [1:0] mode; // @[csr.scala 223:25:@259.4]
  wire  _T_426; // @[csr.scala 224:38:@260.4]
  wire  _T_427; // @[csr.scala 224:31:@261.4]
  wire [31:0] _GEN_149; // @[csr.scala 224:57:@262.4]
  wire [31:0] _T_428; // @[csr.scala 224:57:@262.4]
  wire [32:0] _T_429; // @[csr.scala 224:48:@263.4]
  wire [31:0] _T_430; // @[csr.scala 224:48:@264.4]
  wire  _T_432; // @[csr.scala 227:33:@267.4]
  wire  _T_433; // @[csr.scala 227:49:@268.4]
  wire  _T_434; // @[csr.scala 227:65:@269.4]
  wire [1:0] _T_435; // @[csr.scala 228:28:@270.4]
  wire  _T_437; // @[csr.scala 228:35:@271.4]
  wire  _T_439; // @[csr.scala 228:43:@272.4]
  wire  _T_441; // @[csr.scala 228:56:@273.4]
  wire  _T_442; // @[csr.scala 228:53:@274.4]
  wire  _T_443; // @[csr.scala 228:39:@275.4]
  wire  _T_444; // @[csr.scala 227:81:@276.4]
  wire  _T_445; // @[csr.scala 228:75:@277.4]
  wire  _T_446; // @[csr.scala 228:68:@278.4]
  wire  _T_449; // @[csr.scala 229:32:@280.4]
  wire  _T_450; // @[csr.scala 228:84:@281.4]
  wire  _T_451; // @[csr.scala 229:47:@282.4]
  wire  _T_452; // @[csr.scala 229:58:@283.4]
  wire [32:0] _T_455; // @[csr.scala 233:26:@287.4]
  wire [31:0] _T_456; // @[csr.scala 233:26:@288.4]
  wire [31:0] _T_457; // @[csr.scala 234:13:@290.4]
  wire  _T_459; // @[csr.scala 234:13:@291.4]
  wire [32:0] _T_461; // @[csr.scala 235:27:@293.6]
  wire [31:0] _T_462; // @[csr.scala 235:27:@294.6]
  wire [31:0] _GEN_6; // @[csr.scala 234:19:@292.4]
  wire [32:0] _T_464; // @[csr.scala 237:27:@297.4]
  wire [31:0] _T_465; // @[csr.scala 237:27:@298.4]
  wire [31:0] _T_466; // @[csr.scala 238:14:@300.4]
  wire  _T_468; // @[csr.scala 238:14:@301.4]
  wire [32:0] _T_470; // @[csr.scala 239:28:@303.6]
  wire [31:0] _T_471; // @[csr.scala 239:28:@304.6]
  wire [31:0] _GEN_7; // @[csr.scala 238:20:@302.4]
  wire  _T_473; // @[csr.scala 241:28:@307.4]
  wire  _T_475; // @[csr.scala 241:53:@308.4]
  wire  _T_476; // @[csr.scala 241:62:@309.4]
  wire  _T_477; // @[csr.scala 241:73:@310.4]
  wire  _T_478; // @[csr.scala 241:49:@311.4]
  wire  _T_480; // @[csr.scala 241:89:@312.4]
  wire  isInstRet; // @[csr.scala 241:86:@313.4]
  wire [32:0] _T_482; // @[csr.scala 244:29:@315.6]
  wire [31:0] _T_483; // @[csr.scala 244:29:@316.6]
  wire [31:0] _GEN_8; // @[csr.scala 243:19:@314.4]
  wire [31:0] _T_484; // @[csr.scala 246:29:@319.4]
  wire  _T_486; // @[csr.scala 246:29:@320.4]
  wire  _T_487; // @[csr.scala 246:18:@321.4]
  wire [32:0] _T_489; // @[csr.scala 247:30:@323.6]
  wire [31:0] _T_490; // @[csr.scala 247:30:@324.6]
  wire [31:0] _GEN_9; // @[csr.scala 246:35:@322.4]
  reg  wasEret; // @[csr.scala 251:28:@327.4]
  reg [31:0] _RAND_25;
  reg  br_taken; // @[csr.scala 255:30:@329.4]
  reg [31:0] _RAND_26;
  reg  br_taken_delayed; // @[csr.scala 256:30:@330.4]
  reg [31:0] _RAND_27;
  wire  _T_498; // @[csr.scala 265:12:@336.8]
  wire [32:0] _T_500; // @[csr.scala 266:54:@338.10]
  wire [32:0] _T_501; // @[csr.scala 266:54:@339.10]
  wire [31:0] _T_502; // @[csr.scala 266:54:@340.10]
  wire [31:0] _T_503; // @[csr.scala 266:29:@341.10]
  wire [29:0] _T_504; // @[csr.scala 266:69:@342.10]
  wire [31:0] _GEN_150; // @[csr.scala 266:74:@343.10]
  wire [31:0] _T_505; // @[csr.scala 266:74:@343.10]
  wire [31:0] _GEN_10; // @[csr.scala 266:7:@337.8]
  wire [31:0] _T_511; // @[Cat.scala 30:58:@348.8]
  wire  _T_513; // @[csr.scala 274:25:@354.8]
  wire  _T_514; // @[csr.scala 274:41:@355.8]
  wire [31:0] _GEN_11; // @[csr.scala 274:58:@356.8]
  wire  _T_516; // @[csr.scala 281:21:@369.12]
  wire [1:0] _T_517; // @[csr.scala 282:30:@371.14]
  wire  _T_518; // @[csr.scala 283:30:@373.14]
  wire [1:0] _T_519; // @[csr.scala 284:30:@375.14]
  wire  _T_520; // @[csr.scala 285:30:@377.14]
  wire  _T_521; // @[csr.scala 287:26:@381.14]
  wire  _T_522; // @[csr.scala 288:30:@383.16]
  wire  _T_523; // @[csr.scala 289:29:@385.16]
  wire  _T_524; // @[csr.scala 290:30:@387.16]
  wire  _T_527; // @[csr.scala 294:26:@395.16]
  wire  _T_533; // @[csr.scala 301:26:@409.18]
  wire  _T_534; // @[csr.scala 302:26:@414.20]
  wire  _T_535; // @[csr.scala 303:26:@419.22]
  wire [31:0] _T_537; // @[csr.scala 303:56:@421.24]
  wire [34:0] _GEN_151; // @[csr.scala 303:63:@422.24]
  wire [34:0] _T_539; // @[csr.scala 303:63:@422.24]
  wire  _T_540; // @[csr.scala 304:26:@426.24]
  wire [31:0] _T_542; // @[csr.scala 304:60:@428.26]
  wire  _T_543; // @[csr.scala 305:26:@432.26]
  wire [31:0] _GEN_12; // @[csr.scala 305:41:@433.26]
  wire [31:0] _GEN_13; // @[csr.scala 304:42:@427.24]
  wire [31:0] _GEN_14; // @[csr.scala 304:42:@427.24]
  wire [34:0] _GEN_15; // @[csr.scala 303:40:@420.22]
  wire [31:0] _GEN_16; // @[csr.scala 303:40:@420.22]
  wire [31:0] _GEN_17; // @[csr.scala 303:40:@420.22]
  wire [31:0] _GEN_18; // @[csr.scala 302:44:@415.20]
  wire [34:0] _GEN_19; // @[csr.scala 302:44:@415.20]
  wire [31:0] _GEN_20; // @[csr.scala 302:44:@415.20]
  wire [31:0] _GEN_21; // @[csr.scala 302:44:@415.20]
  wire [31:0] _GEN_22; // @[csr.scala 301:41:@410.18]
  wire [31:0] _GEN_23; // @[csr.scala 301:41:@410.18]
  wire [34:0] _GEN_24; // @[csr.scala 301:41:@410.18]
  wire [31:0] _GEN_25; // @[csr.scala 301:41:@410.18]
  wire [31:0] _GEN_26; // @[csr.scala 301:41:@410.18]
  wire  _GEN_27; // @[csr.scala 294:39:@396.16]
  wire  _GEN_28; // @[csr.scala 294:39:@396.16]
  wire  _GEN_29; // @[csr.scala 294:39:@396.16]
  wire  _GEN_30; // @[csr.scala 294:39:@396.16]
  wire  _GEN_31; // @[csr.scala 294:39:@396.16]
  wire [31:0] _GEN_32; // @[csr.scala 294:39:@396.16]
  wire [31:0] _GEN_33; // @[csr.scala 294:39:@396.16]
  wire [34:0] _GEN_34; // @[csr.scala 294:39:@396.16]
  wire [31:0] _GEN_35; // @[csr.scala 294:39:@396.16]
  wire [31:0] _GEN_36; // @[csr.scala 294:39:@396.16]
  wire  _GEN_40; // @[csr.scala 287:39:@382.14]
  wire  _GEN_41; // @[csr.scala 287:39:@382.14]
  wire  _GEN_42; // @[csr.scala 287:39:@382.14]
  wire  _GEN_43; // @[csr.scala 287:39:@382.14]
  wire  _GEN_44; // @[csr.scala 287:39:@382.14]
  wire  _GEN_45; // @[csr.scala 287:39:@382.14]
  wire  _GEN_46; // @[csr.scala 287:39:@382.14]
  wire [31:0] _GEN_47; // @[csr.scala 287:39:@382.14]
  wire [31:0] _GEN_48; // @[csr.scala 287:39:@382.14]
  wire [34:0] _GEN_49; // @[csr.scala 287:39:@382.14]
  wire [31:0] _GEN_50; // @[csr.scala 287:39:@382.14]
  wire [31:0] _GEN_51; // @[csr.scala 287:39:@382.14]
  wire [1:0] _GEN_52; // @[csr.scala 281:38:@370.12]
  wire  _GEN_53; // @[csr.scala 281:38:@370.12]
  wire [1:0] _GEN_54; // @[csr.scala 281:38:@370.12]
  wire  _GEN_55; // @[csr.scala 281:38:@370.12]
  wire  _GEN_59; // @[csr.scala 281:38:@370.12]
  wire  _GEN_60; // @[csr.scala 281:38:@370.12]
  wire  _GEN_61; // @[csr.scala 281:38:@370.12]
  wire  _GEN_62; // @[csr.scala 281:38:@370.12]
  wire  _GEN_63; // @[csr.scala 281:38:@370.12]
  wire  _GEN_64; // @[csr.scala 281:38:@370.12]
  wire  _GEN_65; // @[csr.scala 281:38:@370.12]
  wire [31:0] _GEN_66; // @[csr.scala 281:38:@370.12]
  wire [31:0] _GEN_67; // @[csr.scala 281:38:@370.12]
  wire [34:0] _GEN_68; // @[csr.scala 281:38:@370.12]
  wire [31:0] _GEN_69; // @[csr.scala 281:38:@370.12]
  wire [31:0] _GEN_70; // @[csr.scala 281:38:@370.12]
  wire [1:0] _GEN_71; // @[csr.scala 280:21:@368.10]
  wire  _GEN_72; // @[csr.scala 280:21:@368.10]
  wire [1:0] _GEN_73; // @[csr.scala 280:21:@368.10]
  wire  _GEN_74; // @[csr.scala 280:21:@368.10]
  wire  _GEN_78; // @[csr.scala 280:21:@368.10]
  wire  _GEN_79; // @[csr.scala 280:21:@368.10]
  wire  _GEN_80; // @[csr.scala 280:21:@368.10]
  wire  _GEN_81; // @[csr.scala 280:21:@368.10]
  wire  _GEN_82; // @[csr.scala 280:21:@368.10]
  wire  _GEN_83; // @[csr.scala 280:21:@368.10]
  wire  _GEN_84; // @[csr.scala 280:21:@368.10]
  wire [31:0] _GEN_85; // @[csr.scala 280:21:@368.10]
  wire [31:0] _GEN_86; // @[csr.scala 280:21:@368.10]
  wire [34:0] _GEN_87; // @[csr.scala 280:21:@368.10]
  wire [31:0] _GEN_88; // @[csr.scala 280:21:@368.10]
  wire [31:0] _GEN_89; // @[csr.scala 280:21:@368.10]
  wire [1:0] _GEN_90; // @[csr.scala 275:24:@361.8]
  wire  _GEN_91; // @[csr.scala 275:24:@361.8]
  wire [1:0] _GEN_92; // @[csr.scala 275:24:@361.8]
  wire  _GEN_93; // @[csr.scala 275:24:@361.8]
  wire  _GEN_97; // @[csr.scala 275:24:@361.8]
  wire  _GEN_98; // @[csr.scala 275:24:@361.8]
  wire  _GEN_99; // @[csr.scala 275:24:@361.8]
  wire  _GEN_100; // @[csr.scala 275:24:@361.8]
  wire  _GEN_101; // @[csr.scala 275:24:@361.8]
  wire  _GEN_102; // @[csr.scala 275:24:@361.8]
  wire  _GEN_103; // @[csr.scala 275:24:@361.8]
  wire [31:0] _GEN_104; // @[csr.scala 275:24:@361.8]
  wire [31:0] _GEN_105; // @[csr.scala 275:24:@361.8]
  wire [34:0] _GEN_106; // @[csr.scala 275:24:@361.8]
  wire [31:0] _GEN_107; // @[csr.scala 275:24:@361.8]
  wire [31:0] _GEN_108; // @[csr.scala 275:24:@361.8]
  wire [34:0] _GEN_109; // @[csr.scala 261:19:@335.6]
  wire [31:0] _GEN_110; // @[csr.scala 261:19:@335.6]
  wire [1:0] _GEN_111; // @[csr.scala 261:19:@335.6]
  wire  _GEN_112; // @[csr.scala 261:19:@335.6]
  wire [1:0] _GEN_113; // @[csr.scala 261:19:@335.6]
  wire  _GEN_114; // @[csr.scala 261:19:@335.6]
  wire [31:0] _GEN_115; // @[csr.scala 261:19:@335.6]
  wire  _GEN_119; // @[csr.scala 261:19:@335.6]
  wire  _GEN_120; // @[csr.scala 261:19:@335.6]
  wire  _GEN_121; // @[csr.scala 261:19:@335.6]
  wire  _GEN_122; // @[csr.scala 261:19:@335.6]
  wire  _GEN_123; // @[csr.scala 261:19:@335.6]
  wire  _GEN_124; // @[csr.scala 261:19:@335.6]
  wire  _GEN_125; // @[csr.scala 261:19:@335.6]
  wire [31:0] _GEN_126; // @[csr.scala 261:19:@335.6]
  wire [31:0] _GEN_127; // @[csr.scala 261:19:@335.6]
  wire [34:0] _GEN_128; // @[csr.scala 260:20:@334.4]
  wire  _GEN_135; // @[csr.scala 260:20:@334.4]
  wire  _GEN_136; // @[csr.scala 260:20:@334.4]
  wire  _GEN_137; // @[csr.scala 260:20:@334.4]
  wire  _GEN_138; // @[csr.scala 260:20:@334.4]
  wire  _GEN_139; // @[csr.scala 260:20:@334.4]
  wire [31:0] _GEN_145; // @[csr.scala 260:20:@334.4]
  assign csr_addr = io_inst[31:20]; // @[csr.scala 106:27:@8.4]
  assign rs1_addr = io_inst[19:15]; // @[csr.scala 107:27:@9.4]
  assign _GEN_0 = reset ? 1'h0 : mie_motorie; // @[csr.scala 146:3:@26.4]
  assign _GEN_1 = reset ? 1'h0 : mie_spiie; // @[csr.scala 146:3:@26.4]
  assign _GEN_2 = reset ? 1'h1 : mie_uartie; // @[csr.scala 146:3:@26.4]
  assign _GEN_3 = reset ? 1'h1 : mstatus_mie; // @[csr.scala 146:3:@26.4]
  assign _GEN_4 = reset ? 2'h3 : mstatus_prv; // @[csr.scala 146:3:@26.4]
  assign _GEN_5 = reset ? 2'h3 : mstatus_mpp; // @[csr.scala 146:3:@26.4]
  assign _T_147 = {mie_mtie,1'h0,2'h0,mie_msie,1'h0,2'h0}; // @[csr.scala 164:34:@40.4]
  assign _T_156 = {13'h0,mie_motorie,mie_spiie,mie_uartie,4'h0,4'h0,_T_147}; // @[csr.scala 164:34:@49.4]
  assign _T_163 = {mip_mtip,1'h0,2'h0,mip_msip,1'h0,2'h0}; // @[csr.scala 169:34:@56.4]
  assign _T_172 = {13'h0,mip_motorip,mip_spiip,mip_uartip,4'h0,4'h0,_T_163}; // @[csr.scala 169:34:@65.4]
  assign _T_182 = {mstatus_mpp,2'h0,1'h0,mstatus_mpie,1'h0,1'h0,1'h0,mstatus_mie,1'h0,2'h0}; // @[csr.scala 170:38:@75.4]
  assign _T_193 = {7'h0,mstatus_prv,3'h0,7'h0,_T_182}; // @[csr.scala 170:38:@86.4]
  assign _T_198 = 12'hc00 == csr_addr; // @[Lookup.scala 9:38:@88.4]
  assign _T_202 = 12'hc01 == csr_addr; // @[Lookup.scala 9:38:@90.4]
  assign _T_206 = 12'hc02 == csr_addr; // @[Lookup.scala 9:38:@92.4]
  assign _T_210 = 12'hc80 == csr_addr; // @[Lookup.scala 9:38:@94.4]
  assign _T_214 = 12'hc81 == csr_addr; // @[Lookup.scala 9:38:@96.4]
  assign _T_218 = 12'hc82 == csr_addr; // @[Lookup.scala 9:38:@98.4]
  assign _T_222 = 12'h305 == csr_addr; // @[Lookup.scala 9:38:@100.4]
  assign _T_226 = 12'h304 == csr_addr; // @[Lookup.scala 9:38:@102.4]
  assign _T_230 = 12'h340 == csr_addr; // @[Lookup.scala 9:38:@104.4]
  assign _T_234 = 12'h341 == csr_addr; // @[Lookup.scala 9:38:@106.4]
  assign _T_238 = 12'h342 == csr_addr; // @[Lookup.scala 9:38:@108.4]
  assign _T_242 = 12'h343 == csr_addr; // @[Lookup.scala 9:38:@110.4]
  assign _T_246 = 12'h344 == csr_addr; // @[Lookup.scala 9:38:@112.4]
  assign _T_250 = 12'h300 == csr_addr; // @[Lookup.scala 9:38:@114.4]
  assign _T_254 = 12'h301 == csr_addr; // @[Lookup.scala 9:38:@116.4]
  assign _T_255 = _T_254 ? 32'h40000100 : 32'h0; // @[Lookup.scala 11:37:@117.4]
  assign _T_256 = _T_250 ? _T_193 : _T_255; // @[Lookup.scala 11:37:@118.4]
  assign _T_257 = _T_246 ? _T_172 : _T_256; // @[Lookup.scala 11:37:@119.4]
  assign _T_258 = _T_242 ? mtval : _T_257; // @[Lookup.scala 11:37:@120.4]
  assign _T_259 = _T_238 ? mcause : _T_258; // @[Lookup.scala 11:37:@121.4]
  assign _T_260 = _T_234 ? mepc : _T_259; // @[Lookup.scala 11:37:@122.4]
  assign _T_261 = _T_230 ? mscratch : _T_260; // @[Lookup.scala 11:37:@123.4]
  assign _T_262 = _T_226 ? _T_156 : _T_261; // @[Lookup.scala 11:37:@124.4]
  assign _T_263 = _T_222 ? mtvec : _T_262; // @[Lookup.scala 11:37:@125.4]
  assign _T_264 = _T_218 ? instreth : _T_263; // @[Lookup.scala 11:37:@126.4]
  assign _T_265 = _T_214 ? timeh : _T_264; // @[Lookup.scala 11:37:@127.4]
  assign _T_266 = _T_210 ? cycleh : _T_265; // @[Lookup.scala 11:37:@128.4]
  assign _T_267 = _T_206 ? instret : _T_266; // @[Lookup.scala 11:37:@129.4]
  assign _T_268 = _T_202 ? time$ : _T_267; // @[Lookup.scala 11:37:@130.4]
  assign _T_270 = csr_addr[9:8]; // @[csr.scala 178:31:@133.4]
  assign privValid = _T_270 <= mstatus_prv; // @[csr.scala 178:38:@134.4]
  assign privInst = io_cmd == 3'h4; // @[csr.scala 179:30:@135.4]
  assign _T_271 = csr_addr[0]; // @[csr.scala 180:44:@136.4]
  assign _T_273 = _T_271 == 1'h0; // @[csr.scala 180:35:@137.4]
  assign _T_274 = privInst & _T_273; // @[csr.scala 180:32:@138.4]
  assign _T_275 = csr_addr[8]; // @[csr.scala 180:60:@139.4]
  assign _T_277 = _T_275 == 1'h0; // @[csr.scala 180:51:@140.4]
  assign isEcall = _T_274 & _T_277; // @[csr.scala 180:48:@141.4]
  assign _T_279 = privInst & _T_271; // @[csr.scala 181:32:@143.4]
  assign isEbreak = _T_279 & _T_277; // @[csr.scala 181:48:@146.4]
  assign isEret = _T_274 & _T_275; // @[csr.scala 182:48:@151.4]
  assign _T_288 = io_addr[1]; // @[csr.scala 183:45:@152.4]
  assign iaddrInvalid = io_pc_check & _T_288; // @[csr.scala 183:35:@153.4]
  assign _T_290 = io_addr[1:0]; // @[csr.scala 185:49:@154.4]
  assign _T_292 = _T_290 != 2'h0; // @[csr.scala 185:56:@155.4]
  assign _T_293 = io_addr[0]; // @[csr.scala 185:77:@156.4]
  assign _T_295 = 3'h4 == io_ld_type; // @[Mux.scala 46:19:@158.4]
  assign _T_296 = _T_295 ? _T_293 : 1'h0; // @[Mux.scala 46:16:@159.4]
  assign _T_297 = 3'h2 == io_ld_type; // @[Mux.scala 46:19:@160.4]
  assign _T_298 = _T_297 ? _T_293 : _T_296; // @[Mux.scala 46:16:@161.4]
  assign _T_299 = 3'h1 == io_ld_type; // @[Mux.scala 46:19:@162.4]
  assign laddrInvalid = _T_299 ? _T_292 : _T_298; // @[Mux.scala 46:16:@163.4]
  assign _T_305 = 2'h2 == io_st_type; // @[Mux.scala 46:19:@167.4]
  assign _T_306 = _T_305 ? _T_293 : 1'h0; // @[Mux.scala 46:16:@168.4]
  assign _T_307 = 2'h1 == io_st_type; // @[Mux.scala 46:19:@169.4]
  assign saddrInvalid = _T_307 ? _T_292 : _T_306; // @[Mux.scala 46:16:@170.4]
  assign isMotor = mip_motorip & mie_motorie; // @[csr.scala 189:36:@171.4]
  assign isSpi = mip_spiip & mie_spiie; // @[csr.scala 190:35:@172.4]
  assign isUart = mip_uartip & mie_uartie; // @[csr.scala 191:36:@173.4]
  assign isTimer = mip_mtip & mie_mtie; // @[csr.scala 192:36:@174.4]
  assign isSoftware = mip_msip & mie_msie; // @[csr.scala 194:36:@176.4]
  assign _T_368 = _T_198 | _T_202; // @[csr.scala 197:65:@207.4]
  assign _T_369 = _T_368 | _T_206; // @[csr.scala 197:65:@208.4]
  assign _T_370 = _T_369 | _T_210; // @[csr.scala 197:65:@209.4]
  assign _T_371 = _T_370 | _T_214; // @[csr.scala 197:65:@210.4]
  assign _T_372 = _T_371 | _T_218; // @[csr.scala 197:65:@211.4]
  assign _T_373 = _T_372 | _T_222; // @[csr.scala 197:65:@212.4]
  assign _T_374 = _T_373 | _T_226; // @[csr.scala 197:65:@213.4]
  assign _T_375 = _T_374 | _T_230; // @[csr.scala 197:65:@214.4]
  assign _T_376 = _T_375 | _T_234; // @[csr.scala 197:65:@215.4]
  assign _T_377 = _T_376 | _T_238; // @[csr.scala 197:65:@216.4]
  assign _T_378 = _T_377 | _T_242; // @[csr.scala 197:65:@217.4]
  assign _T_379 = _T_378 | _T_246; // @[csr.scala 197:65:@218.4]
  assign _T_380 = _T_379 | _T_250; // @[csr.scala 197:65:@219.4]
  assign csrValid = _T_380 | _T_254; // @[csr.scala 197:65:@220.4]
  assign _T_381 = csr_addr[11:10]; // @[csr.scala 198:31:@221.4]
  assign _T_382 = ~ _T_381; // @[csr.scala 198:40:@222.4]
  assign csrRO = _T_382 == 2'h0; // @[csr.scala 198:40:@223.4]
  assign _T_384 = io_cmd == 3'h1; // @[csr.scala 199:30:@224.4]
  assign _T_385 = io_cmd[1]; // @[csr.scala 199:49:@225.4]
  assign _T_387 = rs1_addr != 5'h0; // @[csr.scala 199:65:@226.4]
  assign _T_388 = _T_385 & _T_387; // @[csr.scala 199:53:@227.4]
  assign wen = _T_384 | _T_388; // @[csr.scala 199:40:@228.4]
  assign _T_390 = io_out | io_in; // @[csr.scala 201:68:@229.4]
  assign _T_391 = ~ io_in; // @[csr.scala 202:70:@230.4]
  assign _T_392 = io_out & _T_391; // @[csr.scala 202:68:@231.4]
  assign _T_393 = 3'h3 == io_cmd; // @[Mux.scala 46:19:@232.4]
  assign _T_394 = _T_393 ? _T_392 : 32'h0; // @[Mux.scala 46:16:@233.4]
  assign _T_395 = 3'h2 == io_cmd; // @[Mux.scala 46:19:@234.4]
  assign _T_396 = _T_395 ? _T_390 : _T_394; // @[Mux.scala 46:16:@235.4]
  assign _T_397 = 3'h1 == io_cmd; // @[Mux.scala 46:19:@236.4]
  assign wdata = _T_397 ? io_in : _T_396; // @[Mux.scala 46:16:@237.4]
  assign _GEN_147 = {{28'd0}, mstatus_prv}; // @[csr.scala 208:50:@238.4]
  assign _T_410 = 30'h8 + _GEN_147; // @[csr.scala 208:50:@238.4]
  assign _T_411 = 30'h8 + _GEN_147; // @[csr.scala 208:50:@239.4]
  assign _T_412 = isEbreak ? 30'h3 : 30'h2; // @[csr.scala 209:22:@240.4]
  assign _T_413 = isEcall ? _T_411 : _T_412; // @[csr.scala 208:22:@241.4]
  assign _T_414 = saddrInvalid ? 30'h6 : _T_413; // @[csr.scala 207:22:@242.4]
  assign _T_415 = laddrInvalid ? 30'h4 : _T_414; // @[csr.scala 206:22:@243.4]
  assign causeExpt = iaddrInvalid ? 30'h0 : _T_415; // @[csr.scala 205:22:@244.4]
  assign _T_416 = isSpi ? 30'h11 : 30'h12; // @[csr.scala 215:22:@245.4]
  assign _T_417 = isUart ? 30'h10 : _T_416; // @[csr.scala 214:22:@246.4]
  assign _T_418 = isTimer ? 30'h7 : _T_417; // @[csr.scala 213:22:@247.4]
  assign causeInt = isSoftware ? 30'h3 : _T_418; // @[csr.scala 211:22:@249.4]
  assign _T_420 = isMotor | isSpi; // @[csr.scala 218:29:@250.4]
  assign _T_421 = _T_420 | isUart; // @[csr.scala 218:38:@251.4]
  assign _T_422 = _T_421 | isTimer; // @[csr.scala 218:48:@252.4]
  assign _T_424 = _T_422 | isSoftware; // @[csr.scala 218:73:@254.4]
  assign isInt = _T_424 & mstatus_mie; // @[csr.scala 218:88:@255.4]
  assign cause = isInt ? causeInt : causeExpt; // @[csr.scala 219:23:@256.4]
  assign _T_425 = mtvec[31:2]; // @[csr.scala 222:26:@257.4]
  assign _GEN_148 = {{2'd0}, _T_425}; // @[csr.scala 222:31:@258.4]
  assign base = _GEN_148 << 2; // @[csr.scala 222:31:@258.4]
  assign mode = mtvec[1:0]; // @[csr.scala 223:25:@259.4]
  assign _T_426 = mode[0]; // @[csr.scala 224:38:@260.4]
  assign _T_427 = isInt & _T_426; // @[csr.scala 224:31:@261.4]
  assign _GEN_149 = {{2'd0}, cause}; // @[csr.scala 224:57:@262.4]
  assign _T_428 = _GEN_149 << 2; // @[csr.scala 224:57:@262.4]
  assign _T_429 = base + _T_428; // @[csr.scala 224:48:@263.4]
  assign _T_430 = base + _T_428; // @[csr.scala 224:48:@264.4]
  assign _T_432 = io_illegal | iaddrInvalid; // @[csr.scala 227:33:@267.4]
  assign _T_433 = _T_432 | laddrInvalid; // @[csr.scala 227:49:@268.4]
  assign _T_434 = _T_433 | saddrInvalid; // @[csr.scala 227:65:@269.4]
  assign _T_435 = io_cmd[1:0]; // @[csr.scala 228:28:@270.4]
  assign _T_437 = _T_435 != 2'h0; // @[csr.scala 228:35:@271.4]
  assign _T_439 = csrValid == 1'h0; // @[csr.scala 228:43:@272.4]
  assign _T_441 = privValid == 1'h0; // @[csr.scala 228:56:@273.4]
  assign _T_442 = _T_439 | _T_441; // @[csr.scala 228:53:@274.4]
  assign _T_443 = _T_437 & _T_442; // @[csr.scala 228:39:@275.4]
  assign _T_444 = _T_434 | _T_443; // @[csr.scala 227:81:@276.4]
  assign _T_445 = wen & csrRO; // @[csr.scala 228:75:@277.4]
  assign _T_446 = _T_444 | _T_445; // @[csr.scala 228:68:@278.4]
  assign _T_449 = privInst & _T_441; // @[csr.scala 229:32:@280.4]
  assign _T_450 = _T_446 | _T_449; // @[csr.scala 228:84:@281.4]
  assign _T_451 = _T_450 | isEcall; // @[csr.scala 229:47:@282.4]
  assign _T_452 = _T_451 | isEbreak; // @[csr.scala 229:58:@283.4]
  assign _T_455 = time$ + 32'h1; // @[csr.scala 233:26:@287.4]
  assign _T_456 = time$ + 32'h1; // @[csr.scala 233:26:@288.4]
  assign _T_457 = ~ time$; // @[csr.scala 234:13:@290.4]
  assign _T_459 = _T_457 == 32'h0; // @[csr.scala 234:13:@291.4]
  assign _T_461 = timeh + 32'h1; // @[csr.scala 235:27:@293.6]
  assign _T_462 = timeh + 32'h1; // @[csr.scala 235:27:@294.6]
  assign _GEN_6 = _T_459 ? _T_462 : timeh; // @[csr.scala 234:19:@292.4]
  assign _T_464 = cycle + 32'h1; // @[csr.scala 237:27:@297.4]
  assign _T_465 = cycle + 32'h1; // @[csr.scala 237:27:@298.4]
  assign _T_466 = ~ cycle; // @[csr.scala 238:14:@300.4]
  assign _T_468 = _T_466 == 32'h0; // @[csr.scala 238:14:@301.4]
  assign _T_470 = cycleh + 32'h1; // @[csr.scala 239:28:@303.6]
  assign _T_471 = cycleh + 32'h1; // @[csr.scala 239:28:@304.6]
  assign _GEN_7 = _T_468 ? _T_471 : cycleh; // @[csr.scala 238:20:@302.4]
  assign _T_473 = io_inst != 32'h13; // @[csr.scala 241:28:@307.4]
  assign _T_475 = io_expt == 1'h0; // @[csr.scala 241:53:@308.4]
  assign _T_476 = _T_475 | isEcall; // @[csr.scala 241:62:@309.4]
  assign _T_477 = _T_476 | isEbreak; // @[csr.scala 241:73:@310.4]
  assign _T_478 = _T_473 & _T_477; // @[csr.scala 241:49:@311.4]
  assign _T_480 = io_stall == 1'h0; // @[csr.scala 241:89:@312.4]
  assign isInstRet = _T_478 & _T_480; // @[csr.scala 241:86:@313.4]
  assign _T_482 = instret + 32'h1; // @[csr.scala 244:29:@315.6]
  assign _T_483 = instret + 32'h1; // @[csr.scala 244:29:@316.6]
  assign _GEN_8 = isInstRet ? _T_483 : instret; // @[csr.scala 243:19:@314.4]
  assign _T_484 = ~ instret; // @[csr.scala 246:29:@319.4]
  assign _T_486 = _T_484 == 32'h0; // @[csr.scala 246:29:@320.4]
  assign _T_487 = isInstRet & _T_486; // @[csr.scala 246:18:@321.4]
  assign _T_489 = instreth + 32'h1; // @[csr.scala 247:30:@323.6]
  assign _T_490 = instreth + 32'h1; // @[csr.scala 247:30:@324.6]
  assign _GEN_9 = _T_487 ? _T_490 : instreth; // @[csr.scala 246:35:@322.4]
  assign _T_498 = wasEret == 1'h0; // @[csr.scala 265:12:@336.8]
  assign _T_500 = io_pc - 32'h4; // @[csr.scala 266:54:@338.10]
  assign _T_501 = $unsigned(_T_500); // @[csr.scala 266:54:@339.10]
  assign _T_502 = _T_501[31:0]; // @[csr.scala 266:54:@340.10]
  assign _T_503 = br_taken_delayed ? _T_502 : io_pc; // @[csr.scala 266:29:@341.10]
  assign _T_504 = _T_503[31:2]; // @[csr.scala 266:69:@342.10]
  assign _GEN_150 = {{2'd0}, _T_504}; // @[csr.scala 266:74:@343.10]
  assign _T_505 = _GEN_150 << 2; // @[csr.scala 266:74:@343.10]
  assign _GEN_10 = _T_498 ? _T_505 : mepc; // @[csr.scala 266:7:@337.8]
  assign _T_511 = {isInt,1'h0,cause}; // @[Cat.scala 30:58:@348.8]
  assign _T_513 = iaddrInvalid | laddrInvalid; // @[csr.scala 274:25:@354.8]
  assign _T_514 = _T_513 | saddrInvalid; // @[csr.scala 274:41:@355.8]
  assign _GEN_11 = _T_514 ? io_addr : mtval; // @[csr.scala 274:58:@356.8]
  assign _T_516 = csr_addr == 12'h300; // @[csr.scala 281:21:@369.12]
  assign _T_517 = wdata[12:11]; // @[csr.scala 282:30:@371.14]
  assign _T_518 = wdata[7]; // @[csr.scala 283:30:@373.14]
  assign _T_519 = wdata[24:23]; // @[csr.scala 284:30:@375.14]
  assign _T_520 = wdata[3]; // @[csr.scala 285:30:@377.14]
  assign _T_521 = csr_addr == 12'h344; // @[csr.scala 287:26:@381.14]
  assign _T_522 = wdata[18]; // @[csr.scala 288:30:@383.16]
  assign _T_523 = wdata[17]; // @[csr.scala 289:29:@385.16]
  assign _T_524 = wdata[16]; // @[csr.scala 290:30:@387.16]
  assign _T_527 = csr_addr == 12'h304; // @[csr.scala 294:26:@395.16]
  assign _T_533 = csr_addr == 12'h305; // @[csr.scala 301:26:@409.18]
  assign _T_534 = csr_addr == 12'h340; // @[csr.scala 302:26:@414.20]
  assign _T_535 = csr_addr == 12'h341; // @[csr.scala 303:26:@419.22]
  assign _T_537 = wdata >> 2'h2; // @[csr.scala 303:56:@421.24]
  assign _GEN_151 = {{3'd0}, _T_537}; // @[csr.scala 303:63:@422.24]
  assign _T_539 = _GEN_151 << 2'h2; // @[csr.scala 303:63:@422.24]
  assign _T_540 = csr_addr == 12'h342; // @[csr.scala 304:26:@426.24]
  assign _T_542 = wdata & 32'h8000000f; // @[csr.scala 304:60:@428.26]
  assign _T_543 = csr_addr == 12'h343; // @[csr.scala 305:26:@432.26]
  assign _GEN_12 = _T_543 ? wdata : mtval; // @[csr.scala 305:41:@433.26]
  assign _GEN_13 = _T_540 ? _T_542 : mcause; // @[csr.scala 304:42:@427.24]
  assign _GEN_14 = _T_540 ? mtval : _GEN_12; // @[csr.scala 304:42:@427.24]
  assign _GEN_15 = _T_535 ? _T_539 : {{3'd0}, mepc}; // @[csr.scala 303:40:@420.22]
  assign _GEN_16 = _T_535 ? mcause : _GEN_13; // @[csr.scala 303:40:@420.22]
  assign _GEN_17 = _T_535 ? mtval : _GEN_14; // @[csr.scala 303:40:@420.22]
  assign _GEN_18 = _T_534 ? wdata : mscratch; // @[csr.scala 302:44:@415.20]
  assign _GEN_19 = _T_534 ? {{3'd0}, mepc} : _GEN_15; // @[csr.scala 302:44:@415.20]
  assign _GEN_20 = _T_534 ? mcause : _GEN_16; // @[csr.scala 302:44:@415.20]
  assign _GEN_21 = _T_534 ? mtval : _GEN_17; // @[csr.scala 302:44:@415.20]
  assign _GEN_22 = _T_533 ? wdata : mtvec; // @[csr.scala 301:41:@410.18]
  assign _GEN_23 = _T_533 ? mscratch : _GEN_18; // @[csr.scala 301:41:@410.18]
  assign _GEN_24 = _T_533 ? {{3'd0}, mepc} : _GEN_19; // @[csr.scala 301:41:@410.18]
  assign _GEN_25 = _T_533 ? mcause : _GEN_20; // @[csr.scala 301:41:@410.18]
  assign _GEN_26 = _T_533 ? mtval : _GEN_21; // @[csr.scala 301:41:@410.18]
  assign _GEN_27 = _T_527 ? _T_522 : _GEN_0; // @[csr.scala 294:39:@396.16]
  assign _GEN_28 = _T_527 ? _T_523 : _GEN_1; // @[csr.scala 294:39:@396.16]
  assign _GEN_29 = _T_527 ? _T_524 : _GEN_2; // @[csr.scala 294:39:@396.16]
  assign _GEN_30 = _T_527 ? _T_518 : mie_mtie; // @[csr.scala 294:39:@396.16]
  assign _GEN_31 = _T_527 ? _T_520 : mie_msie; // @[csr.scala 294:39:@396.16]
  assign _GEN_32 = _T_527 ? mtvec : _GEN_22; // @[csr.scala 294:39:@396.16]
  assign _GEN_33 = _T_527 ? mscratch : _GEN_23; // @[csr.scala 294:39:@396.16]
  assign _GEN_34 = _T_527 ? {{3'd0}, mepc} : _GEN_24; // @[csr.scala 294:39:@396.16]
  assign _GEN_35 = _T_527 ? mcause : _GEN_25; // @[csr.scala 294:39:@396.16]
  assign _GEN_36 = _T_527 ? mtval : _GEN_26; // @[csr.scala 294:39:@396.16]
  assign _GEN_40 = _T_521 ? _T_518 : mip_mtip; // @[csr.scala 287:39:@382.14]
  assign _GEN_41 = _T_521 ? _T_520 : mip_msip; // @[csr.scala 287:39:@382.14]
  assign _GEN_42 = _T_521 ? _GEN_0 : _GEN_27; // @[csr.scala 287:39:@382.14]
  assign _GEN_43 = _T_521 ? _GEN_1 : _GEN_28; // @[csr.scala 287:39:@382.14]
  assign _GEN_44 = _T_521 ? _GEN_2 : _GEN_29; // @[csr.scala 287:39:@382.14]
  assign _GEN_45 = _T_521 ? mie_mtie : _GEN_30; // @[csr.scala 287:39:@382.14]
  assign _GEN_46 = _T_521 ? mie_msie : _GEN_31; // @[csr.scala 287:39:@382.14]
  assign _GEN_47 = _T_521 ? mtvec : _GEN_32; // @[csr.scala 287:39:@382.14]
  assign _GEN_48 = _T_521 ? mscratch : _GEN_33; // @[csr.scala 287:39:@382.14]
  assign _GEN_49 = _T_521 ? {{3'd0}, mepc} : _GEN_34; // @[csr.scala 287:39:@382.14]
  assign _GEN_50 = _T_521 ? mcause : _GEN_35; // @[csr.scala 287:39:@382.14]
  assign _GEN_51 = _T_521 ? mtval : _GEN_36; // @[csr.scala 287:39:@382.14]
  assign _GEN_52 = _T_516 ? _T_517 : _GEN_5; // @[csr.scala 281:38:@370.12]
  assign _GEN_53 = _T_516 ? _T_518 : mstatus_mpie; // @[csr.scala 281:38:@370.12]
  assign _GEN_54 = _T_516 ? _T_519 : _GEN_4; // @[csr.scala 281:38:@370.12]
  assign _GEN_55 = _T_516 ? _T_520 : _GEN_3; // @[csr.scala 281:38:@370.12]
  assign _GEN_59 = _T_516 ? mip_mtip : _GEN_40; // @[csr.scala 281:38:@370.12]
  assign _GEN_60 = _T_516 ? mip_msip : _GEN_41; // @[csr.scala 281:38:@370.12]
  assign _GEN_61 = _T_516 ? _GEN_0 : _GEN_42; // @[csr.scala 281:38:@370.12]
  assign _GEN_62 = _T_516 ? _GEN_1 : _GEN_43; // @[csr.scala 281:38:@370.12]
  assign _GEN_63 = _T_516 ? _GEN_2 : _GEN_44; // @[csr.scala 281:38:@370.12]
  assign _GEN_64 = _T_516 ? mie_mtie : _GEN_45; // @[csr.scala 281:38:@370.12]
  assign _GEN_65 = _T_516 ? mie_msie : _GEN_46; // @[csr.scala 281:38:@370.12]
  assign _GEN_66 = _T_516 ? mtvec : _GEN_47; // @[csr.scala 281:38:@370.12]
  assign _GEN_67 = _T_516 ? mscratch : _GEN_48; // @[csr.scala 281:38:@370.12]
  assign _GEN_68 = _T_516 ? {{3'd0}, mepc} : _GEN_49; // @[csr.scala 281:38:@370.12]
  assign _GEN_69 = _T_516 ? mcause : _GEN_50; // @[csr.scala 281:38:@370.12]
  assign _GEN_70 = _T_516 ? mtval : _GEN_51; // @[csr.scala 281:38:@370.12]
  assign _GEN_71 = wen ? _GEN_52 : _GEN_5; // @[csr.scala 280:21:@368.10]
  assign _GEN_72 = wen ? _GEN_53 : mstatus_mpie; // @[csr.scala 280:21:@368.10]
  assign _GEN_73 = wen ? _GEN_54 : _GEN_4; // @[csr.scala 280:21:@368.10]
  assign _GEN_74 = wen ? _GEN_55 : _GEN_3; // @[csr.scala 280:21:@368.10]
  assign _GEN_78 = wen ? _GEN_59 : mip_mtip; // @[csr.scala 280:21:@368.10]
  assign _GEN_79 = wen ? _GEN_60 : mip_msip; // @[csr.scala 280:21:@368.10]
  assign _GEN_80 = wen ? _GEN_61 : _GEN_0; // @[csr.scala 280:21:@368.10]
  assign _GEN_81 = wen ? _GEN_62 : _GEN_1; // @[csr.scala 280:21:@368.10]
  assign _GEN_82 = wen ? _GEN_63 : _GEN_2; // @[csr.scala 280:21:@368.10]
  assign _GEN_83 = wen ? _GEN_64 : mie_mtie; // @[csr.scala 280:21:@368.10]
  assign _GEN_84 = wen ? _GEN_65 : mie_msie; // @[csr.scala 280:21:@368.10]
  assign _GEN_85 = wen ? _GEN_66 : mtvec; // @[csr.scala 280:21:@368.10]
  assign _GEN_86 = wen ? _GEN_67 : mscratch; // @[csr.scala 280:21:@368.10]
  assign _GEN_87 = wen ? _GEN_68 : {{3'd0}, mepc}; // @[csr.scala 280:21:@368.10]
  assign _GEN_88 = wen ? _GEN_69 : mcause; // @[csr.scala 280:21:@368.10]
  assign _GEN_89 = wen ? _GEN_70 : mtval; // @[csr.scala 280:21:@368.10]
  assign _GEN_90 = isEret ? mstatus_mpp : _GEN_73; // @[csr.scala 275:24:@361.8]
  assign _GEN_91 = isEret ? mstatus_mpie : _GEN_74; // @[csr.scala 275:24:@361.8]
  assign _GEN_92 = isEret ? 2'h3 : _GEN_71; // @[csr.scala 275:24:@361.8]
  assign _GEN_93 = isEret ? 1'h1 : _GEN_72; // @[csr.scala 275:24:@361.8]
  assign _GEN_97 = isEret ? mip_mtip : _GEN_78; // @[csr.scala 275:24:@361.8]
  assign _GEN_98 = isEret ? mip_msip : _GEN_79; // @[csr.scala 275:24:@361.8]
  assign _GEN_99 = isEret ? _GEN_0 : _GEN_80; // @[csr.scala 275:24:@361.8]
  assign _GEN_100 = isEret ? _GEN_1 : _GEN_81; // @[csr.scala 275:24:@361.8]
  assign _GEN_101 = isEret ? _GEN_2 : _GEN_82; // @[csr.scala 275:24:@361.8]
  assign _GEN_102 = isEret ? mie_mtie : _GEN_83; // @[csr.scala 275:24:@361.8]
  assign _GEN_103 = isEret ? mie_msie : _GEN_84; // @[csr.scala 275:24:@361.8]
  assign _GEN_104 = isEret ? mtvec : _GEN_85; // @[csr.scala 275:24:@361.8]
  assign _GEN_105 = isEret ? mscratch : _GEN_86; // @[csr.scala 275:24:@361.8]
  assign _GEN_106 = isEret ? {{3'd0}, mepc} : _GEN_87; // @[csr.scala 275:24:@361.8]
  assign _GEN_107 = isEret ? mcause : _GEN_88; // @[csr.scala 275:24:@361.8]
  assign _GEN_108 = isEret ? mtval : _GEN_89; // @[csr.scala 275:24:@361.8]
  assign _GEN_109 = io_expt ? {{3'd0}, _GEN_10} : _GEN_106; // @[csr.scala 261:19:@335.6]
  assign _GEN_110 = io_expt ? _T_511 : _GEN_107; // @[csr.scala 261:19:@335.6]
  assign _GEN_111 = io_expt ? 2'h3 : _GEN_90; // @[csr.scala 261:19:@335.6]
  assign _GEN_112 = io_expt ? 1'h0 : _GEN_91; // @[csr.scala 261:19:@335.6]
  assign _GEN_113 = io_expt ? mstatus_prv : _GEN_92; // @[csr.scala 261:19:@335.6]
  assign _GEN_114 = io_expt ? mstatus_mie : _GEN_93; // @[csr.scala 261:19:@335.6]
  assign _GEN_115 = io_expt ? _GEN_11 : _GEN_108; // @[csr.scala 261:19:@335.6]
  assign _GEN_119 = io_expt ? mip_mtip : _GEN_97; // @[csr.scala 261:19:@335.6]
  assign _GEN_120 = io_expt ? mip_msip : _GEN_98; // @[csr.scala 261:19:@335.6]
  assign _GEN_121 = io_expt ? _GEN_0 : _GEN_99; // @[csr.scala 261:19:@335.6]
  assign _GEN_122 = io_expt ? _GEN_1 : _GEN_100; // @[csr.scala 261:19:@335.6]
  assign _GEN_123 = io_expt ? _GEN_2 : _GEN_101; // @[csr.scala 261:19:@335.6]
  assign _GEN_124 = io_expt ? mie_mtie : _GEN_102; // @[csr.scala 261:19:@335.6]
  assign _GEN_125 = io_expt ? mie_msie : _GEN_103; // @[csr.scala 261:19:@335.6]
  assign _GEN_126 = io_expt ? mtvec : _GEN_104; // @[csr.scala 261:19:@335.6]
  assign _GEN_127 = io_expt ? mscratch : _GEN_105; // @[csr.scala 261:19:@335.6]
  assign _GEN_128 = _T_480 ? _GEN_109 : {{3'd0}, mepc}; // @[csr.scala 260:20:@334.4]
  assign _GEN_135 = _T_480 ? io_irq_motor_irq : mip_motorip; // @[csr.scala 260:20:@334.4]
  assign _GEN_136 = _T_480 ? io_irq_spi_irq : mip_spiip; // @[csr.scala 260:20:@334.4]
  assign _GEN_137 = _T_480 ? io_irq_uart_irq : mip_uartip; // @[csr.scala 260:20:@334.4]
  assign _GEN_138 = _T_480 ? _GEN_119 : mip_mtip; // @[csr.scala 260:20:@334.4]
  assign _GEN_139 = _T_480 ? _GEN_120 : mip_msip; // @[csr.scala 260:20:@334.4]
  assign _GEN_145 = _T_480 ? _GEN_126 : mtvec; // @[csr.scala 260:20:@334.4]
  assign io_out = _T_198 ? cycle : _T_268; // @[csr.scala 175:10:@132.4]
  assign io_expt = _T_452 | isInt; // @[csr.scala 227:18:@285.4]
  assign io_evec = _T_427 ? _T_430 : base; // @[csr.scala 224:18:@266.4]
  assign io_epc = mepc; // @[csr.scala 230:18:@286.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  time$ = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  timeh = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  cycle = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  cycleh = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  instret = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  instreth = _RAND_5[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  mstatus_prv = _RAND_6[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  mstatus_mpp = _RAND_7[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  mstatus_mpie = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  mstatus_mie = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  mie_motorie = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  mie_spiie = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  mie_uartie = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  mie_mtie = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  mie_msie = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  mip_motorip = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  mip_spiip = _RAND_16[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  mip_uartip = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  mip_mtip = _RAND_18[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  mip_msip = _RAND_19[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  mtvec = _RAND_20[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  mscratch = _RAND_21[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  mepc = _RAND_22[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  mcause = _RAND_23[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  mtval = _RAND_24[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  wasEret = _RAND_25[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  br_taken = _RAND_26[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  br_taken_delayed = _RAND_27[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      time$ <= 32'h0;
    end else begin
      time$ <= _T_456;
    end
    if (reset) begin
      timeh <= 32'h0;
    end else begin
      if (_T_459) begin
        timeh <= _T_462;
      end
    end
    if (reset) begin
      cycle <= 32'h0;
    end else begin
      cycle <= _T_465;
    end
    if (reset) begin
      cycleh <= 32'h0;
    end else begin
      if (_T_468) begin
        cycleh <= _T_471;
      end
    end
    if (reset) begin
      instret <= 32'h0;
    end else begin
      if (isInstRet) begin
        instret <= _T_483;
      end
    end
    if (reset) begin
      instreth <= 32'h0;
    end else begin
      if (_T_487) begin
        instreth <= _T_490;
      end
    end
    if (_T_480) begin
      if (io_expt) begin
        mstatus_prv <= 2'h3;
      end else begin
        if (isEret) begin
          mstatus_prv <= mstatus_mpp;
        end else begin
          if (wen) begin
            if (_T_516) begin
              mstatus_prv <= _T_519;
            end else begin
              if (reset) begin
                mstatus_prv <= 2'h3;
              end
            end
          end else begin
            if (reset) begin
              mstatus_prv <= 2'h3;
            end
          end
        end
      end
    end else begin
      if (reset) begin
        mstatus_prv <= 2'h3;
      end
    end
    if (_T_480) begin
      if (io_expt) begin
        mstatus_mpp <= mstatus_prv;
      end else begin
        if (isEret) begin
          mstatus_mpp <= 2'h3;
        end else begin
          if (wen) begin
            if (_T_516) begin
              mstatus_mpp <= _T_517;
            end else begin
              if (reset) begin
                mstatus_mpp <= 2'h3;
              end
            end
          end else begin
            if (reset) begin
              mstatus_mpp <= 2'h3;
            end
          end
        end
      end
    end else begin
      if (reset) begin
        mstatus_mpp <= 2'h3;
      end
    end
    if (_T_480) begin
      if (io_expt) begin
        mstatus_mpie <= mstatus_mie;
      end else begin
        if (isEret) begin
          mstatus_mpie <= 1'h1;
        end else begin
          if (wen) begin
            if (_T_516) begin
              mstatus_mpie <= _T_518;
            end
          end
        end
      end
    end
    if (_T_480) begin
      if (io_expt) begin
        mstatus_mie <= 1'h0;
      end else begin
        if (isEret) begin
          mstatus_mie <= mstatus_mpie;
        end else begin
          if (wen) begin
            if (_T_516) begin
              mstatus_mie <= _T_520;
            end else begin
              if (reset) begin
                mstatus_mie <= 1'h1;
              end
            end
          end else begin
            if (reset) begin
              mstatus_mie <= 1'h1;
            end
          end
        end
      end
    end else begin
      if (reset) begin
        mstatus_mie <= 1'h1;
      end
    end
    if (_T_480) begin
      if (io_expt) begin
        if (reset) begin
          mie_motorie <= 1'h0;
        end
      end else begin
        if (isEret) begin
          if (reset) begin
            mie_motorie <= 1'h0;
          end
        end else begin
          if (wen) begin
            if (_T_516) begin
              if (reset) begin
                mie_motorie <= 1'h0;
              end
            end else begin
              if (_T_521) begin
                if (reset) begin
                  mie_motorie <= 1'h0;
                end
              end else begin
                if (_T_527) begin
                  mie_motorie <= _T_522;
                end else begin
                  mie_motorie <= _GEN_0;
                end
              end
            end
          end else begin
            mie_motorie <= _GEN_0;
          end
        end
      end
    end else begin
      mie_motorie <= _GEN_0;
    end
    if (_T_480) begin
      if (io_expt) begin
        if (reset) begin
          mie_spiie <= 1'h0;
        end
      end else begin
        if (isEret) begin
          if (reset) begin
            mie_spiie <= 1'h0;
          end
        end else begin
          if (wen) begin
            if (_T_516) begin
              if (reset) begin
                mie_spiie <= 1'h0;
              end
            end else begin
              if (_T_521) begin
                if (reset) begin
                  mie_spiie <= 1'h0;
                end
              end else begin
                if (_T_527) begin
                  mie_spiie <= _T_523;
                end else begin
                  mie_spiie <= _GEN_1;
                end
              end
            end
          end else begin
            mie_spiie <= _GEN_1;
          end
        end
      end
    end else begin
      mie_spiie <= _GEN_1;
    end
    if (_T_480) begin
      if (io_expt) begin
        if (reset) begin
          mie_uartie <= 1'h1;
        end
      end else begin
        if (isEret) begin
          if (reset) begin
            mie_uartie <= 1'h1;
          end
        end else begin
          if (wen) begin
            if (_T_516) begin
              if (reset) begin
                mie_uartie <= 1'h1;
              end
            end else begin
              if (_T_521) begin
                if (reset) begin
                  mie_uartie <= 1'h1;
                end
              end else begin
                if (_T_527) begin
                  mie_uartie <= _T_524;
                end else begin
                  mie_uartie <= _GEN_2;
                end
              end
            end
          end else begin
            mie_uartie <= _GEN_2;
          end
        end
      end
    end else begin
      mie_uartie <= _GEN_2;
    end
    if (_T_480) begin
      if (!(io_expt)) begin
        if (!(isEret)) begin
          if (wen) begin
            if (!(_T_516)) begin
              if (!(_T_521)) begin
                if (_T_527) begin
                  mie_mtie <= _T_518;
                end
              end
            end
          end
        end
      end
    end
    if (_T_480) begin
      if (!(io_expt)) begin
        if (!(isEret)) begin
          if (wen) begin
            if (!(_T_516)) begin
              if (!(_T_521)) begin
                if (_T_527) begin
                  mie_msie <= _T_520;
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      mip_motorip <= 1'h0;
    end else begin
      if (_T_480) begin
        mip_motorip <= io_irq_motor_irq;
      end
    end
    if (reset) begin
      mip_spiip <= 1'h0;
    end else begin
      if (_T_480) begin
        mip_spiip <= io_irq_spi_irq;
      end
    end
    if (reset) begin
      mip_uartip <= 1'h0;
    end else begin
      if (_T_480) begin
        mip_uartip <= io_irq_uart_irq;
      end
    end
    if (reset) begin
      mip_mtip <= 1'h0;
    end else begin
      if (_T_480) begin
        if (!(io_expt)) begin
          if (!(isEret)) begin
            if (wen) begin
              if (!(_T_516)) begin
                if (_T_521) begin
                  mip_mtip <= _T_518;
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      mip_msip <= 1'h0;
    end else begin
      if (_T_480) begin
        if (!(io_expt)) begin
          if (!(isEret)) begin
            if (wen) begin
              if (!(_T_516)) begin
                if (_T_521) begin
                  mip_msip <= _T_520;
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      mtvec <= 32'h9;
    end else begin
      if (_T_480) begin
        if (!(io_expt)) begin
          if (!(isEret)) begin
            if (wen) begin
              if (!(_T_516)) begin
                if (!(_T_521)) begin
                  if (!(_T_527)) begin
                    if (_T_533) begin
                      if (_T_397) begin
                        mtvec <= io_in;
                      end else begin
                        if (_T_395) begin
                          mtvec <= _T_390;
                        end else begin
                          if (_T_393) begin
                            mtvec <= _T_392;
                          end else begin
                            mtvec <= 32'h0;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_480) begin
      if (!(io_expt)) begin
        if (!(isEret)) begin
          if (wen) begin
            if (!(_T_516)) begin
              if (!(_T_521)) begin
                if (!(_T_527)) begin
                  if (!(_T_533)) begin
                    if (_T_534) begin
                      if (_T_397) begin
                        mscratch <= io_in;
                      end else begin
                        if (_T_395) begin
                          mscratch <= _T_390;
                        end else begin
                          if (_T_393) begin
                            mscratch <= _T_392;
                          end else begin
                            mscratch <= 32'h0;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    mepc <= _GEN_128[31:0];
    if (_T_480) begin
      if (io_expt) begin
        mcause <= _T_511;
      end else begin
        if (!(isEret)) begin
          if (wen) begin
            if (!(_T_516)) begin
              if (!(_T_521)) begin
                if (!(_T_527)) begin
                  if (!(_T_533)) begin
                    if (!(_T_534)) begin
                      if (!(_T_535)) begin
                        if (_T_540) begin
                          mcause <= _T_542;
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_480) begin
      if (io_expt) begin
        if (_T_514) begin
          mtval <= io_addr;
        end
      end else begin
        if (!(isEret)) begin
          if (wen) begin
            if (!(_T_516)) begin
              if (!(_T_521)) begin
                if (!(_T_527)) begin
                  if (!(_T_533)) begin
                    if (!(_T_534)) begin
                      if (!(_T_535)) begin
                        if (!(_T_540)) begin
                          if (_T_543) begin
                            if (_T_397) begin
                              mtval <= io_in;
                            end else begin
                              if (_T_395) begin
                                mtval <= _T_390;
                              end else begin
                                if (_T_393) begin
                                  mtval <= _T_392;
                                end else begin
                                  mtval <= 32'h0;
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      wasEret <= 1'h0;
    end else begin
      wasEret <= isEret;
    end
    br_taken <= io_br_taken;
    br_taken_delayed <= br_taken;
  end
endmodule
module RegFile( // @[:@442.2]
  input         clock, // @[:@443.4]
  input  [4:0]  io_raddr1, // @[:@445.4]
  input  [4:0]  io_raddr2, // @[:@445.4]
  output [31:0] io_rdata1, // @[:@445.4]
  output [31:0] io_rdata2, // @[:@445.4]
  input         io_wen, // @[:@445.4]
  input  [4:0]  io_waddr, // @[:@445.4]
  input  [31:0] io_wdata // @[:@445.4]
);
  reg [31:0] regs [0:31]; // @[reg_file.scala 30:17:@447.4]
  reg [31:0] _RAND_0;
  wire [31:0] regs__T_23_data; // @[reg_file.scala 30:17:@447.4]
  wire [4:0] regs__T_23_addr; // @[reg_file.scala 30:17:@447.4]
  wire [31:0] regs__T_28_data; // @[reg_file.scala 30:17:@447.4]
  wire [4:0] regs__T_28_addr; // @[reg_file.scala 30:17:@447.4]
  wire [31:0] regs__T_34_data; // @[reg_file.scala 30:17:@447.4]
  wire [4:0] regs__T_34_addr; // @[reg_file.scala 30:17:@447.4]
  wire  regs__T_34_mask; // @[reg_file.scala 30:17:@447.4]
  wire  regs__T_34_en; // @[reg_file.scala 30:17:@447.4]
  wire  _T_22; // @[reg_file.scala 32:31:@448.4]
  wire  _T_27; // @[reg_file.scala 33:31:@452.4]
  wire  _T_32; // @[reg_file.scala 35:26:@456.4]
  assign regs__T_23_addr = io_raddr1;
  assign regs__T_23_data = regs[regs__T_23_addr]; // @[reg_file.scala 30:17:@447.4]
  assign regs__T_28_addr = io_raddr2;
  assign regs__T_28_data = regs[regs__T_28_addr]; // @[reg_file.scala 30:17:@447.4]
  assign regs__T_34_data = io_wdata;
  assign regs__T_34_addr = io_waddr;
  assign regs__T_34_mask = 1'h1;
  assign regs__T_34_en = io_wen & _T_32;
  assign _T_22 = io_raddr1 != 5'h0; // @[reg_file.scala 32:31:@448.4]
  assign _T_27 = io_raddr2 != 5'h0; // @[reg_file.scala 33:31:@452.4]
  assign _T_32 = io_waddr != 5'h0; // @[reg_file.scala 35:26:@456.4]
  assign io_rdata1 = _T_22 ? regs__T_23_data : 32'h0; // @[reg_file.scala 32:13:@451.4]
  assign io_rdata2 = _T_27 ? regs__T_28_data : 32'h0; // @[reg_file.scala 33:13:@455.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    regs[initvar] = _RAND_0[31:0];
  `endif // RANDOMIZE_MEM_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(regs__T_34_en & regs__T_34_mask) begin
      regs[regs__T_34_addr] <= regs__T_34_data; // @[reg_file.scala 30:17:@447.4]
    end
  end
endmodule
module ALU( // @[:@463.2]
  input  [31:0] io_in_a, // @[:@466.4]
  input  [31:0] io_in_b, // @[:@466.4]
  input  [3:0]  io_alu_op, // @[:@466.4]
  output [31:0] io_out, // @[:@466.4]
  output [31:0] io_sum // @[:@466.4]
);
  wire  _T_15; // @[alu.scala 46:39:@468.4]
  wire [32:0] _T_17; // @[alu.scala 46:44:@469.4]
  wire [32:0] _T_18; // @[alu.scala 46:44:@470.4]
  wire [31:0] _T_19; // @[alu.scala 46:44:@471.4]
  wire [31:0] _T_20; // @[alu.scala 46:29:@472.4]
  wire [32:0] _T_21; // @[alu.scala 46:24:@473.4]
  wire [31:0] sum; // @[alu.scala 46:24:@474.4]
  wire  _T_22; // @[alu.scala 47:28:@475.4]
  wire  _T_23; // @[alu.scala 47:48:@476.4]
  wire  _T_24; // @[alu.scala 47:37:@477.4]
  wire  _T_25; // @[alu.scala 47:61:@478.4]
  wire  _T_26; // @[alu.scala 48:33:@479.4]
  wire  _T_29; // @[alu.scala 48:23:@482.4]
  wire  cmp; // @[alu.scala 47:19:@483.4]
  wire [4:0] shamt; // @[alu.scala 49:23:@484.4]
  wire  _T_30; // @[alu.scala 50:29:@485.4]
  wire [15:0] _T_35; // @[Bitwise.scala 103:21:@488.4]
  wire [31:0] _T_36; // @[Bitwise.scala 103:31:@489.4]
  wire [15:0] _T_37; // @[Bitwise.scala 103:46:@490.4]
  wire [31:0] _GEN_0; // @[Bitwise.scala 103:65:@491.4]
  wire [31:0] _T_38; // @[Bitwise.scala 103:65:@491.4]
  wire [31:0] _T_40; // @[Bitwise.scala 103:75:@493.4]
  wire [31:0] _T_41; // @[Bitwise.scala 103:39:@494.4]
  wire [23:0] _T_45; // @[Bitwise.scala 103:21:@498.4]
  wire [31:0] _GEN_1; // @[Bitwise.scala 103:31:@499.4]
  wire [31:0] _T_46; // @[Bitwise.scala 103:31:@499.4]
  wire [23:0] _T_47; // @[Bitwise.scala 103:46:@500.4]
  wire [31:0] _GEN_2; // @[Bitwise.scala 103:65:@501.4]
  wire [31:0] _T_48; // @[Bitwise.scala 103:65:@501.4]
  wire [31:0] _T_50; // @[Bitwise.scala 103:75:@503.4]
  wire [31:0] _T_51; // @[Bitwise.scala 103:39:@504.4]
  wire [27:0] _T_55; // @[Bitwise.scala 103:21:@508.4]
  wire [31:0] _GEN_3; // @[Bitwise.scala 103:31:@509.4]
  wire [31:0] _T_56; // @[Bitwise.scala 103:31:@509.4]
  wire [27:0] _T_57; // @[Bitwise.scala 103:46:@510.4]
  wire [31:0] _GEN_4; // @[Bitwise.scala 103:65:@511.4]
  wire [31:0] _T_58; // @[Bitwise.scala 103:65:@511.4]
  wire [31:0] _T_60; // @[Bitwise.scala 103:75:@513.4]
  wire [31:0] _T_61; // @[Bitwise.scala 103:39:@514.4]
  wire [29:0] _T_65; // @[Bitwise.scala 103:21:@518.4]
  wire [31:0] _GEN_5; // @[Bitwise.scala 103:31:@519.4]
  wire [31:0] _T_66; // @[Bitwise.scala 103:31:@519.4]
  wire [29:0] _T_67; // @[Bitwise.scala 103:46:@520.4]
  wire [31:0] _GEN_6; // @[Bitwise.scala 103:65:@521.4]
  wire [31:0] _T_68; // @[Bitwise.scala 103:65:@521.4]
  wire [31:0] _T_70; // @[Bitwise.scala 103:75:@523.4]
  wire [31:0] _T_71; // @[Bitwise.scala 103:39:@524.4]
  wire [30:0] _T_75; // @[Bitwise.scala 103:21:@528.4]
  wire [31:0] _GEN_7; // @[Bitwise.scala 103:31:@529.4]
  wire [31:0] _T_76; // @[Bitwise.scala 103:31:@529.4]
  wire [30:0] _T_77; // @[Bitwise.scala 103:46:@530.4]
  wire [31:0] _GEN_8; // @[Bitwise.scala 103:65:@531.4]
  wire [31:0] _T_78; // @[Bitwise.scala 103:65:@531.4]
  wire [31:0] _T_80; // @[Bitwise.scala 103:75:@533.4]
  wire [31:0] _T_81; // @[Bitwise.scala 103:39:@534.4]
  wire [31:0] shin; // @[alu.scala 50:19:@535.4]
  wire  _T_83; // @[alu.scala 51:41:@537.4]
  wire  _T_84; // @[alu.scala 51:34:@538.4]
  wire [32:0] _T_85; // @[Cat.scala 30:58:@539.4]
  wire [32:0] _T_86; // @[alu.scala 51:57:@540.4]
  wire [32:0] _T_87; // @[alu.scala 51:64:@541.4]
  wire [31:0] shiftr; // @[alu.scala 51:73:@542.4]
  wire [15:0] _T_92; // @[Bitwise.scala 103:21:@545.4]
  wire [31:0] _T_93; // @[Bitwise.scala 103:31:@546.4]
  wire [15:0] _T_94; // @[Bitwise.scala 103:46:@547.4]
  wire [31:0] _GEN_9; // @[Bitwise.scala 103:65:@548.4]
  wire [31:0] _T_95; // @[Bitwise.scala 103:65:@548.4]
  wire [31:0] _T_97; // @[Bitwise.scala 103:75:@550.4]
  wire [31:0] _T_98; // @[Bitwise.scala 103:39:@551.4]
  wire [23:0] _T_102; // @[Bitwise.scala 103:21:@555.4]
  wire [31:0] _GEN_10; // @[Bitwise.scala 103:31:@556.4]
  wire [31:0] _T_103; // @[Bitwise.scala 103:31:@556.4]
  wire [23:0] _T_104; // @[Bitwise.scala 103:46:@557.4]
  wire [31:0] _GEN_11; // @[Bitwise.scala 103:65:@558.4]
  wire [31:0] _T_105; // @[Bitwise.scala 103:65:@558.4]
  wire [31:0] _T_107; // @[Bitwise.scala 103:75:@560.4]
  wire [31:0] _T_108; // @[Bitwise.scala 103:39:@561.4]
  wire [27:0] _T_112; // @[Bitwise.scala 103:21:@565.4]
  wire [31:0] _GEN_12; // @[Bitwise.scala 103:31:@566.4]
  wire [31:0] _T_113; // @[Bitwise.scala 103:31:@566.4]
  wire [27:0] _T_114; // @[Bitwise.scala 103:46:@567.4]
  wire [31:0] _GEN_13; // @[Bitwise.scala 103:65:@568.4]
  wire [31:0] _T_115; // @[Bitwise.scala 103:65:@568.4]
  wire [31:0] _T_117; // @[Bitwise.scala 103:75:@570.4]
  wire [31:0] _T_118; // @[Bitwise.scala 103:39:@571.4]
  wire [29:0] _T_122; // @[Bitwise.scala 103:21:@575.4]
  wire [31:0] _GEN_14; // @[Bitwise.scala 103:31:@576.4]
  wire [31:0] _T_123; // @[Bitwise.scala 103:31:@576.4]
  wire [29:0] _T_124; // @[Bitwise.scala 103:46:@577.4]
  wire [31:0] _GEN_15; // @[Bitwise.scala 103:65:@578.4]
  wire [31:0] _T_125; // @[Bitwise.scala 103:65:@578.4]
  wire [31:0] _T_127; // @[Bitwise.scala 103:75:@580.4]
  wire [31:0] _T_128; // @[Bitwise.scala 103:39:@581.4]
  wire [30:0] _T_132; // @[Bitwise.scala 103:21:@585.4]
  wire [31:0] _GEN_16; // @[Bitwise.scala 103:31:@586.4]
  wire [31:0] _T_133; // @[Bitwise.scala 103:31:@586.4]
  wire [30:0] _T_134; // @[Bitwise.scala 103:46:@587.4]
  wire [31:0] _GEN_17; // @[Bitwise.scala 103:65:@588.4]
  wire [31:0] _T_135; // @[Bitwise.scala 103:65:@588.4]
  wire [31:0] _T_137; // @[Bitwise.scala 103:75:@590.4]
  wire [31:0] shiftl; // @[Bitwise.scala 103:39:@591.4]
  wire  _T_151; // @[alu.scala 55:19:@592.4]
  wire  _T_152; // @[alu.scala 55:44:@593.4]
  wire  _T_153; // @[alu.scala 55:31:@594.4]
  wire  _T_154; // @[alu.scala 56:19:@595.4]
  wire  _T_155; // @[alu.scala 56:44:@596.4]
  wire  _T_156; // @[alu.scala 56:31:@597.4]
  wire  _T_157; // @[alu.scala 57:19:@598.4]
  wire  _T_158; // @[alu.scala 57:44:@599.4]
  wire  _T_159; // @[alu.scala 57:31:@600.4]
  wire  _T_160; // @[alu.scala 58:19:@601.4]
  wire  _T_161; // @[alu.scala 59:19:@602.4]
  wire [31:0] _T_162; // @[alu.scala 59:41:@603.4]
  wire  _T_163; // @[alu.scala 60:19:@604.4]
  wire [31:0] _T_164; // @[alu.scala 60:41:@605.4]
  wire  _T_165; // @[alu.scala 61:19:@606.4]
  wire [31:0] _T_166; // @[alu.scala 61:41:@607.4]
  wire  _T_167; // @[alu.scala 62:19:@608.4]
  wire [31:0] _T_168; // @[alu.scala 62:8:@609.4]
  wire [31:0] _T_169; // @[alu.scala 61:8:@610.4]
  wire [31:0] _T_170; // @[alu.scala 60:8:@611.4]
  wire [31:0] _T_171; // @[alu.scala 59:8:@612.4]
  wire [31:0] _T_172; // @[alu.scala 58:8:@613.4]
  wire [31:0] _T_173; // @[alu.scala 57:8:@614.4]
  wire [31:0] _T_174; // @[alu.scala 56:8:@615.4]
  assign _T_15 = io_alu_op[0]; // @[alu.scala 46:39:@468.4]
  assign _T_17 = 32'h0 - io_in_b; // @[alu.scala 46:44:@469.4]
  assign _T_18 = $unsigned(_T_17); // @[alu.scala 46:44:@470.4]
  assign _T_19 = _T_18[31:0]; // @[alu.scala 46:44:@471.4]
  assign _T_20 = _T_15 ? _T_19 : io_in_b; // @[alu.scala 46:29:@472.4]
  assign _T_21 = io_in_a + _T_20; // @[alu.scala 46:24:@473.4]
  assign sum = io_in_a + _T_20; // @[alu.scala 46:24:@474.4]
  assign _T_22 = io_in_a[31]; // @[alu.scala 47:28:@475.4]
  assign _T_23 = io_in_b[31]; // @[alu.scala 47:48:@476.4]
  assign _T_24 = _T_22 == _T_23; // @[alu.scala 47:37:@477.4]
  assign _T_25 = sum[31]; // @[alu.scala 47:61:@478.4]
  assign _T_26 = io_alu_op[1]; // @[alu.scala 48:33:@479.4]
  assign _T_29 = _T_26 ? _T_23 : _T_22; // @[alu.scala 48:23:@482.4]
  assign cmp = _T_24 ? _T_25 : _T_29; // @[alu.scala 47:19:@483.4]
  assign shamt = io_in_b[4:0]; // @[alu.scala 49:23:@484.4]
  assign _T_30 = io_alu_op[3]; // @[alu.scala 50:29:@485.4]
  assign _T_35 = io_in_a[31:16]; // @[Bitwise.scala 103:21:@488.4]
  assign _T_36 = {{16'd0}, _T_35}; // @[Bitwise.scala 103:31:@489.4]
  assign _T_37 = io_in_a[15:0]; // @[Bitwise.scala 103:46:@490.4]
  assign _GEN_0 = {{16'd0}, _T_37}; // @[Bitwise.scala 103:65:@491.4]
  assign _T_38 = _GEN_0 << 16; // @[Bitwise.scala 103:65:@491.4]
  assign _T_40 = _T_38 & 32'hffff0000; // @[Bitwise.scala 103:75:@493.4]
  assign _T_41 = _T_36 | _T_40; // @[Bitwise.scala 103:39:@494.4]
  assign _T_45 = _T_41[31:8]; // @[Bitwise.scala 103:21:@498.4]
  assign _GEN_1 = {{8'd0}, _T_45}; // @[Bitwise.scala 103:31:@499.4]
  assign _T_46 = _GEN_1 & 32'hff00ff; // @[Bitwise.scala 103:31:@499.4]
  assign _T_47 = _T_41[23:0]; // @[Bitwise.scala 103:46:@500.4]
  assign _GEN_2 = {{8'd0}, _T_47}; // @[Bitwise.scala 103:65:@501.4]
  assign _T_48 = _GEN_2 << 8; // @[Bitwise.scala 103:65:@501.4]
  assign _T_50 = _T_48 & 32'hff00ff00; // @[Bitwise.scala 103:75:@503.4]
  assign _T_51 = _T_46 | _T_50; // @[Bitwise.scala 103:39:@504.4]
  assign _T_55 = _T_51[31:4]; // @[Bitwise.scala 103:21:@508.4]
  assign _GEN_3 = {{4'd0}, _T_55}; // @[Bitwise.scala 103:31:@509.4]
  assign _T_56 = _GEN_3 & 32'hf0f0f0f; // @[Bitwise.scala 103:31:@509.4]
  assign _T_57 = _T_51[27:0]; // @[Bitwise.scala 103:46:@510.4]
  assign _GEN_4 = {{4'd0}, _T_57}; // @[Bitwise.scala 103:65:@511.4]
  assign _T_58 = _GEN_4 << 4; // @[Bitwise.scala 103:65:@511.4]
  assign _T_60 = _T_58 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75:@513.4]
  assign _T_61 = _T_56 | _T_60; // @[Bitwise.scala 103:39:@514.4]
  assign _T_65 = _T_61[31:2]; // @[Bitwise.scala 103:21:@518.4]
  assign _GEN_5 = {{2'd0}, _T_65}; // @[Bitwise.scala 103:31:@519.4]
  assign _T_66 = _GEN_5 & 32'h33333333; // @[Bitwise.scala 103:31:@519.4]
  assign _T_67 = _T_61[29:0]; // @[Bitwise.scala 103:46:@520.4]
  assign _GEN_6 = {{2'd0}, _T_67}; // @[Bitwise.scala 103:65:@521.4]
  assign _T_68 = _GEN_6 << 2; // @[Bitwise.scala 103:65:@521.4]
  assign _T_70 = _T_68 & 32'hcccccccc; // @[Bitwise.scala 103:75:@523.4]
  assign _T_71 = _T_66 | _T_70; // @[Bitwise.scala 103:39:@524.4]
  assign _T_75 = _T_71[31:1]; // @[Bitwise.scala 103:21:@528.4]
  assign _GEN_7 = {{1'd0}, _T_75}; // @[Bitwise.scala 103:31:@529.4]
  assign _T_76 = _GEN_7 & 32'h55555555; // @[Bitwise.scala 103:31:@529.4]
  assign _T_77 = _T_71[30:0]; // @[Bitwise.scala 103:46:@530.4]
  assign _GEN_8 = {{1'd0}, _T_77}; // @[Bitwise.scala 103:65:@531.4]
  assign _T_78 = _GEN_8 << 1; // @[Bitwise.scala 103:65:@531.4]
  assign _T_80 = _T_78 & 32'haaaaaaaa; // @[Bitwise.scala 103:75:@533.4]
  assign _T_81 = _T_76 | _T_80; // @[Bitwise.scala 103:39:@534.4]
  assign shin = _T_30 ? io_in_a : _T_81; // @[alu.scala 50:19:@535.4]
  assign _T_83 = shin[31]; // @[alu.scala 51:41:@537.4]
  assign _T_84 = _T_15 & _T_83; // @[alu.scala 51:34:@538.4]
  assign _T_85 = {_T_84,shin}; // @[Cat.scala 30:58:@539.4]
  assign _T_86 = $signed(_T_85); // @[alu.scala 51:57:@540.4]
  assign _T_87 = $signed(_T_86) >>> shamt; // @[alu.scala 51:64:@541.4]
  assign shiftr = _T_87[31:0]; // @[alu.scala 51:73:@542.4]
  assign _T_92 = shiftr[31:16]; // @[Bitwise.scala 103:21:@545.4]
  assign _T_93 = {{16'd0}, _T_92}; // @[Bitwise.scala 103:31:@546.4]
  assign _T_94 = shiftr[15:0]; // @[Bitwise.scala 103:46:@547.4]
  assign _GEN_9 = {{16'd0}, _T_94}; // @[Bitwise.scala 103:65:@548.4]
  assign _T_95 = _GEN_9 << 16; // @[Bitwise.scala 103:65:@548.4]
  assign _T_97 = _T_95 & 32'hffff0000; // @[Bitwise.scala 103:75:@550.4]
  assign _T_98 = _T_93 | _T_97; // @[Bitwise.scala 103:39:@551.4]
  assign _T_102 = _T_98[31:8]; // @[Bitwise.scala 103:21:@555.4]
  assign _GEN_10 = {{8'd0}, _T_102}; // @[Bitwise.scala 103:31:@556.4]
  assign _T_103 = _GEN_10 & 32'hff00ff; // @[Bitwise.scala 103:31:@556.4]
  assign _T_104 = _T_98[23:0]; // @[Bitwise.scala 103:46:@557.4]
  assign _GEN_11 = {{8'd0}, _T_104}; // @[Bitwise.scala 103:65:@558.4]
  assign _T_105 = _GEN_11 << 8; // @[Bitwise.scala 103:65:@558.4]
  assign _T_107 = _T_105 & 32'hff00ff00; // @[Bitwise.scala 103:75:@560.4]
  assign _T_108 = _T_103 | _T_107; // @[Bitwise.scala 103:39:@561.4]
  assign _T_112 = _T_108[31:4]; // @[Bitwise.scala 103:21:@565.4]
  assign _GEN_12 = {{4'd0}, _T_112}; // @[Bitwise.scala 103:31:@566.4]
  assign _T_113 = _GEN_12 & 32'hf0f0f0f; // @[Bitwise.scala 103:31:@566.4]
  assign _T_114 = _T_108[27:0]; // @[Bitwise.scala 103:46:@567.4]
  assign _GEN_13 = {{4'd0}, _T_114}; // @[Bitwise.scala 103:65:@568.4]
  assign _T_115 = _GEN_13 << 4; // @[Bitwise.scala 103:65:@568.4]
  assign _T_117 = _T_115 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75:@570.4]
  assign _T_118 = _T_113 | _T_117; // @[Bitwise.scala 103:39:@571.4]
  assign _T_122 = _T_118[31:2]; // @[Bitwise.scala 103:21:@575.4]
  assign _GEN_14 = {{2'd0}, _T_122}; // @[Bitwise.scala 103:31:@576.4]
  assign _T_123 = _GEN_14 & 32'h33333333; // @[Bitwise.scala 103:31:@576.4]
  assign _T_124 = _T_118[29:0]; // @[Bitwise.scala 103:46:@577.4]
  assign _GEN_15 = {{2'd0}, _T_124}; // @[Bitwise.scala 103:65:@578.4]
  assign _T_125 = _GEN_15 << 2; // @[Bitwise.scala 103:65:@578.4]
  assign _T_127 = _T_125 & 32'hcccccccc; // @[Bitwise.scala 103:75:@580.4]
  assign _T_128 = _T_123 | _T_127; // @[Bitwise.scala 103:39:@581.4]
  assign _T_132 = _T_128[31:1]; // @[Bitwise.scala 103:21:@585.4]
  assign _GEN_16 = {{1'd0}, _T_132}; // @[Bitwise.scala 103:31:@586.4]
  assign _T_133 = _GEN_16 & 32'h55555555; // @[Bitwise.scala 103:31:@586.4]
  assign _T_134 = _T_128[30:0]; // @[Bitwise.scala 103:46:@587.4]
  assign _GEN_17 = {{1'd0}, _T_134}; // @[Bitwise.scala 103:65:@588.4]
  assign _T_135 = _GEN_17 << 1; // @[Bitwise.scala 103:65:@588.4]
  assign _T_137 = _T_135 & 32'haaaaaaaa; // @[Bitwise.scala 103:75:@590.4]
  assign shiftl = _T_133 | _T_137; // @[Bitwise.scala 103:39:@591.4]
  assign _T_151 = io_alu_op == 4'h0; // @[alu.scala 55:19:@592.4]
  assign _T_152 = io_alu_op == 4'h1; // @[alu.scala 55:44:@593.4]
  assign _T_153 = _T_151 | _T_152; // @[alu.scala 55:31:@594.4]
  assign _T_154 = io_alu_op == 4'h5; // @[alu.scala 56:19:@595.4]
  assign _T_155 = io_alu_op == 4'h7; // @[alu.scala 56:44:@596.4]
  assign _T_156 = _T_154 | _T_155; // @[alu.scala 56:31:@597.4]
  assign _T_157 = io_alu_op == 4'h9; // @[alu.scala 57:19:@598.4]
  assign _T_158 = io_alu_op == 4'h8; // @[alu.scala 57:44:@599.4]
  assign _T_159 = _T_157 | _T_158; // @[alu.scala 57:31:@600.4]
  assign _T_160 = io_alu_op == 4'h6; // @[alu.scala 58:19:@601.4]
  assign _T_161 = io_alu_op == 4'h2; // @[alu.scala 59:19:@602.4]
  assign _T_162 = io_in_a & io_in_b; // @[alu.scala 59:41:@603.4]
  assign _T_163 = io_alu_op == 4'h3; // @[alu.scala 60:19:@604.4]
  assign _T_164 = io_in_a | io_in_b; // @[alu.scala 60:41:@605.4]
  assign _T_165 = io_alu_op == 4'h4; // @[alu.scala 61:19:@606.4]
  assign _T_166 = io_in_a ^ io_in_b; // @[alu.scala 61:41:@607.4]
  assign _T_167 = io_alu_op == 4'ha; // @[alu.scala 62:19:@608.4]
  assign _T_168 = _T_167 ? io_in_a : io_in_b; // @[alu.scala 62:8:@609.4]
  assign _T_169 = _T_165 ? _T_166 : _T_168; // @[alu.scala 61:8:@610.4]
  assign _T_170 = _T_163 ? _T_164 : _T_169; // @[alu.scala 60:8:@611.4]
  assign _T_171 = _T_161 ? _T_162 : _T_170; // @[alu.scala 59:8:@612.4]
  assign _T_172 = _T_160 ? shiftl : _T_171; // @[alu.scala 58:8:@613.4]
  assign _T_173 = _T_159 ? shiftr : _T_172; // @[alu.scala 57:8:@614.4]
  assign _T_174 = _T_156 ? {{31'd0}, cmp} : _T_173; // @[alu.scala 56:8:@615.4]
  assign io_out = _T_153 ? sum : _T_174; // @[alu.scala 64:10:@617.4]
  assign io_sum = io_in_a + _T_20; // @[alu.scala 65:10:@618.4]
endmodule
module ImmGen( // @[:@620.2]
  input  [31:0] io_inst, // @[:@623.4]
  input  [2:0]  io_sel, // @[:@623.4]
  output [31:0] io_out // @[:@623.4]
);
  wire  _T_11; // @[imm_gen.scala 26:25:@625.4]
  wire  _T_13; // @[imm_gen.scala 26:48:@626.4]
  wire  _T_14; // @[imm_gen.scala 26:53:@627.4]
  wire  sign; // @[imm_gen.scala 26:17:@628.4]
  wire  _T_15; // @[imm_gen.scala 27:27:@629.4]
  wire [10:0] _T_16; // @[imm_gen.scala 27:45:@630.4]
  wire [10:0] _T_17; // @[imm_gen.scala 27:53:@631.4]
  wire [10:0] b30_20; // @[imm_gen.scala 27:19:@632.4]
  wire  _T_18; // @[imm_gen.scala 28:27:@633.4]
  wire  _T_19; // @[imm_gen.scala 28:47:@634.4]
  wire  _T_20; // @[imm_gen.scala 28:37:@635.4]
  wire [7:0] _T_21; // @[imm_gen.scala 28:71:@636.4]
  wire [7:0] _T_22; // @[imm_gen.scala 28:79:@637.4]
  wire [7:0] b19_12; // @[imm_gen.scala 28:19:@638.4]
  wire  _T_25; // @[imm_gen.scala 29:34:@641.4]
  wire  _T_27; // @[imm_gen.scala 30:24:@642.4]
  wire  _T_28; // @[imm_gen.scala 30:42:@643.4]
  wire  _T_29; // @[imm_gen.scala 30:47:@644.4]
  wire  _T_30; // @[imm_gen.scala 31:24:@645.4]
  wire  _T_31; // @[imm_gen.scala 31:42:@646.4]
  wire  _T_32; // @[imm_gen.scala 31:46:@647.4]
  wire  _T_33; // @[imm_gen.scala 31:16:@648.4]
  wire  _T_34; // @[imm_gen.scala 30:16:@649.4]
  wire  b11; // @[imm_gen.scala 29:16:@650.4]
  wire [5:0] _T_39; // @[imm_gen.scala 32:69:@654.4]
  wire [5:0] b10_5; // @[imm_gen.scala 32:18:@655.4]
  wire  _T_42; // @[imm_gen.scala 34:25:@657.4]
  wire  _T_44; // @[imm_gen.scala 34:35:@659.4]
  wire [3:0] _T_45; // @[imm_gen.scala 34:63:@660.4]
  wire [3:0] _T_47; // @[imm_gen.scala 35:43:@662.4]
  wire [3:0] _T_48; // @[imm_gen.scala 35:59:@663.4]
  wire [3:0] _T_49; // @[imm_gen.scala 35:17:@664.4]
  wire [3:0] _T_50; // @[imm_gen.scala 34:17:@665.4]
  wire [3:0] b4_1; // @[imm_gen.scala 33:17:@666.4]
  wire  _T_53; // @[imm_gen.scala 37:23:@669.4]
  wire  _T_56; // @[imm_gen.scala 38:41:@672.4]
  wire  _T_58; // @[imm_gen.scala 38:15:@673.4]
  wire  _T_59; // @[imm_gen.scala 37:15:@674.4]
  wire  b0; // @[imm_gen.scala 36:15:@675.4]
  wire  _T_62; // @[Cat.scala 30:58:@678.4]
  wire [7:0] _T_63; // @[Cat.scala 30:58:@679.4]
  wire [10:0] _T_65; // @[Cat.scala 30:58:@681.4]
  wire  _T_66; // @[Cat.scala 30:58:@682.4]
  wire [31:0] _T_69; // @[Cat.scala 30:58:@685.4]
  wire [31:0] _T_70; // @[imm_gen.scala 40:61:@686.4]
  assign _T_11 = io_sel == 3'h6; // @[imm_gen.scala 26:25:@625.4]
  assign _T_13 = io_inst[31]; // @[imm_gen.scala 26:48:@626.4]
  assign _T_14 = $signed(_T_13); // @[imm_gen.scala 26:53:@627.4]
  assign sign = _T_11 ? $signed(1'sh0) : $signed(_T_14); // @[imm_gen.scala 26:17:@628.4]
  assign _T_15 = io_sel == 3'h3; // @[imm_gen.scala 27:27:@629.4]
  assign _T_16 = io_inst[30:20]; // @[imm_gen.scala 27:45:@630.4]
  assign _T_17 = $signed(_T_16); // @[imm_gen.scala 27:53:@631.4]
  assign b30_20 = _T_15 ? $signed(_T_17) : $signed({11{sign}}); // @[imm_gen.scala 27:19:@632.4]
  assign _T_18 = io_sel != 3'h3; // @[imm_gen.scala 28:27:@633.4]
  assign _T_19 = io_sel != 3'h4; // @[imm_gen.scala 28:47:@634.4]
  assign _T_20 = _T_18 & _T_19; // @[imm_gen.scala 28:37:@635.4]
  assign _T_21 = io_inst[19:12]; // @[imm_gen.scala 28:71:@636.4]
  assign _T_22 = $signed(_T_21); // @[imm_gen.scala 28:79:@637.4]
  assign b19_12 = _T_20 ? $signed({8{sign}}) : $signed(_T_22); // @[imm_gen.scala 28:19:@638.4]
  assign _T_25 = _T_15 | _T_11; // @[imm_gen.scala 29:34:@641.4]
  assign _T_27 = io_sel == 3'h4; // @[imm_gen.scala 30:24:@642.4]
  assign _T_28 = io_inst[20]; // @[imm_gen.scala 30:42:@643.4]
  assign _T_29 = $signed(_T_28); // @[imm_gen.scala 30:47:@644.4]
  assign _T_30 = io_sel == 3'h5; // @[imm_gen.scala 31:24:@645.4]
  assign _T_31 = io_inst[7]; // @[imm_gen.scala 31:42:@646.4]
  assign _T_32 = $signed(_T_31); // @[imm_gen.scala 31:46:@647.4]
  assign _T_33 = _T_30 ? $signed(_T_32) : $signed(sign); // @[imm_gen.scala 31:16:@648.4]
  assign _T_34 = _T_27 ? $signed(_T_29) : $signed(_T_33); // @[imm_gen.scala 30:16:@649.4]
  assign b11 = _T_25 ? $signed(1'sh0) : $signed(_T_34); // @[imm_gen.scala 29:16:@650.4]
  assign _T_39 = io_inst[30:25]; // @[imm_gen.scala 32:69:@654.4]
  assign b10_5 = _T_25 ? 6'h0 : _T_39; // @[imm_gen.scala 32:18:@655.4]
  assign _T_42 = io_sel == 3'h2; // @[imm_gen.scala 34:25:@657.4]
  assign _T_44 = _T_42 | _T_30; // @[imm_gen.scala 34:35:@659.4]
  assign _T_45 = io_inst[11:8]; // @[imm_gen.scala 34:63:@660.4]
  assign _T_47 = io_inst[19:16]; // @[imm_gen.scala 35:43:@662.4]
  assign _T_48 = io_inst[24:21]; // @[imm_gen.scala 35:59:@663.4]
  assign _T_49 = _T_11 ? _T_47 : _T_48; // @[imm_gen.scala 35:17:@664.4]
  assign _T_50 = _T_44 ? _T_45 : _T_49; // @[imm_gen.scala 34:17:@665.4]
  assign b4_1 = _T_15 ? 4'h0 : _T_50; // @[imm_gen.scala 33:17:@666.4]
  assign _T_53 = io_sel == 3'h1; // @[imm_gen.scala 37:23:@669.4]
  assign _T_56 = io_inst[15]; // @[imm_gen.scala 38:41:@672.4]
  assign _T_58 = _T_11 ? _T_56 : 1'h0; // @[imm_gen.scala 38:15:@673.4]
  assign _T_59 = _T_53 ? _T_28 : _T_58; // @[imm_gen.scala 37:15:@674.4]
  assign b0 = _T_42 ? _T_31 : _T_59; // @[imm_gen.scala 36:15:@675.4]
  assign _T_62 = $unsigned(b11); // @[Cat.scala 30:58:@678.4]
  assign _T_63 = $unsigned(b19_12); // @[Cat.scala 30:58:@679.4]
  assign _T_65 = $unsigned(b30_20); // @[Cat.scala 30:58:@681.4]
  assign _T_66 = $unsigned(sign); // @[Cat.scala 30:58:@682.4]
  assign _T_69 = {_T_66,_T_65,_T_63,_T_62,b10_5,b4_1,b0}; // @[Cat.scala 30:58:@685.4]
  assign _T_70 = $signed(_T_69); // @[imm_gen.scala 40:61:@686.4]
  assign io_out = $unsigned(_T_70); // @[imm_gen.scala 40:10:@688.4]
endmodule
module Branch( // @[:@690.2]
  input  [31:0] io_rs1, // @[:@693.4]
  input  [31:0] io_rs2, // @[:@693.4]
  input  [2:0]  io_br_type, // @[:@693.4]
  output        io_taken // @[:@693.4]
);
  wire [32:0] _T_13; // @[branch.scala 24:29:@695.4]
  wire [32:0] _T_14; // @[branch.scala 24:29:@696.4]
  wire [31:0] diff; // @[branch.scala 24:29:@697.4]
  wire  neq; // @[branch.scala 25:27:@698.4]
  wire  eq; // @[branch.scala 26:22:@699.4]
  wire  _T_17; // @[branch.scala 27:28:@700.4]
  wire  _T_18; // @[branch.scala 27:47:@701.4]
  wire  is_same_sign; // @[branch.scala 27:37:@702.4]
  wire  _T_19; // @[branch.scala 28:44:@703.4]
  wire  lt; // @[branch.scala 28:25:@705.4]
  wire  ltu; // @[branch.scala 29:25:@708.4]
  wire  ge; // @[branch.scala 30:22:@709.4]
  wire  geu; // @[branch.scala 31:22:@710.4]
  wire  _T_25; // @[branch.scala 35:18:@711.4]
  wire  _T_26; // @[branch.scala 35:29:@712.4]
  wire  _T_27; // @[branch.scala 36:18:@713.4]
  wire  _T_28; // @[branch.scala 36:29:@714.4]
  wire  _T_29; // @[branch.scala 35:36:@715.4]
  wire  _T_30; // @[branch.scala 37:18:@716.4]
  wire  _T_31; // @[branch.scala 37:29:@717.4]
  wire  _T_32; // @[branch.scala 36:37:@718.4]
  wire  _T_33; // @[branch.scala 38:18:@719.4]
  wire  _T_34; // @[branch.scala 38:29:@720.4]
  wire  _T_35; // @[branch.scala 37:36:@721.4]
  wire  _T_36; // @[branch.scala 39:18:@722.4]
  wire  _T_37; // @[branch.scala 39:30:@723.4]
  wire  _T_38; // @[branch.scala 38:36:@724.4]
  wire  _T_39; // @[branch.scala 40:18:@725.4]
  wire  _T_40; // @[branch.scala 40:30:@726.4]
  assign _T_13 = io_rs1 - io_rs2; // @[branch.scala 24:29:@695.4]
  assign _T_14 = $unsigned(_T_13); // @[branch.scala 24:29:@696.4]
  assign diff = _T_14[31:0]; // @[branch.scala 24:29:@697.4]
  assign neq = diff != 32'h0; // @[branch.scala 25:27:@698.4]
  assign eq = neq == 1'h0; // @[branch.scala 26:22:@699.4]
  assign _T_17 = io_rs1[31]; // @[branch.scala 27:28:@700.4]
  assign _T_18 = io_rs2[31]; // @[branch.scala 27:47:@701.4]
  assign is_same_sign = _T_17 == _T_18; // @[branch.scala 27:37:@702.4]
  assign _T_19 = diff[31]; // @[branch.scala 28:44:@703.4]
  assign lt = is_same_sign ? _T_19 : _T_17; // @[branch.scala 28:25:@705.4]
  assign ltu = is_same_sign ? _T_19 : _T_18; // @[branch.scala 29:25:@708.4]
  assign ge = lt == 1'h0; // @[branch.scala 30:22:@709.4]
  assign geu = ltu == 1'h0; // @[branch.scala 31:22:@710.4]
  assign _T_25 = io_br_type == 3'h3; // @[branch.scala 35:18:@711.4]
  assign _T_26 = _T_25 & eq; // @[branch.scala 35:29:@712.4]
  assign _T_27 = io_br_type == 3'h6; // @[branch.scala 36:18:@713.4]
  assign _T_28 = _T_27 & neq; // @[branch.scala 36:29:@714.4]
  assign _T_29 = _T_26 | _T_28; // @[branch.scala 35:36:@715.4]
  assign _T_30 = io_br_type == 3'h2; // @[branch.scala 37:18:@716.4]
  assign _T_31 = _T_30 & lt; // @[branch.scala 37:29:@717.4]
  assign _T_32 = _T_29 | _T_31; // @[branch.scala 36:37:@718.4]
  assign _T_33 = io_br_type == 3'h5; // @[branch.scala 38:18:@719.4]
  assign _T_34 = _T_33 & ge; // @[branch.scala 38:29:@720.4]
  assign _T_35 = _T_32 | _T_34; // @[branch.scala 37:36:@721.4]
  assign _T_36 = io_br_type == 3'h1; // @[branch.scala 39:18:@722.4]
  assign _T_37 = _T_36 & ltu; // @[branch.scala 39:30:@723.4]
  assign _T_38 = _T_35 | _T_37; // @[branch.scala 38:36:@724.4]
  assign _T_39 = io_br_type == 3'h4; // @[branch.scala 40:18:@725.4]
  assign _T_40 = _T_39 & geu; // @[branch.scala 40:30:@726.4]
  assign io_taken = _T_38 | _T_40; // @[branch.scala 34:12:@728.4]
endmodule
module LS_Unit( // @[:@730.2]
  input  [1:0]  io_lsu_st_type, // @[:@733.4]
  input  [31:0] io_lsu_wdata_in, // @[:@733.4]
  output [31:0] io_lsu_wdata_out, // @[:@733.4]
  input  [31:0] io_lsu_rdata_in, // @[:@733.4]
  output [31:0] io_lsu_rdata_out, // @[:@733.4]
  input  [2:0]  io_lsu_ld_type // @[:@733.4]
);
  wire [15:0] _T_18; // @[ls_unit.scala 34:31:@735.4]
  wire [7:0] _T_19; // @[ls_unit.scala 35:31:@736.4]
  wire  _T_20; // @[Mux.scala 46:19:@737.4]
  wire [7:0] _T_21; // @[Mux.scala 46:16:@738.4]
  wire  _T_22; // @[Mux.scala 46:19:@739.4]
  wire [15:0] _T_23; // @[Mux.scala 46:16:@740.4]
  wire  _T_24; // @[Mux.scala 46:19:@741.4]
  wire [32:0] _T_27; // @[ls_unit.scala 40:29:@744.4]
  wire [15:0] _T_28; // @[ls_unit.scala 41:28:@745.4]
  wire [15:0] _T_29; // @[ls_unit.scala 41:36:@746.4]
  wire [7:0] _T_30; // @[ls_unit.scala 42:28:@747.4]
  wire [7:0] _T_31; // @[ls_unit.scala 42:35:@748.4]
  wire [16:0] _T_33; // @[ls_unit.scala 43:36:@750.4]
  wire [8:0] _T_35; // @[ls_unit.scala 44:35:@752.4]
  wire  _T_36; // @[Mux.scala 46:19:@753.4]
  wire [8:0] _T_37; // @[Mux.scala 46:16:@754.4]
  wire  _T_38; // @[Mux.scala 46:19:@755.4]
  wire [16:0] _T_39; // @[Mux.scala 46:16:@756.4]
  wire  _T_40; // @[Mux.scala 46:19:@757.4]
  wire [16:0] _T_41; // @[Mux.scala 46:16:@758.4]
  wire  _T_42; // @[Mux.scala 46:19:@759.4]
  wire [16:0] _T_43; // @[Mux.scala 46:16:@760.4]
  wire  _T_44; // @[Mux.scala 46:19:@761.4]
  wire [32:0] _T_45; // @[Mux.scala 46:16:@762.4]
  wire [31:0] _GEN_0; // @[ls_unit.scala 39:21:@763.4]
  assign _T_18 = io_lsu_wdata_in[15:0]; // @[ls_unit.scala 34:31:@735.4]
  assign _T_19 = io_lsu_wdata_in[7:0]; // @[ls_unit.scala 35:31:@736.4]
  assign _T_20 = 2'h3 == io_lsu_st_type; // @[Mux.scala 46:19:@737.4]
  assign _T_21 = _T_20 ? _T_19 : 8'h0; // @[Mux.scala 46:16:@738.4]
  assign _T_22 = 2'h2 == io_lsu_st_type; // @[Mux.scala 46:19:@739.4]
  assign _T_23 = _T_22 ? _T_18 : {{8'd0}, _T_21}; // @[Mux.scala 46:16:@740.4]
  assign _T_24 = 2'h1 == io_lsu_st_type; // @[Mux.scala 46:19:@741.4]
  assign _T_27 = {1'b0,$signed(io_lsu_rdata_in)}; // @[ls_unit.scala 40:29:@744.4]
  assign _T_28 = io_lsu_rdata_in[15:0]; // @[ls_unit.scala 41:28:@745.4]
  assign _T_29 = $signed(_T_28); // @[ls_unit.scala 41:36:@746.4]
  assign _T_30 = io_lsu_rdata_in[7:0]; // @[ls_unit.scala 42:28:@747.4]
  assign _T_31 = $signed(_T_30); // @[ls_unit.scala 42:35:@748.4]
  assign _T_33 = {1'b0,$signed(_T_28)}; // @[ls_unit.scala 43:36:@750.4]
  assign _T_35 = {1'b0,$signed(_T_30)}; // @[ls_unit.scala 44:35:@752.4]
  assign _T_36 = 3'h5 == io_lsu_ld_type; // @[Mux.scala 46:19:@753.4]
  assign _T_37 = _T_36 ? $signed(_T_35) : $signed(9'sh0); // @[Mux.scala 46:16:@754.4]
  assign _T_38 = 3'h4 == io_lsu_ld_type; // @[Mux.scala 46:19:@755.4]
  assign _T_39 = _T_38 ? $signed(_T_33) : $signed({{8{_T_37[8]}},_T_37}); // @[Mux.scala 46:16:@756.4]
  assign _T_40 = 3'h3 == io_lsu_ld_type; // @[Mux.scala 46:19:@757.4]
  assign _T_41 = _T_40 ? $signed({{9{_T_31[7]}},_T_31}) : $signed(_T_39); // @[Mux.scala 46:16:@758.4]
  assign _T_42 = 3'h2 == io_lsu_ld_type; // @[Mux.scala 46:19:@759.4]
  assign _T_43 = _T_42 ? $signed({{1{_T_29[15]}},_T_29}) : $signed(_T_41); // @[Mux.scala 46:16:@760.4]
  assign _T_44 = 3'h1 == io_lsu_ld_type; // @[Mux.scala 46:19:@761.4]
  assign _T_45 = _T_44 ? $signed(_T_27) : $signed({{16{_T_43[16]}},_T_43}); // @[Mux.scala 46:16:@762.4]
  assign io_lsu_wdata_out = _T_24 ? io_lsu_wdata_in : {{16'd0}, _T_23}; // @[ls_unit.scala 32:20:@743.4]
  assign _GEN_0 = _T_45[31:0]; // @[ls_unit.scala 39:21:@763.4]
  assign io_lsu_rdata_out = $signed(_GEN_0); // @[ls_unit.scala 39:21:@763.4]
endmodule
module Datapath( // @[:@765.2]
  input         clock, // @[:@766.4]
  input         reset, // @[:@767.4]
  input         io_irq_uart_irq, // @[:@768.4]
  input         io_irq_spi_irq, // @[:@768.4]
  input         io_irq_motor_irq, // @[:@768.4]
  output [31:0] io_ibus_addr, // @[:@768.4]
  input  [31:0] io_ibus_inst, // @[:@768.4]
  input         io_ibus_valid, // @[:@768.4]
  output [31:0] io_dbus_addr, // @[:@768.4]
  output [31:0] io_dbus_wdata, // @[:@768.4]
  input  [31:0] io_dbus_rdata, // @[:@768.4]
  output        io_dbus_rd_en, // @[:@768.4]
  output        io_dbus_wr_en, // @[:@768.4]
  output [1:0]  io_dbus_st_type, // @[:@768.4]
  output [2:0]  io_dbus_ld_type, // @[:@768.4]
  input         io_dbus_valid, // @[:@768.4]
  output [31:0] io_ctrl_inst, // @[:@768.4]
  input  [1:0]  io_ctrl_pc_sel, // @[:@768.4]
  input         io_ctrl_inst_kill, // @[:@768.4]
  input         io_ctrl_a_sel, // @[:@768.4]
  input         io_ctrl_b_sel, // @[:@768.4]
  input  [2:0]  io_ctrl_imm_sel, // @[:@768.4]
  input  [4:0]  io_ctrl_alu_op, // @[:@768.4]
  input  [2:0]  io_ctrl_br_type, // @[:@768.4]
  input  [1:0]  io_ctrl_st_type, // @[:@768.4]
  input  [2:0]  io_ctrl_ld_type, // @[:@768.4]
  input  [1:0]  io_ctrl_wb_mux_sel, // @[:@768.4]
  input         io_ctrl_wb_en, // @[:@768.4]
  input  [2:0]  io_ctrl_csr_cmd, // @[:@768.4]
  input         io_ctrl_illegal, // @[:@768.4]
  input         io_ctrl_en_rs1, // @[:@768.4]
  input         io_ctrl_en_rs2 // @[:@768.4]
);
  wire  csr_clock; // @[datapath.scala 34:26:@770.4]
  wire  csr_reset; // @[datapath.scala 34:26:@770.4]
  wire  csr_io_stall; // @[datapath.scala 34:26:@770.4]
  wire [2:0] csr_io_cmd; // @[datapath.scala 34:26:@770.4]
  wire [31:0] csr_io_in; // @[datapath.scala 34:26:@770.4]
  wire [31:0] csr_io_out; // @[datapath.scala 34:26:@770.4]
  wire [31:0] csr_io_pc; // @[datapath.scala 34:26:@770.4]
  wire [31:0] csr_io_addr; // @[datapath.scala 34:26:@770.4]
  wire [31:0] csr_io_inst; // @[datapath.scala 34:26:@770.4]
  wire  csr_io_illegal; // @[datapath.scala 34:26:@770.4]
  wire [1:0] csr_io_st_type; // @[datapath.scala 34:26:@770.4]
  wire [2:0] csr_io_ld_type; // @[datapath.scala 34:26:@770.4]
  wire  csr_io_pc_check; // @[datapath.scala 34:26:@770.4]
  wire  csr_io_expt; // @[datapath.scala 34:26:@770.4]
  wire [31:0] csr_io_evec; // @[datapath.scala 34:26:@770.4]
  wire [31:0] csr_io_epc; // @[datapath.scala 34:26:@770.4]
  wire  csr_io_irq_uart_irq; // @[datapath.scala 34:26:@770.4]
  wire  csr_io_irq_spi_irq; // @[datapath.scala 34:26:@770.4]
  wire  csr_io_irq_motor_irq; // @[datapath.scala 34:26:@770.4]
  wire  csr_io_br_taken; // @[datapath.scala 34:26:@770.4]
  wire  reg_file_clock; // @[datapath.scala 35:26:@773.4]
  wire [4:0] reg_file_io_raddr1; // @[datapath.scala 35:26:@773.4]
  wire [4:0] reg_file_io_raddr2; // @[datapath.scala 35:26:@773.4]
  wire [31:0] reg_file_io_rdata1; // @[datapath.scala 35:26:@773.4]
  wire [31:0] reg_file_io_rdata2; // @[datapath.scala 35:26:@773.4]
  wire  reg_file_io_wen; // @[datapath.scala 35:26:@773.4]
  wire [4:0] reg_file_io_waddr; // @[datapath.scala 35:26:@773.4]
  wire [31:0] reg_file_io_wdata; // @[datapath.scala 35:26:@773.4]
  wire [31:0] alu_io_in_a; // @[datapath.scala 36:26:@776.4]
  wire [31:0] alu_io_in_b; // @[datapath.scala 36:26:@776.4]
  wire [3:0] alu_io_alu_op; // @[datapath.scala 36:26:@776.4]
  wire [31:0] alu_io_out; // @[datapath.scala 36:26:@776.4]
  wire [31:0] alu_io_sum; // @[datapath.scala 36:26:@776.4]
  wire [31:0] gen_imm_io_inst; // @[datapath.scala 37:26:@779.4]
  wire [2:0] gen_imm_io_sel; // @[datapath.scala 37:26:@779.4]
  wire [31:0] gen_imm_io_out; // @[datapath.scala 37:26:@779.4]
  wire [31:0] cond_br_io_rs1; // @[datapath.scala 38:26:@782.4]
  wire [31:0] cond_br_io_rs2; // @[datapath.scala 38:26:@782.4]
  wire [2:0] cond_br_io_br_type; // @[datapath.scala 38:26:@782.4]
  wire  cond_br_io_taken; // @[datapath.scala 38:26:@782.4]
  wire [1:0] lsu_io_lsu_st_type; // @[datapath.scala 137:19:@901.4]
  wire [31:0] lsu_io_lsu_wdata_in; // @[datapath.scala 137:19:@901.4]
  wire [31:0] lsu_io_lsu_wdata_out; // @[datapath.scala 137:19:@901.4]
  wire [31:0] lsu_io_lsu_rdata_in; // @[datapath.scala 137:19:@901.4]
  wire [31:0] lsu_io_lsu_rdata_out; // @[datapath.scala 137:19:@901.4]
  wire [2:0] lsu_io_lsu_ld_type; // @[datapath.scala 137:19:@901.4]
  reg [31:0] fet_exe_inst; // @[datapath.scala 42:30:@785.4]
  reg [31:0] _RAND_0;
  reg [31:0] fet_exe_pc; // @[datapath.scala 43:26:@786.4]
  reg [31:0] _RAND_1;
  reg [31:0] exe_wb_inst; // @[datapath.scala 46:33:@787.4]
  reg [31:0] _RAND_2;
  reg [31:0] exe_wb_pc; // @[datapath.scala 47:29:@788.4]
  reg [31:0] _RAND_3;
  reg [31:0] exe_wb_alu; // @[datapath.scala 48:29:@789.4]
  reg [31:0] _RAND_4;
  reg [31:0] csr_in; // @[datapath.scala 49:29:@790.4]
  reg [31:0] _RAND_5;
  reg [1:0] ctrl_st_type; // @[datapath.scala 52:29:@791.4]
  reg [31:0] _RAND_6;
  reg [2:0] ctrl_ld_type; // @[datapath.scala 53:29:@792.4]
  reg [31:0] _RAND_7;
  reg [1:0] ctrl_wb_mux_sel; // @[datapath.scala 54:29:@793.4]
  reg [31:0] _RAND_8;
  reg  ctrl_wb_en; // @[datapath.scala 55:29:@794.4]
  reg [31:0] _RAND_9;
  reg [2:0] ctrl_csr_cmd; // @[datapath.scala 56:29:@795.4]
  reg [31:0] _RAND_10;
  reg  ctrl_illegal; // @[datapath.scala 57:29:@796.4]
  reg [31:0] _RAND_11;
  reg  ctrl_pc_check; // @[datapath.scala 58:29:@797.4]
  reg [31:0] _RAND_12;
  reg  notstarted; // @[datapath.scala 61:27:@799.4]
  reg [31:0] _RAND_13;
  wire [32:0] _T_146; // @[datapath.scala 64:57:@803.4]
  wire [32:0] _T_147; // @[datapath.scala 64:57:@804.4]
  wire [31:0] _T_148; // @[datapath.scala 64:57:@805.4]
  reg [31:0] pc; // @[datapath.scala 64:27:@806.4]
  reg [31:0] _RAND_14;
  wire  _T_153; // @[datapath.scala 66:33:@809.4]
  wire  _T_198; // @[datapath.scala 113:39:@866.4]
  wire  _T_199; // @[datapath.scala 113:59:@867.4]
  wire  _T_200; // @[datapath.scala 113:43:@868.4]
  wire [4:0] rs1_addr; // @[datapath.scala 91:37:@843.4]
  wire  _T_184; // @[datapath.scala 103:47:@850.4]
  wire  _T_185; // @[datapath.scala 103:35:@851.4]
  wire [4:0] wrbk_rd_addr; // @[datapath.scala 102:35:@849.4]
  wire  _T_186; // @[datapath.scala 103:64:@852.4]
  wire  rs1hazard; // @[datapath.scala 103:51:@853.4]
  wire  _T_201; // @[datapath.scala 113:90:@869.4]
  wire [4:0] rs2_addr; // @[datapath.scala 92:37:@844.4]
  wire  _T_188; // @[datapath.scala 104:47:@854.4]
  wire  _T_189; // @[datapath.scala 104:35:@855.4]
  wire  _T_190; // @[datapath.scala 104:64:@856.4]
  wire  rs2hazard; // @[datapath.scala 104:51:@857.4]
  wire  _T_202; // @[datapath.scala 113:123:@870.4]
  wire  _T_203; // @[datapath.scala 113:104:@871.4]
  wire  hazard_stall; // @[datapath.scala 113:70:@872.4]
  wire  _T_208; // @[datapath.scala 117:57:@875.4]
  wire  is_load_store; // @[datapath.scala 117:41:@876.4]
  wire  _T_211; // @[datapath.scala 119:42:@879.4]
  wire  _T_213; // @[datapath.scala 119:63:@880.4]
  wire  _T_214; // @[datapath.scala 119:60:@881.4]
  wire  dmem_stall; // @[datapath.scala 119:25:@882.4]
  wire  stall; // @[datapath.scala 120:38:@884.4]
  wire  _T_154; // @[datapath.scala 66:30:@810.4]
  wire  _T_155; // @[datapath.scala 67:39:@811.4]
  wire  _T_156; // @[datapath.scala 68:39:@812.4]
  wire  _T_157; // @[datapath.scala 68:50:@813.4]
  wire [31:0] _T_159; // @[datapath.scala 68:82:@814.4]
  wire [32:0] _GEN_28; // @[datapath.scala 68:89:@815.4]
  wire [32:0] _T_161; // @[datapath.scala 68:89:@815.4]
  wire  _T_162; // @[datapath.scala 69:39:@816.4]
  wire [32:0] _T_164; // @[datapath.scala 69:56:@817.4]
  wire [31:0] _T_165; // @[datapath.scala 69:56:@818.4]
  wire [31:0] _T_166; // @[datapath.scala 69:23:@819.4]
  wire [32:0] _T_167; // @[datapath.scala 68:23:@820.4]
  wire [32:0] _T_168; // @[datapath.scala 67:23:@821.4]
  wire [32:0] _T_169; // @[datapath.scala 66:57:@822.4]
  wire [32:0] _T_170; // @[datapath.scala 66:23:@823.4]
  wire  _T_171; // @[datapath.scala 72:35:@825.4]
  wire  _T_172; // @[datapath.scala 72:56:@826.4]
  wire  _T_173; // @[datapath.scala 72:76:@827.4]
  wire  _T_176; // @[datapath.scala 72:91:@829.4]
  wire [31:0] inst; // @[datapath.scala 72:23:@830.4]
  wire  _T_179; // @[datapath.scala 80:9:@833.4]
  wire  _T_180; // @[datapath.scala 81:45:@835.6]
  wire  _T_181; // @[datapath.scala 81:65:@836.6]
  wire [31:0] _T_182; // @[datapath.scala 81:25:@837.6]
  wire [31:0] _GEN_1; // @[datapath.scala 80:17:@834.4]
  wire  _T_191; // @[datapath.scala 107:44:@858.4]
  wire  _T_192; // @[datapath.scala 107:55:@859.4]
  wire [31:0] rs1; // @[datapath.scala 107:27:@860.4]
  wire  _T_194; // @[datapath.scala 108:55:@862.4]
  wire [31:0] rs2; // @[datapath.scala 108:27:@863.4]
  wire  _T_221; // @[datapath.scala 123:71:@887.4]
  wire  _T_232; // @[datapath.scala 157:31:@915.4]
  wire  _T_233; // @[datapath.scala 157:21:@916.4]
  wire  _T_243; // @[datapath.scala 164:24:@927.6]
  wire  _T_244; // @[datapath.scala 164:21:@928.6]
  wire  _T_245; // @[datapath.scala 170:46:@933.8]
  wire [31:0] _T_246; // @[datapath.scala 170:29:@934.8]
  wire [1:0] _GEN_2; // @[datapath.scala 178:28:@946.8]
  wire [2:0] _GEN_3; // @[datapath.scala 178:28:@946.8]
  wire  _GEN_4; // @[datapath.scala 178:28:@946.8]
  wire [2:0] _GEN_5; // @[datapath.scala 178:28:@946.8]
  wire [31:0] _GEN_6; // @[datapath.scala 164:38:@929.6]
  wire [31:0] _GEN_7; // @[datapath.scala 164:38:@929.6]
  wire [31:0] _GEN_8; // @[datapath.scala 164:38:@929.6]
  wire [31:0] _GEN_9; // @[datapath.scala 164:38:@929.6]
  wire [1:0] _GEN_10; // @[datapath.scala 164:38:@929.6]
  wire [2:0] _GEN_11; // @[datapath.scala 164:38:@929.6]
  wire [1:0] _GEN_12; // @[datapath.scala 164:38:@929.6]
  wire  _GEN_13; // @[datapath.scala 164:38:@929.6]
  wire [2:0] _GEN_14; // @[datapath.scala 164:38:@929.6]
  wire  _GEN_15; // @[datapath.scala 164:38:@929.6]
  wire  _GEN_16; // @[datapath.scala 164:38:@929.6]
  wire [31:0] _GEN_24; // @[datapath.scala 157:47:@917.4]
  wire [32:0] _T_249; // @[datapath.scala 208:62:@966.4]
  wire [32:0] _T_251; // @[datapath.scala 210:54:@967.4]
  wire [31:0] _T_252; // @[datapath.scala 210:54:@968.4]
  wire [32:0] _T_253; // @[datapath.scala 210:61:@969.4]
  wire [32:0] _T_254; // @[datapath.scala 211:54:@970.4]
  wire  _T_255; // @[Mux.scala 46:19:@971.4]
  wire [32:0] _T_256; // @[Mux.scala 46:16:@972.4]
  wire  _T_257; // @[Mux.scala 46:19:@973.4]
  wire [32:0] _T_258; // @[Mux.scala 46:16:@974.4]
  wire  _T_259; // @[Mux.scala 46:19:@975.4]
  wire [32:0] _T_260; // @[Mux.scala 46:16:@976.4]
  wire [32:0] reg_file_wdata; // @[datapath.scala 211:62:@977.4]
  wire [31:0] npc; // @[:@807.4 :@808.4 datapath.scala 66:17:@824.4]
  CSR csr ( // @[datapath.scala 34:26:@770.4]
    .clock(csr_clock),
    .reset(csr_reset),
    .io_stall(csr_io_stall),
    .io_cmd(csr_io_cmd),
    .io_in(csr_io_in),
    .io_out(csr_io_out),
    .io_pc(csr_io_pc),
    .io_addr(csr_io_addr),
    .io_inst(csr_io_inst),
    .io_illegal(csr_io_illegal),
    .io_st_type(csr_io_st_type),
    .io_ld_type(csr_io_ld_type),
    .io_pc_check(csr_io_pc_check),
    .io_expt(csr_io_expt),
    .io_evec(csr_io_evec),
    .io_epc(csr_io_epc),
    .io_irq_uart_irq(csr_io_irq_uart_irq),
    .io_irq_spi_irq(csr_io_irq_spi_irq),
    .io_irq_motor_irq(csr_io_irq_motor_irq),
    .io_br_taken(csr_io_br_taken)
  );
  RegFile reg_file ( // @[datapath.scala 35:26:@773.4]
    .clock(reg_file_clock),
    .io_raddr1(reg_file_io_raddr1),
    .io_raddr2(reg_file_io_raddr2),
    .io_rdata1(reg_file_io_rdata1),
    .io_rdata2(reg_file_io_rdata2),
    .io_wen(reg_file_io_wen),
    .io_waddr(reg_file_io_waddr),
    .io_wdata(reg_file_io_wdata)
  );
  ALU alu ( // @[datapath.scala 36:26:@776.4]
    .io_in_a(alu_io_in_a),
    .io_in_b(alu_io_in_b),
    .io_alu_op(alu_io_alu_op),
    .io_out(alu_io_out),
    .io_sum(alu_io_sum)
  );
  ImmGen gen_imm ( // @[datapath.scala 37:26:@779.4]
    .io_inst(gen_imm_io_inst),
    .io_sel(gen_imm_io_sel),
    .io_out(gen_imm_io_out)
  );
  Branch cond_br ( // @[datapath.scala 38:26:@782.4]
    .io_rs1(cond_br_io_rs1),
    .io_rs2(cond_br_io_rs2),
    .io_br_type(cond_br_io_br_type),
    .io_taken(cond_br_io_taken)
  );
  LS_Unit lsu ( // @[datapath.scala 137:19:@901.4]
    .io_lsu_st_type(lsu_io_lsu_st_type),
    .io_lsu_wdata_in(lsu_io_lsu_wdata_in),
    .io_lsu_wdata_out(lsu_io_lsu_wdata_out),
    .io_lsu_rdata_in(lsu_io_lsu_rdata_in),
    .io_lsu_rdata_out(lsu_io_lsu_rdata_out),
    .io_lsu_ld_type(lsu_io_lsu_ld_type)
  );
  assign _T_146 = 32'h7000 - 32'h4; // @[datapath.scala 64:57:@803.4]
  assign _T_147 = $unsigned(_T_146); // @[datapath.scala 64:57:@804.4]
  assign _T_148 = _T_147[31:0]; // @[datapath.scala 64:57:@805.4]
  assign _T_153 = io_ibus_valid == 1'h0; // @[datapath.scala 66:33:@809.4]
  assign _T_198 = ctrl_ld_type != 3'h0; // @[datapath.scala 113:39:@866.4]
  assign _T_199 = ctrl_csr_cmd != 3'h0; // @[datapath.scala 113:59:@867.4]
  assign _T_200 = _T_198 | _T_199; // @[datapath.scala 113:43:@868.4]
  assign rs1_addr = fet_exe_inst[19:15]; // @[datapath.scala 91:37:@843.4]
  assign _T_184 = rs1_addr != 5'h0; // @[datapath.scala 103:47:@850.4]
  assign _T_185 = ctrl_wb_en & _T_184; // @[datapath.scala 103:35:@851.4]
  assign wrbk_rd_addr = exe_wb_inst[11:7]; // @[datapath.scala 102:35:@849.4]
  assign _T_186 = rs1_addr == wrbk_rd_addr; // @[datapath.scala 103:64:@852.4]
  assign rs1hazard = _T_185 & _T_186; // @[datapath.scala 103:51:@853.4]
  assign _T_201 = io_ctrl_en_rs1 & rs1hazard; // @[datapath.scala 113:90:@869.4]
  assign rs2_addr = fet_exe_inst[24:20]; // @[datapath.scala 92:37:@844.4]
  assign _T_188 = rs2_addr != 5'h0; // @[datapath.scala 104:47:@854.4]
  assign _T_189 = ctrl_wb_en & _T_188; // @[datapath.scala 104:35:@855.4]
  assign _T_190 = rs2_addr == wrbk_rd_addr; // @[datapath.scala 104:64:@856.4]
  assign rs2hazard = _T_189 & _T_190; // @[datapath.scala 104:51:@857.4]
  assign _T_202 = io_ctrl_en_rs2 & rs2hazard; // @[datapath.scala 113:123:@870.4]
  assign _T_203 = _T_201 | _T_202; // @[datapath.scala 113:104:@871.4]
  assign hazard_stall = _T_200 & _T_203; // @[datapath.scala 113:70:@872.4]
  assign _T_208 = ctrl_st_type != 2'h0; // @[datapath.scala 117:57:@875.4]
  assign is_load_store = _T_198 | _T_208; // @[datapath.scala 117:41:@876.4]
  assign _T_211 = io_dbus_valid & is_load_store; // @[datapath.scala 119:42:@879.4]
  assign _T_213 = is_load_store == 1'h0; // @[datapath.scala 119:63:@880.4]
  assign _T_214 = _T_211 | _T_213; // @[datapath.scala 119:60:@881.4]
  assign dmem_stall = _T_214 == 1'h0; // @[datapath.scala 119:25:@882.4]
  assign stall = hazard_stall | dmem_stall; // @[datapath.scala 120:38:@884.4]
  assign _T_154 = stall | _T_153; // @[datapath.scala 66:30:@810.4]
  assign _T_155 = io_ctrl_pc_sel == 2'h3; // @[datapath.scala 67:39:@811.4]
  assign _T_156 = io_ctrl_pc_sel == 2'h1; // @[datapath.scala 68:39:@812.4]
  assign _T_157 = _T_156 | cond_br_io_taken; // @[datapath.scala 68:50:@813.4]
  assign _T_159 = alu_io_sum >> 1'h1; // @[datapath.scala 68:82:@814.4]
  assign _GEN_28 = {{1'd0}, _T_159}; // @[datapath.scala 68:89:@815.4]
  assign _T_161 = _GEN_28 << 1'h1; // @[datapath.scala 68:89:@815.4]
  assign _T_162 = io_ctrl_pc_sel == 2'h2; // @[datapath.scala 69:39:@816.4]
  assign _T_164 = pc + 32'h4; // @[datapath.scala 69:56:@817.4]
  assign _T_165 = pc + 32'h4; // @[datapath.scala 69:56:@818.4]
  assign _T_166 = _T_162 ? pc : _T_165; // @[datapath.scala 69:23:@819.4]
  assign _T_167 = _T_157 ? _T_161 : {{1'd0}, _T_166}; // @[datapath.scala 68:23:@820.4]
  assign _T_168 = _T_155 ? {{1'd0}, csr_io_epc} : _T_167; // @[datapath.scala 67:23:@821.4]
  assign _T_169 = csr_io_expt ? {{1'd0}, csr_io_evec} : _T_168; // @[datapath.scala 66:57:@822.4]
  assign _T_170 = _T_154 ? {{1'd0}, pc} : _T_169; // @[datapath.scala 66:23:@823.4]
  assign _T_171 = notstarted | io_ctrl_inst_kill; // @[datapath.scala 72:35:@825.4]
  assign _T_172 = _T_171 | cond_br_io_taken; // @[datapath.scala 72:56:@826.4]
  assign _T_173 = _T_172 | csr_io_expt; // @[datapath.scala 72:76:@827.4]
  assign _T_176 = _T_173 | _T_153; // @[datapath.scala 72:91:@829.4]
  assign inst = _T_176 ? 32'h13 : io_ibus_inst; // @[datapath.scala 72:23:@830.4]
  assign _T_179 = stall == 1'h0; // @[datapath.scala 80:9:@833.4]
  assign _T_180 = io_ctrl_inst_kill | cond_br_io_taken; // @[datapath.scala 81:45:@835.6]
  assign _T_181 = _T_180 | csr_io_expt; // @[datapath.scala 81:65:@836.6]
  assign _T_182 = _T_181 ? fet_exe_pc : pc; // @[datapath.scala 81:25:@837.6]
  assign _GEN_1 = _T_179 ? inst : fet_exe_inst; // @[datapath.scala 80:17:@834.4]
  assign _T_191 = ctrl_wb_mux_sel == 2'h0; // @[datapath.scala 107:44:@858.4]
  assign _T_192 = _T_191 & rs1hazard; // @[datapath.scala 107:55:@859.4]
  assign rs1 = _T_192 ? exe_wb_alu : reg_file_io_rdata1; // @[datapath.scala 107:27:@860.4]
  assign _T_194 = _T_191 & rs2hazard; // @[datapath.scala 108:55:@862.4]
  assign rs2 = _T_194 ? exe_wb_alu : reg_file_io_rdata2; // @[datapath.scala 108:27:@863.4]
  assign _T_221 = io_ctrl_st_type != 2'h0; // @[datapath.scala 123:71:@887.4]
  assign _T_232 = _T_179 & csr_io_expt; // @[datapath.scala 157:31:@915.4]
  assign _T_233 = reset | _T_232; // @[datapath.scala 157:21:@916.4]
  assign _T_243 = csr_io_expt == 1'h0; // @[datapath.scala 164:24:@927.6]
  assign _T_244 = _T_179 & _T_243; // @[datapath.scala 164:21:@928.6]
  assign _T_245 = io_ctrl_imm_sel == 3'h6; // @[datapath.scala 170:46:@933.8]
  assign _T_246 = _T_245 ? gen_imm_io_out : rs1; // @[datapath.scala 170:29:@934.8]
  assign _GEN_2 = hazard_stall ? 2'h0 : ctrl_st_type; // @[datapath.scala 178:28:@946.8]
  assign _GEN_3 = hazard_stall ? 3'h0 : ctrl_ld_type; // @[datapath.scala 178:28:@946.8]
  assign _GEN_4 = hazard_stall ? 1'h0 : ctrl_wb_en; // @[datapath.scala 178:28:@946.8]
  assign _GEN_5 = hazard_stall ? 3'h0 : ctrl_csr_cmd; // @[datapath.scala 178:28:@946.8]
  assign _GEN_6 = _T_244 ? fet_exe_pc : exe_wb_pc; // @[datapath.scala 164:38:@929.6]
  assign _GEN_7 = _T_244 ? fet_exe_inst : exe_wb_inst; // @[datapath.scala 164:38:@929.6]
  assign _GEN_8 = _T_244 ? alu_io_out : exe_wb_alu; // @[datapath.scala 164:38:@929.6]
  assign _GEN_9 = _T_244 ? _T_246 : csr_in; // @[datapath.scala 164:38:@929.6]
  assign _GEN_10 = _T_244 ? io_ctrl_st_type : _GEN_2; // @[datapath.scala 164:38:@929.6]
  assign _GEN_11 = _T_244 ? io_ctrl_ld_type : _GEN_3; // @[datapath.scala 164:38:@929.6]
  assign _GEN_12 = _T_244 ? io_ctrl_wb_mux_sel : ctrl_wb_mux_sel; // @[datapath.scala 164:38:@929.6]
  assign _GEN_13 = _T_244 ? io_ctrl_wb_en : _GEN_4; // @[datapath.scala 164:38:@929.6]
  assign _GEN_14 = _T_244 ? io_ctrl_csr_cmd : _GEN_5; // @[datapath.scala 164:38:@929.6]
  assign _GEN_15 = _T_244 ? io_ctrl_illegal : ctrl_illegal; // @[datapath.scala 164:38:@929.6]
  assign _GEN_16 = _T_244 ? _T_156 : ctrl_pc_check; // @[datapath.scala 164:38:@929.6]
  assign _GEN_24 = _T_233 ? exe_wb_inst : _GEN_7; // @[datapath.scala 157:47:@917.4]
  assign _T_249 = {1'b0,$signed(exe_wb_alu)}; // @[datapath.scala 208:62:@966.4]
  assign _T_251 = exe_wb_pc + 32'h4; // @[datapath.scala 210:54:@967.4]
  assign _T_252 = exe_wb_pc + 32'h4; // @[datapath.scala 210:54:@968.4]
  assign _T_253 = {1'b0,$signed(_T_252)}; // @[datapath.scala 210:61:@969.4]
  assign _T_254 = {1'b0,$signed(csr_io_out)}; // @[datapath.scala 211:54:@970.4]
  assign _T_255 = 2'h3 == ctrl_wb_mux_sel; // @[Mux.scala 46:19:@971.4]
  assign _T_256 = _T_255 ? $signed(_T_254) : $signed(_T_249); // @[Mux.scala 46:16:@972.4]
  assign _T_257 = 2'h2 == ctrl_wb_mux_sel; // @[Mux.scala 46:19:@973.4]
  assign _T_258 = _T_257 ? $signed(_T_253) : $signed(_T_256); // @[Mux.scala 46:16:@974.4]
  assign _T_259 = 2'h1 == ctrl_wb_mux_sel; // @[Mux.scala 46:19:@975.4]
  assign _T_260 = _T_259 ? $signed({{1{lsu_io_lsu_rdata_out[31]}},lsu_io_lsu_rdata_out}) : $signed(_T_258); // @[Mux.scala 46:16:@976.4]
  assign reg_file_wdata = $unsigned(_T_260); // @[datapath.scala 211:62:@977.4]
  assign npc = _T_170[31:0]; // @[:@807.4 :@808.4 datapath.scala 66:17:@824.4]
  assign io_ibus_addr = _T_170[31:0]; // @[datapath.scala 75:18:@832.4]
  assign io_dbus_addr = alu_io_sum; // @[datapath.scala 152:23:@912.4]
  assign io_dbus_wdata = lsu_io_lsu_wdata_out; // @[datapath.scala 142:23:@906.4]
  assign io_dbus_rd_en = io_ctrl_ld_type != 3'h0; // @[datapath.scala 145:23:@908.4]
  assign io_dbus_wr_en = hazard_stall ? 1'h0 : _T_221; // @[datapath.scala 123:22:@889.4]
  assign io_dbus_st_type = io_ctrl_st_type; // @[datapath.scala 124:22:@890.4]
  assign io_dbus_ld_type = io_ctrl_ld_type; // @[datapath.scala 146:23:@909.4]
  assign io_ctrl_inst = fet_exe_inst; // @[datapath.scala 87:22:@841.4]
  assign csr_clock = clock; // @[:@771.4]
  assign csr_reset = reset; // @[:@772.4]
  assign csr_io_stall = hazard_stall | dmem_stall; // @[datapath.scala 190:20:@952.4]
  assign csr_io_cmd = ctrl_csr_cmd; // @[datapath.scala 192:20:@954.4]
  assign csr_io_in = csr_in; // @[datapath.scala 191:20:@953.4]
  assign csr_io_pc = exe_wb_pc; // @[datapath.scala 194:20:@956.4]
  assign csr_io_addr = exe_wb_alu; // @[datapath.scala 195:20:@957.4]
  assign csr_io_inst = exe_wb_inst; // @[datapath.scala 193:20:@955.4]
  assign csr_io_illegal = ctrl_illegal; // @[datapath.scala 196:20:@958.4]
  assign csr_io_st_type = ctrl_st_type; // @[datapath.scala 199:20:@961.4]
  assign csr_io_ld_type = ctrl_ld_type; // @[datapath.scala 198:20:@960.4]
  assign csr_io_pc_check = ctrl_pc_check; // @[datapath.scala 197:20:@959.4]
  assign csr_io_irq_uart_irq = io_irq_uart_irq; // @[datapath.scala 203:20:@965.4]
  assign csr_io_irq_spi_irq = io_irq_spi_irq; // @[datapath.scala 203:20:@964.4]
  assign csr_io_irq_motor_irq = io_irq_motor_irq; // @[datapath.scala 203:20:@963.4]
  assign csr_io_br_taken = cond_br_io_taken; // @[datapath.scala 200:20:@962.4]
  assign reg_file_clock = clock; // @[:@774.4]
  assign reg_file_io_raddr1 = fet_exe_inst[19:15]; // @[datapath.scala 93:22:@845.4]
  assign reg_file_io_raddr2 = fet_exe_inst[24:20]; // @[datapath.scala 94:22:@846.4]
  assign reg_file_io_wen = ctrl_wb_en & _T_243; // @[datapath.scala 213:22:@980.4]
  assign reg_file_io_waddr = exe_wb_inst[11:7]; // @[datapath.scala 214:22:@981.4]
  assign reg_file_io_wdata = reg_file_wdata[31:0]; // @[datapath.scala 215:22:@982.4]
  assign alu_io_in_a = io_ctrl_a_sel ? rs1 : fet_exe_pc; // @[datapath.scala 127:22:@893.4]
  assign alu_io_in_b = io_ctrl_b_sel ? rs2 : gen_imm_io_out; // @[datapath.scala 128:22:@896.4]
  assign alu_io_alu_op = io_ctrl_alu_op[3:0]; // @[datapath.scala 129:22:@897.4]
  assign gen_imm_io_inst = fet_exe_inst; // @[datapath.scala 97:22:@847.4]
  assign gen_imm_io_sel = io_ctrl_imm_sel; // @[datapath.scala 98:22:@848.4]
  assign cond_br_io_rs1 = _T_192 ? exe_wb_alu : reg_file_io_rdata1; // @[datapath.scala 132:22:@898.4]
  assign cond_br_io_rs2 = _T_194 ? exe_wb_alu : reg_file_io_rdata2; // @[datapath.scala 133:22:@899.4]
  assign cond_br_io_br_type = io_ctrl_br_type; // @[datapath.scala 134:22:@900.4]
  assign lsu_io_lsu_st_type = io_ctrl_st_type; // @[datapath.scala 140:23:@904.4]
  assign lsu_io_lsu_wdata_in = _T_194 ? exe_wb_alu : reg_file_io_rdata2; // @[datapath.scala 141:23:@905.4]
  assign lsu_io_lsu_rdata_in = io_dbus_rdata; // @[datapath.scala 148:23:@911.4]
  assign lsu_io_lsu_ld_type = ctrl_ld_type; // @[datapath.scala 147:23:@910.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  fet_exe_inst = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  fet_exe_pc = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  exe_wb_inst = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  exe_wb_pc = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  exe_wb_alu = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  csr_in = _RAND_5[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  ctrl_st_type = _RAND_6[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  ctrl_ld_type = _RAND_7[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  ctrl_wb_mux_sel = _RAND_8[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  ctrl_wb_en = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  ctrl_csr_cmd = _RAND_10[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  ctrl_illegal = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  ctrl_pc_check = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  notstarted = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  pc = _RAND_14[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      fet_exe_inst <= 32'h13;
    end else begin
      if (_T_179) begin
        if (_T_176) begin
          fet_exe_inst <= 32'h13;
        end else begin
          fet_exe_inst <= io_ibus_inst;
        end
      end
    end
    if (_T_179) begin
      if (!(_T_181)) begin
        fet_exe_pc <= pc;
      end
    end
    if (reset) begin
      exe_wb_inst <= 32'h13;
    end else begin
      if (!(_T_233)) begin
        if (_T_244) begin
          exe_wb_inst <= fet_exe_inst;
        end
      end
    end
    if (!(_T_233)) begin
      if (_T_244) begin
        exe_wb_pc <= fet_exe_pc;
      end
    end
    if (!(_T_233)) begin
      if (_T_244) begin
        exe_wb_alu <= alu_io_out;
      end
    end
    if (!(_T_233)) begin
      if (_T_244) begin
        if (_T_245) begin
          csr_in <= gen_imm_io_out;
        end else begin
          if (_T_192) begin
            csr_in <= exe_wb_alu;
          end else begin
            csr_in <= reg_file_io_rdata1;
          end
        end
      end
    end
    if (_T_233) begin
      ctrl_st_type <= 2'h0;
    end else begin
      if (_T_244) begin
        ctrl_st_type <= io_ctrl_st_type;
      end else begin
        if (hazard_stall) begin
          ctrl_st_type <= 2'h0;
        end
      end
    end
    if (_T_233) begin
      ctrl_ld_type <= 3'h0;
    end else begin
      if (_T_244) begin
        ctrl_ld_type <= io_ctrl_ld_type;
      end else begin
        if (hazard_stall) begin
          ctrl_ld_type <= 3'h0;
        end
      end
    end
    if (!(_T_233)) begin
      if (_T_244) begin
        ctrl_wb_mux_sel <= io_ctrl_wb_mux_sel;
      end
    end
    if (_T_233) begin
      ctrl_wb_en <= 1'h0;
    end else begin
      if (_T_244) begin
        ctrl_wb_en <= io_ctrl_wb_en;
      end else begin
        if (hazard_stall) begin
          ctrl_wb_en <= 1'h0;
        end
      end
    end
    if (_T_233) begin
      ctrl_csr_cmd <= 3'h0;
    end else begin
      if (_T_244) begin
        ctrl_csr_cmd <= io_ctrl_csr_cmd;
      end else begin
        if (hazard_stall) begin
          ctrl_csr_cmd <= 3'h0;
        end
      end
    end
    if (_T_233) begin
      ctrl_illegal <= 1'h0;
    end else begin
      if (_T_244) begin
        ctrl_illegal <= io_ctrl_illegal;
      end
    end
    if (_T_233) begin
      ctrl_pc_check <= 1'h0;
    end else begin
      if (_T_244) begin
        ctrl_pc_check <= _T_156;
      end
    end
    notstarted <= reset;
    if (reset) begin
      pc <= _T_148;
    end else begin
      pc <= npc;
    end
  end
endmodule
module Control( // @[:@984.2]
  input  [31:0] io_inst, // @[:@987.4]
  output [1:0]  io_pc_sel, // @[:@987.4]
  output        io_inst_kill, // @[:@987.4]
  output        io_a_sel, // @[:@987.4]
  output        io_b_sel, // @[:@987.4]
  output [2:0]  io_imm_sel, // @[:@987.4]
  output [4:0]  io_alu_op, // @[:@987.4]
  output [2:0]  io_br_type, // @[:@987.4]
  output [1:0]  io_st_type, // @[:@987.4]
  output [2:0]  io_ld_type, // @[:@987.4]
  output [1:0]  io_wb_mux_sel, // @[:@987.4]
  output        io_wb_en, // @[:@987.4]
  output [2:0]  io_csr_cmd, // @[:@987.4]
  output        io_illegal, // @[:@987.4]
  output        io_en_rs1, // @[:@987.4]
  output        io_en_rs2 // @[:@987.4]
);
  wire [31:0] _T_39; // @[Lookup.scala 9:38:@989.4]
  wire  _T_40; // @[Lookup.scala 9:38:@990.4]
  wire  _T_44; // @[Lookup.scala 9:38:@992.4]
  wire  _T_48; // @[Lookup.scala 9:38:@994.4]
  wire [31:0] _T_51; // @[Lookup.scala 9:38:@995.4]
  wire  _T_52; // @[Lookup.scala 9:38:@996.4]
  wire  _T_56; // @[Lookup.scala 9:38:@998.4]
  wire  _T_60; // @[Lookup.scala 9:38:@1000.4]
  wire  _T_64; // @[Lookup.scala 9:38:@1002.4]
  wire  _T_68; // @[Lookup.scala 9:38:@1004.4]
  wire  _T_72; // @[Lookup.scala 9:38:@1006.4]
  wire  _T_76; // @[Lookup.scala 9:38:@1008.4]
  wire  _T_80; // @[Lookup.scala 9:38:@1010.4]
  wire  _T_84; // @[Lookup.scala 9:38:@1012.4]
  wire  _T_88; // @[Lookup.scala 9:38:@1014.4]
  wire  _T_92; // @[Lookup.scala 9:38:@1016.4]
  wire  _T_96; // @[Lookup.scala 9:38:@1018.4]
  wire  _T_100; // @[Lookup.scala 9:38:@1020.4]
  wire  _T_104; // @[Lookup.scala 9:38:@1022.4]
  wire  _T_108; // @[Lookup.scala 9:38:@1024.4]
  wire  _T_112; // @[Lookup.scala 9:38:@1026.4]
  wire  _T_116; // @[Lookup.scala 9:38:@1028.4]
  wire  _T_120; // @[Lookup.scala 9:38:@1030.4]
  wire  _T_124; // @[Lookup.scala 9:38:@1032.4]
  wire  _T_128; // @[Lookup.scala 9:38:@1034.4]
  wire  _T_132; // @[Lookup.scala 9:38:@1036.4]
  wire [31:0] _T_135; // @[Lookup.scala 9:38:@1037.4]
  wire  _T_136; // @[Lookup.scala 9:38:@1038.4]
  wire  _T_140; // @[Lookup.scala 9:38:@1040.4]
  wire  _T_144; // @[Lookup.scala 9:38:@1042.4]
  wire  _T_148; // @[Lookup.scala 9:38:@1044.4]
  wire  _T_152; // @[Lookup.scala 9:38:@1046.4]
  wire  _T_156; // @[Lookup.scala 9:38:@1048.4]
  wire  _T_160; // @[Lookup.scala 9:38:@1050.4]
  wire  _T_164; // @[Lookup.scala 9:38:@1052.4]
  wire  _T_168; // @[Lookup.scala 9:38:@1054.4]
  wire  _T_172; // @[Lookup.scala 9:38:@1056.4]
  wire  _T_176; // @[Lookup.scala 9:38:@1058.4]
  wire  _T_180; // @[Lookup.scala 9:38:@1060.4]
  wire  _T_184; // @[Lookup.scala 9:38:@1062.4]
  wire [31:0] _T_187; // @[Lookup.scala 9:38:@1063.4]
  wire  _T_188; // @[Lookup.scala 9:38:@1064.4]
  wire  _T_192; // @[Lookup.scala 9:38:@1066.4]
  wire  _T_196; // @[Lookup.scala 9:38:@1068.4]
  wire  _T_200; // @[Lookup.scala 9:38:@1070.4]
  wire  _T_204; // @[Lookup.scala 9:38:@1072.4]
  wire  _T_208; // @[Lookup.scala 9:38:@1074.4]
  wire  _T_212; // @[Lookup.scala 9:38:@1076.4]
  wire  _T_216; // @[Lookup.scala 9:38:@1078.4]
  wire  _T_220; // @[Lookup.scala 9:38:@1080.4]
  wire  _T_224; // @[Lookup.scala 9:38:@1082.4]
  wire  _T_228; // @[Lookup.scala 9:38:@1084.4]
  wire  _T_232; // @[Lookup.scala 9:38:@1086.4]
  wire [1:0] _T_234; // @[Lookup.scala 11:37:@1088.4]
  wire [1:0] _T_235; // @[Lookup.scala 11:37:@1089.4]
  wire [1:0] _T_236; // @[Lookup.scala 11:37:@1090.4]
  wire [1:0] _T_237; // @[Lookup.scala 11:37:@1091.4]
  wire [1:0] _T_238; // @[Lookup.scala 11:37:@1092.4]
  wire [1:0] _T_239; // @[Lookup.scala 11:37:@1093.4]
  wire [1:0] _T_240; // @[Lookup.scala 11:37:@1094.4]
  wire [1:0] _T_241; // @[Lookup.scala 11:37:@1095.4]
  wire [1:0] _T_242; // @[Lookup.scala 11:37:@1096.4]
  wire [1:0] _T_243; // @[Lookup.scala 11:37:@1097.4]
  wire [1:0] _T_244; // @[Lookup.scala 11:37:@1098.4]
  wire [1:0] _T_245; // @[Lookup.scala 11:37:@1099.4]
  wire [1:0] _T_246; // @[Lookup.scala 11:37:@1100.4]
  wire [1:0] _T_247; // @[Lookup.scala 11:37:@1101.4]
  wire [1:0] _T_248; // @[Lookup.scala 11:37:@1102.4]
  wire [1:0] _T_249; // @[Lookup.scala 11:37:@1103.4]
  wire [1:0] _T_250; // @[Lookup.scala 11:37:@1104.4]
  wire [1:0] _T_251; // @[Lookup.scala 11:37:@1105.4]
  wire [1:0] _T_252; // @[Lookup.scala 11:37:@1106.4]
  wire [1:0] _T_253; // @[Lookup.scala 11:37:@1107.4]
  wire [1:0] _T_254; // @[Lookup.scala 11:37:@1108.4]
  wire [1:0] _T_255; // @[Lookup.scala 11:37:@1109.4]
  wire [1:0] _T_256; // @[Lookup.scala 11:37:@1110.4]
  wire [1:0] _T_257; // @[Lookup.scala 11:37:@1111.4]
  wire [1:0] _T_258; // @[Lookup.scala 11:37:@1112.4]
  wire [1:0] _T_259; // @[Lookup.scala 11:37:@1113.4]
  wire [1:0] _T_260; // @[Lookup.scala 11:37:@1114.4]
  wire [1:0] _T_261; // @[Lookup.scala 11:37:@1115.4]
  wire [1:0] _T_262; // @[Lookup.scala 11:37:@1116.4]
  wire [1:0] _T_263; // @[Lookup.scala 11:37:@1117.4]
  wire [1:0] _T_264; // @[Lookup.scala 11:37:@1118.4]
  wire [1:0] _T_265; // @[Lookup.scala 11:37:@1119.4]
  wire [1:0] _T_266; // @[Lookup.scala 11:37:@1120.4]
  wire [1:0] _T_267; // @[Lookup.scala 11:37:@1121.4]
  wire [1:0] _T_268; // @[Lookup.scala 11:37:@1122.4]
  wire [1:0] _T_269; // @[Lookup.scala 11:37:@1123.4]
  wire [1:0] _T_270; // @[Lookup.scala 11:37:@1124.4]
  wire [1:0] _T_271; // @[Lookup.scala 11:37:@1125.4]
  wire [1:0] _T_272; // @[Lookup.scala 11:37:@1126.4]
  wire [1:0] _T_273; // @[Lookup.scala 11:37:@1127.4]
  wire [1:0] _T_274; // @[Lookup.scala 11:37:@1128.4]
  wire [1:0] _T_275; // @[Lookup.scala 11:37:@1129.4]
  wire [1:0] _T_276; // @[Lookup.scala 11:37:@1130.4]
  wire [1:0] _T_277; // @[Lookup.scala 11:37:@1131.4]
  wire [1:0] _T_278; // @[Lookup.scala 11:37:@1132.4]
  wire [1:0] _T_279; // @[Lookup.scala 11:37:@1133.4]
  wire [1:0] _T_280; // @[Lookup.scala 11:37:@1134.4]
  wire  _T_289; // @[Lookup.scala 11:37:@1144.4]
  wire  _T_290; // @[Lookup.scala 11:37:@1145.4]
  wire  _T_291; // @[Lookup.scala 11:37:@1146.4]
  wire  _T_292; // @[Lookup.scala 11:37:@1147.4]
  wire  _T_293; // @[Lookup.scala 11:37:@1148.4]
  wire  _T_294; // @[Lookup.scala 11:37:@1149.4]
  wire  _T_295; // @[Lookup.scala 11:37:@1150.4]
  wire  _T_296; // @[Lookup.scala 11:37:@1151.4]
  wire  _T_297; // @[Lookup.scala 11:37:@1152.4]
  wire  _T_298; // @[Lookup.scala 11:37:@1153.4]
  wire  _T_299; // @[Lookup.scala 11:37:@1154.4]
  wire  _T_300; // @[Lookup.scala 11:37:@1155.4]
  wire  _T_301; // @[Lookup.scala 11:37:@1156.4]
  wire  _T_302; // @[Lookup.scala 11:37:@1157.4]
  wire  _T_303; // @[Lookup.scala 11:37:@1158.4]
  wire  _T_304; // @[Lookup.scala 11:37:@1159.4]
  wire  _T_305; // @[Lookup.scala 11:37:@1160.4]
  wire  _T_306; // @[Lookup.scala 11:37:@1161.4]
  wire  _T_307; // @[Lookup.scala 11:37:@1162.4]
  wire  _T_308; // @[Lookup.scala 11:37:@1163.4]
  wire  _T_309; // @[Lookup.scala 11:37:@1164.4]
  wire  _T_310; // @[Lookup.scala 11:37:@1165.4]
  wire  _T_311; // @[Lookup.scala 11:37:@1166.4]
  wire  _T_312; // @[Lookup.scala 11:37:@1167.4]
  wire  _T_313; // @[Lookup.scala 11:37:@1168.4]
  wire  _T_314; // @[Lookup.scala 11:37:@1169.4]
  wire  _T_315; // @[Lookup.scala 11:37:@1170.4]
  wire  _T_316; // @[Lookup.scala 11:37:@1171.4]
  wire  _T_317; // @[Lookup.scala 11:37:@1172.4]
  wire  _T_318; // @[Lookup.scala 11:37:@1173.4]
  wire  _T_319; // @[Lookup.scala 11:37:@1174.4]
  wire  _T_320; // @[Lookup.scala 11:37:@1175.4]
  wire  _T_321; // @[Lookup.scala 11:37:@1176.4]
  wire  _T_322; // @[Lookup.scala 11:37:@1177.4]
  wire  _T_323; // @[Lookup.scala 11:37:@1178.4]
  wire  _T_324; // @[Lookup.scala 11:37:@1179.4]
  wire  _T_325; // @[Lookup.scala 11:37:@1180.4]
  wire  _T_326; // @[Lookup.scala 11:37:@1181.4]
  wire  _T_327; // @[Lookup.scala 11:37:@1182.4]
  wire  _T_328; // @[Lookup.scala 11:37:@1183.4]
  wire  _T_342; // @[Lookup.scala 11:37:@1198.4]
  wire  _T_343; // @[Lookup.scala 11:37:@1199.4]
  wire  _T_344; // @[Lookup.scala 11:37:@1200.4]
  wire  _T_345; // @[Lookup.scala 11:37:@1201.4]
  wire  _T_346; // @[Lookup.scala 11:37:@1202.4]
  wire  _T_347; // @[Lookup.scala 11:37:@1203.4]
  wire  _T_348; // @[Lookup.scala 11:37:@1204.4]
  wire  _T_349; // @[Lookup.scala 11:37:@1205.4]
  wire  _T_350; // @[Lookup.scala 11:37:@1206.4]
  wire  _T_351; // @[Lookup.scala 11:37:@1207.4]
  wire  _T_352; // @[Lookup.scala 11:37:@1208.4]
  wire  _T_353; // @[Lookup.scala 11:37:@1209.4]
  wire  _T_354; // @[Lookup.scala 11:37:@1210.4]
  wire  _T_355; // @[Lookup.scala 11:37:@1211.4]
  wire  _T_356; // @[Lookup.scala 11:37:@1212.4]
  wire  _T_357; // @[Lookup.scala 11:37:@1213.4]
  wire  _T_358; // @[Lookup.scala 11:37:@1214.4]
  wire  _T_359; // @[Lookup.scala 11:37:@1215.4]
  wire  _T_360; // @[Lookup.scala 11:37:@1216.4]
  wire  _T_361; // @[Lookup.scala 11:37:@1217.4]
  wire  _T_362; // @[Lookup.scala 11:37:@1218.4]
  wire  _T_363; // @[Lookup.scala 11:37:@1219.4]
  wire  _T_364; // @[Lookup.scala 11:37:@1220.4]
  wire  _T_365; // @[Lookup.scala 11:37:@1221.4]
  wire  _T_366; // @[Lookup.scala 11:37:@1222.4]
  wire  _T_367; // @[Lookup.scala 11:37:@1223.4]
  wire  _T_368; // @[Lookup.scala 11:37:@1224.4]
  wire  _T_369; // @[Lookup.scala 11:37:@1225.4]
  wire  _T_370; // @[Lookup.scala 11:37:@1226.4]
  wire  _T_371; // @[Lookup.scala 11:37:@1227.4]
  wire  _T_372; // @[Lookup.scala 11:37:@1228.4]
  wire  _T_373; // @[Lookup.scala 11:37:@1229.4]
  wire  _T_374; // @[Lookup.scala 11:37:@1230.4]
  wire  _T_375; // @[Lookup.scala 11:37:@1231.4]
  wire  _T_376; // @[Lookup.scala 11:37:@1232.4]
  wire [2:0] _T_381; // @[Lookup.scala 11:37:@1238.4]
  wire [2:0] _T_382; // @[Lookup.scala 11:37:@1239.4]
  wire [2:0] _T_383; // @[Lookup.scala 11:37:@1240.4]
  wire [2:0] _T_384; // @[Lookup.scala 11:37:@1241.4]
  wire [2:0] _T_385; // @[Lookup.scala 11:37:@1242.4]
  wire [2:0] _T_386; // @[Lookup.scala 11:37:@1243.4]
  wire [2:0] _T_387; // @[Lookup.scala 11:37:@1244.4]
  wire [2:0] _T_388; // @[Lookup.scala 11:37:@1245.4]
  wire [2:0] _T_389; // @[Lookup.scala 11:37:@1246.4]
  wire [2:0] _T_390; // @[Lookup.scala 11:37:@1247.4]
  wire [2:0] _T_391; // @[Lookup.scala 11:37:@1248.4]
  wire [2:0] _T_392; // @[Lookup.scala 11:37:@1249.4]
  wire [2:0] _T_393; // @[Lookup.scala 11:37:@1250.4]
  wire [2:0] _T_394; // @[Lookup.scala 11:37:@1251.4]
  wire [2:0] _T_395; // @[Lookup.scala 11:37:@1252.4]
  wire [2:0] _T_396; // @[Lookup.scala 11:37:@1253.4]
  wire [2:0] _T_397; // @[Lookup.scala 11:37:@1254.4]
  wire [2:0] _T_398; // @[Lookup.scala 11:37:@1255.4]
  wire [2:0] _T_399; // @[Lookup.scala 11:37:@1256.4]
  wire [2:0] _T_400; // @[Lookup.scala 11:37:@1257.4]
  wire [2:0] _T_401; // @[Lookup.scala 11:37:@1258.4]
  wire [2:0] _T_402; // @[Lookup.scala 11:37:@1259.4]
  wire [2:0] _T_403; // @[Lookup.scala 11:37:@1260.4]
  wire [2:0] _T_404; // @[Lookup.scala 11:37:@1261.4]
  wire [2:0] _T_405; // @[Lookup.scala 11:37:@1262.4]
  wire [2:0] _T_406; // @[Lookup.scala 11:37:@1263.4]
  wire [2:0] _T_407; // @[Lookup.scala 11:37:@1264.4]
  wire [2:0] _T_408; // @[Lookup.scala 11:37:@1265.4]
  wire [2:0] _T_409; // @[Lookup.scala 11:37:@1266.4]
  wire [2:0] _T_410; // @[Lookup.scala 11:37:@1267.4]
  wire [2:0] _T_411; // @[Lookup.scala 11:37:@1268.4]
  wire [2:0] _T_412; // @[Lookup.scala 11:37:@1269.4]
  wire [2:0] _T_413; // @[Lookup.scala 11:37:@1270.4]
  wire [2:0] _T_414; // @[Lookup.scala 11:37:@1271.4]
  wire [2:0] _T_415; // @[Lookup.scala 11:37:@1272.4]
  wire [2:0] _T_416; // @[Lookup.scala 11:37:@1273.4]
  wire [2:0] _T_417; // @[Lookup.scala 11:37:@1274.4]
  wire [2:0] _T_418; // @[Lookup.scala 11:37:@1275.4]
  wire [2:0] _T_419; // @[Lookup.scala 11:37:@1276.4]
  wire [2:0] _T_420; // @[Lookup.scala 11:37:@1277.4]
  wire [2:0] _T_421; // @[Lookup.scala 11:37:@1278.4]
  wire [2:0] _T_422; // @[Lookup.scala 11:37:@1279.4]
  wire [2:0] _T_423; // @[Lookup.scala 11:37:@1280.4]
  wire [2:0] _T_424; // @[Lookup.scala 11:37:@1281.4]
  wire [3:0] _T_432; // @[Lookup.scala 11:37:@1290.4]
  wire [3:0] _T_433; // @[Lookup.scala 11:37:@1291.4]
  wire [3:0] _T_434; // @[Lookup.scala 11:37:@1292.4]
  wire [3:0] _T_435; // @[Lookup.scala 11:37:@1293.4]
  wire [3:0] _T_436; // @[Lookup.scala 11:37:@1294.4]
  wire [3:0] _T_437; // @[Lookup.scala 11:37:@1295.4]
  wire [3:0] _T_438; // @[Lookup.scala 11:37:@1296.4]
  wire [3:0] _T_439; // @[Lookup.scala 11:37:@1297.4]
  wire [3:0] _T_440; // @[Lookup.scala 11:37:@1298.4]
  wire [3:0] _T_441; // @[Lookup.scala 11:37:@1299.4]
  wire [3:0] _T_442; // @[Lookup.scala 11:37:@1300.4]
  wire [3:0] _T_443; // @[Lookup.scala 11:37:@1301.4]
  wire [3:0] _T_444; // @[Lookup.scala 11:37:@1302.4]
  wire [3:0] _T_445; // @[Lookup.scala 11:37:@1303.4]
  wire [3:0] _T_446; // @[Lookup.scala 11:37:@1304.4]
  wire [3:0] _T_447; // @[Lookup.scala 11:37:@1305.4]
  wire [3:0] _T_448; // @[Lookup.scala 11:37:@1306.4]
  wire [3:0] _T_449; // @[Lookup.scala 11:37:@1307.4]
  wire [3:0] _T_450; // @[Lookup.scala 11:37:@1308.4]
  wire [3:0] _T_451; // @[Lookup.scala 11:37:@1309.4]
  wire [3:0] _T_452; // @[Lookup.scala 11:37:@1310.4]
  wire [3:0] _T_453; // @[Lookup.scala 11:37:@1311.4]
  wire [3:0] _T_454; // @[Lookup.scala 11:37:@1312.4]
  wire [3:0] _T_455; // @[Lookup.scala 11:37:@1313.4]
  wire [3:0] _T_456; // @[Lookup.scala 11:37:@1314.4]
  wire [3:0] _T_457; // @[Lookup.scala 11:37:@1315.4]
  wire [3:0] _T_458; // @[Lookup.scala 11:37:@1316.4]
  wire [3:0] _T_459; // @[Lookup.scala 11:37:@1317.4]
  wire [3:0] _T_460; // @[Lookup.scala 11:37:@1318.4]
  wire [3:0] _T_461; // @[Lookup.scala 11:37:@1319.4]
  wire [3:0] _T_462; // @[Lookup.scala 11:37:@1320.4]
  wire [3:0] _T_463; // @[Lookup.scala 11:37:@1321.4]
  wire [3:0] _T_464; // @[Lookup.scala 11:37:@1322.4]
  wire [3:0] _T_465; // @[Lookup.scala 11:37:@1323.4]
  wire [3:0] _T_466; // @[Lookup.scala 11:37:@1324.4]
  wire [3:0] _T_467; // @[Lookup.scala 11:37:@1325.4]
  wire [3:0] _T_468; // @[Lookup.scala 11:37:@1326.4]
  wire [3:0] _T_469; // @[Lookup.scala 11:37:@1327.4]
  wire [3:0] _T_470; // @[Lookup.scala 11:37:@1328.4]
  wire [3:0] _T_471; // @[Lookup.scala 11:37:@1329.4]
  wire [3:0] _T_472; // @[Lookup.scala 11:37:@1330.4]
  wire [3:0] ctrlSignals_4; // @[Lookup.scala 11:37:@1331.4]
  wire [2:0] _T_512; // @[Lookup.scala 11:37:@1371.4]
  wire [2:0] _T_513; // @[Lookup.scala 11:37:@1372.4]
  wire [2:0] _T_514; // @[Lookup.scala 11:37:@1373.4]
  wire [2:0] _T_515; // @[Lookup.scala 11:37:@1374.4]
  wire [2:0] _T_516; // @[Lookup.scala 11:37:@1375.4]
  wire [2:0] _T_517; // @[Lookup.scala 11:37:@1376.4]
  wire [2:0] _T_518; // @[Lookup.scala 11:37:@1377.4]
  wire [2:0] _T_519; // @[Lookup.scala 11:37:@1378.4]
  wire [2:0] _T_520; // @[Lookup.scala 11:37:@1379.4]
  wire  _T_523; // @[Lookup.scala 11:37:@1383.4]
  wire  _T_524; // @[Lookup.scala 11:37:@1384.4]
  wire  _T_525; // @[Lookup.scala 11:37:@1385.4]
  wire  _T_526; // @[Lookup.scala 11:37:@1386.4]
  wire  _T_527; // @[Lookup.scala 11:37:@1387.4]
  wire  _T_528; // @[Lookup.scala 11:37:@1388.4]
  wire  _T_529; // @[Lookup.scala 11:37:@1389.4]
  wire  _T_530; // @[Lookup.scala 11:37:@1390.4]
  wire  _T_531; // @[Lookup.scala 11:37:@1391.4]
  wire  _T_532; // @[Lookup.scala 11:37:@1392.4]
  wire  _T_533; // @[Lookup.scala 11:37:@1393.4]
  wire  _T_534; // @[Lookup.scala 11:37:@1394.4]
  wire  _T_535; // @[Lookup.scala 11:37:@1395.4]
  wire  _T_536; // @[Lookup.scala 11:37:@1396.4]
  wire  _T_537; // @[Lookup.scala 11:37:@1397.4]
  wire  _T_538; // @[Lookup.scala 11:37:@1398.4]
  wire  _T_539; // @[Lookup.scala 11:37:@1399.4]
  wire  _T_540; // @[Lookup.scala 11:37:@1400.4]
  wire  _T_541; // @[Lookup.scala 11:37:@1401.4]
  wire  _T_542; // @[Lookup.scala 11:37:@1402.4]
  wire  _T_543; // @[Lookup.scala 11:37:@1403.4]
  wire  _T_544; // @[Lookup.scala 11:37:@1404.4]
  wire  _T_545; // @[Lookup.scala 11:37:@1405.4]
  wire  _T_546; // @[Lookup.scala 11:37:@1406.4]
  wire  _T_547; // @[Lookup.scala 11:37:@1407.4]
  wire  _T_548; // @[Lookup.scala 11:37:@1408.4]
  wire  _T_549; // @[Lookup.scala 11:37:@1409.4]
  wire  _T_550; // @[Lookup.scala 11:37:@1410.4]
  wire  _T_551; // @[Lookup.scala 11:37:@1411.4]
  wire  _T_552; // @[Lookup.scala 11:37:@1412.4]
  wire  _T_553; // @[Lookup.scala 11:37:@1413.4]
  wire  _T_554; // @[Lookup.scala 11:37:@1414.4]
  wire  _T_555; // @[Lookup.scala 11:37:@1415.4]
  wire  _T_556; // @[Lookup.scala 11:37:@1416.4]
  wire  _T_557; // @[Lookup.scala 11:37:@1417.4]
  wire  _T_558; // @[Lookup.scala 11:37:@1418.4]
  wire  _T_559; // @[Lookup.scala 11:37:@1419.4]
  wire  _T_560; // @[Lookup.scala 11:37:@1420.4]
  wire  _T_561; // @[Lookup.scala 11:37:@1421.4]
  wire  _T_562; // @[Lookup.scala 11:37:@1422.4]
  wire  _T_563; // @[Lookup.scala 11:37:@1423.4]
  wire  _T_564; // @[Lookup.scala 11:37:@1424.4]
  wire  _T_565; // @[Lookup.scala 11:37:@1425.4]
  wire  _T_566; // @[Lookup.scala 11:37:@1426.4]
  wire  _T_567; // @[Lookup.scala 11:37:@1427.4]
  wire  _T_568; // @[Lookup.scala 11:37:@1428.4]
  wire [1:0] _T_600; // @[Lookup.scala 11:37:@1461.4]
  wire [1:0] _T_601; // @[Lookup.scala 11:37:@1462.4]
  wire [1:0] _T_602; // @[Lookup.scala 11:37:@1463.4]
  wire [1:0] _T_603; // @[Lookup.scala 11:37:@1464.4]
  wire [1:0] _T_604; // @[Lookup.scala 11:37:@1465.4]
  wire [1:0] _T_605; // @[Lookup.scala 11:37:@1466.4]
  wire [1:0] _T_606; // @[Lookup.scala 11:37:@1467.4]
  wire [1:0] _T_607; // @[Lookup.scala 11:37:@1468.4]
  wire [1:0] _T_608; // @[Lookup.scala 11:37:@1469.4]
  wire [1:0] _T_609; // @[Lookup.scala 11:37:@1470.4]
  wire [1:0] _T_610; // @[Lookup.scala 11:37:@1471.4]
  wire [1:0] _T_611; // @[Lookup.scala 11:37:@1472.4]
  wire [1:0] _T_612; // @[Lookup.scala 11:37:@1473.4]
  wire [1:0] _T_613; // @[Lookup.scala 11:37:@1474.4]
  wire [1:0] _T_614; // @[Lookup.scala 11:37:@1475.4]
  wire [1:0] _T_615; // @[Lookup.scala 11:37:@1476.4]
  wire [1:0] _T_616; // @[Lookup.scala 11:37:@1477.4]
  wire [2:0] _T_651; // @[Lookup.scala 11:37:@1513.4]
  wire [2:0] _T_652; // @[Lookup.scala 11:37:@1514.4]
  wire [2:0] _T_653; // @[Lookup.scala 11:37:@1515.4]
  wire [2:0] _T_654; // @[Lookup.scala 11:37:@1516.4]
  wire [2:0] _T_655; // @[Lookup.scala 11:37:@1517.4]
  wire [2:0] _T_656; // @[Lookup.scala 11:37:@1518.4]
  wire [2:0] _T_657; // @[Lookup.scala 11:37:@1519.4]
  wire [2:0] _T_658; // @[Lookup.scala 11:37:@1520.4]
  wire [2:0] _T_659; // @[Lookup.scala 11:37:@1521.4]
  wire [2:0] _T_660; // @[Lookup.scala 11:37:@1522.4]
  wire [2:0] _T_661; // @[Lookup.scala 11:37:@1523.4]
  wire [2:0] _T_662; // @[Lookup.scala 11:37:@1524.4]
  wire [2:0] _T_663; // @[Lookup.scala 11:37:@1525.4]
  wire [2:0] _T_664; // @[Lookup.scala 11:37:@1526.4]
  wire [1:0] _T_667; // @[Lookup.scala 11:37:@1530.4]
  wire [1:0] _T_668; // @[Lookup.scala 11:37:@1531.4]
  wire [1:0] _T_669; // @[Lookup.scala 11:37:@1532.4]
  wire [1:0] _T_670; // @[Lookup.scala 11:37:@1533.4]
  wire [1:0] _T_671; // @[Lookup.scala 11:37:@1534.4]
  wire [1:0] _T_672; // @[Lookup.scala 11:37:@1535.4]
  wire [1:0] _T_673; // @[Lookup.scala 11:37:@1536.4]
  wire [1:0] _T_674; // @[Lookup.scala 11:37:@1537.4]
  wire [1:0] _T_675; // @[Lookup.scala 11:37:@1538.4]
  wire [1:0] _T_676; // @[Lookup.scala 11:37:@1539.4]
  wire [1:0] _T_677; // @[Lookup.scala 11:37:@1540.4]
  wire [1:0] _T_678; // @[Lookup.scala 11:37:@1541.4]
  wire [1:0] _T_679; // @[Lookup.scala 11:37:@1542.4]
  wire [1:0] _T_680; // @[Lookup.scala 11:37:@1543.4]
  wire [1:0] _T_681; // @[Lookup.scala 11:37:@1544.4]
  wire [1:0] _T_682; // @[Lookup.scala 11:37:@1545.4]
  wire [1:0] _T_683; // @[Lookup.scala 11:37:@1546.4]
  wire [1:0] _T_684; // @[Lookup.scala 11:37:@1547.4]
  wire [1:0] _T_685; // @[Lookup.scala 11:37:@1548.4]
  wire [1:0] _T_686; // @[Lookup.scala 11:37:@1549.4]
  wire [1:0] _T_687; // @[Lookup.scala 11:37:@1550.4]
  wire [1:0] _T_688; // @[Lookup.scala 11:37:@1551.4]
  wire [1:0] _T_689; // @[Lookup.scala 11:37:@1552.4]
  wire [1:0] _T_690; // @[Lookup.scala 11:37:@1553.4]
  wire [1:0] _T_691; // @[Lookup.scala 11:37:@1554.4]
  wire [1:0] _T_692; // @[Lookup.scala 11:37:@1555.4]
  wire [1:0] _T_693; // @[Lookup.scala 11:37:@1556.4]
  wire [1:0] _T_694; // @[Lookup.scala 11:37:@1557.4]
  wire [1:0] _T_695; // @[Lookup.scala 11:37:@1558.4]
  wire [1:0] _T_696; // @[Lookup.scala 11:37:@1559.4]
  wire [1:0] _T_697; // @[Lookup.scala 11:37:@1560.4]
  wire [1:0] _T_698; // @[Lookup.scala 11:37:@1561.4]
  wire [1:0] _T_699; // @[Lookup.scala 11:37:@1562.4]
  wire [1:0] _T_700; // @[Lookup.scala 11:37:@1563.4]
  wire [1:0] _T_701; // @[Lookup.scala 11:37:@1564.4]
  wire [1:0] _T_702; // @[Lookup.scala 11:37:@1565.4]
  wire [1:0] _T_703; // @[Lookup.scala 11:37:@1566.4]
  wire [1:0] _T_704; // @[Lookup.scala 11:37:@1567.4]
  wire [1:0] _T_705; // @[Lookup.scala 11:37:@1568.4]
  wire [1:0] _T_706; // @[Lookup.scala 11:37:@1569.4]
  wire [1:0] _T_707; // @[Lookup.scala 11:37:@1570.4]
  wire [1:0] _T_708; // @[Lookup.scala 11:37:@1571.4]
  wire [1:0] _T_709; // @[Lookup.scala 11:37:@1572.4]
  wire [1:0] _T_710; // @[Lookup.scala 11:37:@1573.4]
  wire [1:0] _T_711; // @[Lookup.scala 11:37:@1574.4]
  wire [1:0] _T_712; // @[Lookup.scala 11:37:@1575.4]
  wire  _T_718; // @[Lookup.scala 11:37:@1582.4]
  wire  _T_719; // @[Lookup.scala 11:37:@1583.4]
  wire  _T_720; // @[Lookup.scala 11:37:@1584.4]
  wire  _T_721; // @[Lookup.scala 11:37:@1585.4]
  wire  _T_722; // @[Lookup.scala 11:37:@1586.4]
  wire  _T_723; // @[Lookup.scala 11:37:@1587.4]
  wire  _T_724; // @[Lookup.scala 11:37:@1588.4]
  wire  _T_725; // @[Lookup.scala 11:37:@1589.4]
  wire  _T_726; // @[Lookup.scala 11:37:@1590.4]
  wire  _T_727; // @[Lookup.scala 11:37:@1591.4]
  wire  _T_728; // @[Lookup.scala 11:37:@1592.4]
  wire  _T_729; // @[Lookup.scala 11:37:@1593.4]
  wire  _T_730; // @[Lookup.scala 11:37:@1594.4]
  wire  _T_731; // @[Lookup.scala 11:37:@1595.4]
  wire  _T_732; // @[Lookup.scala 11:37:@1596.4]
  wire  _T_733; // @[Lookup.scala 11:37:@1597.4]
  wire  _T_734; // @[Lookup.scala 11:37:@1598.4]
  wire  _T_735; // @[Lookup.scala 11:37:@1599.4]
  wire  _T_736; // @[Lookup.scala 11:37:@1600.4]
  wire  _T_737; // @[Lookup.scala 11:37:@1601.4]
  wire  _T_738; // @[Lookup.scala 11:37:@1602.4]
  wire  _T_739; // @[Lookup.scala 11:37:@1603.4]
  wire  _T_740; // @[Lookup.scala 11:37:@1604.4]
  wire  _T_741; // @[Lookup.scala 11:37:@1605.4]
  wire  _T_742; // @[Lookup.scala 11:37:@1606.4]
  wire  _T_743; // @[Lookup.scala 11:37:@1607.4]
  wire  _T_744; // @[Lookup.scala 11:37:@1608.4]
  wire  _T_745; // @[Lookup.scala 11:37:@1609.4]
  wire  _T_746; // @[Lookup.scala 11:37:@1610.4]
  wire  _T_747; // @[Lookup.scala 11:37:@1611.4]
  wire  _T_748; // @[Lookup.scala 11:37:@1612.4]
  wire  _T_749; // @[Lookup.scala 11:37:@1613.4]
  wire  _T_750; // @[Lookup.scala 11:37:@1614.4]
  wire  _T_751; // @[Lookup.scala 11:37:@1615.4]
  wire  _T_752; // @[Lookup.scala 11:37:@1616.4]
  wire  _T_753; // @[Lookup.scala 11:37:@1617.4]
  wire  _T_754; // @[Lookup.scala 11:37:@1618.4]
  wire  _T_755; // @[Lookup.scala 11:37:@1619.4]
  wire  _T_756; // @[Lookup.scala 11:37:@1620.4]
  wire  _T_757; // @[Lookup.scala 11:37:@1621.4]
  wire  _T_758; // @[Lookup.scala 11:37:@1622.4]
  wire  _T_759; // @[Lookup.scala 11:37:@1623.4]
  wire  _T_760; // @[Lookup.scala 11:37:@1624.4]
  wire [2:0] _T_762; // @[Lookup.scala 11:37:@1627.4]
  wire [2:0] _T_763; // @[Lookup.scala 11:37:@1628.4]
  wire [2:0] _T_764; // @[Lookup.scala 11:37:@1629.4]
  wire [2:0] _T_765; // @[Lookup.scala 11:37:@1630.4]
  wire [2:0] _T_766; // @[Lookup.scala 11:37:@1631.4]
  wire [2:0] _T_767; // @[Lookup.scala 11:37:@1632.4]
  wire [2:0] _T_768; // @[Lookup.scala 11:37:@1633.4]
  wire [2:0] _T_769; // @[Lookup.scala 11:37:@1634.4]
  wire [2:0] _T_770; // @[Lookup.scala 11:37:@1635.4]
  wire [2:0] _T_771; // @[Lookup.scala 11:37:@1636.4]
  wire [2:0] _T_772; // @[Lookup.scala 11:37:@1637.4]
  wire [2:0] _T_773; // @[Lookup.scala 11:37:@1638.4]
  wire [2:0] _T_774; // @[Lookup.scala 11:37:@1639.4]
  wire [2:0] _T_775; // @[Lookup.scala 11:37:@1640.4]
  wire [2:0] _T_776; // @[Lookup.scala 11:37:@1641.4]
  wire [2:0] _T_777; // @[Lookup.scala 11:37:@1642.4]
  wire [2:0] _T_778; // @[Lookup.scala 11:37:@1643.4]
  wire [2:0] _T_779; // @[Lookup.scala 11:37:@1644.4]
  wire [2:0] _T_780; // @[Lookup.scala 11:37:@1645.4]
  wire [2:0] _T_781; // @[Lookup.scala 11:37:@1646.4]
  wire [2:0] _T_782; // @[Lookup.scala 11:37:@1647.4]
  wire [2:0] _T_783; // @[Lookup.scala 11:37:@1648.4]
  wire [2:0] _T_784; // @[Lookup.scala 11:37:@1649.4]
  wire [2:0] _T_785; // @[Lookup.scala 11:37:@1650.4]
  wire [2:0] _T_786; // @[Lookup.scala 11:37:@1651.4]
  wire [2:0] _T_787; // @[Lookup.scala 11:37:@1652.4]
  wire [2:0] _T_788; // @[Lookup.scala 11:37:@1653.4]
  wire [2:0] _T_789; // @[Lookup.scala 11:37:@1654.4]
  wire [2:0] _T_790; // @[Lookup.scala 11:37:@1655.4]
  wire [2:0] _T_791; // @[Lookup.scala 11:37:@1656.4]
  wire [2:0] _T_792; // @[Lookup.scala 11:37:@1657.4]
  wire [2:0] _T_793; // @[Lookup.scala 11:37:@1658.4]
  wire [2:0] _T_794; // @[Lookup.scala 11:37:@1659.4]
  wire [2:0] _T_795; // @[Lookup.scala 11:37:@1660.4]
  wire [2:0] _T_796; // @[Lookup.scala 11:37:@1661.4]
  wire [2:0] _T_797; // @[Lookup.scala 11:37:@1662.4]
  wire [2:0] _T_798; // @[Lookup.scala 11:37:@1663.4]
  wire [2:0] _T_799; // @[Lookup.scala 11:37:@1664.4]
  wire [2:0] _T_800; // @[Lookup.scala 11:37:@1665.4]
  wire [2:0] _T_801; // @[Lookup.scala 11:37:@1666.4]
  wire [2:0] _T_802; // @[Lookup.scala 11:37:@1667.4]
  wire [2:0] _T_803; // @[Lookup.scala 11:37:@1668.4]
  wire [2:0] _T_804; // @[Lookup.scala 11:37:@1669.4]
  wire [2:0] _T_805; // @[Lookup.scala 11:37:@1670.4]
  wire [2:0] _T_806; // @[Lookup.scala 11:37:@1671.4]
  wire [2:0] _T_807; // @[Lookup.scala 11:37:@1672.4]
  wire [2:0] _T_808; // @[Lookup.scala 11:37:@1673.4]
  wire  _T_809; // @[Lookup.scala 11:37:@1675.4]
  wire  _T_810; // @[Lookup.scala 11:37:@1676.4]
  wire  _T_811; // @[Lookup.scala 11:37:@1677.4]
  wire  _T_812; // @[Lookup.scala 11:37:@1678.4]
  wire  _T_813; // @[Lookup.scala 11:37:@1679.4]
  wire  _T_814; // @[Lookup.scala 11:37:@1680.4]
  wire  _T_815; // @[Lookup.scala 11:37:@1681.4]
  wire  _T_816; // @[Lookup.scala 11:37:@1682.4]
  wire  _T_817; // @[Lookup.scala 11:37:@1683.4]
  wire  _T_818; // @[Lookup.scala 11:37:@1684.4]
  wire  _T_819; // @[Lookup.scala 11:37:@1685.4]
  wire  _T_820; // @[Lookup.scala 11:37:@1686.4]
  wire  _T_821; // @[Lookup.scala 11:37:@1687.4]
  wire  _T_822; // @[Lookup.scala 11:37:@1688.4]
  wire  _T_823; // @[Lookup.scala 11:37:@1689.4]
  wire  _T_824; // @[Lookup.scala 11:37:@1690.4]
  wire  _T_825; // @[Lookup.scala 11:37:@1691.4]
  wire  _T_826; // @[Lookup.scala 11:37:@1692.4]
  wire  _T_827; // @[Lookup.scala 11:37:@1693.4]
  wire  _T_828; // @[Lookup.scala 11:37:@1694.4]
  wire  _T_829; // @[Lookup.scala 11:37:@1695.4]
  wire  _T_830; // @[Lookup.scala 11:37:@1696.4]
  wire  _T_831; // @[Lookup.scala 11:37:@1697.4]
  wire  _T_832; // @[Lookup.scala 11:37:@1698.4]
  wire  _T_833; // @[Lookup.scala 11:37:@1699.4]
  wire  _T_834; // @[Lookup.scala 11:37:@1700.4]
  wire  _T_835; // @[Lookup.scala 11:37:@1701.4]
  wire  _T_836; // @[Lookup.scala 11:37:@1702.4]
  wire  _T_837; // @[Lookup.scala 11:37:@1703.4]
  wire  _T_838; // @[Lookup.scala 11:37:@1704.4]
  wire  _T_839; // @[Lookup.scala 11:37:@1705.4]
  wire  _T_840; // @[Lookup.scala 11:37:@1706.4]
  wire  _T_841; // @[Lookup.scala 11:37:@1707.4]
  wire  _T_842; // @[Lookup.scala 11:37:@1708.4]
  wire  _T_843; // @[Lookup.scala 11:37:@1709.4]
  wire  _T_844; // @[Lookup.scala 11:37:@1710.4]
  wire  _T_845; // @[Lookup.scala 11:37:@1711.4]
  wire  _T_846; // @[Lookup.scala 11:37:@1712.4]
  wire  _T_847; // @[Lookup.scala 11:37:@1713.4]
  wire  _T_848; // @[Lookup.scala 11:37:@1714.4]
  wire  _T_849; // @[Lookup.scala 11:37:@1715.4]
  wire  _T_850; // @[Lookup.scala 11:37:@1716.4]
  wire  _T_851; // @[Lookup.scala 11:37:@1717.4]
  wire  _T_852; // @[Lookup.scala 11:37:@1718.4]
  wire  _T_853; // @[Lookup.scala 11:37:@1719.4]
  wire  _T_854; // @[Lookup.scala 11:37:@1720.4]
  wire  _T_855; // @[Lookup.scala 11:37:@1721.4]
  wire  _T_856; // @[Lookup.scala 11:37:@1722.4]
  wire  _T_896; // @[Lookup.scala 11:37:@1763.4]
  wire  _T_897; // @[Lookup.scala 11:37:@1764.4]
  wire  _T_898; // @[Lookup.scala 11:37:@1765.4]
  wire  _T_899; // @[Lookup.scala 11:37:@1766.4]
  wire  _T_900; // @[Lookup.scala 11:37:@1767.4]
  wire  _T_901; // @[Lookup.scala 11:37:@1768.4]
  wire  _T_902; // @[Lookup.scala 11:37:@1769.4]
  wire  _T_903; // @[Lookup.scala 11:37:@1770.4]
  wire  _T_904; // @[Lookup.scala 11:37:@1771.4]
  wire  _T_936; // @[Lookup.scala 11:37:@1804.4]
  wire  _T_937; // @[Lookup.scala 11:37:@1805.4]
  wire  _T_938; // @[Lookup.scala 11:37:@1806.4]
  wire  _T_939; // @[Lookup.scala 11:37:@1807.4]
  wire  _T_940; // @[Lookup.scala 11:37:@1808.4]
  wire  _T_941; // @[Lookup.scala 11:37:@1809.4]
  wire  _T_942; // @[Lookup.scala 11:37:@1810.4]
  wire  _T_943; // @[Lookup.scala 11:37:@1811.4]
  wire  _T_944; // @[Lookup.scala 11:37:@1812.4]
  wire  _T_945; // @[Lookup.scala 11:37:@1813.4]
  wire  _T_946; // @[Lookup.scala 11:37:@1814.4]
  wire  _T_947; // @[Lookup.scala 11:37:@1815.4]
  wire  _T_948; // @[Lookup.scala 11:37:@1816.4]
  wire  _T_949; // @[Lookup.scala 11:37:@1817.4]
  wire  _T_950; // @[Lookup.scala 11:37:@1818.4]
  wire  _T_951; // @[Lookup.scala 11:37:@1819.4]
  wire  _T_952; // @[Lookup.scala 11:37:@1820.4]
  assign _T_39 = io_inst & 32'h7f; // @[Lookup.scala 9:38:@989.4]
  assign _T_40 = 32'h37 == _T_39; // @[Lookup.scala 9:38:@990.4]
  assign _T_44 = 32'h17 == _T_39; // @[Lookup.scala 9:38:@992.4]
  assign _T_48 = 32'h6f == _T_39; // @[Lookup.scala 9:38:@994.4]
  assign _T_51 = io_inst & 32'h707f; // @[Lookup.scala 9:38:@995.4]
  assign _T_52 = 32'h67 == _T_51; // @[Lookup.scala 9:38:@996.4]
  assign _T_56 = 32'h63 == _T_51; // @[Lookup.scala 9:38:@998.4]
  assign _T_60 = 32'h1063 == _T_51; // @[Lookup.scala 9:38:@1000.4]
  assign _T_64 = 32'h4063 == _T_51; // @[Lookup.scala 9:38:@1002.4]
  assign _T_68 = 32'h5063 == _T_51; // @[Lookup.scala 9:38:@1004.4]
  assign _T_72 = 32'h6063 == _T_51; // @[Lookup.scala 9:38:@1006.4]
  assign _T_76 = 32'h7063 == _T_51; // @[Lookup.scala 9:38:@1008.4]
  assign _T_80 = 32'h3 == _T_51; // @[Lookup.scala 9:38:@1010.4]
  assign _T_84 = 32'h1003 == _T_51; // @[Lookup.scala 9:38:@1012.4]
  assign _T_88 = 32'h2003 == _T_51; // @[Lookup.scala 9:38:@1014.4]
  assign _T_92 = 32'h4003 == _T_51; // @[Lookup.scala 9:38:@1016.4]
  assign _T_96 = 32'h5003 == _T_51; // @[Lookup.scala 9:38:@1018.4]
  assign _T_100 = 32'h23 == _T_51; // @[Lookup.scala 9:38:@1020.4]
  assign _T_104 = 32'h1023 == _T_51; // @[Lookup.scala 9:38:@1022.4]
  assign _T_108 = 32'h2023 == _T_51; // @[Lookup.scala 9:38:@1024.4]
  assign _T_112 = 32'h13 == _T_51; // @[Lookup.scala 9:38:@1026.4]
  assign _T_116 = 32'h2013 == _T_51; // @[Lookup.scala 9:38:@1028.4]
  assign _T_120 = 32'h3013 == _T_51; // @[Lookup.scala 9:38:@1030.4]
  assign _T_124 = 32'h4013 == _T_51; // @[Lookup.scala 9:38:@1032.4]
  assign _T_128 = 32'h6013 == _T_51; // @[Lookup.scala 9:38:@1034.4]
  assign _T_132 = 32'h7013 == _T_51; // @[Lookup.scala 9:38:@1036.4]
  assign _T_135 = io_inst & 32'hfe00707f; // @[Lookup.scala 9:38:@1037.4]
  assign _T_136 = 32'h1013 == _T_135; // @[Lookup.scala 9:38:@1038.4]
  assign _T_140 = 32'h5013 == _T_135; // @[Lookup.scala 9:38:@1040.4]
  assign _T_144 = 32'h40005013 == _T_135; // @[Lookup.scala 9:38:@1042.4]
  assign _T_148 = 32'h33 == _T_135; // @[Lookup.scala 9:38:@1044.4]
  assign _T_152 = 32'h40000033 == _T_135; // @[Lookup.scala 9:38:@1046.4]
  assign _T_156 = 32'h1033 == _T_135; // @[Lookup.scala 9:38:@1048.4]
  assign _T_160 = 32'h2033 == _T_135; // @[Lookup.scala 9:38:@1050.4]
  assign _T_164 = 32'h3033 == _T_135; // @[Lookup.scala 9:38:@1052.4]
  assign _T_168 = 32'h4033 == _T_135; // @[Lookup.scala 9:38:@1054.4]
  assign _T_172 = 32'h5033 == _T_135; // @[Lookup.scala 9:38:@1056.4]
  assign _T_176 = 32'h40005033 == _T_135; // @[Lookup.scala 9:38:@1058.4]
  assign _T_180 = 32'h6033 == _T_135; // @[Lookup.scala 9:38:@1060.4]
  assign _T_184 = 32'h7033 == _T_135; // @[Lookup.scala 9:38:@1062.4]
  assign _T_187 = io_inst & 32'hf00fffff; // @[Lookup.scala 9:38:@1063.4]
  assign _T_188 = 32'hf == _T_187; // @[Lookup.scala 9:38:@1064.4]
  assign _T_192 = 32'h100f == io_inst; // @[Lookup.scala 9:38:@1066.4]
  assign _T_196 = 32'h1073 == _T_51; // @[Lookup.scala 9:38:@1068.4]
  assign _T_200 = 32'h2073 == _T_51; // @[Lookup.scala 9:38:@1070.4]
  assign _T_204 = 32'h3073 == _T_51; // @[Lookup.scala 9:38:@1072.4]
  assign _T_208 = 32'h5073 == _T_51; // @[Lookup.scala 9:38:@1074.4]
  assign _T_212 = 32'h6073 == _T_51; // @[Lookup.scala 9:38:@1076.4]
  assign _T_216 = 32'h7073 == _T_51; // @[Lookup.scala 9:38:@1078.4]
  assign _T_220 = 32'h73 == io_inst; // @[Lookup.scala 9:38:@1080.4]
  assign _T_224 = 32'h100073 == io_inst; // @[Lookup.scala 9:38:@1082.4]
  assign _T_228 = 32'h30200073 == io_inst; // @[Lookup.scala 9:38:@1084.4]
  assign _T_232 = 32'h10500073 == io_inst; // @[Lookup.scala 9:38:@1086.4]
  assign _T_234 = _T_228 ? 2'h3 : 2'h0; // @[Lookup.scala 11:37:@1088.4]
  assign _T_235 = _T_224 ? 2'h0 : _T_234; // @[Lookup.scala 11:37:@1089.4]
  assign _T_236 = _T_220 ? 2'h0 : _T_235; // @[Lookup.scala 11:37:@1090.4]
  assign _T_237 = _T_216 ? 2'h0 : _T_236; // @[Lookup.scala 11:37:@1091.4]
  assign _T_238 = _T_212 ? 2'h0 : _T_237; // @[Lookup.scala 11:37:@1092.4]
  assign _T_239 = _T_208 ? 2'h0 : _T_238; // @[Lookup.scala 11:37:@1093.4]
  assign _T_240 = _T_204 ? 2'h0 : _T_239; // @[Lookup.scala 11:37:@1094.4]
  assign _T_241 = _T_200 ? 2'h0 : _T_240; // @[Lookup.scala 11:37:@1095.4]
  assign _T_242 = _T_196 ? 2'h0 : _T_241; // @[Lookup.scala 11:37:@1096.4]
  assign _T_243 = _T_192 ? 2'h2 : _T_242; // @[Lookup.scala 11:37:@1097.4]
  assign _T_244 = _T_188 ? 2'h0 : _T_243; // @[Lookup.scala 11:37:@1098.4]
  assign _T_245 = _T_184 ? 2'h0 : _T_244; // @[Lookup.scala 11:37:@1099.4]
  assign _T_246 = _T_180 ? 2'h0 : _T_245; // @[Lookup.scala 11:37:@1100.4]
  assign _T_247 = _T_176 ? 2'h0 : _T_246; // @[Lookup.scala 11:37:@1101.4]
  assign _T_248 = _T_172 ? 2'h0 : _T_247; // @[Lookup.scala 11:37:@1102.4]
  assign _T_249 = _T_168 ? 2'h0 : _T_248; // @[Lookup.scala 11:37:@1103.4]
  assign _T_250 = _T_164 ? 2'h0 : _T_249; // @[Lookup.scala 11:37:@1104.4]
  assign _T_251 = _T_160 ? 2'h0 : _T_250; // @[Lookup.scala 11:37:@1105.4]
  assign _T_252 = _T_156 ? 2'h0 : _T_251; // @[Lookup.scala 11:37:@1106.4]
  assign _T_253 = _T_152 ? 2'h0 : _T_252; // @[Lookup.scala 11:37:@1107.4]
  assign _T_254 = _T_148 ? 2'h0 : _T_253; // @[Lookup.scala 11:37:@1108.4]
  assign _T_255 = _T_144 ? 2'h0 : _T_254; // @[Lookup.scala 11:37:@1109.4]
  assign _T_256 = _T_140 ? 2'h0 : _T_255; // @[Lookup.scala 11:37:@1110.4]
  assign _T_257 = _T_136 ? 2'h0 : _T_256; // @[Lookup.scala 11:37:@1111.4]
  assign _T_258 = _T_132 ? 2'h0 : _T_257; // @[Lookup.scala 11:37:@1112.4]
  assign _T_259 = _T_128 ? 2'h0 : _T_258; // @[Lookup.scala 11:37:@1113.4]
  assign _T_260 = _T_124 ? 2'h0 : _T_259; // @[Lookup.scala 11:37:@1114.4]
  assign _T_261 = _T_120 ? 2'h0 : _T_260; // @[Lookup.scala 11:37:@1115.4]
  assign _T_262 = _T_116 ? 2'h0 : _T_261; // @[Lookup.scala 11:37:@1116.4]
  assign _T_263 = _T_112 ? 2'h0 : _T_262; // @[Lookup.scala 11:37:@1117.4]
  assign _T_264 = _T_108 ? 2'h0 : _T_263; // @[Lookup.scala 11:37:@1118.4]
  assign _T_265 = _T_104 ? 2'h0 : _T_264; // @[Lookup.scala 11:37:@1119.4]
  assign _T_266 = _T_100 ? 2'h0 : _T_265; // @[Lookup.scala 11:37:@1120.4]
  assign _T_267 = _T_96 ? 2'h0 : _T_266; // @[Lookup.scala 11:37:@1121.4]
  assign _T_268 = _T_92 ? 2'h0 : _T_267; // @[Lookup.scala 11:37:@1122.4]
  assign _T_269 = _T_88 ? 2'h0 : _T_268; // @[Lookup.scala 11:37:@1123.4]
  assign _T_270 = _T_84 ? 2'h0 : _T_269; // @[Lookup.scala 11:37:@1124.4]
  assign _T_271 = _T_80 ? 2'h0 : _T_270; // @[Lookup.scala 11:37:@1125.4]
  assign _T_272 = _T_76 ? 2'h0 : _T_271; // @[Lookup.scala 11:37:@1126.4]
  assign _T_273 = _T_72 ? 2'h0 : _T_272; // @[Lookup.scala 11:37:@1127.4]
  assign _T_274 = _T_68 ? 2'h0 : _T_273; // @[Lookup.scala 11:37:@1128.4]
  assign _T_275 = _T_64 ? 2'h0 : _T_274; // @[Lookup.scala 11:37:@1129.4]
  assign _T_276 = _T_60 ? 2'h0 : _T_275; // @[Lookup.scala 11:37:@1130.4]
  assign _T_277 = _T_56 ? 2'h0 : _T_276; // @[Lookup.scala 11:37:@1131.4]
  assign _T_278 = _T_52 ? 2'h1 : _T_277; // @[Lookup.scala 11:37:@1132.4]
  assign _T_279 = _T_48 ? 2'h1 : _T_278; // @[Lookup.scala 11:37:@1133.4]
  assign _T_280 = _T_44 ? 2'h0 : _T_279; // @[Lookup.scala 11:37:@1134.4]
  assign _T_289 = _T_200 ? 1'h1 : _T_204; // @[Lookup.scala 11:37:@1144.4]
  assign _T_290 = _T_196 ? 1'h1 : _T_289; // @[Lookup.scala 11:37:@1145.4]
  assign _T_291 = _T_192 ? 1'h0 : _T_290; // @[Lookup.scala 11:37:@1146.4]
  assign _T_292 = _T_188 ? 1'h0 : _T_291; // @[Lookup.scala 11:37:@1147.4]
  assign _T_293 = _T_184 ? 1'h1 : _T_292; // @[Lookup.scala 11:37:@1148.4]
  assign _T_294 = _T_180 ? 1'h1 : _T_293; // @[Lookup.scala 11:37:@1149.4]
  assign _T_295 = _T_176 ? 1'h1 : _T_294; // @[Lookup.scala 11:37:@1150.4]
  assign _T_296 = _T_172 ? 1'h1 : _T_295; // @[Lookup.scala 11:37:@1151.4]
  assign _T_297 = _T_168 ? 1'h1 : _T_296; // @[Lookup.scala 11:37:@1152.4]
  assign _T_298 = _T_164 ? 1'h1 : _T_297; // @[Lookup.scala 11:37:@1153.4]
  assign _T_299 = _T_160 ? 1'h1 : _T_298; // @[Lookup.scala 11:37:@1154.4]
  assign _T_300 = _T_156 ? 1'h1 : _T_299; // @[Lookup.scala 11:37:@1155.4]
  assign _T_301 = _T_152 ? 1'h1 : _T_300; // @[Lookup.scala 11:37:@1156.4]
  assign _T_302 = _T_148 ? 1'h1 : _T_301; // @[Lookup.scala 11:37:@1157.4]
  assign _T_303 = _T_144 ? 1'h1 : _T_302; // @[Lookup.scala 11:37:@1158.4]
  assign _T_304 = _T_140 ? 1'h1 : _T_303; // @[Lookup.scala 11:37:@1159.4]
  assign _T_305 = _T_136 ? 1'h1 : _T_304; // @[Lookup.scala 11:37:@1160.4]
  assign _T_306 = _T_132 ? 1'h1 : _T_305; // @[Lookup.scala 11:37:@1161.4]
  assign _T_307 = _T_128 ? 1'h1 : _T_306; // @[Lookup.scala 11:37:@1162.4]
  assign _T_308 = _T_124 ? 1'h1 : _T_307; // @[Lookup.scala 11:37:@1163.4]
  assign _T_309 = _T_120 ? 1'h1 : _T_308; // @[Lookup.scala 11:37:@1164.4]
  assign _T_310 = _T_116 ? 1'h1 : _T_309; // @[Lookup.scala 11:37:@1165.4]
  assign _T_311 = _T_112 ? 1'h1 : _T_310; // @[Lookup.scala 11:37:@1166.4]
  assign _T_312 = _T_108 ? 1'h1 : _T_311; // @[Lookup.scala 11:37:@1167.4]
  assign _T_313 = _T_104 ? 1'h1 : _T_312; // @[Lookup.scala 11:37:@1168.4]
  assign _T_314 = _T_100 ? 1'h1 : _T_313; // @[Lookup.scala 11:37:@1169.4]
  assign _T_315 = _T_96 ? 1'h1 : _T_314; // @[Lookup.scala 11:37:@1170.4]
  assign _T_316 = _T_92 ? 1'h1 : _T_315; // @[Lookup.scala 11:37:@1171.4]
  assign _T_317 = _T_88 ? 1'h1 : _T_316; // @[Lookup.scala 11:37:@1172.4]
  assign _T_318 = _T_84 ? 1'h1 : _T_317; // @[Lookup.scala 11:37:@1173.4]
  assign _T_319 = _T_80 ? 1'h1 : _T_318; // @[Lookup.scala 11:37:@1174.4]
  assign _T_320 = _T_76 ? 1'h0 : _T_319; // @[Lookup.scala 11:37:@1175.4]
  assign _T_321 = _T_72 ? 1'h0 : _T_320; // @[Lookup.scala 11:37:@1176.4]
  assign _T_322 = _T_68 ? 1'h0 : _T_321; // @[Lookup.scala 11:37:@1177.4]
  assign _T_323 = _T_64 ? 1'h0 : _T_322; // @[Lookup.scala 11:37:@1178.4]
  assign _T_324 = _T_60 ? 1'h0 : _T_323; // @[Lookup.scala 11:37:@1179.4]
  assign _T_325 = _T_56 ? 1'h0 : _T_324; // @[Lookup.scala 11:37:@1180.4]
  assign _T_326 = _T_52 ? 1'h1 : _T_325; // @[Lookup.scala 11:37:@1181.4]
  assign _T_327 = _T_48 ? 1'h0 : _T_326; // @[Lookup.scala 11:37:@1182.4]
  assign _T_328 = _T_44 ? 1'h0 : _T_327; // @[Lookup.scala 11:37:@1183.4]
  assign _T_342 = _T_180 ? 1'h1 : _T_184; // @[Lookup.scala 11:37:@1198.4]
  assign _T_343 = _T_176 ? 1'h1 : _T_342; // @[Lookup.scala 11:37:@1199.4]
  assign _T_344 = _T_172 ? 1'h1 : _T_343; // @[Lookup.scala 11:37:@1200.4]
  assign _T_345 = _T_168 ? 1'h1 : _T_344; // @[Lookup.scala 11:37:@1201.4]
  assign _T_346 = _T_164 ? 1'h1 : _T_345; // @[Lookup.scala 11:37:@1202.4]
  assign _T_347 = _T_160 ? 1'h1 : _T_346; // @[Lookup.scala 11:37:@1203.4]
  assign _T_348 = _T_156 ? 1'h1 : _T_347; // @[Lookup.scala 11:37:@1204.4]
  assign _T_349 = _T_152 ? 1'h1 : _T_348; // @[Lookup.scala 11:37:@1205.4]
  assign _T_350 = _T_148 ? 1'h1 : _T_349; // @[Lookup.scala 11:37:@1206.4]
  assign _T_351 = _T_144 ? 1'h0 : _T_350; // @[Lookup.scala 11:37:@1207.4]
  assign _T_352 = _T_140 ? 1'h0 : _T_351; // @[Lookup.scala 11:37:@1208.4]
  assign _T_353 = _T_136 ? 1'h0 : _T_352; // @[Lookup.scala 11:37:@1209.4]
  assign _T_354 = _T_132 ? 1'h0 : _T_353; // @[Lookup.scala 11:37:@1210.4]
  assign _T_355 = _T_128 ? 1'h0 : _T_354; // @[Lookup.scala 11:37:@1211.4]
  assign _T_356 = _T_124 ? 1'h0 : _T_355; // @[Lookup.scala 11:37:@1212.4]
  assign _T_357 = _T_120 ? 1'h0 : _T_356; // @[Lookup.scala 11:37:@1213.4]
  assign _T_358 = _T_116 ? 1'h0 : _T_357; // @[Lookup.scala 11:37:@1214.4]
  assign _T_359 = _T_112 ? 1'h0 : _T_358; // @[Lookup.scala 11:37:@1215.4]
  assign _T_360 = _T_108 ? 1'h0 : _T_359; // @[Lookup.scala 11:37:@1216.4]
  assign _T_361 = _T_104 ? 1'h0 : _T_360; // @[Lookup.scala 11:37:@1217.4]
  assign _T_362 = _T_100 ? 1'h0 : _T_361; // @[Lookup.scala 11:37:@1218.4]
  assign _T_363 = _T_96 ? 1'h0 : _T_362; // @[Lookup.scala 11:37:@1219.4]
  assign _T_364 = _T_92 ? 1'h0 : _T_363; // @[Lookup.scala 11:37:@1220.4]
  assign _T_365 = _T_88 ? 1'h0 : _T_364; // @[Lookup.scala 11:37:@1221.4]
  assign _T_366 = _T_84 ? 1'h0 : _T_365; // @[Lookup.scala 11:37:@1222.4]
  assign _T_367 = _T_80 ? 1'h0 : _T_366; // @[Lookup.scala 11:37:@1223.4]
  assign _T_368 = _T_76 ? 1'h0 : _T_367; // @[Lookup.scala 11:37:@1224.4]
  assign _T_369 = _T_72 ? 1'h0 : _T_368; // @[Lookup.scala 11:37:@1225.4]
  assign _T_370 = _T_68 ? 1'h0 : _T_369; // @[Lookup.scala 11:37:@1226.4]
  assign _T_371 = _T_64 ? 1'h0 : _T_370; // @[Lookup.scala 11:37:@1227.4]
  assign _T_372 = _T_60 ? 1'h0 : _T_371; // @[Lookup.scala 11:37:@1228.4]
  assign _T_373 = _T_56 ? 1'h0 : _T_372; // @[Lookup.scala 11:37:@1229.4]
  assign _T_374 = _T_52 ? 1'h0 : _T_373; // @[Lookup.scala 11:37:@1230.4]
  assign _T_375 = _T_48 ? 1'h0 : _T_374; // @[Lookup.scala 11:37:@1231.4]
  assign _T_376 = _T_44 ? 1'h0 : _T_375; // @[Lookup.scala 11:37:@1232.4]
  assign _T_381 = _T_216 ? 3'h6 : 3'h0; // @[Lookup.scala 11:37:@1238.4]
  assign _T_382 = _T_212 ? 3'h6 : _T_381; // @[Lookup.scala 11:37:@1239.4]
  assign _T_383 = _T_208 ? 3'h6 : _T_382; // @[Lookup.scala 11:37:@1240.4]
  assign _T_384 = _T_204 ? 3'h0 : _T_383; // @[Lookup.scala 11:37:@1241.4]
  assign _T_385 = _T_200 ? 3'h0 : _T_384; // @[Lookup.scala 11:37:@1242.4]
  assign _T_386 = _T_196 ? 3'h0 : _T_385; // @[Lookup.scala 11:37:@1243.4]
  assign _T_387 = _T_192 ? 3'h0 : _T_386; // @[Lookup.scala 11:37:@1244.4]
  assign _T_388 = _T_188 ? 3'h0 : _T_387; // @[Lookup.scala 11:37:@1245.4]
  assign _T_389 = _T_184 ? 3'h0 : _T_388; // @[Lookup.scala 11:37:@1246.4]
  assign _T_390 = _T_180 ? 3'h0 : _T_389; // @[Lookup.scala 11:37:@1247.4]
  assign _T_391 = _T_176 ? 3'h0 : _T_390; // @[Lookup.scala 11:37:@1248.4]
  assign _T_392 = _T_172 ? 3'h0 : _T_391; // @[Lookup.scala 11:37:@1249.4]
  assign _T_393 = _T_168 ? 3'h0 : _T_392; // @[Lookup.scala 11:37:@1250.4]
  assign _T_394 = _T_164 ? 3'h0 : _T_393; // @[Lookup.scala 11:37:@1251.4]
  assign _T_395 = _T_160 ? 3'h0 : _T_394; // @[Lookup.scala 11:37:@1252.4]
  assign _T_396 = _T_156 ? 3'h0 : _T_395; // @[Lookup.scala 11:37:@1253.4]
  assign _T_397 = _T_152 ? 3'h0 : _T_396; // @[Lookup.scala 11:37:@1254.4]
  assign _T_398 = _T_148 ? 3'h0 : _T_397; // @[Lookup.scala 11:37:@1255.4]
  assign _T_399 = _T_144 ? 3'h1 : _T_398; // @[Lookup.scala 11:37:@1256.4]
  assign _T_400 = _T_140 ? 3'h1 : _T_399; // @[Lookup.scala 11:37:@1257.4]
  assign _T_401 = _T_136 ? 3'h1 : _T_400; // @[Lookup.scala 11:37:@1258.4]
  assign _T_402 = _T_132 ? 3'h1 : _T_401; // @[Lookup.scala 11:37:@1259.4]
  assign _T_403 = _T_128 ? 3'h1 : _T_402; // @[Lookup.scala 11:37:@1260.4]
  assign _T_404 = _T_124 ? 3'h1 : _T_403; // @[Lookup.scala 11:37:@1261.4]
  assign _T_405 = _T_120 ? 3'h1 : _T_404; // @[Lookup.scala 11:37:@1262.4]
  assign _T_406 = _T_116 ? 3'h1 : _T_405; // @[Lookup.scala 11:37:@1263.4]
  assign _T_407 = _T_112 ? 3'h1 : _T_406; // @[Lookup.scala 11:37:@1264.4]
  assign _T_408 = _T_108 ? 3'h2 : _T_407; // @[Lookup.scala 11:37:@1265.4]
  assign _T_409 = _T_104 ? 3'h2 : _T_408; // @[Lookup.scala 11:37:@1266.4]
  assign _T_410 = _T_100 ? 3'h2 : _T_409; // @[Lookup.scala 11:37:@1267.4]
  assign _T_411 = _T_96 ? 3'h1 : _T_410; // @[Lookup.scala 11:37:@1268.4]
  assign _T_412 = _T_92 ? 3'h1 : _T_411; // @[Lookup.scala 11:37:@1269.4]
  assign _T_413 = _T_88 ? 3'h1 : _T_412; // @[Lookup.scala 11:37:@1270.4]
  assign _T_414 = _T_84 ? 3'h1 : _T_413; // @[Lookup.scala 11:37:@1271.4]
  assign _T_415 = _T_80 ? 3'h1 : _T_414; // @[Lookup.scala 11:37:@1272.4]
  assign _T_416 = _T_76 ? 3'h5 : _T_415; // @[Lookup.scala 11:37:@1273.4]
  assign _T_417 = _T_72 ? 3'h5 : _T_416; // @[Lookup.scala 11:37:@1274.4]
  assign _T_418 = _T_68 ? 3'h5 : _T_417; // @[Lookup.scala 11:37:@1275.4]
  assign _T_419 = _T_64 ? 3'h5 : _T_418; // @[Lookup.scala 11:37:@1276.4]
  assign _T_420 = _T_60 ? 3'h5 : _T_419; // @[Lookup.scala 11:37:@1277.4]
  assign _T_421 = _T_56 ? 3'h5 : _T_420; // @[Lookup.scala 11:37:@1278.4]
  assign _T_422 = _T_52 ? 3'h1 : _T_421; // @[Lookup.scala 11:37:@1279.4]
  assign _T_423 = _T_48 ? 3'h4 : _T_422; // @[Lookup.scala 11:37:@1280.4]
  assign _T_424 = _T_44 ? 3'h3 : _T_423; // @[Lookup.scala 11:37:@1281.4]
  assign _T_432 = _T_204 ? 4'ha : 4'hf; // @[Lookup.scala 11:37:@1290.4]
  assign _T_433 = _T_200 ? 4'ha : _T_432; // @[Lookup.scala 11:37:@1291.4]
  assign _T_434 = _T_196 ? 4'ha : _T_433; // @[Lookup.scala 11:37:@1292.4]
  assign _T_435 = _T_192 ? 4'hf : _T_434; // @[Lookup.scala 11:37:@1293.4]
  assign _T_436 = _T_188 ? 4'hf : _T_435; // @[Lookup.scala 11:37:@1294.4]
  assign _T_437 = _T_184 ? 4'h2 : _T_436; // @[Lookup.scala 11:37:@1295.4]
  assign _T_438 = _T_180 ? 4'h3 : _T_437; // @[Lookup.scala 11:37:@1296.4]
  assign _T_439 = _T_176 ? 4'h9 : _T_438; // @[Lookup.scala 11:37:@1297.4]
  assign _T_440 = _T_172 ? 4'h8 : _T_439; // @[Lookup.scala 11:37:@1298.4]
  assign _T_441 = _T_168 ? 4'h4 : _T_440; // @[Lookup.scala 11:37:@1299.4]
  assign _T_442 = _T_164 ? 4'h7 : _T_441; // @[Lookup.scala 11:37:@1300.4]
  assign _T_443 = _T_160 ? 4'h5 : _T_442; // @[Lookup.scala 11:37:@1301.4]
  assign _T_444 = _T_156 ? 4'h6 : _T_443; // @[Lookup.scala 11:37:@1302.4]
  assign _T_445 = _T_152 ? 4'h1 : _T_444; // @[Lookup.scala 11:37:@1303.4]
  assign _T_446 = _T_148 ? 4'h0 : _T_445; // @[Lookup.scala 11:37:@1304.4]
  assign _T_447 = _T_144 ? 4'h9 : _T_446; // @[Lookup.scala 11:37:@1305.4]
  assign _T_448 = _T_140 ? 4'h8 : _T_447; // @[Lookup.scala 11:37:@1306.4]
  assign _T_449 = _T_136 ? 4'h6 : _T_448; // @[Lookup.scala 11:37:@1307.4]
  assign _T_450 = _T_132 ? 4'h2 : _T_449; // @[Lookup.scala 11:37:@1308.4]
  assign _T_451 = _T_128 ? 4'h3 : _T_450; // @[Lookup.scala 11:37:@1309.4]
  assign _T_452 = _T_124 ? 4'h4 : _T_451; // @[Lookup.scala 11:37:@1310.4]
  assign _T_453 = _T_120 ? 4'h7 : _T_452; // @[Lookup.scala 11:37:@1311.4]
  assign _T_454 = _T_116 ? 4'h5 : _T_453; // @[Lookup.scala 11:37:@1312.4]
  assign _T_455 = _T_112 ? 4'h0 : _T_454; // @[Lookup.scala 11:37:@1313.4]
  assign _T_456 = _T_108 ? 4'h0 : _T_455; // @[Lookup.scala 11:37:@1314.4]
  assign _T_457 = _T_104 ? 4'h0 : _T_456; // @[Lookup.scala 11:37:@1315.4]
  assign _T_458 = _T_100 ? 4'h0 : _T_457; // @[Lookup.scala 11:37:@1316.4]
  assign _T_459 = _T_96 ? 4'h0 : _T_458; // @[Lookup.scala 11:37:@1317.4]
  assign _T_460 = _T_92 ? 4'h0 : _T_459; // @[Lookup.scala 11:37:@1318.4]
  assign _T_461 = _T_88 ? 4'h0 : _T_460; // @[Lookup.scala 11:37:@1319.4]
  assign _T_462 = _T_84 ? 4'h0 : _T_461; // @[Lookup.scala 11:37:@1320.4]
  assign _T_463 = _T_80 ? 4'h0 : _T_462; // @[Lookup.scala 11:37:@1321.4]
  assign _T_464 = _T_76 ? 4'h0 : _T_463; // @[Lookup.scala 11:37:@1322.4]
  assign _T_465 = _T_72 ? 4'h0 : _T_464; // @[Lookup.scala 11:37:@1323.4]
  assign _T_466 = _T_68 ? 4'h0 : _T_465; // @[Lookup.scala 11:37:@1324.4]
  assign _T_467 = _T_64 ? 4'h0 : _T_466; // @[Lookup.scala 11:37:@1325.4]
  assign _T_468 = _T_60 ? 4'h0 : _T_467; // @[Lookup.scala 11:37:@1326.4]
  assign _T_469 = _T_56 ? 4'h0 : _T_468; // @[Lookup.scala 11:37:@1327.4]
  assign _T_470 = _T_52 ? 4'h0 : _T_469; // @[Lookup.scala 11:37:@1328.4]
  assign _T_471 = _T_48 ? 4'h0 : _T_470; // @[Lookup.scala 11:37:@1329.4]
  assign _T_472 = _T_44 ? 4'h0 : _T_471; // @[Lookup.scala 11:37:@1330.4]
  assign ctrlSignals_4 = _T_40 ? 4'hb : _T_472; // @[Lookup.scala 11:37:@1331.4]
  assign _T_512 = _T_76 ? 3'h4 : 3'h0; // @[Lookup.scala 11:37:@1371.4]
  assign _T_513 = _T_72 ? 3'h1 : _T_512; // @[Lookup.scala 11:37:@1372.4]
  assign _T_514 = _T_68 ? 3'h5 : _T_513; // @[Lookup.scala 11:37:@1373.4]
  assign _T_515 = _T_64 ? 3'h2 : _T_514; // @[Lookup.scala 11:37:@1374.4]
  assign _T_516 = _T_60 ? 3'h6 : _T_515; // @[Lookup.scala 11:37:@1375.4]
  assign _T_517 = _T_56 ? 3'h3 : _T_516; // @[Lookup.scala 11:37:@1376.4]
  assign _T_518 = _T_52 ? 3'h0 : _T_517; // @[Lookup.scala 11:37:@1377.4]
  assign _T_519 = _T_48 ? 3'h0 : _T_518; // @[Lookup.scala 11:37:@1378.4]
  assign _T_520 = _T_44 ? 3'h0 : _T_519; // @[Lookup.scala 11:37:@1379.4]
  assign _T_523 = _T_224 ? 1'h0 : _T_228; // @[Lookup.scala 11:37:@1383.4]
  assign _T_524 = _T_220 ? 1'h0 : _T_523; // @[Lookup.scala 11:37:@1384.4]
  assign _T_525 = _T_216 ? 1'h0 : _T_524; // @[Lookup.scala 11:37:@1385.4]
  assign _T_526 = _T_212 ? 1'h0 : _T_525; // @[Lookup.scala 11:37:@1386.4]
  assign _T_527 = _T_208 ? 1'h0 : _T_526; // @[Lookup.scala 11:37:@1387.4]
  assign _T_528 = _T_204 ? 1'h0 : _T_527; // @[Lookup.scala 11:37:@1388.4]
  assign _T_529 = _T_200 ? 1'h0 : _T_528; // @[Lookup.scala 11:37:@1389.4]
  assign _T_530 = _T_196 ? 1'h0 : _T_529; // @[Lookup.scala 11:37:@1390.4]
  assign _T_531 = _T_192 ? 1'h1 : _T_530; // @[Lookup.scala 11:37:@1391.4]
  assign _T_532 = _T_188 ? 1'h0 : _T_531; // @[Lookup.scala 11:37:@1392.4]
  assign _T_533 = _T_184 ? 1'h0 : _T_532; // @[Lookup.scala 11:37:@1393.4]
  assign _T_534 = _T_180 ? 1'h0 : _T_533; // @[Lookup.scala 11:37:@1394.4]
  assign _T_535 = _T_176 ? 1'h0 : _T_534; // @[Lookup.scala 11:37:@1395.4]
  assign _T_536 = _T_172 ? 1'h0 : _T_535; // @[Lookup.scala 11:37:@1396.4]
  assign _T_537 = _T_168 ? 1'h0 : _T_536; // @[Lookup.scala 11:37:@1397.4]
  assign _T_538 = _T_164 ? 1'h0 : _T_537; // @[Lookup.scala 11:37:@1398.4]
  assign _T_539 = _T_160 ? 1'h0 : _T_538; // @[Lookup.scala 11:37:@1399.4]
  assign _T_540 = _T_156 ? 1'h0 : _T_539; // @[Lookup.scala 11:37:@1400.4]
  assign _T_541 = _T_152 ? 1'h0 : _T_540; // @[Lookup.scala 11:37:@1401.4]
  assign _T_542 = _T_148 ? 1'h0 : _T_541; // @[Lookup.scala 11:37:@1402.4]
  assign _T_543 = _T_144 ? 1'h0 : _T_542; // @[Lookup.scala 11:37:@1403.4]
  assign _T_544 = _T_140 ? 1'h0 : _T_543; // @[Lookup.scala 11:37:@1404.4]
  assign _T_545 = _T_136 ? 1'h0 : _T_544; // @[Lookup.scala 11:37:@1405.4]
  assign _T_546 = _T_132 ? 1'h0 : _T_545; // @[Lookup.scala 11:37:@1406.4]
  assign _T_547 = _T_128 ? 1'h0 : _T_546; // @[Lookup.scala 11:37:@1407.4]
  assign _T_548 = _T_124 ? 1'h0 : _T_547; // @[Lookup.scala 11:37:@1408.4]
  assign _T_549 = _T_120 ? 1'h0 : _T_548; // @[Lookup.scala 11:37:@1409.4]
  assign _T_550 = _T_116 ? 1'h0 : _T_549; // @[Lookup.scala 11:37:@1410.4]
  assign _T_551 = _T_112 ? 1'h0 : _T_550; // @[Lookup.scala 11:37:@1411.4]
  assign _T_552 = _T_108 ? 1'h0 : _T_551; // @[Lookup.scala 11:37:@1412.4]
  assign _T_553 = _T_104 ? 1'h0 : _T_552; // @[Lookup.scala 11:37:@1413.4]
  assign _T_554 = _T_100 ? 1'h0 : _T_553; // @[Lookup.scala 11:37:@1414.4]
  assign _T_555 = _T_96 ? 1'h0 : _T_554; // @[Lookup.scala 11:37:@1415.4]
  assign _T_556 = _T_92 ? 1'h0 : _T_555; // @[Lookup.scala 11:37:@1416.4]
  assign _T_557 = _T_88 ? 1'h0 : _T_556; // @[Lookup.scala 11:37:@1417.4]
  assign _T_558 = _T_84 ? 1'h0 : _T_557; // @[Lookup.scala 11:37:@1418.4]
  assign _T_559 = _T_80 ? 1'h0 : _T_558; // @[Lookup.scala 11:37:@1419.4]
  assign _T_560 = _T_76 ? 1'h0 : _T_559; // @[Lookup.scala 11:37:@1420.4]
  assign _T_561 = _T_72 ? 1'h0 : _T_560; // @[Lookup.scala 11:37:@1421.4]
  assign _T_562 = _T_68 ? 1'h0 : _T_561; // @[Lookup.scala 11:37:@1422.4]
  assign _T_563 = _T_64 ? 1'h0 : _T_562; // @[Lookup.scala 11:37:@1423.4]
  assign _T_564 = _T_60 ? 1'h0 : _T_563; // @[Lookup.scala 11:37:@1424.4]
  assign _T_565 = _T_56 ? 1'h0 : _T_564; // @[Lookup.scala 11:37:@1425.4]
  assign _T_566 = _T_52 ? 1'h1 : _T_565; // @[Lookup.scala 11:37:@1426.4]
  assign _T_567 = _T_48 ? 1'h1 : _T_566; // @[Lookup.scala 11:37:@1427.4]
  assign _T_568 = _T_44 ? 1'h0 : _T_567; // @[Lookup.scala 11:37:@1428.4]
  assign _T_600 = _T_108 ? 2'h1 : 2'h0; // @[Lookup.scala 11:37:@1461.4]
  assign _T_601 = _T_104 ? 2'h2 : _T_600; // @[Lookup.scala 11:37:@1462.4]
  assign _T_602 = _T_100 ? 2'h3 : _T_601; // @[Lookup.scala 11:37:@1463.4]
  assign _T_603 = _T_96 ? 2'h0 : _T_602; // @[Lookup.scala 11:37:@1464.4]
  assign _T_604 = _T_92 ? 2'h0 : _T_603; // @[Lookup.scala 11:37:@1465.4]
  assign _T_605 = _T_88 ? 2'h0 : _T_604; // @[Lookup.scala 11:37:@1466.4]
  assign _T_606 = _T_84 ? 2'h0 : _T_605; // @[Lookup.scala 11:37:@1467.4]
  assign _T_607 = _T_80 ? 2'h0 : _T_606; // @[Lookup.scala 11:37:@1468.4]
  assign _T_608 = _T_76 ? 2'h0 : _T_607; // @[Lookup.scala 11:37:@1469.4]
  assign _T_609 = _T_72 ? 2'h0 : _T_608; // @[Lookup.scala 11:37:@1470.4]
  assign _T_610 = _T_68 ? 2'h0 : _T_609; // @[Lookup.scala 11:37:@1471.4]
  assign _T_611 = _T_64 ? 2'h0 : _T_610; // @[Lookup.scala 11:37:@1472.4]
  assign _T_612 = _T_60 ? 2'h0 : _T_611; // @[Lookup.scala 11:37:@1473.4]
  assign _T_613 = _T_56 ? 2'h0 : _T_612; // @[Lookup.scala 11:37:@1474.4]
  assign _T_614 = _T_52 ? 2'h0 : _T_613; // @[Lookup.scala 11:37:@1475.4]
  assign _T_615 = _T_48 ? 2'h0 : _T_614; // @[Lookup.scala 11:37:@1476.4]
  assign _T_616 = _T_44 ? 2'h0 : _T_615; // @[Lookup.scala 11:37:@1477.4]
  assign _T_651 = _T_96 ? 3'h4 : 3'h0; // @[Lookup.scala 11:37:@1513.4]
  assign _T_652 = _T_92 ? 3'h5 : _T_651; // @[Lookup.scala 11:37:@1514.4]
  assign _T_653 = _T_88 ? 3'h1 : _T_652; // @[Lookup.scala 11:37:@1515.4]
  assign _T_654 = _T_84 ? 3'h2 : _T_653; // @[Lookup.scala 11:37:@1516.4]
  assign _T_655 = _T_80 ? 3'h3 : _T_654; // @[Lookup.scala 11:37:@1517.4]
  assign _T_656 = _T_76 ? 3'h0 : _T_655; // @[Lookup.scala 11:37:@1518.4]
  assign _T_657 = _T_72 ? 3'h0 : _T_656; // @[Lookup.scala 11:37:@1519.4]
  assign _T_658 = _T_68 ? 3'h0 : _T_657; // @[Lookup.scala 11:37:@1520.4]
  assign _T_659 = _T_64 ? 3'h0 : _T_658; // @[Lookup.scala 11:37:@1521.4]
  assign _T_660 = _T_60 ? 3'h0 : _T_659; // @[Lookup.scala 11:37:@1522.4]
  assign _T_661 = _T_56 ? 3'h0 : _T_660; // @[Lookup.scala 11:37:@1523.4]
  assign _T_662 = _T_52 ? 3'h0 : _T_661; // @[Lookup.scala 11:37:@1524.4]
  assign _T_663 = _T_48 ? 3'h0 : _T_662; // @[Lookup.scala 11:37:@1525.4]
  assign _T_664 = _T_44 ? 3'h0 : _T_663; // @[Lookup.scala 11:37:@1526.4]
  assign _T_667 = _T_224 ? 2'h3 : _T_234; // @[Lookup.scala 11:37:@1530.4]
  assign _T_668 = _T_220 ? 2'h3 : _T_667; // @[Lookup.scala 11:37:@1531.4]
  assign _T_669 = _T_216 ? 2'h3 : _T_668; // @[Lookup.scala 11:37:@1532.4]
  assign _T_670 = _T_212 ? 2'h3 : _T_669; // @[Lookup.scala 11:37:@1533.4]
  assign _T_671 = _T_208 ? 2'h3 : _T_670; // @[Lookup.scala 11:37:@1534.4]
  assign _T_672 = _T_204 ? 2'h3 : _T_671; // @[Lookup.scala 11:37:@1535.4]
  assign _T_673 = _T_200 ? 2'h3 : _T_672; // @[Lookup.scala 11:37:@1536.4]
  assign _T_674 = _T_196 ? 2'h3 : _T_673; // @[Lookup.scala 11:37:@1537.4]
  assign _T_675 = _T_192 ? 2'h0 : _T_674; // @[Lookup.scala 11:37:@1538.4]
  assign _T_676 = _T_188 ? 2'h0 : _T_675; // @[Lookup.scala 11:37:@1539.4]
  assign _T_677 = _T_184 ? 2'h0 : _T_676; // @[Lookup.scala 11:37:@1540.4]
  assign _T_678 = _T_180 ? 2'h0 : _T_677; // @[Lookup.scala 11:37:@1541.4]
  assign _T_679 = _T_176 ? 2'h0 : _T_678; // @[Lookup.scala 11:37:@1542.4]
  assign _T_680 = _T_172 ? 2'h0 : _T_679; // @[Lookup.scala 11:37:@1543.4]
  assign _T_681 = _T_168 ? 2'h0 : _T_680; // @[Lookup.scala 11:37:@1544.4]
  assign _T_682 = _T_164 ? 2'h0 : _T_681; // @[Lookup.scala 11:37:@1545.4]
  assign _T_683 = _T_160 ? 2'h0 : _T_682; // @[Lookup.scala 11:37:@1546.4]
  assign _T_684 = _T_156 ? 2'h0 : _T_683; // @[Lookup.scala 11:37:@1547.4]
  assign _T_685 = _T_152 ? 2'h0 : _T_684; // @[Lookup.scala 11:37:@1548.4]
  assign _T_686 = _T_148 ? 2'h0 : _T_685; // @[Lookup.scala 11:37:@1549.4]
  assign _T_687 = _T_144 ? 2'h0 : _T_686; // @[Lookup.scala 11:37:@1550.4]
  assign _T_688 = _T_140 ? 2'h0 : _T_687; // @[Lookup.scala 11:37:@1551.4]
  assign _T_689 = _T_136 ? 2'h0 : _T_688; // @[Lookup.scala 11:37:@1552.4]
  assign _T_690 = _T_132 ? 2'h0 : _T_689; // @[Lookup.scala 11:37:@1553.4]
  assign _T_691 = _T_128 ? 2'h0 : _T_690; // @[Lookup.scala 11:37:@1554.4]
  assign _T_692 = _T_124 ? 2'h0 : _T_691; // @[Lookup.scala 11:37:@1555.4]
  assign _T_693 = _T_120 ? 2'h0 : _T_692; // @[Lookup.scala 11:37:@1556.4]
  assign _T_694 = _T_116 ? 2'h0 : _T_693; // @[Lookup.scala 11:37:@1557.4]
  assign _T_695 = _T_112 ? 2'h0 : _T_694; // @[Lookup.scala 11:37:@1558.4]
  assign _T_696 = _T_108 ? 2'h0 : _T_695; // @[Lookup.scala 11:37:@1559.4]
  assign _T_697 = _T_104 ? 2'h0 : _T_696; // @[Lookup.scala 11:37:@1560.4]
  assign _T_698 = _T_100 ? 2'h0 : _T_697; // @[Lookup.scala 11:37:@1561.4]
  assign _T_699 = _T_96 ? 2'h1 : _T_698; // @[Lookup.scala 11:37:@1562.4]
  assign _T_700 = _T_92 ? 2'h1 : _T_699; // @[Lookup.scala 11:37:@1563.4]
  assign _T_701 = _T_88 ? 2'h1 : _T_700; // @[Lookup.scala 11:37:@1564.4]
  assign _T_702 = _T_84 ? 2'h1 : _T_701; // @[Lookup.scala 11:37:@1565.4]
  assign _T_703 = _T_80 ? 2'h1 : _T_702; // @[Lookup.scala 11:37:@1566.4]
  assign _T_704 = _T_76 ? 2'h0 : _T_703; // @[Lookup.scala 11:37:@1567.4]
  assign _T_705 = _T_72 ? 2'h0 : _T_704; // @[Lookup.scala 11:37:@1568.4]
  assign _T_706 = _T_68 ? 2'h0 : _T_705; // @[Lookup.scala 11:37:@1569.4]
  assign _T_707 = _T_64 ? 2'h0 : _T_706; // @[Lookup.scala 11:37:@1570.4]
  assign _T_708 = _T_60 ? 2'h0 : _T_707; // @[Lookup.scala 11:37:@1571.4]
  assign _T_709 = _T_56 ? 2'h0 : _T_708; // @[Lookup.scala 11:37:@1572.4]
  assign _T_710 = _T_52 ? 2'h2 : _T_709; // @[Lookup.scala 11:37:@1573.4]
  assign _T_711 = _T_48 ? 2'h2 : _T_710; // @[Lookup.scala 11:37:@1574.4]
  assign _T_712 = _T_44 ? 2'h0 : _T_711; // @[Lookup.scala 11:37:@1575.4]
  assign _T_718 = _T_212 ? 1'h1 : _T_216; // @[Lookup.scala 11:37:@1582.4]
  assign _T_719 = _T_208 ? 1'h1 : _T_718; // @[Lookup.scala 11:37:@1583.4]
  assign _T_720 = _T_204 ? 1'h1 : _T_719; // @[Lookup.scala 11:37:@1584.4]
  assign _T_721 = _T_200 ? 1'h1 : _T_720; // @[Lookup.scala 11:37:@1585.4]
  assign _T_722 = _T_196 ? 1'h1 : _T_721; // @[Lookup.scala 11:37:@1586.4]
  assign _T_723 = _T_192 ? 1'h0 : _T_722; // @[Lookup.scala 11:37:@1587.4]
  assign _T_724 = _T_188 ? 1'h0 : _T_723; // @[Lookup.scala 11:37:@1588.4]
  assign _T_725 = _T_184 ? 1'h1 : _T_724; // @[Lookup.scala 11:37:@1589.4]
  assign _T_726 = _T_180 ? 1'h1 : _T_725; // @[Lookup.scala 11:37:@1590.4]
  assign _T_727 = _T_176 ? 1'h1 : _T_726; // @[Lookup.scala 11:37:@1591.4]
  assign _T_728 = _T_172 ? 1'h1 : _T_727; // @[Lookup.scala 11:37:@1592.4]
  assign _T_729 = _T_168 ? 1'h1 : _T_728; // @[Lookup.scala 11:37:@1593.4]
  assign _T_730 = _T_164 ? 1'h1 : _T_729; // @[Lookup.scala 11:37:@1594.4]
  assign _T_731 = _T_160 ? 1'h1 : _T_730; // @[Lookup.scala 11:37:@1595.4]
  assign _T_732 = _T_156 ? 1'h1 : _T_731; // @[Lookup.scala 11:37:@1596.4]
  assign _T_733 = _T_152 ? 1'h1 : _T_732; // @[Lookup.scala 11:37:@1597.4]
  assign _T_734 = _T_148 ? 1'h1 : _T_733; // @[Lookup.scala 11:37:@1598.4]
  assign _T_735 = _T_144 ? 1'h1 : _T_734; // @[Lookup.scala 11:37:@1599.4]
  assign _T_736 = _T_140 ? 1'h1 : _T_735; // @[Lookup.scala 11:37:@1600.4]
  assign _T_737 = _T_136 ? 1'h1 : _T_736; // @[Lookup.scala 11:37:@1601.4]
  assign _T_738 = _T_132 ? 1'h1 : _T_737; // @[Lookup.scala 11:37:@1602.4]
  assign _T_739 = _T_128 ? 1'h1 : _T_738; // @[Lookup.scala 11:37:@1603.4]
  assign _T_740 = _T_124 ? 1'h1 : _T_739; // @[Lookup.scala 11:37:@1604.4]
  assign _T_741 = _T_120 ? 1'h1 : _T_740; // @[Lookup.scala 11:37:@1605.4]
  assign _T_742 = _T_116 ? 1'h1 : _T_741; // @[Lookup.scala 11:37:@1606.4]
  assign _T_743 = _T_112 ? 1'h1 : _T_742; // @[Lookup.scala 11:37:@1607.4]
  assign _T_744 = _T_108 ? 1'h0 : _T_743; // @[Lookup.scala 11:37:@1608.4]
  assign _T_745 = _T_104 ? 1'h0 : _T_744; // @[Lookup.scala 11:37:@1609.4]
  assign _T_746 = _T_100 ? 1'h0 : _T_745; // @[Lookup.scala 11:37:@1610.4]
  assign _T_747 = _T_96 ? 1'h1 : _T_746; // @[Lookup.scala 11:37:@1611.4]
  assign _T_748 = _T_92 ? 1'h1 : _T_747; // @[Lookup.scala 11:37:@1612.4]
  assign _T_749 = _T_88 ? 1'h1 : _T_748; // @[Lookup.scala 11:37:@1613.4]
  assign _T_750 = _T_84 ? 1'h1 : _T_749; // @[Lookup.scala 11:37:@1614.4]
  assign _T_751 = _T_80 ? 1'h1 : _T_750; // @[Lookup.scala 11:37:@1615.4]
  assign _T_752 = _T_76 ? 1'h0 : _T_751; // @[Lookup.scala 11:37:@1616.4]
  assign _T_753 = _T_72 ? 1'h0 : _T_752; // @[Lookup.scala 11:37:@1617.4]
  assign _T_754 = _T_68 ? 1'h0 : _T_753; // @[Lookup.scala 11:37:@1618.4]
  assign _T_755 = _T_64 ? 1'h0 : _T_754; // @[Lookup.scala 11:37:@1619.4]
  assign _T_756 = _T_60 ? 1'h0 : _T_755; // @[Lookup.scala 11:37:@1620.4]
  assign _T_757 = _T_56 ? 1'h0 : _T_756; // @[Lookup.scala 11:37:@1621.4]
  assign _T_758 = _T_52 ? 1'h1 : _T_757; // @[Lookup.scala 11:37:@1622.4]
  assign _T_759 = _T_48 ? 1'h1 : _T_758; // @[Lookup.scala 11:37:@1623.4]
  assign _T_760 = _T_44 ? 1'h1 : _T_759; // @[Lookup.scala 11:37:@1624.4]
  assign _T_762 = _T_228 ? 3'h4 : 3'h0; // @[Lookup.scala 11:37:@1627.4]
  assign _T_763 = _T_224 ? 3'h4 : _T_762; // @[Lookup.scala 11:37:@1628.4]
  assign _T_764 = _T_220 ? 3'h4 : _T_763; // @[Lookup.scala 11:37:@1629.4]
  assign _T_765 = _T_216 ? 3'h3 : _T_764; // @[Lookup.scala 11:37:@1630.4]
  assign _T_766 = _T_212 ? 3'h2 : _T_765; // @[Lookup.scala 11:37:@1631.4]
  assign _T_767 = _T_208 ? 3'h1 : _T_766; // @[Lookup.scala 11:37:@1632.4]
  assign _T_768 = _T_204 ? 3'h3 : _T_767; // @[Lookup.scala 11:37:@1633.4]
  assign _T_769 = _T_200 ? 3'h2 : _T_768; // @[Lookup.scala 11:37:@1634.4]
  assign _T_770 = _T_196 ? 3'h1 : _T_769; // @[Lookup.scala 11:37:@1635.4]
  assign _T_771 = _T_192 ? 3'h0 : _T_770; // @[Lookup.scala 11:37:@1636.4]
  assign _T_772 = _T_188 ? 3'h0 : _T_771; // @[Lookup.scala 11:37:@1637.4]
  assign _T_773 = _T_184 ? 3'h0 : _T_772; // @[Lookup.scala 11:37:@1638.4]
  assign _T_774 = _T_180 ? 3'h0 : _T_773; // @[Lookup.scala 11:37:@1639.4]
  assign _T_775 = _T_176 ? 3'h0 : _T_774; // @[Lookup.scala 11:37:@1640.4]
  assign _T_776 = _T_172 ? 3'h0 : _T_775; // @[Lookup.scala 11:37:@1641.4]
  assign _T_777 = _T_168 ? 3'h0 : _T_776; // @[Lookup.scala 11:37:@1642.4]
  assign _T_778 = _T_164 ? 3'h0 : _T_777; // @[Lookup.scala 11:37:@1643.4]
  assign _T_779 = _T_160 ? 3'h0 : _T_778; // @[Lookup.scala 11:37:@1644.4]
  assign _T_780 = _T_156 ? 3'h0 : _T_779; // @[Lookup.scala 11:37:@1645.4]
  assign _T_781 = _T_152 ? 3'h0 : _T_780; // @[Lookup.scala 11:37:@1646.4]
  assign _T_782 = _T_148 ? 3'h0 : _T_781; // @[Lookup.scala 11:37:@1647.4]
  assign _T_783 = _T_144 ? 3'h0 : _T_782; // @[Lookup.scala 11:37:@1648.4]
  assign _T_784 = _T_140 ? 3'h0 : _T_783; // @[Lookup.scala 11:37:@1649.4]
  assign _T_785 = _T_136 ? 3'h0 : _T_784; // @[Lookup.scala 11:37:@1650.4]
  assign _T_786 = _T_132 ? 3'h0 : _T_785; // @[Lookup.scala 11:37:@1651.4]
  assign _T_787 = _T_128 ? 3'h0 : _T_786; // @[Lookup.scala 11:37:@1652.4]
  assign _T_788 = _T_124 ? 3'h0 : _T_787; // @[Lookup.scala 11:37:@1653.4]
  assign _T_789 = _T_120 ? 3'h0 : _T_788; // @[Lookup.scala 11:37:@1654.4]
  assign _T_790 = _T_116 ? 3'h0 : _T_789; // @[Lookup.scala 11:37:@1655.4]
  assign _T_791 = _T_112 ? 3'h0 : _T_790; // @[Lookup.scala 11:37:@1656.4]
  assign _T_792 = _T_108 ? 3'h0 : _T_791; // @[Lookup.scala 11:37:@1657.4]
  assign _T_793 = _T_104 ? 3'h0 : _T_792; // @[Lookup.scala 11:37:@1658.4]
  assign _T_794 = _T_100 ? 3'h0 : _T_793; // @[Lookup.scala 11:37:@1659.4]
  assign _T_795 = _T_96 ? 3'h0 : _T_794; // @[Lookup.scala 11:37:@1660.4]
  assign _T_796 = _T_92 ? 3'h0 : _T_795; // @[Lookup.scala 11:37:@1661.4]
  assign _T_797 = _T_88 ? 3'h0 : _T_796; // @[Lookup.scala 11:37:@1662.4]
  assign _T_798 = _T_84 ? 3'h0 : _T_797; // @[Lookup.scala 11:37:@1663.4]
  assign _T_799 = _T_80 ? 3'h0 : _T_798; // @[Lookup.scala 11:37:@1664.4]
  assign _T_800 = _T_76 ? 3'h0 : _T_799; // @[Lookup.scala 11:37:@1665.4]
  assign _T_801 = _T_72 ? 3'h0 : _T_800; // @[Lookup.scala 11:37:@1666.4]
  assign _T_802 = _T_68 ? 3'h0 : _T_801; // @[Lookup.scala 11:37:@1667.4]
  assign _T_803 = _T_64 ? 3'h0 : _T_802; // @[Lookup.scala 11:37:@1668.4]
  assign _T_804 = _T_60 ? 3'h0 : _T_803; // @[Lookup.scala 11:37:@1669.4]
  assign _T_805 = _T_56 ? 3'h0 : _T_804; // @[Lookup.scala 11:37:@1670.4]
  assign _T_806 = _T_52 ? 3'h0 : _T_805; // @[Lookup.scala 11:37:@1671.4]
  assign _T_807 = _T_48 ? 3'h0 : _T_806; // @[Lookup.scala 11:37:@1672.4]
  assign _T_808 = _T_44 ? 3'h0 : _T_807; // @[Lookup.scala 11:37:@1673.4]
  assign _T_809 = _T_232 ? 1'h0 : 1'h1; // @[Lookup.scala 11:37:@1675.4]
  assign _T_810 = _T_228 ? 1'h0 : _T_809; // @[Lookup.scala 11:37:@1676.4]
  assign _T_811 = _T_224 ? 1'h0 : _T_810; // @[Lookup.scala 11:37:@1677.4]
  assign _T_812 = _T_220 ? 1'h0 : _T_811; // @[Lookup.scala 11:37:@1678.4]
  assign _T_813 = _T_216 ? 1'h0 : _T_812; // @[Lookup.scala 11:37:@1679.4]
  assign _T_814 = _T_212 ? 1'h0 : _T_813; // @[Lookup.scala 11:37:@1680.4]
  assign _T_815 = _T_208 ? 1'h0 : _T_814; // @[Lookup.scala 11:37:@1681.4]
  assign _T_816 = _T_204 ? 1'h0 : _T_815; // @[Lookup.scala 11:37:@1682.4]
  assign _T_817 = _T_200 ? 1'h0 : _T_816; // @[Lookup.scala 11:37:@1683.4]
  assign _T_818 = _T_196 ? 1'h0 : _T_817; // @[Lookup.scala 11:37:@1684.4]
  assign _T_819 = _T_192 ? 1'h0 : _T_818; // @[Lookup.scala 11:37:@1685.4]
  assign _T_820 = _T_188 ? 1'h0 : _T_819; // @[Lookup.scala 11:37:@1686.4]
  assign _T_821 = _T_184 ? 1'h0 : _T_820; // @[Lookup.scala 11:37:@1687.4]
  assign _T_822 = _T_180 ? 1'h0 : _T_821; // @[Lookup.scala 11:37:@1688.4]
  assign _T_823 = _T_176 ? 1'h0 : _T_822; // @[Lookup.scala 11:37:@1689.4]
  assign _T_824 = _T_172 ? 1'h0 : _T_823; // @[Lookup.scala 11:37:@1690.4]
  assign _T_825 = _T_168 ? 1'h0 : _T_824; // @[Lookup.scala 11:37:@1691.4]
  assign _T_826 = _T_164 ? 1'h0 : _T_825; // @[Lookup.scala 11:37:@1692.4]
  assign _T_827 = _T_160 ? 1'h0 : _T_826; // @[Lookup.scala 11:37:@1693.4]
  assign _T_828 = _T_156 ? 1'h0 : _T_827; // @[Lookup.scala 11:37:@1694.4]
  assign _T_829 = _T_152 ? 1'h0 : _T_828; // @[Lookup.scala 11:37:@1695.4]
  assign _T_830 = _T_148 ? 1'h0 : _T_829; // @[Lookup.scala 11:37:@1696.4]
  assign _T_831 = _T_144 ? 1'h0 : _T_830; // @[Lookup.scala 11:37:@1697.4]
  assign _T_832 = _T_140 ? 1'h0 : _T_831; // @[Lookup.scala 11:37:@1698.4]
  assign _T_833 = _T_136 ? 1'h0 : _T_832; // @[Lookup.scala 11:37:@1699.4]
  assign _T_834 = _T_132 ? 1'h0 : _T_833; // @[Lookup.scala 11:37:@1700.4]
  assign _T_835 = _T_128 ? 1'h0 : _T_834; // @[Lookup.scala 11:37:@1701.4]
  assign _T_836 = _T_124 ? 1'h0 : _T_835; // @[Lookup.scala 11:37:@1702.4]
  assign _T_837 = _T_120 ? 1'h0 : _T_836; // @[Lookup.scala 11:37:@1703.4]
  assign _T_838 = _T_116 ? 1'h0 : _T_837; // @[Lookup.scala 11:37:@1704.4]
  assign _T_839 = _T_112 ? 1'h0 : _T_838; // @[Lookup.scala 11:37:@1705.4]
  assign _T_840 = _T_108 ? 1'h0 : _T_839; // @[Lookup.scala 11:37:@1706.4]
  assign _T_841 = _T_104 ? 1'h0 : _T_840; // @[Lookup.scala 11:37:@1707.4]
  assign _T_842 = _T_100 ? 1'h0 : _T_841; // @[Lookup.scala 11:37:@1708.4]
  assign _T_843 = _T_96 ? 1'h0 : _T_842; // @[Lookup.scala 11:37:@1709.4]
  assign _T_844 = _T_92 ? 1'h0 : _T_843; // @[Lookup.scala 11:37:@1710.4]
  assign _T_845 = _T_88 ? 1'h0 : _T_844; // @[Lookup.scala 11:37:@1711.4]
  assign _T_846 = _T_84 ? 1'h0 : _T_845; // @[Lookup.scala 11:37:@1712.4]
  assign _T_847 = _T_80 ? 1'h0 : _T_846; // @[Lookup.scala 11:37:@1713.4]
  assign _T_848 = _T_76 ? 1'h0 : _T_847; // @[Lookup.scala 11:37:@1714.4]
  assign _T_849 = _T_72 ? 1'h0 : _T_848; // @[Lookup.scala 11:37:@1715.4]
  assign _T_850 = _T_68 ? 1'h0 : _T_849; // @[Lookup.scala 11:37:@1716.4]
  assign _T_851 = _T_64 ? 1'h0 : _T_850; // @[Lookup.scala 11:37:@1717.4]
  assign _T_852 = _T_60 ? 1'h0 : _T_851; // @[Lookup.scala 11:37:@1718.4]
  assign _T_853 = _T_56 ? 1'h0 : _T_852; // @[Lookup.scala 11:37:@1719.4]
  assign _T_854 = _T_52 ? 1'h0 : _T_853; // @[Lookup.scala 11:37:@1720.4]
  assign _T_855 = _T_48 ? 1'h0 : _T_854; // @[Lookup.scala 11:37:@1721.4]
  assign _T_856 = _T_44 ? 1'h0 : _T_855; // @[Lookup.scala 11:37:@1722.4]
  assign _T_896 = _T_76 ? 1'h1 : _T_319; // @[Lookup.scala 11:37:@1763.4]
  assign _T_897 = _T_72 ? 1'h1 : _T_896; // @[Lookup.scala 11:37:@1764.4]
  assign _T_898 = _T_68 ? 1'h1 : _T_897; // @[Lookup.scala 11:37:@1765.4]
  assign _T_899 = _T_64 ? 1'h1 : _T_898; // @[Lookup.scala 11:37:@1766.4]
  assign _T_900 = _T_60 ? 1'h1 : _T_899; // @[Lookup.scala 11:37:@1767.4]
  assign _T_901 = _T_56 ? 1'h1 : _T_900; // @[Lookup.scala 11:37:@1768.4]
  assign _T_902 = _T_52 ? 1'h1 : _T_901; // @[Lookup.scala 11:37:@1769.4]
  assign _T_903 = _T_48 ? 1'h0 : _T_902; // @[Lookup.scala 11:37:@1770.4]
  assign _T_904 = _T_44 ? 1'h0 : _T_903; // @[Lookup.scala 11:37:@1771.4]
  assign _T_936 = _T_108 ? 1'h1 : _T_359; // @[Lookup.scala 11:37:@1804.4]
  assign _T_937 = _T_104 ? 1'h1 : _T_936; // @[Lookup.scala 11:37:@1805.4]
  assign _T_938 = _T_100 ? 1'h1 : _T_937; // @[Lookup.scala 11:37:@1806.4]
  assign _T_939 = _T_96 ? 1'h0 : _T_938; // @[Lookup.scala 11:37:@1807.4]
  assign _T_940 = _T_92 ? 1'h0 : _T_939; // @[Lookup.scala 11:37:@1808.4]
  assign _T_941 = _T_88 ? 1'h0 : _T_940; // @[Lookup.scala 11:37:@1809.4]
  assign _T_942 = _T_84 ? 1'h0 : _T_941; // @[Lookup.scala 11:37:@1810.4]
  assign _T_943 = _T_80 ? 1'h0 : _T_942; // @[Lookup.scala 11:37:@1811.4]
  assign _T_944 = _T_76 ? 1'h1 : _T_943; // @[Lookup.scala 11:37:@1812.4]
  assign _T_945 = _T_72 ? 1'h1 : _T_944; // @[Lookup.scala 11:37:@1813.4]
  assign _T_946 = _T_68 ? 1'h1 : _T_945; // @[Lookup.scala 11:37:@1814.4]
  assign _T_947 = _T_64 ? 1'h1 : _T_946; // @[Lookup.scala 11:37:@1815.4]
  assign _T_948 = _T_60 ? 1'h1 : _T_947; // @[Lookup.scala 11:37:@1816.4]
  assign _T_949 = _T_56 ? 1'h1 : _T_948; // @[Lookup.scala 11:37:@1817.4]
  assign _T_950 = _T_52 ? 1'h0 : _T_949; // @[Lookup.scala 11:37:@1818.4]
  assign _T_951 = _T_48 ? 1'h0 : _T_950; // @[Lookup.scala 11:37:@1819.4]
  assign _T_952 = _T_44 ? 1'h0 : _T_951; // @[Lookup.scala 11:37:@1820.4]
  assign io_pc_sel = _T_40 ? 2'h0 : _T_280; // @[pipeline_control.scala 112:16:@1822.4]
  assign io_inst_kill = _T_40 ? 1'h0 : _T_568; // @[pipeline_control.scala 113:16:@1824.4]
  assign io_a_sel = _T_40 ? 1'h0 : _T_328; // @[pipeline_control.scala 116:17:@1825.4]
  assign io_b_sel = _T_40 ? 1'h0 : _T_376; // @[pipeline_control.scala 117:17:@1826.4]
  assign io_imm_sel = _T_40 ? 3'h3 : _T_424; // @[pipeline_control.scala 118:17:@1827.4]
  assign io_alu_op = {{1'd0}, ctrlSignals_4}; // @[pipeline_control.scala 119:17:@1828.4]
  assign io_br_type = _T_40 ? 3'h0 : _T_520; // @[pipeline_control.scala 120:17:@1829.4]
  assign io_st_type = _T_40 ? 2'h0 : _T_616; // @[pipeline_control.scala 121:17:@1830.4]
  assign io_ld_type = _T_40 ? 3'h0 : _T_664; // @[pipeline_control.scala 124:17:@1831.4]
  assign io_wb_mux_sel = _T_40 ? 2'h0 : _T_712; // @[pipeline_control.scala 125:17:@1832.4]
  assign io_wb_en = _T_40 ? 1'h1 : _T_760; // @[pipeline_control.scala 126:17:@1834.4]
  assign io_csr_cmd = _T_40 ? 3'h0 : _T_808; // @[pipeline_control.scala 127:17:@1835.4]
  assign io_illegal = _T_40 ? 1'h0 : _T_856; // @[pipeline_control.scala 128:17:@1836.4]
  assign io_en_rs1 = _T_40 ? 1'h0 : _T_904; // @[pipeline_control.scala 129:17:@1837.4]
  assign io_en_rs2 = _T_40 ? 1'h0 : _T_952; // @[pipeline_control.scala 130:17:@1838.4]
endmodule
module Core( // @[:@1840.2]
  input         clock, // @[:@1841.4]
  input         reset, // @[:@1842.4]
  input         io_irq_uart_irq, // @[:@1843.4]
  input         io_irq_spi_irq, // @[:@1843.4]
  input         io_irq_motor_irq, // @[:@1843.4]
  output [31:0] io_ibus_addr, // @[:@1843.4]
  input  [31:0] io_ibus_inst, // @[:@1843.4]
  input         io_ibus_valid, // @[:@1843.4]
  output [31:0] io_dbus_addr, // @[:@1843.4]
  output [31:0] io_dbus_wdata, // @[:@1843.4]
  input  [31:0] io_dbus_rdata, // @[:@1843.4]
  output        io_dbus_rd_en, // @[:@1843.4]
  output        io_dbus_wr_en, // @[:@1843.4]
  output [1:0]  io_dbus_st_type, // @[:@1843.4]
  output [2:0]  io_dbus_ld_type, // @[:@1843.4]
  input         io_dbus_valid // @[:@1843.4]
);
  wire  dpath_clock; // @[core.scala 55:25:@1845.4]
  wire  dpath_reset; // @[core.scala 55:25:@1845.4]
  wire  dpath_io_irq_uart_irq; // @[core.scala 55:25:@1845.4]
  wire  dpath_io_irq_spi_irq; // @[core.scala 55:25:@1845.4]
  wire  dpath_io_irq_motor_irq; // @[core.scala 55:25:@1845.4]
  wire [31:0] dpath_io_ibus_addr; // @[core.scala 55:25:@1845.4]
  wire [31:0] dpath_io_ibus_inst; // @[core.scala 55:25:@1845.4]
  wire  dpath_io_ibus_valid; // @[core.scala 55:25:@1845.4]
  wire [31:0] dpath_io_dbus_addr; // @[core.scala 55:25:@1845.4]
  wire [31:0] dpath_io_dbus_wdata; // @[core.scala 55:25:@1845.4]
  wire [31:0] dpath_io_dbus_rdata; // @[core.scala 55:25:@1845.4]
  wire  dpath_io_dbus_rd_en; // @[core.scala 55:25:@1845.4]
  wire  dpath_io_dbus_wr_en; // @[core.scala 55:25:@1845.4]
  wire [1:0] dpath_io_dbus_st_type; // @[core.scala 55:25:@1845.4]
  wire [2:0] dpath_io_dbus_ld_type; // @[core.scala 55:25:@1845.4]
  wire  dpath_io_dbus_valid; // @[core.scala 55:25:@1845.4]
  wire [31:0] dpath_io_ctrl_inst; // @[core.scala 55:25:@1845.4]
  wire [1:0] dpath_io_ctrl_pc_sel; // @[core.scala 55:25:@1845.4]
  wire  dpath_io_ctrl_inst_kill; // @[core.scala 55:25:@1845.4]
  wire  dpath_io_ctrl_a_sel; // @[core.scala 55:25:@1845.4]
  wire  dpath_io_ctrl_b_sel; // @[core.scala 55:25:@1845.4]
  wire [2:0] dpath_io_ctrl_imm_sel; // @[core.scala 55:25:@1845.4]
  wire [4:0] dpath_io_ctrl_alu_op; // @[core.scala 55:25:@1845.4]
  wire [2:0] dpath_io_ctrl_br_type; // @[core.scala 55:25:@1845.4]
  wire [1:0] dpath_io_ctrl_st_type; // @[core.scala 55:25:@1845.4]
  wire [2:0] dpath_io_ctrl_ld_type; // @[core.scala 55:25:@1845.4]
  wire [1:0] dpath_io_ctrl_wb_mux_sel; // @[core.scala 55:25:@1845.4]
  wire  dpath_io_ctrl_wb_en; // @[core.scala 55:25:@1845.4]
  wire [2:0] dpath_io_ctrl_csr_cmd; // @[core.scala 55:25:@1845.4]
  wire  dpath_io_ctrl_illegal; // @[core.scala 55:25:@1845.4]
  wire  dpath_io_ctrl_en_rs1; // @[core.scala 55:25:@1845.4]
  wire  dpath_io_ctrl_en_rs2; // @[core.scala 55:25:@1845.4]
  wire [31:0] ctrl_io_inst; // @[core.scala 56:25:@1848.4]
  wire [1:0] ctrl_io_pc_sel; // @[core.scala 56:25:@1848.4]
  wire  ctrl_io_inst_kill; // @[core.scala 56:25:@1848.4]
  wire  ctrl_io_a_sel; // @[core.scala 56:25:@1848.4]
  wire  ctrl_io_b_sel; // @[core.scala 56:25:@1848.4]
  wire [2:0] ctrl_io_imm_sel; // @[core.scala 56:25:@1848.4]
  wire [4:0] ctrl_io_alu_op; // @[core.scala 56:25:@1848.4]
  wire [2:0] ctrl_io_br_type; // @[core.scala 56:25:@1848.4]
  wire [1:0] ctrl_io_st_type; // @[core.scala 56:25:@1848.4]
  wire [2:0] ctrl_io_ld_type; // @[core.scala 56:25:@1848.4]
  wire [1:0] ctrl_io_wb_mux_sel; // @[core.scala 56:25:@1848.4]
  wire  ctrl_io_wb_en; // @[core.scala 56:25:@1848.4]
  wire [2:0] ctrl_io_csr_cmd; // @[core.scala 56:25:@1848.4]
  wire  ctrl_io_illegal; // @[core.scala 56:25:@1848.4]
  wire  ctrl_io_en_rs1; // @[core.scala 56:25:@1848.4]
  wire  ctrl_io_en_rs2; // @[core.scala 56:25:@1848.4]
  Datapath dpath ( // @[core.scala 55:25:@1845.4]
    .clock(dpath_clock),
    .reset(dpath_reset),
    .io_irq_uart_irq(dpath_io_irq_uart_irq),
    .io_irq_spi_irq(dpath_io_irq_spi_irq),
    .io_irq_motor_irq(dpath_io_irq_motor_irq),
    .io_ibus_addr(dpath_io_ibus_addr),
    .io_ibus_inst(dpath_io_ibus_inst),
    .io_ibus_valid(dpath_io_ibus_valid),
    .io_dbus_addr(dpath_io_dbus_addr),
    .io_dbus_wdata(dpath_io_dbus_wdata),
    .io_dbus_rdata(dpath_io_dbus_rdata),
    .io_dbus_rd_en(dpath_io_dbus_rd_en),
    .io_dbus_wr_en(dpath_io_dbus_wr_en),
    .io_dbus_st_type(dpath_io_dbus_st_type),
    .io_dbus_ld_type(dpath_io_dbus_ld_type),
    .io_dbus_valid(dpath_io_dbus_valid),
    .io_ctrl_inst(dpath_io_ctrl_inst),
    .io_ctrl_pc_sel(dpath_io_ctrl_pc_sel),
    .io_ctrl_inst_kill(dpath_io_ctrl_inst_kill),
    .io_ctrl_a_sel(dpath_io_ctrl_a_sel),
    .io_ctrl_b_sel(dpath_io_ctrl_b_sel),
    .io_ctrl_imm_sel(dpath_io_ctrl_imm_sel),
    .io_ctrl_alu_op(dpath_io_ctrl_alu_op),
    .io_ctrl_br_type(dpath_io_ctrl_br_type),
    .io_ctrl_st_type(dpath_io_ctrl_st_type),
    .io_ctrl_ld_type(dpath_io_ctrl_ld_type),
    .io_ctrl_wb_mux_sel(dpath_io_ctrl_wb_mux_sel),
    .io_ctrl_wb_en(dpath_io_ctrl_wb_en),
    .io_ctrl_csr_cmd(dpath_io_ctrl_csr_cmd),
    .io_ctrl_illegal(dpath_io_ctrl_illegal),
    .io_ctrl_en_rs1(dpath_io_ctrl_en_rs1),
    .io_ctrl_en_rs2(dpath_io_ctrl_en_rs2)
  );
  Control ctrl ( // @[core.scala 56:25:@1848.4]
    .io_inst(ctrl_io_inst),
    .io_pc_sel(ctrl_io_pc_sel),
    .io_inst_kill(ctrl_io_inst_kill),
    .io_a_sel(ctrl_io_a_sel),
    .io_b_sel(ctrl_io_b_sel),
    .io_imm_sel(ctrl_io_imm_sel),
    .io_alu_op(ctrl_io_alu_op),
    .io_br_type(ctrl_io_br_type),
    .io_st_type(ctrl_io_st_type),
    .io_ld_type(ctrl_io_ld_type),
    .io_wb_mux_sel(ctrl_io_wb_mux_sel),
    .io_wb_en(ctrl_io_wb_en),
    .io_csr_cmd(ctrl_io_csr_cmd),
    .io_illegal(ctrl_io_illegal),
    .io_en_rs1(ctrl_io_en_rs1),
    .io_en_rs2(ctrl_io_en_rs2)
  );
  assign io_ibus_addr = dpath_io_ibus_addr; // @[core.scala 61:17:@1856.4]
  assign io_dbus_addr = dpath_io_dbus_addr; // @[core.scala 62:17:@1864.4]
  assign io_dbus_wdata = dpath_io_dbus_wdata; // @[core.scala 62:17:@1863.4]
  assign io_dbus_rd_en = dpath_io_dbus_rd_en; // @[core.scala 62:17:@1861.4]
  assign io_dbus_wr_en = dpath_io_dbus_wr_en; // @[core.scala 62:17:@1860.4]
  assign io_dbus_st_type = dpath_io_dbus_st_type; // @[core.scala 62:17:@1859.4]
  assign io_dbus_ld_type = dpath_io_dbus_ld_type; // @[core.scala 62:17:@1858.4]
  assign dpath_clock = clock; // @[:@1846.4]
  assign dpath_reset = reset; // @[:@1847.4]
  assign dpath_io_irq_uart_irq = io_irq_uart_irq; // @[core.scala 60:17:@1853.4]
  assign dpath_io_irq_spi_irq = io_irq_spi_irq; // @[core.scala 60:17:@1852.4]
  assign dpath_io_irq_motor_irq = io_irq_motor_irq; // @[core.scala 60:17:@1851.4]
  assign dpath_io_ibus_inst = io_ibus_inst; // @[core.scala 61:17:@1855.4]
  assign dpath_io_ibus_valid = io_ibus_valid; // @[core.scala 61:17:@1854.4]
  assign dpath_io_dbus_rdata = io_dbus_rdata; // @[core.scala 62:17:@1862.4]
  assign dpath_io_dbus_valid = io_dbus_valid; // @[core.scala 62:17:@1857.4]
  assign dpath_io_ctrl_pc_sel = ctrl_io_pc_sel; // @[core.scala 63:17:@1879.4]
  assign dpath_io_ctrl_inst_kill = ctrl_io_inst_kill; // @[core.scala 63:17:@1878.4]
  assign dpath_io_ctrl_a_sel = ctrl_io_a_sel; // @[core.scala 63:17:@1877.4]
  assign dpath_io_ctrl_b_sel = ctrl_io_b_sel; // @[core.scala 63:17:@1876.4]
  assign dpath_io_ctrl_imm_sel = ctrl_io_imm_sel; // @[core.scala 63:17:@1875.4]
  assign dpath_io_ctrl_alu_op = ctrl_io_alu_op; // @[core.scala 63:17:@1874.4]
  assign dpath_io_ctrl_br_type = ctrl_io_br_type; // @[core.scala 63:17:@1873.4]
  assign dpath_io_ctrl_st_type = ctrl_io_st_type; // @[core.scala 63:17:@1872.4]
  assign dpath_io_ctrl_ld_type = ctrl_io_ld_type; // @[core.scala 63:17:@1871.4]
  assign dpath_io_ctrl_wb_mux_sel = ctrl_io_wb_mux_sel; // @[core.scala 63:17:@1870.4]
  assign dpath_io_ctrl_wb_en = ctrl_io_wb_en; // @[core.scala 63:17:@1869.4]
  assign dpath_io_ctrl_csr_cmd = ctrl_io_csr_cmd; // @[core.scala 63:17:@1868.4]
  assign dpath_io_ctrl_illegal = ctrl_io_illegal; // @[core.scala 63:17:@1867.4]
  assign dpath_io_ctrl_en_rs1 = ctrl_io_en_rs1; // @[core.scala 63:17:@1866.4]
  assign dpath_io_ctrl_en_rs2 = ctrl_io_en_rs2; // @[core.scala 63:17:@1865.4]
  assign ctrl_io_inst = dpath_io_ctrl_inst; // @[core.scala 63:17:@1880.4]
endmodule
