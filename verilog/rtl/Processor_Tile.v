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
module DMem( // @[:@1882.2]
  input         clock, // @[:@1883.4]
  input  [7:0]  io_dmem_addr, // @[:@1885.4]
  input  [31:0] io_dmem_wdata, // @[:@1885.4]
  output [31:0] io_dmem_rdata, // @[:@1885.4]
  input         io_wr_en, // @[:@1885.4]
  input  [3:0]  io_st_type // @[:@1885.4]
);
  reg [7:0] dmem [0:255]; // @[memory.scala 78:26:@1887.4]
  reg [31:0] _RAND_0;
  wire [7:0] dmem__T_46_data; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_46_addr; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_50_data; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_50_addr; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_54_data; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_54_addr; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_55_data; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_55_addr; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_19_data; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_19_addr; // @[memory.scala 78:26:@1887.4]
  wire  dmem__T_19_mask; // @[memory.scala 78:26:@1887.4]
  wire  dmem__T_19_en; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_26_data; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_26_addr; // @[memory.scala 78:26:@1887.4]
  wire  dmem__T_26_mask; // @[memory.scala 78:26:@1887.4]
  wire  dmem__T_26_en; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_33_data; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_33_addr; // @[memory.scala 78:26:@1887.4]
  wire  dmem__T_33_mask; // @[memory.scala 78:26:@1887.4]
  wire  dmem__T_33_en; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_40_data; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_40_addr; // @[memory.scala 78:26:@1887.4]
  wire  dmem__T_40_mask; // @[memory.scala 78:26:@1887.4]
  wire  dmem__T_40_en; // @[memory.scala 78:26:@1887.4]
  wire  _T_17; // @[memory.scala 86:18:@1889.6]
  wire  _GEN_3; // @[memory.scala 86:30:@1891.6]
  wire  _T_21; // @[memory.scala 89:18:@1896.6]
  wire [8:0] _T_24; // @[memory.scala 90:17:@1899.8]
  wire [7:0] _T_25; // @[memory.scala 90:17:@1900.8]
  wire  _T_28; // @[memory.scala 92:18:@1905.6]
  wire [8:0] _T_31; // @[memory.scala 93:17:@1908.8]
  wire [7:0] _T_32; // @[memory.scala 93:17:@1909.8]
  wire  _T_35; // @[memory.scala 95:18:@1914.6]
  wire [8:0] _T_38; // @[memory.scala 96:17:@1917.8]
  wire [7:0] _T_39; // @[memory.scala 96:17:@1918.8]
  wire [15:0] _T_56; // @[Cat.scala 30:58:@1935.4]
  wire [15:0] _T_57; // @[Cat.scala 30:58:@1936.4]
  reg [7:0] dmem__T_46_addr_pipe_0;
  reg [31:0] _RAND_1;
  reg [7:0] dmem__T_50_addr_pipe_0;
  reg [31:0] _RAND_2;
  reg [7:0] dmem__T_54_addr_pipe_0;
  reg [31:0] _RAND_3;
  reg [7:0] dmem__T_55_addr_pipe_0;
  reg [31:0] _RAND_4;
  assign dmem__T_46_addr = dmem__T_46_addr_pipe_0;
  assign dmem__T_46_data = dmem[dmem__T_46_addr]; // @[memory.scala 78:26:@1887.4]
  assign dmem__T_50_addr = dmem__T_50_addr_pipe_0;
  assign dmem__T_50_data = dmem[dmem__T_50_addr]; // @[memory.scala 78:26:@1887.4]
  assign dmem__T_54_addr = dmem__T_54_addr_pipe_0;
  assign dmem__T_54_data = dmem[dmem__T_54_addr]; // @[memory.scala 78:26:@1887.4]
  assign dmem__T_55_addr = dmem__T_55_addr_pipe_0;
  assign dmem__T_55_data = dmem[dmem__T_55_addr]; // @[memory.scala 78:26:@1887.4]
  assign dmem__T_19_data = io_dmem_wdata[7:0];
  assign dmem__T_19_addr = io_dmem_addr;
  assign dmem__T_19_mask = 1'h1;
  assign dmem__T_19_en = io_wr_en ? _T_17 : 1'h0;
  assign dmem__T_26_data = io_dmem_wdata[15:8];
  assign dmem__T_26_addr = io_dmem_addr + 8'h1;
  assign dmem__T_26_mask = 1'h1;
  assign dmem__T_26_en = io_wr_en ? _T_21 : 1'h0;
  assign dmem__T_33_data = io_dmem_wdata[23:16];
  assign dmem__T_33_addr = io_dmem_addr + 8'h2;
  assign dmem__T_33_mask = 1'h1;
  assign dmem__T_33_en = io_wr_en ? _T_28 : 1'h0;
  assign dmem__T_40_data = io_dmem_wdata[31:24];
  assign dmem__T_40_addr = io_dmem_addr + 8'h3;
  assign dmem__T_40_mask = 1'h1;
  assign dmem__T_40_en = io_wr_en ? _T_35 : 1'h0;
  assign _T_17 = io_st_type[0]; // @[memory.scala 86:18:@1889.6]
  assign _GEN_3 = 1'h1; // @[memory.scala 86:30:@1891.6]
  assign _T_21 = io_st_type[1]; // @[memory.scala 89:18:@1896.6]
  assign _T_24 = io_dmem_addr + 8'h1; // @[memory.scala 90:17:@1899.8]
  assign _T_25 = io_dmem_addr + 8'h1; // @[memory.scala 90:17:@1900.8]
  assign _T_28 = io_st_type[2]; // @[memory.scala 92:18:@1905.6]
  assign _T_31 = io_dmem_addr + 8'h2; // @[memory.scala 93:17:@1908.8]
  assign _T_32 = io_dmem_addr + 8'h2; // @[memory.scala 93:17:@1909.8]
  assign _T_35 = io_st_type[3]; // @[memory.scala 95:18:@1914.6]
  assign _T_38 = io_dmem_addr + 8'h3; // @[memory.scala 96:17:@1917.8]
  assign _T_39 = io_dmem_addr + 8'h3; // @[memory.scala 96:17:@1918.8]
  assign _T_56 = {dmem__T_54_data,dmem__T_55_data}; // @[Cat.scala 30:58:@1935.4]
  assign _T_57 = {dmem__T_46_data,dmem__T_50_data}; // @[Cat.scala 30:58:@1936.4]
  assign io_dmem_rdata = {_T_57,_T_56}; // @[memory.scala 103:17:@1939.4]
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
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dmem[initvar] = _RAND_0[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  dmem__T_46_addr_pipe_0 = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  dmem__T_50_addr_pipe_0 = _RAND_2[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  dmem__T_54_addr_pipe_0 = _RAND_3[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  dmem__T_55_addr_pipe_0 = _RAND_4[7:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(dmem__T_19_en & dmem__T_19_mask) begin
      dmem[dmem__T_19_addr] <= dmem__T_19_data; // @[memory.scala 78:26:@1887.4]
    end
    if(dmem__T_26_en & dmem__T_26_mask) begin
      dmem[dmem__T_26_addr] <= dmem__T_26_data; // @[memory.scala 78:26:@1887.4]
    end
    if(dmem__T_33_en & dmem__T_33_mask) begin
      dmem[dmem__T_33_addr] <= dmem__T_33_data; // @[memory.scala 78:26:@1887.4]
    end
    if(dmem__T_40_en & dmem__T_40_mask) begin
      dmem[dmem__T_40_addr] <= dmem__T_40_data; // @[memory.scala 78:26:@1887.4]
    end
    if (_GEN_3) begin
      dmem__T_46_addr_pipe_0 <= _T_39;
    end
    if (_GEN_3) begin
      dmem__T_50_addr_pipe_0 <= _T_32;
    end
    if (_GEN_3) begin
      dmem__T_54_addr_pipe_0 <= _T_25;
    end
    if (_GEN_3) begin
      dmem__T_55_addr_pipe_0 <= io_dmem_addr;
    end
  end
endmodule
module DMem_Interface( // @[:@1941.2]
  input         clock, // @[:@1942.4]
  input         reset, // @[:@1943.4]
  input  [15:0] io_wbs_m2s_addr, // @[:@1944.4]
  input  [31:0] io_wbs_m2s_data, // @[:@1944.4]
  input         io_wbs_m2s_we, // @[:@1944.4]
  input  [3:0]  io_wbs_m2s_sel, // @[:@1944.4]
  input         io_wbs_m2s_stb, // @[:@1944.4]
  output        io_wbs_ack_o, // @[:@1944.4]
  output [31:0] io_wbs_data_o // @[:@1944.4]
);
  wire  dmem_clock; // @[dmem_interface.scala 35:20:@1946.4]
  wire [7:0] dmem_io_dmem_addr; // @[dmem_interface.scala 35:20:@1946.4]
  wire [31:0] dmem_io_dmem_wdata; // @[dmem_interface.scala 35:20:@1946.4]
  wire [31:0] dmem_io_dmem_rdata; // @[dmem_interface.scala 35:20:@1946.4]
  wire  dmem_io_wr_en; // @[dmem_interface.scala 35:20:@1946.4]
  wire [3:0] dmem_io_st_type; // @[dmem_interface.scala 35:20:@1946.4]
  wire [3:0] _T_35; // @[dmem_interface.scala 37:41:@1949.4]
  wire  dmem_addr_match; // @[dmem_interface.scala 37:79:@1950.4]
  wire  dmem_select; // @[dmem_interface.scala 39:41:@1951.4]
  wire  _T_42; // @[dmem_interface.scala 40:26:@1952.4]
  reg  ack2; // @[dmem_interface.scala 48:28:@1960.4]
  reg [31:0] _RAND_0;
  wire  dmem_res_en; // @[dmem_interface.scala 49:49:@1962.4]
  wire  _GEN_0; // @[dmem_interface.scala 51:21:@1963.4]
  reg  ack; // @[dmem_interface.scala 55:28:@1967.4]
  reg [31:0] _RAND_1;
  reg  rd_resp; // @[dmem_interface.scala 60:24:@1972.4]
  reg [31:0] _RAND_2;
  DMem dmem ( // @[dmem_interface.scala 35:20:@1946.4]
    .clock(dmem_clock),
    .io_dmem_addr(dmem_io_dmem_addr),
    .io_dmem_wdata(dmem_io_dmem_wdata),
    .io_dmem_rdata(dmem_io_dmem_rdata),
    .io_wr_en(dmem_io_wr_en),
    .io_st_type(dmem_io_st_type)
  );
  assign _T_35 = io_wbs_m2s_addr[15:12]; // @[dmem_interface.scala 37:41:@1949.4]
  assign dmem_addr_match = _T_35 == 4'h1; // @[dmem_interface.scala 37:79:@1950.4]
  assign dmem_select = io_wbs_m2s_stb & dmem_addr_match; // @[dmem_interface.scala 39:41:@1951.4]
  assign _T_42 = io_wbs_m2s_we == 1'h0; // @[dmem_interface.scala 40:26:@1952.4]
  assign dmem_res_en = ack2 ^ io_wbs_m2s_stb; // @[dmem_interface.scala 49:49:@1962.4]
  assign _GEN_0 = dmem_res_en ? io_wbs_m2s_stb : ack2; // @[dmem_interface.scala 51:21:@1963.4]
  assign io_wbs_ack_o = ack | ack2; // @[dmem_interface.scala 57:18:@1971.4]
  assign io_wbs_data_o = rd_resp ? dmem_io_dmem_rdata : 32'h0; // @[dmem_interface.scala 62:18:@1975.4]
  assign dmem_clock = clock; // @[:@1947.4]
  assign dmem_io_dmem_addr = io_wbs_m2s_addr[7:0]; // @[dmem_interface.scala 42:23:@1955.4]
  assign dmem_io_dmem_wdata = io_wbs_m2s_data; // @[dmem_interface.scala 43:23:@1956.4]
  assign dmem_io_wr_en = io_wbs_m2s_we & dmem_select; // @[dmem_interface.scala 44:23:@1958.4]
  assign dmem_io_st_type = io_wbs_m2s_sel; // @[dmem_interface.scala 45:23:@1959.4]
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
  ack2 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  ack = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  rd_resp = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      ack2 <= 1'h0;
    end else begin
      if (dmem_res_en) begin
        ack2 <= io_wbs_m2s_stb;
      end
    end
    if (reset) begin
      ack <= 1'h0;
    end else begin
      ack <= io_wbs_m2s_stb;
    end
    rd_resp <= _T_42 & dmem_select;
  end
endmodule
module IMem( // @[:@1977.2]
  input         clock, // @[:@1978.4]
  input  [31:0] io_imem_addr, // @[:@1980.4]
  output [31:0] io_imem_rdata, // @[:@1980.4]
  input  [31:0] io_imem_wdata, // @[:@1980.4]
  input         io_wr_en // @[:@1980.4]
);
  reg [31:0] imem [0:4095]; // @[memory.scala 32:25:@1982.4]
  reg [31:0] _RAND_0;
  wire [31:0] imem__T_24_data; // @[memory.scala 32:25:@1982.4]
  wire [11:0] imem__T_24_addr; // @[memory.scala 32:25:@1982.4]
  wire [31:0] imem__T_20_data; // @[memory.scala 32:25:@1982.4]
  wire [11:0] imem__T_20_addr; // @[memory.scala 32:25:@1982.4]
  wire  imem__T_20_mask; // @[memory.scala 32:25:@1982.4]
  wire  imem__T_20_en; // @[memory.scala 32:25:@1982.4]
  wire [31:0] _T_18; // @[memory.scala 43:23:@1984.6]
  wire [11:0] _T_19; // @[memory.scala 43:9:@1985.6]
  wire  _GEN_3; // @[memory.scala 42:19:@1983.4]
  reg [11:0] imem__T_24_addr_pipe_0;
  reg [31:0] _RAND_1;
  assign imem__T_24_addr = imem__T_24_addr_pipe_0;
  assign imem__T_24_data = imem[imem__T_24_addr]; // @[memory.scala 32:25:@1982.4]
  assign imem__T_20_data = io_imem_wdata;
  assign imem__T_20_addr = _T_18[11:0];
  assign imem__T_20_mask = 1'h1;
  assign imem__T_20_en = io_wr_en;
  assign _T_18 = io_imem_addr / 32'h4; // @[memory.scala 43:23:@1984.6]
  assign _T_19 = _T_18[11:0]; // @[memory.scala 43:9:@1985.6]
  assign _GEN_3 = 1'h1; // @[memory.scala 42:19:@1983.4]
  assign io_imem_rdata = imem__T_24_data; // @[memory.scala 61:17:@1992.4]
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
  for (initvar = 0; initvar < 4096; initvar = initvar+1)
    imem[initvar] = _RAND_0[31:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  imem__T_24_addr_pipe_0 = _RAND_1[11:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(imem__T_20_en & imem__T_20_mask) begin
      imem[imem__T_20_addr] <= imem__T_20_data; // @[memory.scala 32:25:@1982.4]
    end
    if (_GEN_3) begin
      imem__T_24_addr_pipe_0 <= _T_19;
    end
  end
endmodule
module BMem( // @[:@1994.2]
  input         clock, // @[:@1995.4]
  input         reset, // @[:@1996.4]
  input  [31:0] io_bmem_addr, // @[:@1997.4]
  output [31:0] io_bmem_rdata // @[:@1997.4]
);
  wire [9:0] _T_9; // @[BMEM.scala 24:26:@1999.4]
  wire [9:0] addr; // @[BMEM.scala 24:33:@2000.4]
  reg [31:0] bmem_data; // @[BMEM.scala 25:26:@2001.4]
  reg [31:0] _RAND_0;
  wire  _T_14; // @[Conditional.scala 37:30:@2002.4]
  wire  _T_17; // @[Conditional.scala 37:30:@2007.6]
  wire  _T_20; // @[Conditional.scala 37:30:@2012.8]
  wire  _T_23; // @[Conditional.scala 37:30:@2017.10]
  wire  _T_26; // @[Conditional.scala 37:30:@2022.12]
  wire  _T_29; // @[Conditional.scala 37:30:@2027.14]
  wire  _T_32; // @[Conditional.scala 37:30:@2032.16]
  wire  _T_35; // @[Conditional.scala 37:30:@2037.18]
  wire  _T_38; // @[Conditional.scala 37:30:@2042.20]
  wire  _T_41; // @[Conditional.scala 37:30:@2047.22]
  wire  _T_44; // @[Conditional.scala 37:30:@2052.24]
  wire  _T_47; // @[Conditional.scala 37:30:@2057.26]
  wire  _T_50; // @[Conditional.scala 37:30:@2062.28]
  wire  _T_53; // @[Conditional.scala 37:30:@2067.30]
  wire  _T_56; // @[Conditional.scala 37:30:@2072.32]
  wire  _T_59; // @[Conditional.scala 37:30:@2077.34]
  wire  _T_62; // @[Conditional.scala 37:30:@2082.36]
  wire  _T_65; // @[Conditional.scala 37:30:@2087.38]
  wire  _T_68; // @[Conditional.scala 37:30:@2092.40]
  wire  _T_71; // @[Conditional.scala 37:30:@2097.42]
  wire  _T_74; // @[Conditional.scala 37:30:@2102.44]
  wire  _T_77; // @[Conditional.scala 37:30:@2107.46]
  wire  _T_80; // @[Conditional.scala 37:30:@2112.48]
  wire  _T_83; // @[Conditional.scala 37:30:@2117.50]
  wire  _T_86; // @[Conditional.scala 37:30:@2122.52]
  wire  _T_89; // @[Conditional.scala 37:30:@2127.54]
  wire  _T_92; // @[Conditional.scala 37:30:@2132.56]
  wire  _T_95; // @[Conditional.scala 37:30:@2137.58]
  wire  _T_98; // @[Conditional.scala 37:30:@2142.60]
  wire  _T_101; // @[Conditional.scala 37:30:@2147.62]
  wire  _T_104; // @[Conditional.scala 37:30:@2152.64]
  wire  _T_107; // @[Conditional.scala 37:30:@2157.66]
  wire  _T_110; // @[Conditional.scala 37:30:@2162.68]
  wire  _T_113; // @[Conditional.scala 37:30:@2167.70]
  wire  _T_116; // @[Conditional.scala 37:30:@2172.72]
  wire  _T_119; // @[Conditional.scala 37:30:@2177.74]
  wire  _T_122; // @[Conditional.scala 37:30:@2182.76]
  wire  _T_125; // @[Conditional.scala 37:30:@2187.78]
  wire  _T_128; // @[Conditional.scala 37:30:@2192.80]
  wire  _T_131; // @[Conditional.scala 37:30:@2197.82]
  wire  _T_134; // @[Conditional.scala 37:30:@2202.84]
  wire  _T_137; // @[Conditional.scala 37:30:@2207.86]
  wire  _T_140; // @[Conditional.scala 37:30:@2212.88]
  wire  _T_143; // @[Conditional.scala 37:30:@2217.90]
  wire  _T_146; // @[Conditional.scala 37:30:@2222.92]
  wire  _T_149; // @[Conditional.scala 37:30:@2227.94]
  wire  _T_152; // @[Conditional.scala 37:30:@2232.96]
  wire  _T_155; // @[Conditional.scala 37:30:@2237.98]
  wire  _T_158; // @[Conditional.scala 37:30:@2242.100]
  wire  _T_161; // @[Conditional.scala 37:30:@2247.102]
  wire  _T_164; // @[Conditional.scala 37:30:@2252.104]
  wire  _T_167; // @[Conditional.scala 37:30:@2257.106]
  wire  _T_170; // @[Conditional.scala 37:30:@2262.108]
  wire  _T_173; // @[Conditional.scala 37:30:@2267.110]
  wire  _T_176; // @[Conditional.scala 37:30:@2272.112]
  wire  _T_179; // @[Conditional.scala 37:30:@2277.114]
  wire  _T_182; // @[Conditional.scala 37:30:@2282.116]
  wire  _T_185; // @[Conditional.scala 37:30:@2287.118]
  wire  _T_188; // @[Conditional.scala 37:30:@2292.120]
  wire  _T_191; // @[Conditional.scala 37:30:@2297.122]
  wire  _T_194; // @[Conditional.scala 37:30:@2302.124]
  wire  _T_197; // @[Conditional.scala 37:30:@2307.126]
  wire  _T_200; // @[Conditional.scala 37:30:@2312.128]
  wire  _T_203; // @[Conditional.scala 37:30:@2317.130]
  wire  _T_206; // @[Conditional.scala 37:30:@2322.132]
  wire  _T_209; // @[Conditional.scala 37:30:@2327.134]
  wire  _T_212; // @[Conditional.scala 37:30:@2332.136]
  wire  _T_215; // @[Conditional.scala 37:30:@2337.138]
  wire  _T_218; // @[Conditional.scala 37:30:@2342.140]
  wire  _T_221; // @[Conditional.scala 37:30:@2347.142]
  wire  _T_224; // @[Conditional.scala 37:30:@2352.144]
  wire  _T_227; // @[Conditional.scala 37:30:@2357.146]
  wire  _T_230; // @[Conditional.scala 37:30:@2362.148]
  wire  _T_233; // @[Conditional.scala 37:30:@2367.150]
  wire  _T_236; // @[Conditional.scala 37:30:@2372.152]
  wire  _T_239; // @[Conditional.scala 37:30:@2377.154]
  wire  _T_242; // @[Conditional.scala 37:30:@2382.156]
  wire  _T_245; // @[Conditional.scala 37:30:@2387.158]
  wire  _T_248; // @[Conditional.scala 37:30:@2392.160]
  wire  _T_251; // @[Conditional.scala 37:30:@2397.162]
  wire  _T_254; // @[Conditional.scala 37:30:@2402.164]
  wire  _T_257; // @[Conditional.scala 37:30:@2407.166]
  wire  _T_260; // @[Conditional.scala 37:30:@2412.168]
  wire  _T_263; // @[Conditional.scala 37:30:@2417.170]
  wire  _T_266; // @[Conditional.scala 37:30:@2422.172]
  wire  _T_269; // @[Conditional.scala 37:30:@2427.174]
  wire  _T_272; // @[Conditional.scala 37:30:@2432.176]
  wire  _T_275; // @[Conditional.scala 37:30:@2437.178]
  wire  _T_278; // @[Conditional.scala 37:30:@2442.180]
  wire  _T_281; // @[Conditional.scala 37:30:@2447.182]
  wire  _T_284; // @[Conditional.scala 37:30:@2452.184]
  wire  _T_287; // @[Conditional.scala 37:30:@2457.186]
  wire  _T_290; // @[Conditional.scala 37:30:@2462.188]
  wire  _T_293; // @[Conditional.scala 37:30:@2467.190]
  wire  _T_296; // @[Conditional.scala 37:30:@2472.192]
  wire  _T_299; // @[Conditional.scala 37:30:@2477.194]
  wire  _T_302; // @[Conditional.scala 37:30:@2482.196]
  wire  _T_305; // @[Conditional.scala 37:30:@2487.198]
  wire  _T_308; // @[Conditional.scala 37:30:@2492.200]
  wire  _T_311; // @[Conditional.scala 37:30:@2497.202]
  wire  _T_314; // @[Conditional.scala 37:30:@2502.204]
  wire  _T_317; // @[Conditional.scala 37:30:@2507.206]
  wire  _T_320; // @[Conditional.scala 37:30:@2512.208]
  wire  _T_323; // @[Conditional.scala 37:30:@2517.210]
  wire  _T_326; // @[Conditional.scala 37:30:@2522.212]
  wire  _T_329; // @[Conditional.scala 37:30:@2527.214]
  wire  _T_332; // @[Conditional.scala 37:30:@2532.216]
  wire  _T_335; // @[Conditional.scala 37:30:@2537.218]
  wire  _T_338; // @[Conditional.scala 37:30:@2542.220]
  wire  _T_341; // @[Conditional.scala 37:30:@2547.222]
  wire  _T_344; // @[Conditional.scala 37:30:@2552.224]
  wire  _T_347; // @[Conditional.scala 37:30:@2557.226]
  wire  _T_350; // @[Conditional.scala 37:30:@2562.228]
  wire  _T_353; // @[Conditional.scala 37:30:@2567.230]
  wire  _T_356; // @[Conditional.scala 37:30:@2572.232]
  wire  _T_359; // @[Conditional.scala 37:30:@2577.234]
  wire  _T_362; // @[Conditional.scala 37:30:@2582.236]
  wire  _T_365; // @[Conditional.scala 37:30:@2587.238]
  wire  _T_368; // @[Conditional.scala 37:30:@2592.240]
  wire  _T_371; // @[Conditional.scala 37:30:@2597.242]
  wire  _T_374; // @[Conditional.scala 37:30:@2602.244]
  wire  _T_377; // @[Conditional.scala 37:30:@2607.246]
  wire  _T_380; // @[Conditional.scala 37:30:@2612.248]
  wire  _T_383; // @[Conditional.scala 37:30:@2617.250]
  wire  _T_386; // @[Conditional.scala 37:30:@2622.252]
  wire  _T_389; // @[Conditional.scala 37:30:@2627.254]
  wire  _T_392; // @[Conditional.scala 37:30:@2632.256]
  wire  _T_395; // @[Conditional.scala 37:30:@2637.258]
  wire  _T_398; // @[Conditional.scala 37:30:@2642.260]
  wire  _T_401; // @[Conditional.scala 37:30:@2647.262]
  wire  _T_404; // @[Conditional.scala 37:30:@2652.264]
  wire  _T_407; // @[Conditional.scala 37:30:@2657.266]
  wire  _T_410; // @[Conditional.scala 37:30:@2662.268]
  wire  _T_413; // @[Conditional.scala 37:30:@2667.270]
  wire  _T_416; // @[Conditional.scala 37:30:@2672.272]
  wire  _T_419; // @[Conditional.scala 37:30:@2677.274]
  wire  _T_422; // @[Conditional.scala 37:30:@2682.276]
  wire  _T_425; // @[Conditional.scala 37:30:@2687.278]
  wire  _T_428; // @[Conditional.scala 37:30:@2692.280]
  wire  _T_431; // @[Conditional.scala 37:30:@2697.282]
  wire  _T_434; // @[Conditional.scala 37:30:@2702.284]
  wire  _T_437; // @[Conditional.scala 37:30:@2707.286]
  wire  _T_440; // @[Conditional.scala 37:30:@2712.288]
  wire  _T_443; // @[Conditional.scala 37:30:@2717.290]
  wire  _T_446; // @[Conditional.scala 37:30:@2722.292]
  wire  _T_449; // @[Conditional.scala 37:30:@2727.294]
  wire  _T_452; // @[Conditional.scala 37:30:@2732.296]
  wire  _T_455; // @[Conditional.scala 37:30:@2737.298]
  wire  _T_458; // @[Conditional.scala 37:30:@2742.300]
  wire  _T_461; // @[Conditional.scala 37:30:@2747.302]
  wire  _T_464; // @[Conditional.scala 37:30:@2752.304]
  wire  _T_467; // @[Conditional.scala 37:30:@2757.306]
  wire  _T_470; // @[Conditional.scala 37:30:@2762.308]
  wire  _T_473; // @[Conditional.scala 37:30:@2767.310]
  wire  _T_476; // @[Conditional.scala 37:30:@2772.312]
  wire  _T_479; // @[Conditional.scala 37:30:@2777.314]
  wire  _T_482; // @[Conditional.scala 37:30:@2782.316]
  wire  _T_485; // @[Conditional.scala 37:30:@2787.318]
  wire  _T_488; // @[Conditional.scala 37:30:@2792.320]
  wire  _T_491; // @[Conditional.scala 37:30:@2797.322]
  wire  _T_494; // @[Conditional.scala 37:30:@2802.324]
  wire  _T_497; // @[Conditional.scala 37:30:@2807.326]
  wire  _T_500; // @[Conditional.scala 37:30:@2812.328]
  wire  _T_503; // @[Conditional.scala 37:30:@2817.330]
  wire  _T_506; // @[Conditional.scala 37:30:@2822.332]
  wire  _T_509; // @[Conditional.scala 37:30:@2827.334]
  wire  _T_512; // @[Conditional.scala 37:30:@2832.336]
  wire  _T_515; // @[Conditional.scala 37:30:@2837.338]
  wire  _T_518; // @[Conditional.scala 37:30:@2842.340]
  wire  _T_521; // @[Conditional.scala 37:30:@2847.342]
  wire  _T_524; // @[Conditional.scala 37:30:@2852.344]
  wire  _T_527; // @[Conditional.scala 37:30:@2857.346]
  wire  _T_530; // @[Conditional.scala 37:30:@2862.348]
  wire  _T_533; // @[Conditional.scala 37:30:@2867.350]
  wire  _T_536; // @[Conditional.scala 37:30:@2872.352]
  wire  _T_539; // @[Conditional.scala 37:30:@2877.354]
  wire  _T_542; // @[Conditional.scala 37:30:@2882.356]
  wire  _T_545; // @[Conditional.scala 37:30:@2887.358]
  wire  _T_548; // @[Conditional.scala 37:30:@2892.360]
  wire  _T_551; // @[Conditional.scala 37:30:@2897.362]
  wire  _T_554; // @[Conditional.scala 37:30:@2902.364]
  wire  _T_557; // @[Conditional.scala 37:30:@2907.366]
  wire  _T_560; // @[Conditional.scala 37:30:@2912.368]
  wire  _T_563; // @[Conditional.scala 37:30:@2917.370]
  wire  _T_566; // @[Conditional.scala 37:30:@2922.372]
  wire  _T_569; // @[Conditional.scala 37:30:@2927.374]
  wire  _T_572; // @[Conditional.scala 37:30:@2932.376]
  wire  _T_575; // @[Conditional.scala 37:30:@2937.378]
  wire  _T_578; // @[Conditional.scala 37:30:@2942.380]
  wire  _T_581; // @[Conditional.scala 37:30:@2947.382]
  wire  _T_584; // @[Conditional.scala 37:30:@2952.384]
  wire  _T_587; // @[Conditional.scala 37:30:@2957.386]
  wire  _T_590; // @[Conditional.scala 37:30:@2962.388]
  wire  _T_593; // @[Conditional.scala 37:30:@2967.390]
  wire  _T_596; // @[Conditional.scala 37:30:@2972.392]
  wire  _T_599; // @[Conditional.scala 37:30:@2977.394]
  wire  _T_602; // @[Conditional.scala 37:30:@2982.396]
  wire  _T_605; // @[Conditional.scala 37:30:@2987.398]
  wire  _T_608; // @[Conditional.scala 37:30:@2992.400]
  wire  _T_611; // @[Conditional.scala 37:30:@2997.402]
  wire  _T_614; // @[Conditional.scala 37:30:@3002.404]
  wire  _T_617; // @[Conditional.scala 37:30:@3007.406]
  wire  _T_620; // @[Conditional.scala 37:30:@3012.408]
  wire  _T_623; // @[Conditional.scala 37:30:@3017.410]
  wire  _T_626; // @[Conditional.scala 37:30:@3022.412]
  wire  _T_629; // @[Conditional.scala 37:30:@3027.414]
  wire  _T_632; // @[Conditional.scala 37:30:@3032.416]
  wire  _T_635; // @[Conditional.scala 37:30:@3037.418]
  wire  _T_638; // @[Conditional.scala 37:30:@3042.420]
  wire  _T_641; // @[Conditional.scala 37:30:@3047.422]
  wire  _T_644; // @[Conditional.scala 37:30:@3052.424]
  wire  _T_647; // @[Conditional.scala 37:30:@3057.426]
  wire  _T_650; // @[Conditional.scala 37:30:@3062.428]
  wire  _T_653; // @[Conditional.scala 37:30:@3067.430]
  wire  _T_656; // @[Conditional.scala 37:30:@3072.432]
  wire  _T_659; // @[Conditional.scala 37:30:@3077.434]
  wire  _T_662; // @[Conditional.scala 37:30:@3082.436]
  wire  _T_665; // @[Conditional.scala 37:30:@3087.438]
  wire [31:0] _GEN_0; // @[Conditional.scala 39:67:@3088.438]
  wire [31:0] _GEN_1; // @[Conditional.scala 39:67:@3083.436]
  wire [31:0] _GEN_2; // @[Conditional.scala 39:67:@3078.434]
  wire [31:0] _GEN_3; // @[Conditional.scala 39:67:@3073.432]
  wire [31:0] _GEN_4; // @[Conditional.scala 39:67:@3068.430]
  wire [31:0] _GEN_5; // @[Conditional.scala 39:67:@3063.428]
  wire [31:0] _GEN_6; // @[Conditional.scala 39:67:@3058.426]
  wire [31:0] _GEN_7; // @[Conditional.scala 39:67:@3053.424]
  wire [31:0] _GEN_8; // @[Conditional.scala 39:67:@3048.422]
  wire [31:0] _GEN_9; // @[Conditional.scala 39:67:@3043.420]
  wire [31:0] _GEN_10; // @[Conditional.scala 39:67:@3038.418]
  wire [31:0] _GEN_11; // @[Conditional.scala 39:67:@3033.416]
  wire [31:0] _GEN_12; // @[Conditional.scala 39:67:@3028.414]
  wire [31:0] _GEN_13; // @[Conditional.scala 39:67:@3023.412]
  wire [31:0] _GEN_14; // @[Conditional.scala 39:67:@3018.410]
  wire [31:0] _GEN_15; // @[Conditional.scala 39:67:@3013.408]
  wire [31:0] _GEN_16; // @[Conditional.scala 39:67:@3008.406]
  wire [31:0] _GEN_17; // @[Conditional.scala 39:67:@3003.404]
  wire [31:0] _GEN_18; // @[Conditional.scala 39:67:@2998.402]
  wire [31:0] _GEN_19; // @[Conditional.scala 39:67:@2993.400]
  wire [31:0] _GEN_20; // @[Conditional.scala 39:67:@2988.398]
  wire [31:0] _GEN_21; // @[Conditional.scala 39:67:@2983.396]
  wire [31:0] _GEN_22; // @[Conditional.scala 39:67:@2978.394]
  wire [31:0] _GEN_23; // @[Conditional.scala 39:67:@2973.392]
  wire [31:0] _GEN_24; // @[Conditional.scala 39:67:@2968.390]
  wire [31:0] _GEN_25; // @[Conditional.scala 39:67:@2963.388]
  wire [31:0] _GEN_26; // @[Conditional.scala 39:67:@2958.386]
  wire [31:0] _GEN_27; // @[Conditional.scala 39:67:@2953.384]
  wire [31:0] _GEN_28; // @[Conditional.scala 39:67:@2948.382]
  wire [31:0] _GEN_29; // @[Conditional.scala 39:67:@2943.380]
  wire [31:0] _GEN_30; // @[Conditional.scala 39:67:@2938.378]
  wire [31:0] _GEN_31; // @[Conditional.scala 39:67:@2933.376]
  wire [31:0] _GEN_32; // @[Conditional.scala 39:67:@2928.374]
  wire [31:0] _GEN_33; // @[Conditional.scala 39:67:@2923.372]
  wire [31:0] _GEN_34; // @[Conditional.scala 39:67:@2918.370]
  wire [31:0] _GEN_35; // @[Conditional.scala 39:67:@2913.368]
  wire [31:0] _GEN_36; // @[Conditional.scala 39:67:@2908.366]
  wire [31:0] _GEN_37; // @[Conditional.scala 39:67:@2903.364]
  wire [31:0] _GEN_38; // @[Conditional.scala 39:67:@2898.362]
  wire [31:0] _GEN_39; // @[Conditional.scala 39:67:@2893.360]
  wire [31:0] _GEN_40; // @[Conditional.scala 39:67:@2888.358]
  wire [31:0] _GEN_41; // @[Conditional.scala 39:67:@2883.356]
  wire [31:0] _GEN_42; // @[Conditional.scala 39:67:@2878.354]
  wire [31:0] _GEN_43; // @[Conditional.scala 39:67:@2873.352]
  wire [31:0] _GEN_44; // @[Conditional.scala 39:67:@2868.350]
  wire [31:0] _GEN_45; // @[Conditional.scala 39:67:@2863.348]
  wire [31:0] _GEN_46; // @[Conditional.scala 39:67:@2858.346]
  wire [31:0] _GEN_47; // @[Conditional.scala 39:67:@2853.344]
  wire [31:0] _GEN_48; // @[Conditional.scala 39:67:@2848.342]
  wire [31:0] _GEN_49; // @[Conditional.scala 39:67:@2843.340]
  wire [31:0] _GEN_50; // @[Conditional.scala 39:67:@2838.338]
  wire [31:0] _GEN_51; // @[Conditional.scala 39:67:@2833.336]
  wire [31:0] _GEN_52; // @[Conditional.scala 39:67:@2828.334]
  wire [31:0] _GEN_53; // @[Conditional.scala 39:67:@2823.332]
  wire [31:0] _GEN_54; // @[Conditional.scala 39:67:@2818.330]
  wire [31:0] _GEN_55; // @[Conditional.scala 39:67:@2813.328]
  wire [31:0] _GEN_56; // @[Conditional.scala 39:67:@2808.326]
  wire [31:0] _GEN_57; // @[Conditional.scala 39:67:@2803.324]
  wire [31:0] _GEN_58; // @[Conditional.scala 39:67:@2798.322]
  wire [31:0] _GEN_59; // @[Conditional.scala 39:67:@2793.320]
  wire [31:0] _GEN_60; // @[Conditional.scala 39:67:@2788.318]
  wire [31:0] _GEN_61; // @[Conditional.scala 39:67:@2783.316]
  wire [31:0] _GEN_62; // @[Conditional.scala 39:67:@2778.314]
  wire [31:0] _GEN_63; // @[Conditional.scala 39:67:@2773.312]
  wire [31:0] _GEN_64; // @[Conditional.scala 39:67:@2768.310]
  wire [31:0] _GEN_65; // @[Conditional.scala 39:67:@2763.308]
  wire [31:0] _GEN_66; // @[Conditional.scala 39:67:@2758.306]
  wire [31:0] _GEN_67; // @[Conditional.scala 39:67:@2753.304]
  wire [31:0] _GEN_68; // @[Conditional.scala 39:67:@2748.302]
  wire [31:0] _GEN_69; // @[Conditional.scala 39:67:@2743.300]
  wire [31:0] _GEN_70; // @[Conditional.scala 39:67:@2738.298]
  wire [31:0] _GEN_71; // @[Conditional.scala 39:67:@2733.296]
  wire [31:0] _GEN_72; // @[Conditional.scala 39:67:@2728.294]
  wire [31:0] _GEN_73; // @[Conditional.scala 39:67:@2723.292]
  wire [31:0] _GEN_74; // @[Conditional.scala 39:67:@2718.290]
  wire [31:0] _GEN_75; // @[Conditional.scala 39:67:@2713.288]
  wire [31:0] _GEN_76; // @[Conditional.scala 39:67:@2708.286]
  wire [31:0] _GEN_77; // @[Conditional.scala 39:67:@2703.284]
  wire [31:0] _GEN_78; // @[Conditional.scala 39:67:@2698.282]
  wire [31:0] _GEN_79; // @[Conditional.scala 39:67:@2693.280]
  wire [31:0] _GEN_80; // @[Conditional.scala 39:67:@2688.278]
  wire [31:0] _GEN_81; // @[Conditional.scala 39:67:@2683.276]
  wire [31:0] _GEN_82; // @[Conditional.scala 39:67:@2678.274]
  wire [31:0] _GEN_83; // @[Conditional.scala 39:67:@2673.272]
  wire [31:0] _GEN_84; // @[Conditional.scala 39:67:@2668.270]
  wire [31:0] _GEN_85; // @[Conditional.scala 39:67:@2663.268]
  wire [31:0] _GEN_86; // @[Conditional.scala 39:67:@2658.266]
  wire [31:0] _GEN_87; // @[Conditional.scala 39:67:@2653.264]
  wire [31:0] _GEN_88; // @[Conditional.scala 39:67:@2648.262]
  wire [31:0] _GEN_89; // @[Conditional.scala 39:67:@2643.260]
  wire [31:0] _GEN_90; // @[Conditional.scala 39:67:@2638.258]
  wire [31:0] _GEN_91; // @[Conditional.scala 39:67:@2633.256]
  wire [31:0] _GEN_92; // @[Conditional.scala 39:67:@2628.254]
  wire [31:0] _GEN_93; // @[Conditional.scala 39:67:@2623.252]
  wire [31:0] _GEN_94; // @[Conditional.scala 39:67:@2618.250]
  wire [31:0] _GEN_95; // @[Conditional.scala 39:67:@2613.248]
  wire [31:0] _GEN_96; // @[Conditional.scala 39:67:@2608.246]
  wire [31:0] _GEN_97; // @[Conditional.scala 39:67:@2603.244]
  wire [31:0] _GEN_98; // @[Conditional.scala 39:67:@2598.242]
  wire [31:0] _GEN_99; // @[Conditional.scala 39:67:@2593.240]
  wire [31:0] _GEN_100; // @[Conditional.scala 39:67:@2588.238]
  wire [31:0] _GEN_101; // @[Conditional.scala 39:67:@2583.236]
  wire [31:0] _GEN_102; // @[Conditional.scala 39:67:@2578.234]
  wire [31:0] _GEN_103; // @[Conditional.scala 39:67:@2573.232]
  wire [31:0] _GEN_104; // @[Conditional.scala 39:67:@2568.230]
  wire [31:0] _GEN_105; // @[Conditional.scala 39:67:@2563.228]
  wire [31:0] _GEN_106; // @[Conditional.scala 39:67:@2558.226]
  wire [31:0] _GEN_107; // @[Conditional.scala 39:67:@2553.224]
  wire [31:0] _GEN_108; // @[Conditional.scala 39:67:@2548.222]
  wire [31:0] _GEN_109; // @[Conditional.scala 39:67:@2543.220]
  wire [31:0] _GEN_110; // @[Conditional.scala 39:67:@2538.218]
  wire [31:0] _GEN_111; // @[Conditional.scala 39:67:@2533.216]
  wire [31:0] _GEN_112; // @[Conditional.scala 39:67:@2528.214]
  wire [31:0] _GEN_113; // @[Conditional.scala 39:67:@2523.212]
  wire [31:0] _GEN_114; // @[Conditional.scala 39:67:@2518.210]
  wire [31:0] _GEN_115; // @[Conditional.scala 39:67:@2513.208]
  wire [31:0] _GEN_116; // @[Conditional.scala 39:67:@2508.206]
  wire [31:0] _GEN_117; // @[Conditional.scala 39:67:@2503.204]
  wire [31:0] _GEN_118; // @[Conditional.scala 39:67:@2498.202]
  wire [31:0] _GEN_119; // @[Conditional.scala 39:67:@2493.200]
  wire [31:0] _GEN_120; // @[Conditional.scala 39:67:@2488.198]
  wire [31:0] _GEN_121; // @[Conditional.scala 39:67:@2483.196]
  wire [31:0] _GEN_122; // @[Conditional.scala 39:67:@2478.194]
  wire [31:0] _GEN_123; // @[Conditional.scala 39:67:@2473.192]
  wire [31:0] _GEN_124; // @[Conditional.scala 39:67:@2468.190]
  wire [31:0] _GEN_125; // @[Conditional.scala 39:67:@2463.188]
  wire [31:0] _GEN_126; // @[Conditional.scala 39:67:@2458.186]
  wire [31:0] _GEN_127; // @[Conditional.scala 39:67:@2453.184]
  wire [31:0] _GEN_128; // @[Conditional.scala 39:67:@2448.182]
  wire [31:0] _GEN_129; // @[Conditional.scala 39:67:@2443.180]
  wire [31:0] _GEN_130; // @[Conditional.scala 39:67:@2438.178]
  wire [31:0] _GEN_131; // @[Conditional.scala 39:67:@2433.176]
  wire [31:0] _GEN_132; // @[Conditional.scala 39:67:@2428.174]
  wire [31:0] _GEN_133; // @[Conditional.scala 39:67:@2423.172]
  wire [31:0] _GEN_134; // @[Conditional.scala 39:67:@2418.170]
  wire [31:0] _GEN_135; // @[Conditional.scala 39:67:@2413.168]
  wire [31:0] _GEN_136; // @[Conditional.scala 39:67:@2408.166]
  wire [31:0] _GEN_137; // @[Conditional.scala 39:67:@2403.164]
  wire [31:0] _GEN_138; // @[Conditional.scala 39:67:@2398.162]
  wire [31:0] _GEN_139; // @[Conditional.scala 39:67:@2393.160]
  wire [31:0] _GEN_140; // @[Conditional.scala 39:67:@2388.158]
  wire [31:0] _GEN_141; // @[Conditional.scala 39:67:@2383.156]
  wire [31:0] _GEN_142; // @[Conditional.scala 39:67:@2378.154]
  wire [31:0] _GEN_143; // @[Conditional.scala 39:67:@2373.152]
  wire [31:0] _GEN_144; // @[Conditional.scala 39:67:@2368.150]
  wire [31:0] _GEN_145; // @[Conditional.scala 39:67:@2363.148]
  wire [31:0] _GEN_146; // @[Conditional.scala 39:67:@2358.146]
  wire [31:0] _GEN_147; // @[Conditional.scala 39:67:@2353.144]
  wire [31:0] _GEN_148; // @[Conditional.scala 39:67:@2348.142]
  wire [31:0] _GEN_149; // @[Conditional.scala 39:67:@2343.140]
  wire [31:0] _GEN_150; // @[Conditional.scala 39:67:@2338.138]
  wire [31:0] _GEN_151; // @[Conditional.scala 39:67:@2333.136]
  wire [31:0] _GEN_152; // @[Conditional.scala 39:67:@2328.134]
  wire [31:0] _GEN_153; // @[Conditional.scala 39:67:@2323.132]
  wire [31:0] _GEN_154; // @[Conditional.scala 39:67:@2318.130]
  wire [31:0] _GEN_155; // @[Conditional.scala 39:67:@2313.128]
  wire [31:0] _GEN_156; // @[Conditional.scala 39:67:@2308.126]
  wire [31:0] _GEN_157; // @[Conditional.scala 39:67:@2303.124]
  wire [31:0] _GEN_158; // @[Conditional.scala 39:67:@2298.122]
  wire [31:0] _GEN_159; // @[Conditional.scala 39:67:@2293.120]
  wire [31:0] _GEN_160; // @[Conditional.scala 39:67:@2288.118]
  wire [31:0] _GEN_161; // @[Conditional.scala 39:67:@2283.116]
  wire [31:0] _GEN_162; // @[Conditional.scala 39:67:@2278.114]
  wire [31:0] _GEN_163; // @[Conditional.scala 39:67:@2273.112]
  wire [31:0] _GEN_164; // @[Conditional.scala 39:67:@2268.110]
  wire [31:0] _GEN_165; // @[Conditional.scala 39:67:@2263.108]
  wire [31:0] _GEN_166; // @[Conditional.scala 39:67:@2258.106]
  wire [31:0] _GEN_167; // @[Conditional.scala 39:67:@2253.104]
  wire [31:0] _GEN_168; // @[Conditional.scala 39:67:@2248.102]
  wire [31:0] _GEN_169; // @[Conditional.scala 39:67:@2243.100]
  wire [31:0] _GEN_170; // @[Conditional.scala 39:67:@2238.98]
  wire [31:0] _GEN_171; // @[Conditional.scala 39:67:@2233.96]
  wire [31:0] _GEN_172; // @[Conditional.scala 39:67:@2228.94]
  wire [31:0] _GEN_173; // @[Conditional.scala 39:67:@2223.92]
  wire [31:0] _GEN_174; // @[Conditional.scala 39:67:@2218.90]
  wire [31:0] _GEN_175; // @[Conditional.scala 39:67:@2213.88]
  wire [31:0] _GEN_176; // @[Conditional.scala 39:67:@2208.86]
  wire [31:0] _GEN_177; // @[Conditional.scala 39:67:@2203.84]
  wire [31:0] _GEN_178; // @[Conditional.scala 39:67:@2198.82]
  wire [31:0] _GEN_179; // @[Conditional.scala 39:67:@2193.80]
  wire [31:0] _GEN_180; // @[Conditional.scala 39:67:@2188.78]
  wire [31:0] _GEN_181; // @[Conditional.scala 39:67:@2183.76]
  wire [31:0] _GEN_182; // @[Conditional.scala 39:67:@2178.74]
  wire [31:0] _GEN_183; // @[Conditional.scala 39:67:@2173.72]
  wire [31:0] _GEN_184; // @[Conditional.scala 39:67:@2168.70]
  wire [31:0] _GEN_185; // @[Conditional.scala 39:67:@2163.68]
  wire [31:0] _GEN_186; // @[Conditional.scala 39:67:@2158.66]
  wire [31:0] _GEN_187; // @[Conditional.scala 39:67:@2153.64]
  wire [31:0] _GEN_188; // @[Conditional.scala 39:67:@2148.62]
  wire [31:0] _GEN_189; // @[Conditional.scala 39:67:@2143.60]
  wire [31:0] _GEN_190; // @[Conditional.scala 39:67:@2138.58]
  wire [31:0] _GEN_191; // @[Conditional.scala 39:67:@2133.56]
  wire [31:0] _GEN_192; // @[Conditional.scala 39:67:@2128.54]
  wire [31:0] _GEN_193; // @[Conditional.scala 39:67:@2123.52]
  wire [31:0] _GEN_194; // @[Conditional.scala 39:67:@2118.50]
  wire [31:0] _GEN_195; // @[Conditional.scala 39:67:@2113.48]
  wire [31:0] _GEN_196; // @[Conditional.scala 39:67:@2108.46]
  wire [31:0] _GEN_197; // @[Conditional.scala 39:67:@2103.44]
  wire [31:0] _GEN_198; // @[Conditional.scala 39:67:@2098.42]
  wire [31:0] _GEN_199; // @[Conditional.scala 39:67:@2093.40]
  wire [31:0] _GEN_200; // @[Conditional.scala 39:67:@2088.38]
  wire [31:0] _GEN_201; // @[Conditional.scala 39:67:@2083.36]
  wire [31:0] _GEN_202; // @[Conditional.scala 39:67:@2078.34]
  wire [31:0] _GEN_203; // @[Conditional.scala 39:67:@2073.32]
  wire [31:0] _GEN_204; // @[Conditional.scala 39:67:@2068.30]
  wire [31:0] _GEN_205; // @[Conditional.scala 39:67:@2063.28]
  wire [31:0] _GEN_206; // @[Conditional.scala 39:67:@2058.26]
  wire [31:0] _GEN_207; // @[Conditional.scala 39:67:@2053.24]
  wire [31:0] _GEN_208; // @[Conditional.scala 39:67:@2048.22]
  wire [31:0] _GEN_209; // @[Conditional.scala 39:67:@2043.20]
  wire [31:0] _GEN_210; // @[Conditional.scala 39:67:@2038.18]
  wire [31:0] _GEN_211; // @[Conditional.scala 39:67:@2033.16]
  wire [31:0] _GEN_212; // @[Conditional.scala 39:67:@2028.14]
  wire [31:0] _GEN_213; // @[Conditional.scala 39:67:@2023.12]
  wire [31:0] _GEN_214; // @[Conditional.scala 39:67:@2018.10]
  wire [31:0] _GEN_215; // @[Conditional.scala 39:67:@2013.8]
  wire [31:0] _GEN_216; // @[Conditional.scala 39:67:@2008.6]
  wire [31:0] _GEN_217; // @[Conditional.scala 40:58:@2003.4]
  assign _T_9 = io_bmem_addr[9:0]; // @[BMEM.scala 24:26:@1999.4]
  assign addr = _T_9 / 10'h4; // @[BMEM.scala 24:33:@2000.4]
  assign _T_14 = 10'h0 == addr; // @[Conditional.scala 37:30:@2002.4]
  assign _T_17 = 10'h1 == addr; // @[Conditional.scala 37:30:@2007.6]
  assign _T_20 = 10'h2 == addr; // @[Conditional.scala 37:30:@2012.8]
  assign _T_23 = 10'h3 == addr; // @[Conditional.scala 37:30:@2017.10]
  assign _T_26 = 10'h4 == addr; // @[Conditional.scala 37:30:@2022.12]
  assign _T_29 = 10'h5 == addr; // @[Conditional.scala 37:30:@2027.14]
  assign _T_32 = 10'h6 == addr; // @[Conditional.scala 37:30:@2032.16]
  assign _T_35 = 10'h7 == addr; // @[Conditional.scala 37:30:@2037.18]
  assign _T_38 = 10'h8 == addr; // @[Conditional.scala 37:30:@2042.20]
  assign _T_41 = 10'h9 == addr; // @[Conditional.scala 37:30:@2047.22]
  assign _T_44 = 10'ha == addr; // @[Conditional.scala 37:30:@2052.24]
  assign _T_47 = 10'hb == addr; // @[Conditional.scala 37:30:@2057.26]
  assign _T_50 = 10'hc == addr; // @[Conditional.scala 37:30:@2062.28]
  assign _T_53 = 10'hd == addr; // @[Conditional.scala 37:30:@2067.30]
  assign _T_56 = 10'he == addr; // @[Conditional.scala 37:30:@2072.32]
  assign _T_59 = 10'hf == addr; // @[Conditional.scala 37:30:@2077.34]
  assign _T_62 = 10'h10 == addr; // @[Conditional.scala 37:30:@2082.36]
  assign _T_65 = 10'h11 == addr; // @[Conditional.scala 37:30:@2087.38]
  assign _T_68 = 10'h12 == addr; // @[Conditional.scala 37:30:@2092.40]
  assign _T_71 = 10'h13 == addr; // @[Conditional.scala 37:30:@2097.42]
  assign _T_74 = 10'h14 == addr; // @[Conditional.scala 37:30:@2102.44]
  assign _T_77 = 10'h15 == addr; // @[Conditional.scala 37:30:@2107.46]
  assign _T_80 = 10'h16 == addr; // @[Conditional.scala 37:30:@2112.48]
  assign _T_83 = 10'h17 == addr; // @[Conditional.scala 37:30:@2117.50]
  assign _T_86 = 10'h18 == addr; // @[Conditional.scala 37:30:@2122.52]
  assign _T_89 = 10'h19 == addr; // @[Conditional.scala 37:30:@2127.54]
  assign _T_92 = 10'h1a == addr; // @[Conditional.scala 37:30:@2132.56]
  assign _T_95 = 10'h1b == addr; // @[Conditional.scala 37:30:@2137.58]
  assign _T_98 = 10'h1c == addr; // @[Conditional.scala 37:30:@2142.60]
  assign _T_101 = 10'h1d == addr; // @[Conditional.scala 37:30:@2147.62]
  assign _T_104 = 10'h1e == addr; // @[Conditional.scala 37:30:@2152.64]
  assign _T_107 = 10'h1f == addr; // @[Conditional.scala 37:30:@2157.66]
  assign _T_110 = 10'h20 == addr; // @[Conditional.scala 37:30:@2162.68]
  assign _T_113 = 10'h21 == addr; // @[Conditional.scala 37:30:@2167.70]
  assign _T_116 = 10'h22 == addr; // @[Conditional.scala 37:30:@2172.72]
  assign _T_119 = 10'h23 == addr; // @[Conditional.scala 37:30:@2177.74]
  assign _T_122 = 10'h24 == addr; // @[Conditional.scala 37:30:@2182.76]
  assign _T_125 = 10'h25 == addr; // @[Conditional.scala 37:30:@2187.78]
  assign _T_128 = 10'h26 == addr; // @[Conditional.scala 37:30:@2192.80]
  assign _T_131 = 10'h27 == addr; // @[Conditional.scala 37:30:@2197.82]
  assign _T_134 = 10'h28 == addr; // @[Conditional.scala 37:30:@2202.84]
  assign _T_137 = 10'h29 == addr; // @[Conditional.scala 37:30:@2207.86]
  assign _T_140 = 10'h2a == addr; // @[Conditional.scala 37:30:@2212.88]
  assign _T_143 = 10'h2b == addr; // @[Conditional.scala 37:30:@2217.90]
  assign _T_146 = 10'h2c == addr; // @[Conditional.scala 37:30:@2222.92]
  assign _T_149 = 10'h2d == addr; // @[Conditional.scala 37:30:@2227.94]
  assign _T_152 = 10'h2e == addr; // @[Conditional.scala 37:30:@2232.96]
  assign _T_155 = 10'h2f == addr; // @[Conditional.scala 37:30:@2237.98]
  assign _T_158 = 10'h30 == addr; // @[Conditional.scala 37:30:@2242.100]
  assign _T_161 = 10'h31 == addr; // @[Conditional.scala 37:30:@2247.102]
  assign _T_164 = 10'h32 == addr; // @[Conditional.scala 37:30:@2252.104]
  assign _T_167 = 10'h33 == addr; // @[Conditional.scala 37:30:@2257.106]
  assign _T_170 = 10'h34 == addr; // @[Conditional.scala 37:30:@2262.108]
  assign _T_173 = 10'h35 == addr; // @[Conditional.scala 37:30:@2267.110]
  assign _T_176 = 10'h36 == addr; // @[Conditional.scala 37:30:@2272.112]
  assign _T_179 = 10'h37 == addr; // @[Conditional.scala 37:30:@2277.114]
  assign _T_182 = 10'h38 == addr; // @[Conditional.scala 37:30:@2282.116]
  assign _T_185 = 10'h39 == addr; // @[Conditional.scala 37:30:@2287.118]
  assign _T_188 = 10'h3a == addr; // @[Conditional.scala 37:30:@2292.120]
  assign _T_191 = 10'h3b == addr; // @[Conditional.scala 37:30:@2297.122]
  assign _T_194 = 10'h3c == addr; // @[Conditional.scala 37:30:@2302.124]
  assign _T_197 = 10'h3d == addr; // @[Conditional.scala 37:30:@2307.126]
  assign _T_200 = 10'h3e == addr; // @[Conditional.scala 37:30:@2312.128]
  assign _T_203 = 10'h3f == addr; // @[Conditional.scala 37:30:@2317.130]
  assign _T_206 = 10'h40 == addr; // @[Conditional.scala 37:30:@2322.132]
  assign _T_209 = 10'h41 == addr; // @[Conditional.scala 37:30:@2327.134]
  assign _T_212 = 10'h42 == addr; // @[Conditional.scala 37:30:@2332.136]
  assign _T_215 = 10'h43 == addr; // @[Conditional.scala 37:30:@2337.138]
  assign _T_218 = 10'h44 == addr; // @[Conditional.scala 37:30:@2342.140]
  assign _T_221 = 10'h45 == addr; // @[Conditional.scala 37:30:@2347.142]
  assign _T_224 = 10'h46 == addr; // @[Conditional.scala 37:30:@2352.144]
  assign _T_227 = 10'h47 == addr; // @[Conditional.scala 37:30:@2357.146]
  assign _T_230 = 10'h48 == addr; // @[Conditional.scala 37:30:@2362.148]
  assign _T_233 = 10'h49 == addr; // @[Conditional.scala 37:30:@2367.150]
  assign _T_236 = 10'h4a == addr; // @[Conditional.scala 37:30:@2372.152]
  assign _T_239 = 10'h4b == addr; // @[Conditional.scala 37:30:@2377.154]
  assign _T_242 = 10'h4c == addr; // @[Conditional.scala 37:30:@2382.156]
  assign _T_245 = 10'h4d == addr; // @[Conditional.scala 37:30:@2387.158]
  assign _T_248 = 10'h4e == addr; // @[Conditional.scala 37:30:@2392.160]
  assign _T_251 = 10'h4f == addr; // @[Conditional.scala 37:30:@2397.162]
  assign _T_254 = 10'h50 == addr; // @[Conditional.scala 37:30:@2402.164]
  assign _T_257 = 10'h51 == addr; // @[Conditional.scala 37:30:@2407.166]
  assign _T_260 = 10'h52 == addr; // @[Conditional.scala 37:30:@2412.168]
  assign _T_263 = 10'h53 == addr; // @[Conditional.scala 37:30:@2417.170]
  assign _T_266 = 10'h54 == addr; // @[Conditional.scala 37:30:@2422.172]
  assign _T_269 = 10'h55 == addr; // @[Conditional.scala 37:30:@2427.174]
  assign _T_272 = 10'h56 == addr; // @[Conditional.scala 37:30:@2432.176]
  assign _T_275 = 10'h57 == addr; // @[Conditional.scala 37:30:@2437.178]
  assign _T_278 = 10'h58 == addr; // @[Conditional.scala 37:30:@2442.180]
  assign _T_281 = 10'h59 == addr; // @[Conditional.scala 37:30:@2447.182]
  assign _T_284 = 10'h5a == addr; // @[Conditional.scala 37:30:@2452.184]
  assign _T_287 = 10'h5b == addr; // @[Conditional.scala 37:30:@2457.186]
  assign _T_290 = 10'h5c == addr; // @[Conditional.scala 37:30:@2462.188]
  assign _T_293 = 10'h5d == addr; // @[Conditional.scala 37:30:@2467.190]
  assign _T_296 = 10'h5e == addr; // @[Conditional.scala 37:30:@2472.192]
  assign _T_299 = 10'h5f == addr; // @[Conditional.scala 37:30:@2477.194]
  assign _T_302 = 10'h60 == addr; // @[Conditional.scala 37:30:@2482.196]
  assign _T_305 = 10'h61 == addr; // @[Conditional.scala 37:30:@2487.198]
  assign _T_308 = 10'h62 == addr; // @[Conditional.scala 37:30:@2492.200]
  assign _T_311 = 10'h63 == addr; // @[Conditional.scala 37:30:@2497.202]
  assign _T_314 = 10'h64 == addr; // @[Conditional.scala 37:30:@2502.204]
  assign _T_317 = 10'h65 == addr; // @[Conditional.scala 37:30:@2507.206]
  assign _T_320 = 10'h66 == addr; // @[Conditional.scala 37:30:@2512.208]
  assign _T_323 = 10'h67 == addr; // @[Conditional.scala 37:30:@2517.210]
  assign _T_326 = 10'h68 == addr; // @[Conditional.scala 37:30:@2522.212]
  assign _T_329 = 10'h69 == addr; // @[Conditional.scala 37:30:@2527.214]
  assign _T_332 = 10'h6a == addr; // @[Conditional.scala 37:30:@2532.216]
  assign _T_335 = 10'h6b == addr; // @[Conditional.scala 37:30:@2537.218]
  assign _T_338 = 10'h6c == addr; // @[Conditional.scala 37:30:@2542.220]
  assign _T_341 = 10'h6d == addr; // @[Conditional.scala 37:30:@2547.222]
  assign _T_344 = 10'h6e == addr; // @[Conditional.scala 37:30:@2552.224]
  assign _T_347 = 10'h6f == addr; // @[Conditional.scala 37:30:@2557.226]
  assign _T_350 = 10'h70 == addr; // @[Conditional.scala 37:30:@2562.228]
  assign _T_353 = 10'h71 == addr; // @[Conditional.scala 37:30:@2567.230]
  assign _T_356 = 10'h72 == addr; // @[Conditional.scala 37:30:@2572.232]
  assign _T_359 = 10'h73 == addr; // @[Conditional.scala 37:30:@2577.234]
  assign _T_362 = 10'h74 == addr; // @[Conditional.scala 37:30:@2582.236]
  assign _T_365 = 10'h75 == addr; // @[Conditional.scala 37:30:@2587.238]
  assign _T_368 = 10'h76 == addr; // @[Conditional.scala 37:30:@2592.240]
  assign _T_371 = 10'h77 == addr; // @[Conditional.scala 37:30:@2597.242]
  assign _T_374 = 10'h78 == addr; // @[Conditional.scala 37:30:@2602.244]
  assign _T_377 = 10'h79 == addr; // @[Conditional.scala 37:30:@2607.246]
  assign _T_380 = 10'h7a == addr; // @[Conditional.scala 37:30:@2612.248]
  assign _T_383 = 10'h7b == addr; // @[Conditional.scala 37:30:@2617.250]
  assign _T_386 = 10'h7c == addr; // @[Conditional.scala 37:30:@2622.252]
  assign _T_389 = 10'h7d == addr; // @[Conditional.scala 37:30:@2627.254]
  assign _T_392 = 10'h7e == addr; // @[Conditional.scala 37:30:@2632.256]
  assign _T_395 = 10'h7f == addr; // @[Conditional.scala 37:30:@2637.258]
  assign _T_398 = 10'h80 == addr; // @[Conditional.scala 37:30:@2642.260]
  assign _T_401 = 10'h81 == addr; // @[Conditional.scala 37:30:@2647.262]
  assign _T_404 = 10'h82 == addr; // @[Conditional.scala 37:30:@2652.264]
  assign _T_407 = 10'h83 == addr; // @[Conditional.scala 37:30:@2657.266]
  assign _T_410 = 10'h84 == addr; // @[Conditional.scala 37:30:@2662.268]
  assign _T_413 = 10'h85 == addr; // @[Conditional.scala 37:30:@2667.270]
  assign _T_416 = 10'h86 == addr; // @[Conditional.scala 37:30:@2672.272]
  assign _T_419 = 10'h87 == addr; // @[Conditional.scala 37:30:@2677.274]
  assign _T_422 = 10'h88 == addr; // @[Conditional.scala 37:30:@2682.276]
  assign _T_425 = 10'h89 == addr; // @[Conditional.scala 37:30:@2687.278]
  assign _T_428 = 10'h8a == addr; // @[Conditional.scala 37:30:@2692.280]
  assign _T_431 = 10'h8b == addr; // @[Conditional.scala 37:30:@2697.282]
  assign _T_434 = 10'h8c == addr; // @[Conditional.scala 37:30:@2702.284]
  assign _T_437 = 10'h8d == addr; // @[Conditional.scala 37:30:@2707.286]
  assign _T_440 = 10'h8e == addr; // @[Conditional.scala 37:30:@2712.288]
  assign _T_443 = 10'h8f == addr; // @[Conditional.scala 37:30:@2717.290]
  assign _T_446 = 10'h90 == addr; // @[Conditional.scala 37:30:@2722.292]
  assign _T_449 = 10'h91 == addr; // @[Conditional.scala 37:30:@2727.294]
  assign _T_452 = 10'h92 == addr; // @[Conditional.scala 37:30:@2732.296]
  assign _T_455 = 10'h93 == addr; // @[Conditional.scala 37:30:@2737.298]
  assign _T_458 = 10'h94 == addr; // @[Conditional.scala 37:30:@2742.300]
  assign _T_461 = 10'h95 == addr; // @[Conditional.scala 37:30:@2747.302]
  assign _T_464 = 10'h96 == addr; // @[Conditional.scala 37:30:@2752.304]
  assign _T_467 = 10'h97 == addr; // @[Conditional.scala 37:30:@2757.306]
  assign _T_470 = 10'h98 == addr; // @[Conditional.scala 37:30:@2762.308]
  assign _T_473 = 10'h99 == addr; // @[Conditional.scala 37:30:@2767.310]
  assign _T_476 = 10'h9a == addr; // @[Conditional.scala 37:30:@2772.312]
  assign _T_479 = 10'h9b == addr; // @[Conditional.scala 37:30:@2777.314]
  assign _T_482 = 10'h9c == addr; // @[Conditional.scala 37:30:@2782.316]
  assign _T_485 = 10'h9d == addr; // @[Conditional.scala 37:30:@2787.318]
  assign _T_488 = 10'h9e == addr; // @[Conditional.scala 37:30:@2792.320]
  assign _T_491 = 10'h9f == addr; // @[Conditional.scala 37:30:@2797.322]
  assign _T_494 = 10'ha0 == addr; // @[Conditional.scala 37:30:@2802.324]
  assign _T_497 = 10'ha1 == addr; // @[Conditional.scala 37:30:@2807.326]
  assign _T_500 = 10'ha2 == addr; // @[Conditional.scala 37:30:@2812.328]
  assign _T_503 = 10'ha3 == addr; // @[Conditional.scala 37:30:@2817.330]
  assign _T_506 = 10'ha4 == addr; // @[Conditional.scala 37:30:@2822.332]
  assign _T_509 = 10'ha5 == addr; // @[Conditional.scala 37:30:@2827.334]
  assign _T_512 = 10'ha6 == addr; // @[Conditional.scala 37:30:@2832.336]
  assign _T_515 = 10'ha7 == addr; // @[Conditional.scala 37:30:@2837.338]
  assign _T_518 = 10'ha8 == addr; // @[Conditional.scala 37:30:@2842.340]
  assign _T_521 = 10'ha9 == addr; // @[Conditional.scala 37:30:@2847.342]
  assign _T_524 = 10'haa == addr; // @[Conditional.scala 37:30:@2852.344]
  assign _T_527 = 10'hab == addr; // @[Conditional.scala 37:30:@2857.346]
  assign _T_530 = 10'hac == addr; // @[Conditional.scala 37:30:@2862.348]
  assign _T_533 = 10'had == addr; // @[Conditional.scala 37:30:@2867.350]
  assign _T_536 = 10'hae == addr; // @[Conditional.scala 37:30:@2872.352]
  assign _T_539 = 10'haf == addr; // @[Conditional.scala 37:30:@2877.354]
  assign _T_542 = 10'hb0 == addr; // @[Conditional.scala 37:30:@2882.356]
  assign _T_545 = 10'hb1 == addr; // @[Conditional.scala 37:30:@2887.358]
  assign _T_548 = 10'hb2 == addr; // @[Conditional.scala 37:30:@2892.360]
  assign _T_551 = 10'hb3 == addr; // @[Conditional.scala 37:30:@2897.362]
  assign _T_554 = 10'hb4 == addr; // @[Conditional.scala 37:30:@2902.364]
  assign _T_557 = 10'hb5 == addr; // @[Conditional.scala 37:30:@2907.366]
  assign _T_560 = 10'hb6 == addr; // @[Conditional.scala 37:30:@2912.368]
  assign _T_563 = 10'hb7 == addr; // @[Conditional.scala 37:30:@2917.370]
  assign _T_566 = 10'hb8 == addr; // @[Conditional.scala 37:30:@2922.372]
  assign _T_569 = 10'hb9 == addr; // @[Conditional.scala 37:30:@2927.374]
  assign _T_572 = 10'hba == addr; // @[Conditional.scala 37:30:@2932.376]
  assign _T_575 = 10'hbb == addr; // @[Conditional.scala 37:30:@2937.378]
  assign _T_578 = 10'hbc == addr; // @[Conditional.scala 37:30:@2942.380]
  assign _T_581 = 10'hbd == addr; // @[Conditional.scala 37:30:@2947.382]
  assign _T_584 = 10'hbe == addr; // @[Conditional.scala 37:30:@2952.384]
  assign _T_587 = 10'hbf == addr; // @[Conditional.scala 37:30:@2957.386]
  assign _T_590 = 10'hc0 == addr; // @[Conditional.scala 37:30:@2962.388]
  assign _T_593 = 10'hc1 == addr; // @[Conditional.scala 37:30:@2967.390]
  assign _T_596 = 10'hc2 == addr; // @[Conditional.scala 37:30:@2972.392]
  assign _T_599 = 10'hc3 == addr; // @[Conditional.scala 37:30:@2977.394]
  assign _T_602 = 10'hc4 == addr; // @[Conditional.scala 37:30:@2982.396]
  assign _T_605 = 10'hc5 == addr; // @[Conditional.scala 37:30:@2987.398]
  assign _T_608 = 10'hc6 == addr; // @[Conditional.scala 37:30:@2992.400]
  assign _T_611 = 10'hc7 == addr; // @[Conditional.scala 37:30:@2997.402]
  assign _T_614 = 10'hc8 == addr; // @[Conditional.scala 37:30:@3002.404]
  assign _T_617 = 10'hc9 == addr; // @[Conditional.scala 37:30:@3007.406]
  assign _T_620 = 10'hca == addr; // @[Conditional.scala 37:30:@3012.408]
  assign _T_623 = 10'hcb == addr; // @[Conditional.scala 37:30:@3017.410]
  assign _T_626 = 10'hcc == addr; // @[Conditional.scala 37:30:@3022.412]
  assign _T_629 = 10'hcd == addr; // @[Conditional.scala 37:30:@3027.414]
  assign _T_632 = 10'hce == addr; // @[Conditional.scala 37:30:@3032.416]
  assign _T_635 = 10'hcf == addr; // @[Conditional.scala 37:30:@3037.418]
  assign _T_638 = 10'hd0 == addr; // @[Conditional.scala 37:30:@3042.420]
  assign _T_641 = 10'hd1 == addr; // @[Conditional.scala 37:30:@3047.422]
  assign _T_644 = 10'hd2 == addr; // @[Conditional.scala 37:30:@3052.424]
  assign _T_647 = 10'hd3 == addr; // @[Conditional.scala 37:30:@3057.426]
  assign _T_650 = 10'hd4 == addr; // @[Conditional.scala 37:30:@3062.428]
  assign _T_653 = 10'hd5 == addr; // @[Conditional.scala 37:30:@3067.430]
  assign _T_656 = 10'hd6 == addr; // @[Conditional.scala 37:30:@3072.432]
  assign _T_659 = 10'hd7 == addr; // @[Conditional.scala 37:30:@3077.434]
  assign _T_662 = 10'hd8 == addr; // @[Conditional.scala 37:30:@3082.436]
  assign _T_665 = 10'hd9 == addr; // @[Conditional.scala 37:30:@3087.438]
  assign _GEN_0 = _T_665 ? 32'h8067 : bmem_data; // @[Conditional.scala 39:67:@3088.438]
  assign _GEN_1 = _T_662 ? 32'h3010113 : _GEN_0; // @[Conditional.scala 39:67:@3083.436]
  assign _GEN_2 = _T_659 ? 32'h2812403 : _GEN_1; // @[Conditional.scala 39:67:@3078.434]
  assign _GEN_3 = _T_656 ? 32'h2c12083 : _GEN_2; // @[Conditional.scala 39:67:@3073.432]
  assign _GEN_4 = _T_653 ? 32'h13 : _GEN_3; // @[Conditional.scala 39:67:@3068.430]
  assign _GEN_5 = _T_650 ? 32'hfc07dce3 : _GEN_4; // @[Conditional.scala 39:67:@3063.428]
  assign _GEN_6 = _T_647 ? 32'hfec42783 : _GEN_5; // @[Conditional.scala 39:67:@3058.426]
  assign _GEN_7 = _T_644 ? 32'hfef42623 : _GEN_6; // @[Conditional.scala 39:67:@3053.424]
  assign _GEN_8 = _T_641 ? 32'hfff78793 : _GEN_7; // @[Conditional.scala 39:67:@3048.422]
  assign _GEN_9 = _T_638 ? 32'hfec42783 : _GEN_8; // @[Conditional.scala 39:67:@3043.420]
  assign _GEN_10 = _T_635 ? 32'hd25ff0ef : _GEN_9; // @[Conditional.scala 39:67:@3038.418]
  assign _GEN_11 = _T_632 ? 32'h78513 : _GEN_10; // @[Conditional.scala 39:67:@3033.416]
  assign _GEN_12 = _T_629 ? 32'hff87c783 : _GEN_11; // @[Conditional.scala 39:67:@3028.414]
  assign _GEN_13 = _T_626 ? 32'hf707b3 : _GEN_12; // @[Conditional.scala 39:67:@3023.412]
  assign _GEN_14 = _T_623 ? 32'hff040713 : _GEN_13; // @[Conditional.scala 39:67:@3018.410]
  assign _GEN_15 = _T_620 ? 32'hfec42783 : _GEN_14; // @[Conditional.scala 39:67:@3013.408]
  assign _GEN_16 = _T_617 ? 32'h280006f : _GEN_15; // @[Conditional.scala 39:67:@3008.406]
  assign _GEN_17 = _T_614 ? 32'hfef42623 : _GEN_16; // @[Conditional.scala 39:67:@3003.404]
  assign _GEN_18 = _T_611 ? 32'h200793 : _GEN_17; // @[Conditional.scala 39:67:@2998.402]
  assign _GEN_19 = _T_608 ? 32'hfef42423 : _GEN_18; // @[Conditional.scala 39:67:@2993.400]
  assign _GEN_20 = _T_605 ? 32'hfdc42783 : _GEN_19; // @[Conditional.scala 39:67:@2988.398]
  assign _GEN_21 = _T_602 ? 32'hfca42e23 : _GEN_20; // @[Conditional.scala 39:67:@2983.396]
  assign _GEN_22 = _T_599 ? 32'h3010413 : _GEN_21; // @[Conditional.scala 39:67:@2978.394]
  assign _GEN_23 = _T_596 ? 32'h2812423 : _GEN_22; // @[Conditional.scala 39:67:@2973.392]
  assign _GEN_24 = _T_593 ? 32'h2112623 : _GEN_23; // @[Conditional.scala 39:67:@2968.390]
  assign _GEN_25 = _T_590 ? 32'hfd010113 : _GEN_24; // @[Conditional.scala 39:67:@2963.388]
  assign _GEN_26 = _T_587 ? 32'h8067 : _GEN_25; // @[Conditional.scala 39:67:@2958.386]
  assign _GEN_27 = _T_584 ? 32'h3010113 : _GEN_26; // @[Conditional.scala 39:67:@2953.384]
  assign _GEN_28 = _T_581 ? 32'h2812403 : _GEN_27; // @[Conditional.scala 39:67:@2948.382]
  assign _GEN_29 = _T_578 ? 32'h2c12083 : _GEN_28; // @[Conditional.scala 39:67:@2943.380]
  assign _GEN_30 = _T_575 ? 32'h78513 : _GEN_29; // @[Conditional.scala 39:67:@2938.378]
  assign _GEN_31 = _T_572 ? 32'hfe842783 : _GEN_30; // @[Conditional.scala 39:67:@2933.376]
  assign _GEN_32 = _T_569 ? 32'he782a3 : _GEN_31; // @[Conditional.scala 39:67:@2928.374]
  assign _GEN_33 = _T_566 ? 32'hff77713 : _GEN_32; // @[Conditional.scala 39:67:@2923.372]
  assign _GEN_34 = _T_563 ? 32'hffe77713 : _GEN_33; // @[Conditional.scala 39:67:@2918.370]
  assign _GEN_35 = _T_560 ? 32'h37b7 : _GEN_34; // @[Conditional.scala 39:67:@2913.368]
  assign _GEN_36 = _T_557 ? 32'hff7f713 : _GEN_35; // @[Conditional.scala 39:67:@2908.366]
  assign _GEN_37 = _T_554 ? 32'h57c783 : _GEN_36; // @[Conditional.scala 39:67:@2903.364]
  assign _GEN_38 = _T_551 ? 32'h37b7 : _GEN_37; // @[Conditional.scala 39:67:@2898.362]
  assign _GEN_39 = _T_548 ? 32'hfce7f6e3 : _GEN_38; // @[Conditional.scala 39:67:@2893.360]
  assign _GEN_40 = _T_545 ? 32'h300793 : _GEN_39; // @[Conditional.scala 39:67:@2888.358]
  assign _GEN_41 = _T_542 ? 32'hfec42703 : _GEN_40; // @[Conditional.scala 39:67:@2883.356]
  assign _GEN_42 = _T_539 ? 32'hfef42623 : _GEN_41; // @[Conditional.scala 39:67:@2878.354]
  assign _GEN_43 = _T_536 ? 32'h178793 : _GEN_42; // @[Conditional.scala 39:67:@2873.352]
  assign _GEN_44 = _T_533 ? 32'hfec42783 : _GEN_43; // @[Conditional.scala 39:67:@2868.350]
  assign _GEN_45 = _T_530 ? 32'hfee78c23 : _GEN_44; // @[Conditional.scala 39:67:@2863.348]
  assign _GEN_46 = _T_527 ? 32'hf687b3 : _GEN_45; // @[Conditional.scala 39:67:@2858.346]
  assign _GEN_47 = _T_524 ? 32'hff040693 : _GEN_46; // @[Conditional.scala 39:67:@2853.344]
  assign _GEN_48 = _T_521 ? 32'hfec42783 : _GEN_47; // @[Conditional.scala 39:67:@2848.342]
  assign _GEN_49 = _T_518 ? 32'h78713 : _GEN_48; // @[Conditional.scala 39:67:@2843.340]
  assign _GEN_50 = _T_515 ? 32'h50793 : _GEN_49; // @[Conditional.scala 39:67:@2838.338]
  assign _GEN_51 = _T_512 ? 32'hdc9ff0ef : _GEN_50; // @[Conditional.scala 39:67:@2833.336]
  assign _GEN_52 = _T_509 ? 32'h513 : _GEN_51; // @[Conditional.scala 39:67:@2828.334]
  assign _GEN_53 = _T_506 ? 32'h300006f : _GEN_52; // @[Conditional.scala 39:67:@2823.332]
  assign _GEN_54 = _T_503 ? 32'hfe042623 : _GEN_53; // @[Conditional.scala 39:67:@2818.330]
  assign _GEN_55 = _T_500 ? 32'h78000ef : _GEN_54; // @[Conditional.scala 39:67:@2813.328]
  assign _GEN_56 = _T_497 ? 32'hfdc42503 : _GEN_55; // @[Conditional.scala 39:67:@2808.326]
  assign _GEN_57 = _T_494 ? 32'hde1ff0ef : _GEN_56; // @[Conditional.scala 39:67:@2803.324]
  assign _GEN_58 = _T_491 ? 32'h300513 : _GEN_57; // @[Conditional.scala 39:67:@2798.322]
  assign _GEN_59 = _T_488 ? 32'he782a3 : _GEN_58; // @[Conditional.scala 39:67:@2793.320]
  assign _GEN_60 = _T_485 ? 32'hff77713 : _GEN_59; // @[Conditional.scala 39:67:@2788.318]
  assign _GEN_61 = _T_482 ? 32'h176713 : _GEN_60; // @[Conditional.scala 39:67:@2783.316]
  assign _GEN_62 = _T_479 ? 32'h37b7 : _GEN_61; // @[Conditional.scala 39:67:@2778.314]
  assign _GEN_63 = _T_476 ? 32'hff7f713 : _GEN_62; // @[Conditional.scala 39:67:@2773.312]
  assign _GEN_64 = _T_473 ? 32'h57c783 : _GEN_63; // @[Conditional.scala 39:67:@2768.310]
  assign _GEN_65 = _T_470 ? 32'h37b7 : _GEN_64; // @[Conditional.scala 39:67:@2763.308]
  assign _GEN_66 = _T_467 ? 32'hfca42e23 : _GEN_65; // @[Conditional.scala 39:67:@2758.306]
  assign _GEN_67 = _T_464 ? 32'h3010413 : _GEN_66; // @[Conditional.scala 39:67:@2753.304]
  assign _GEN_68 = _T_461 ? 32'h2812423 : _GEN_67; // @[Conditional.scala 39:67:@2748.302]
  assign _GEN_69 = _T_458 ? 32'h2112623 : _GEN_68; // @[Conditional.scala 39:67:@2743.300]
  assign _GEN_70 = _T_455 ? 32'hfd010113 : _GEN_69; // @[Conditional.scala 39:67:@2738.298]
  assign _GEN_71 = _T_452 ? 32'h8067 : _GEN_70; // @[Conditional.scala 39:67:@2733.296]
  assign _GEN_72 = _T_449 ? 32'h3010113 : _GEN_71; // @[Conditional.scala 39:67:@2728.294]
  assign _GEN_73 = _T_446 ? 32'h2812403 : _GEN_72; // @[Conditional.scala 39:67:@2723.292]
  assign _GEN_74 = _T_443 ? 32'h2c12083 : _GEN_73; // @[Conditional.scala 39:67:@2718.290]
  assign _GEN_75 = _T_440 ? 32'h13 : _GEN_74; // @[Conditional.scala 39:67:@2713.288]
  assign _GEN_76 = _T_437 ? 32'hfaf76ee3 : _GEN_75; // @[Conditional.scala 39:67:@2708.286]
  assign _GEN_77 = _T_434 ? 32'hfe842703 : _GEN_76; // @[Conditional.scala 39:67:@2703.284]
  assign _GEN_78 = _T_431 ? 32'h27d793 : _GEN_77; // @[Conditional.scala 39:67:@2698.282]
  assign _GEN_79 = _T_428 ? 32'hfe042783 : _GEN_78; // @[Conditional.scala 39:67:@2693.280]
  assign _GEN_80 = _T_425 ? 32'hfef42623 : _GEN_79; // @[Conditional.scala 39:67:@2688.278]
  assign _GEN_81 = _T_422 ? 32'h478793 : _GEN_80; // @[Conditional.scala 39:67:@2683.276]
  assign _GEN_82 = _T_419 ? 32'hfec42783 : _GEN_81; // @[Conditional.scala 39:67:@2678.274]
  assign _GEN_83 = _T_416 ? 32'he7a023 : _GEN_82; // @[Conditional.scala 39:67:@2673.272]
  assign _GEN_84 = _T_413 ? 32'hfd842703 : _GEN_83; // @[Conditional.scala 39:67:@2668.270]
  assign _GEN_85 = _T_410 ? 32'hf707b3 : _GEN_84; // @[Conditional.scala 39:67:@2663.268]
  assign _GEN_86 = _T_407 ? 32'hfdc42703 : _GEN_85; // @[Conditional.scala 39:67:@2658.266]
  assign _GEN_87 = _T_404 ? 32'h279793 : _GEN_86; // @[Conditional.scala 39:67:@2653.264]
  assign _GEN_88 = _T_401 ? 32'hfee42423 : _GEN_87; // @[Conditional.scala 39:67:@2648.262]
  assign _GEN_89 = _T_398 ? 32'h178713 : _GEN_88; // @[Conditional.scala 39:67:@2643.260]
  assign _GEN_90 = _T_395 ? 32'hfe842783 : _GEN_89; // @[Conditional.scala 39:67:@2638.258]
  assign _GEN_91 = _T_392 ? 32'hfca42c23 : _GEN_90; // @[Conditional.scala 39:67:@2633.256]
  assign _GEN_92 = _T_389 ? 32'h58000ef : _GEN_91; // @[Conditional.scala 39:67:@2628.254]
  assign _GEN_93 = _T_386 ? 32'hfec42503 : _GEN_92; // @[Conditional.scala 39:67:@2623.252]
  assign _GEN_94 = _T_383 ? 32'h3c0006f : _GEN_93; // @[Conditional.scala 39:67:@2618.250]
  assign _GEN_95 = _T_380 ? 32'hfef42623 : _GEN_94; // @[Conditional.scala 39:67:@2613.248]
  assign _GEN_96 = _T_377 ? 32'hc78793 : _GEN_95; // @[Conditional.scala 39:67:@2608.246]
  assign _GEN_97 = _T_374 ? 32'hfec42783 : _GEN_96; // @[Conditional.scala 39:67:@2603.244]
  assign _GEN_98 = _T_371 ? 32'hfe042423 : _GEN_97; // @[Conditional.scala 39:67:@2598.242]
  assign _GEN_99 = _T_368 ? 32'hfc042c23 : _GEN_98; // @[Conditional.scala 39:67:@2593.240]
  assign _GEN_100 = _T_365 ? 32'hfc042e23 : _GEN_99; // @[Conditional.scala 39:67:@2588.238]
  assign _GEN_101 = _T_362 ? 32'hfea42023 : _GEN_100; // @[Conditional.scala 39:67:@2583.236]
  assign _GEN_102 = _T_359 ? 32'h80000ef : _GEN_101; // @[Conditional.scala 39:67:@2578.234]
  assign _GEN_103 = _T_356 ? 32'h78513 : _GEN_102; // @[Conditional.scala 39:67:@2573.232]
  assign _GEN_104 = _T_353 ? 32'h478793 : _GEN_103; // @[Conditional.scala 39:67:@2568.230]
  assign _GEN_105 = _T_350 ? 32'hfec42783 : _GEN_104; // @[Conditional.scala 39:67:@2563.228]
  assign _GEN_106 = _T_347 ? 32'hfea42223 : _GEN_105; // @[Conditional.scala 39:67:@2558.226]
  assign _GEN_107 = _T_344 ? 32'h94000ef : _GEN_106; // @[Conditional.scala 39:67:@2553.224]
  assign _GEN_108 = _T_341 ? 32'hfec42503 : _GEN_107; // @[Conditional.scala 39:67:@2548.222]
  assign _GEN_109 = _T_338 ? 32'hfe042623 : _GEN_108; // @[Conditional.scala 39:67:@2543.220]
  assign _GEN_110 = _T_335 ? 32'h3010413 : _GEN_109; // @[Conditional.scala 39:67:@2538.218]
  assign _GEN_111 = _T_332 ? 32'h2812423 : _GEN_110; // @[Conditional.scala 39:67:@2533.216]
  assign _GEN_112 = _T_329 ? 32'h2112623 : _GEN_111; // @[Conditional.scala 39:67:@2528.214]
  assign _GEN_113 = _T_326 ? 32'hfd010113 : _GEN_112; // @[Conditional.scala 39:67:@2523.212]
  assign _GEN_114 = _T_323 ? 32'h8067 : _GEN_113; // @[Conditional.scala 39:67:@2518.210]
  assign _GEN_115 = _T_320 ? 32'h1010113 : _GEN_114; // @[Conditional.scala 39:67:@2513.208]
  assign _GEN_116 = _T_317 ? 32'hc12403 : _GEN_115; // @[Conditional.scala 39:67:@2508.206]
  assign _GEN_117 = _T_314 ? 32'h13 : _GEN_116; // @[Conditional.scala 39:67:@2503.204]
  assign _GEN_118 = _T_311 ? 32'h28067 : _GEN_117; // @[Conditional.scala 39:67:@2498.202]
  assign _GEN_119 = _T_308 ? 32'h2b7 : _GEN_118; // @[Conditional.scala 39:67:@2493.200]
  assign _GEN_120 = _T_305 ? 32'h1010413 : _GEN_119; // @[Conditional.scala 39:67:@2488.198]
  assign _GEN_121 = _T_302 ? 32'h812623 : _GEN_120; // @[Conditional.scala 39:67:@2483.196]
  assign _GEN_122 = _T_299 ? 32'hff010113 : _GEN_121; // @[Conditional.scala 39:67:@2478.194]
  assign _GEN_123 = _T_296 ? 32'h8067 : _GEN_122; // @[Conditional.scala 39:67:@2473.192]
  assign _GEN_124 = _T_293 ? 32'h1010113 : _GEN_123; // @[Conditional.scala 39:67:@2468.190]
  assign _GEN_125 = _T_290 ? 32'h812403 : _GEN_124; // @[Conditional.scala 39:67:@2463.188]
  assign _GEN_126 = _T_287 ? 32'hc12083 : _GEN_125; // @[Conditional.scala 39:67:@2458.186]
  assign _GEN_127 = _T_284 ? 32'h78513 : _GEN_126; // @[Conditional.scala 39:67:@2453.184]
  assign _GEN_128 = _T_281 ? 32'h793 : _GEN_127; // @[Conditional.scala 39:67:@2448.182]
  assign _GEN_129 = _T_278 ? 32'h1c000ef : _GEN_128; // @[Conditional.scala 39:67:@2443.180]
  assign _GEN_130 = _T_275 ? 32'hf89ff0ef : _GEN_129; // @[Conditional.scala 39:67:@2438.178]
  assign _GEN_131 = _T_272 ? 32'h6b00513 : _GEN_130; // @[Conditional.scala 39:67:@2433.176]
  assign _GEN_132 = _T_269 ? 32'hf91ff0ef : _GEN_131; // @[Conditional.scala 39:67:@2428.174]
  assign _GEN_133 = _T_266 ? 32'h4f00513 : _GEN_132; // @[Conditional.scala 39:67:@2423.172]
  assign _GEN_134 = _T_263 ? 32'h54000ef : _GEN_133; // @[Conditional.scala 39:67:@2418.170]
  assign _GEN_135 = _T_260 ? 32'hed5ff0ef : _GEN_134; // @[Conditional.scala 39:67:@2413.168]
  assign _GEN_136 = _T_257 ? 32'h800513 : _GEN_135; // @[Conditional.scala 39:67:@2408.166]
  assign _GEN_137 = _T_254 ? 32'hf75ff0ef : _GEN_136; // @[Conditional.scala 39:67:@2403.164]
  assign _GEN_138 = _T_251 ? 32'h1000513 : _GEN_137; // @[Conditional.scala 39:67:@2398.162]
  assign _GEN_139 = _T_248 ? 32'h1010413 : _GEN_138; // @[Conditional.scala 39:67:@2393.160]
  assign _GEN_140 = _T_245 ? 32'h812423 : _GEN_139; // @[Conditional.scala 39:67:@2388.158]
  assign _GEN_141 = _T_242 ? 32'h112623 : _GEN_140; // @[Conditional.scala 39:67:@2383.156]
  assign _GEN_142 = _T_239 ? 32'hff010113 : _GEN_141; // @[Conditional.scala 39:67:@2378.154]
  assign _GEN_143 = _T_236 ? 32'h8067 : _GEN_142; // @[Conditional.scala 39:67:@2373.152]
  assign _GEN_144 = _T_233 ? 32'h2010113 : _GEN_143; // @[Conditional.scala 39:67:@2368.150]
  assign _GEN_145 = _T_230 ? 32'h1c12403 : _GEN_144; // @[Conditional.scala 39:67:@2363.148]
  assign _GEN_146 = _T_227 ? 32'h13 : _GEN_145; // @[Conditional.scala 39:67:@2358.146]
  assign _GEN_147 = _T_224 ? 32'he780a3 : _GEN_146; // @[Conditional.scala 39:67:@2353.144]
  assign _GEN_148 = _T_221 ? 32'hfef44703 : _GEN_147; // @[Conditional.scala 39:67:@2348.142]
  assign _GEN_149 = _T_218 ? 32'h27b7 : _GEN_148; // @[Conditional.scala 39:67:@2343.140]
  assign _GEN_150 = _T_215 ? 32'hfe0788e3 : _GEN_149; // @[Conditional.scala 39:67:@2338.138]
  assign _GEN_151 = _T_212 ? 32'h27f793 : _GEN_150; // @[Conditional.scala 39:67:@2333.136]
  assign _GEN_152 = _T_209 ? 32'hff7f793 : _GEN_151; // @[Conditional.scala 39:67:@2328.134]
  assign _GEN_153 = _T_206 ? 32'h47c783 : _GEN_152; // @[Conditional.scala 39:67:@2323.132]
  assign _GEN_154 = _T_203 ? 32'h27b7 : _GEN_153; // @[Conditional.scala 39:67:@2318.130]
  assign _GEN_155 = _T_200 ? 32'h13 : _GEN_154; // @[Conditional.scala 39:67:@2313.128]
  assign _GEN_156 = _T_197 ? 32'hfef407a3 : _GEN_155; // @[Conditional.scala 39:67:@2308.126]
  assign _GEN_157 = _T_194 ? 32'h50793 : _GEN_156; // @[Conditional.scala 39:67:@2303.124]
  assign _GEN_158 = _T_191 ? 32'h2010413 : _GEN_157; // @[Conditional.scala 39:67:@2298.122]
  assign _GEN_159 = _T_188 ? 32'h812e23 : _GEN_158; // @[Conditional.scala 39:67:@2293.120]
  assign _GEN_160 = _T_185 ? 32'hfe010113 : _GEN_159; // @[Conditional.scala 39:67:@2288.118]
  assign _GEN_161 = _T_182 ? 32'h8067 : _GEN_160; // @[Conditional.scala 39:67:@2283.116]
  assign _GEN_162 = _T_179 ? 32'h2010113 : _GEN_161; // @[Conditional.scala 39:67:@2278.114]
  assign _GEN_163 = _T_176 ? 32'h1c12403 : _GEN_162; // @[Conditional.scala 39:67:@2273.112]
  assign _GEN_164 = _T_173 ? 32'h13 : _GEN_163; // @[Conditional.scala 39:67:@2268.110]
  assign _GEN_165 = _T_170 ? 32'he78123 : _GEN_164; // @[Conditional.scala 39:67:@2263.108]
  assign _GEN_166 = _T_167 ? 32'hfef44703 : _GEN_165; // @[Conditional.scala 39:67:@2258.106]
  assign _GEN_167 = _T_164 ? 32'h27b7 : _GEN_166; // @[Conditional.scala 39:67:@2253.104]
  assign _GEN_168 = _T_161 ? 32'hfef407a3 : _GEN_167; // @[Conditional.scala 39:67:@2248.102]
  assign _GEN_169 = _T_158 ? 32'h50793 : _GEN_168; // @[Conditional.scala 39:67:@2243.100]
  assign _GEN_170 = _T_155 ? 32'h2010413 : _GEN_169; // @[Conditional.scala 39:67:@2238.98]
  assign _GEN_171 = _T_152 ? 32'h812e23 : _GEN_170; // @[Conditional.scala 39:67:@2233.96]
  assign _GEN_172 = _T_149 ? 32'hfe010113 : _GEN_171; // @[Conditional.scala 39:67:@2228.94]
  assign _GEN_173 = _T_146 ? 32'h8067 : _GEN_172; // @[Conditional.scala 39:67:@2223.92]
  assign _GEN_174 = _T_143 ? 32'h2010113 : _GEN_173; // @[Conditional.scala 39:67:@2218.90]
  assign _GEN_175 = _T_140 ? 32'h1c12403 : _GEN_174; // @[Conditional.scala 39:67:@2213.88]
  assign _GEN_176 = _T_137 ? 32'h78513 : _GEN_175; // @[Conditional.scala 39:67:@2208.86]
  assign _GEN_177 = _T_134 ? 32'hff7f793 : _GEN_176; // @[Conditional.scala 39:67:@2203.84]
  assign _GEN_178 = _T_131 ? 32'h7c783 : _GEN_177; // @[Conditional.scala 39:67:@2198.82]
  assign _GEN_179 = _T_128 ? 32'h37b7 : _GEN_178; // @[Conditional.scala 39:67:@2193.80]
  assign _GEN_180 = _T_125 ? 32'hfe0788e3 : _GEN_179; // @[Conditional.scala 39:67:@2188.78]
  assign _GEN_181 = _T_122 ? 32'h107f793 : _GEN_180; // @[Conditional.scala 39:67:@2183.76]
  assign _GEN_182 = _T_119 ? 32'hff7f793 : _GEN_181; // @[Conditional.scala 39:67:@2178.74]
  assign _GEN_183 = _T_116 ? 32'h47c783 : _GEN_182; // @[Conditional.scala 39:67:@2173.72]
  assign _GEN_184 = _T_113 ? 32'h37b7 : _GEN_183; // @[Conditional.scala 39:67:@2168.70]
  assign _GEN_185 = _T_110 ? 32'h13 : _GEN_184; // @[Conditional.scala 39:67:@2163.68]
  assign _GEN_186 = _T_107 ? 32'he780a3 : _GEN_185; // @[Conditional.scala 39:67:@2158.66]
  assign _GEN_187 = _T_104 ? 32'hfef44703 : _GEN_186; // @[Conditional.scala 39:67:@2153.64]
  assign _GEN_188 = _T_101 ? 32'h37b7 : _GEN_187; // @[Conditional.scala 39:67:@2148.62]
  assign _GEN_189 = _T_98 ? 32'hfef407a3 : _GEN_188; // @[Conditional.scala 39:67:@2143.60]
  assign _GEN_190 = _T_95 ? 32'h50793 : _GEN_189; // @[Conditional.scala 39:67:@2138.58]
  assign _GEN_191 = _T_92 ? 32'h2010413 : _GEN_190; // @[Conditional.scala 39:67:@2133.56]
  assign _GEN_192 = _T_89 ? 32'h812e23 : _GEN_191; // @[Conditional.scala 39:67:@2128.54]
  assign _GEN_193 = _T_86 ? 32'hfe010113 : _GEN_192; // @[Conditional.scala 39:67:@2123.52]
  assign _GEN_194 = _T_83 ? 32'h8067 : _GEN_193; // @[Conditional.scala 39:67:@2118.50]
  assign _GEN_195 = _T_80 ? 32'h2010113 : _GEN_194; // @[Conditional.scala 39:67:@2113.48]
  assign _GEN_196 = _T_77 ? 32'h1c12403 : _GEN_195; // @[Conditional.scala 39:67:@2108.46]
  assign _GEN_197 = _T_74 ? 32'h13 : _GEN_196; // @[Conditional.scala 39:67:@2103.44]
  assign _GEN_198 = _T_71 ? 32'he78123 : _GEN_197; // @[Conditional.scala 39:67:@2098.42]
  assign _GEN_199 = _T_68 ? 32'hff77713 : _GEN_198; // @[Conditional.scala 39:67:@2093.40]
  assign _GEN_200 = _T_65 ? 32'he6e733 : _GEN_199; // @[Conditional.scala 39:67:@2088.38]
  assign _GEN_201 = _T_62 ? 32'hfef44703 : _GEN_200; // @[Conditional.scala 39:67:@2083.36]
  assign _GEN_202 = _T_59 ? 32'h37b7 : _GEN_201; // @[Conditional.scala 39:67:@2078.34]
  assign _GEN_203 = _T_56 ? 32'hff7f693 : _GEN_202; // @[Conditional.scala 39:67:@2073.32]
  assign _GEN_204 = _T_53 ? 32'h27c783 : _GEN_203; // @[Conditional.scala 39:67:@2068.30]
  assign _GEN_205 = _T_50 ? 32'h37b7 : _GEN_204; // @[Conditional.scala 39:67:@2063.28]
  assign _GEN_206 = _T_47 ? 32'hfef407a3 : _GEN_205; // @[Conditional.scala 39:67:@2058.26]
  assign _GEN_207 = _T_44 ? 32'h50793 : _GEN_206; // @[Conditional.scala 39:67:@2053.24]
  assign _GEN_208 = _T_41 ? 32'h2010413 : _GEN_207; // @[Conditional.scala 39:67:@2048.22]
  assign _GEN_209 = _T_38 ? 32'h812e23 : _GEN_208; // @[Conditional.scala 39:67:@2043.20]
  assign _GEN_210 = _T_35 ? 32'hfe010113 : _GEN_209; // @[Conditional.scala 39:67:@2038.18]
  assign _GEN_211 = _T_32 ? 32'h114000ef : _GEN_210; // @[Conditional.scala 39:67:@2033.16]
  assign _GEN_212 = _T_29 ? 32'h593 : _GEN_211; // @[Conditional.scala 39:67:@2028.14]
  assign _GEN_213 = _T_26 ? 32'h513 : _GEN_212; // @[Conditional.scala 39:67:@2023.12]
  assign _GEN_214 = _T_23 ? 32'hff810113 : _GEN_213; // @[Conditional.scala 39:67:@2018.10]
  assign _GEN_215 = _T_20 ? 32'hffffb117 : _GEN_214; // @[Conditional.scala 39:67:@2013.8]
  assign _GEN_216 = _T_17 ? 32'h40006f : _GEN_215; // @[Conditional.scala 39:67:@2008.6]
  assign _GEN_217 = _T_14 ? 32'h13 : _GEN_216; // @[Conditional.scala 40:58:@2003.4]
  assign io_bmem_rdata = bmem_data; // @[BMEM.scala 248:17:@3091.4]
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
  bmem_data = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      bmem_data <= 32'h0;
    end else begin
      if (_T_14) begin
        bmem_data <= 32'h13;
      end else begin
        if (_T_17) begin
          bmem_data <= 32'h40006f;
        end else begin
          if (_T_20) begin
            bmem_data <= 32'hffffb117;
          end else begin
            if (_T_23) begin
              bmem_data <= 32'hff810113;
            end else begin
              if (_T_26) begin
                bmem_data <= 32'h513;
              end else begin
                if (_T_29) begin
                  bmem_data <= 32'h593;
                end else begin
                  if (_T_32) begin
                    bmem_data <= 32'h114000ef;
                  end else begin
                    if (_T_35) begin
                      bmem_data <= 32'hfe010113;
                    end else begin
                      if (_T_38) begin
                        bmem_data <= 32'h812e23;
                      end else begin
                        if (_T_41) begin
                          bmem_data <= 32'h2010413;
                        end else begin
                          if (_T_44) begin
                            bmem_data <= 32'h50793;
                          end else begin
                            if (_T_47) begin
                              bmem_data <= 32'hfef407a3;
                            end else begin
                              if (_T_50) begin
                                bmem_data <= 32'h37b7;
                              end else begin
                                if (_T_53) begin
                                  bmem_data <= 32'h27c783;
                                end else begin
                                  if (_T_56) begin
                                    bmem_data <= 32'hff7f693;
                                  end else begin
                                    if (_T_59) begin
                                      bmem_data <= 32'h37b7;
                                    end else begin
                                      if (_T_62) begin
                                        bmem_data <= 32'hfef44703;
                                      end else begin
                                        if (_T_65) begin
                                          bmem_data <= 32'he6e733;
                                        end else begin
                                          if (_T_68) begin
                                            bmem_data <= 32'hff77713;
                                          end else begin
                                            if (_T_71) begin
                                              bmem_data <= 32'he78123;
                                            end else begin
                                              if (_T_74) begin
                                                bmem_data <= 32'h13;
                                              end else begin
                                                if (_T_77) begin
                                                  bmem_data <= 32'h1c12403;
                                                end else begin
                                                  if (_T_80) begin
                                                    bmem_data <= 32'h2010113;
                                                  end else begin
                                                    if (_T_83) begin
                                                      bmem_data <= 32'h8067;
                                                    end else begin
                                                      if (_T_86) begin
                                                        bmem_data <= 32'hfe010113;
                                                      end else begin
                                                        if (_T_89) begin
                                                          bmem_data <= 32'h812e23;
                                                        end else begin
                                                          if (_T_92) begin
                                                            bmem_data <= 32'h2010413;
                                                          end else begin
                                                            if (_T_95) begin
                                                              bmem_data <= 32'h50793;
                                                            end else begin
                                                              if (_T_98) begin
                                                                bmem_data <= 32'hfef407a3;
                                                              end else begin
                                                                if (_T_101) begin
                                                                  bmem_data <= 32'h37b7;
                                                                end else begin
                                                                  if (_T_104) begin
                                                                    bmem_data <= 32'hfef44703;
                                                                  end else begin
                                                                    if (_T_107) begin
                                                                      bmem_data <= 32'he780a3;
                                                                    end else begin
                                                                      if (_T_110) begin
                                                                        bmem_data <= 32'h13;
                                                                      end else begin
                                                                        if (_T_113) begin
                                                                          bmem_data <= 32'h37b7;
                                                                        end else begin
                                                                          if (_T_116) begin
                                                                            bmem_data <= 32'h47c783;
                                                                          end else begin
                                                                            if (_T_119) begin
                                                                              bmem_data <= 32'hff7f793;
                                                                            end else begin
                                                                              if (_T_122) begin
                                                                                bmem_data <= 32'h107f793;
                                                                              end else begin
                                                                                if (_T_125) begin
                                                                                  bmem_data <= 32'hfe0788e3;
                                                                                end else begin
                                                                                  if (_T_128) begin
                                                                                    bmem_data <= 32'h37b7;
                                                                                  end else begin
                                                                                    if (_T_131) begin
                                                                                      bmem_data <= 32'h7c783;
                                                                                    end else begin
                                                                                      if (_T_134) begin
                                                                                        bmem_data <= 32'hff7f793;
                                                                                      end else begin
                                                                                        if (_T_137) begin
                                                                                          bmem_data <= 32'h78513;
                                                                                        end else begin
                                                                                          if (_T_140) begin
                                                                                            bmem_data <= 32'h1c12403;
                                                                                          end else begin
                                                                                            if (_T_143) begin
                                                                                              bmem_data <= 32'h2010113;
                                                                                            end else begin
                                                                                              if (_T_146) begin
                                                                                                bmem_data <= 32'h8067;
                                                                                              end else begin
                                                                                                if (_T_149) begin
                                                                                                  bmem_data <= 32'hfe010113;
                                                                                                end else begin
                                                                                                  if (_T_152) begin
                                                                                                    bmem_data <= 32'h812e23;
                                                                                                  end else begin
                                                                                                    if (_T_155) begin
                                                                                                      bmem_data <= 32'h2010413;
                                                                                                    end else begin
                                                                                                      if (_T_158) begin
                                                                                                        bmem_data <= 32'h50793;
                                                                                                      end else begin
                                                                                                        if (_T_161) begin
                                                                                                          bmem_data <= 32'hfef407a3;
                                                                                                        end else begin
                                                                                                          if (_T_164) begin
                                                                                                            bmem_data <= 32'h27b7;
                                                                                                          end else begin
                                                                                                            if (_T_167) begin
                                                                                                              bmem_data <= 32'hfef44703;
                                                                                                            end else begin
                                                                                                              if (_T_170) begin
                                                                                                                bmem_data <= 32'he78123;
                                                                                                              end else begin
                                                                                                                if (_T_173) begin
                                                                                                                  bmem_data <= 32'h13;
                                                                                                                end else begin
                                                                                                                  if (_T_176) begin
                                                                                                                    bmem_data <= 32'h1c12403;
                                                                                                                  end else begin
                                                                                                                    if (_T_179) begin
                                                                                                                      bmem_data <= 32'h2010113;
                                                                                                                    end else begin
                                                                                                                      if (_T_182) begin
                                                                                                                        bmem_data <= 32'h8067;
                                                                                                                      end else begin
                                                                                                                        if (_T_185) begin
                                                                                                                          bmem_data <= 32'hfe010113;
                                                                                                                        end else begin
                                                                                                                          if (_T_188) begin
                                                                                                                            bmem_data <= 32'h812e23;
                                                                                                                          end else begin
                                                                                                                            if (_T_191) begin
                                                                                                                              bmem_data <= 32'h2010413;
                                                                                                                            end else begin
                                                                                                                              if (_T_194) begin
                                                                                                                                bmem_data <= 32'h50793;
                                                                                                                              end else begin
                                                                                                                                if (_T_197) begin
                                                                                                                                  bmem_data <= 32'hfef407a3;
                                                                                                                                end else begin
                                                                                                                                  if (_T_200) begin
                                                                                                                                    bmem_data <= 32'h13;
                                                                                                                                  end else begin
                                                                                                                                    if (_T_203) begin
                                                                                                                                      bmem_data <= 32'h27b7;
                                                                                                                                    end else begin
                                                                                                                                      if (_T_206) begin
                                                                                                                                        bmem_data <= 32'h47c783;
                                                                                                                                      end else begin
                                                                                                                                        if (_T_209) begin
                                                                                                                                          bmem_data <= 32'hff7f793;
                                                                                                                                        end else begin
                                                                                                                                          if (_T_212) begin
                                                                                                                                            bmem_data <= 32'h27f793;
                                                                                                                                          end else begin
                                                                                                                                            if (_T_215) begin
                                                                                                                                              bmem_data <= 32'hfe0788e3;
                                                                                                                                            end else begin
                                                                                                                                              if (_T_218) begin
                                                                                                                                                bmem_data <= 32'h27b7;
                                                                                                                                              end else begin
                                                                                                                                                if (_T_221) begin
                                                                                                                                                  bmem_data <= 32'hfef44703;
                                                                                                                                                end else begin
                                                                                                                                                  if (_T_224) begin
                                                                                                                                                    bmem_data <= 32'he780a3;
                                                                                                                                                  end else begin
                                                                                                                                                    if (_T_227) begin
                                                                                                                                                      bmem_data <= 32'h13;
                                                                                                                                                    end else begin
                                                                                                                                                      if (_T_230) begin
                                                                                                                                                        bmem_data <= 32'h1c12403;
                                                                                                                                                      end else begin
                                                                                                                                                        if (_T_233) begin
                                                                                                                                                          bmem_data <= 32'h2010113;
                                                                                                                                                        end else begin
                                                                                                                                                          if (_T_236) begin
                                                                                                                                                            bmem_data <= 32'h8067;
                                                                                                                                                          end else begin
                                                                                                                                                            if (_T_239) begin
                                                                                                                                                              bmem_data <= 32'hff010113;
                                                                                                                                                            end else begin
                                                                                                                                                              if (_T_242) begin
                                                                                                                                                                bmem_data <= 32'h112623;
                                                                                                                                                              end else begin
                                                                                                                                                                if (_T_245) begin
                                                                                                                                                                  bmem_data <= 32'h812423;
                                                                                                                                                                end else begin
                                                                                                                                                                  if (_T_248) begin
                                                                                                                                                                    bmem_data <= 32'h1010413;
                                                                                                                                                                  end else begin
                                                                                                                                                                    if (_T_251) begin
                                                                                                                                                                      bmem_data <= 32'h1000513;
                                                                                                                                                                    end else begin
                                                                                                                                                                      if (_T_254) begin
                                                                                                                                                                        bmem_data <= 32'hf75ff0ef;
                                                                                                                                                                      end else begin
                                                                                                                                                                        if (_T_257) begin
                                                                                                                                                                          bmem_data <= 32'h800513;
                                                                                                                                                                        end else begin
                                                                                                                                                                          if (_T_260) begin
                                                                                                                                                                            bmem_data <= 32'hed5ff0ef;
                                                                                                                                                                          end else begin
                                                                                                                                                                            if (_T_263) begin
                                                                                                                                                                              bmem_data <= 32'h54000ef;
                                                                                                                                                                            end else begin
                                                                                                                                                                              if (_T_266) begin
                                                                                                                                                                                bmem_data <= 32'h4f00513;
                                                                                                                                                                              end else begin
                                                                                                                                                                                if (_T_269) begin
                                                                                                                                                                                  bmem_data <= 32'hf91ff0ef;
                                                                                                                                                                                end else begin
                                                                                                                                                                                  if (_T_272) begin
                                                                                                                                                                                    bmem_data <= 32'h6b00513;
                                                                                                                                                                                  end else begin
                                                                                                                                                                                    if (_T_275) begin
                                                                                                                                                                                      bmem_data <= 32'hf89ff0ef;
                                                                                                                                                                                    end else begin
                                                                                                                                                                                      if (_T_278) begin
                                                                                                                                                                                        bmem_data <= 32'h1c000ef;
                                                                                                                                                                                      end else begin
                                                                                                                                                                                        if (_T_281) begin
                                                                                                                                                                                          bmem_data <= 32'h793;
                                                                                                                                                                                        end else begin
                                                                                                                                                                                          if (_T_284) begin
                                                                                                                                                                                            bmem_data <= 32'h78513;
                                                                                                                                                                                          end else begin
                                                                                                                                                                                            if (_T_287) begin
                                                                                                                                                                                              bmem_data <= 32'hc12083;
                                                                                                                                                                                            end else begin
                                                                                                                                                                                              if (_T_290) begin
                                                                                                                                                                                                bmem_data <= 32'h812403;
                                                                                                                                                                                              end else begin
                                                                                                                                                                                                if (_T_293) begin
                                                                                                                                                                                                  bmem_data <= 32'h1010113;
                                                                                                                                                                                                end else begin
                                                                                                                                                                                                  if (_T_296) begin
                                                                                                                                                                                                    bmem_data <= 32'h8067;
                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                    if (_T_299) begin
                                                                                                                                                                                                      bmem_data <= 32'hff010113;
                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                      if (_T_302) begin
                                                                                                                                                                                                        bmem_data <= 32'h812623;
                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                        if (_T_305) begin
                                                                                                                                                                                                          bmem_data <= 32'h1010413;
                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                          if (_T_308) begin
                                                                                                                                                                                                            bmem_data <= 32'h2b7;
                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                            if (_T_311) begin
                                                                                                                                                                                                              bmem_data <= 32'h28067;
                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                              if (_T_314) begin
                                                                                                                                                                                                                bmem_data <= 32'h13;
                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                if (_T_317) begin
                                                                                                                                                                                                                  bmem_data <= 32'hc12403;
                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                  if (_T_320) begin
                                                                                                                                                                                                                    bmem_data <= 32'h1010113;
                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                    if (_T_323) begin
                                                                                                                                                                                                                      bmem_data <= 32'h8067;
                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                      if (_T_326) begin
                                                                                                                                                                                                                        bmem_data <= 32'hfd010113;
                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                        if (_T_329) begin
                                                                                                                                                                                                                          bmem_data <= 32'h2112623;
                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                          if (_T_332) begin
                                                                                                                                                                                                                            bmem_data <= 32'h2812423;
                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                            if (_T_335) begin
                                                                                                                                                                                                                              bmem_data <= 32'h3010413;
                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                              if (_T_338) begin
                                                                                                                                                                                                                                bmem_data <= 32'hfe042623;
                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                if (_T_341) begin
                                                                                                                                                                                                                                  bmem_data <= 32'hfec42503;
                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                  if (_T_344) begin
                                                                                                                                                                                                                                    bmem_data <= 32'h94000ef;
                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                    if (_T_347) begin
                                                                                                                                                                                                                                      bmem_data <= 32'hfea42223;
                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                      if (_T_350) begin
                                                                                                                                                                                                                                        bmem_data <= 32'hfec42783;
                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                        if (_T_353) begin
                                                                                                                                                                                                                                          bmem_data <= 32'h478793;
                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                          if (_T_356) begin
                                                                                                                                                                                                                                            bmem_data <= 32'h78513;
                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                            if (_T_359) begin
                                                                                                                                                                                                                                              bmem_data <= 32'h80000ef;
                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                              if (_T_362) begin
                                                                                                                                                                                                                                                bmem_data <= 32'hfea42023;
                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                if (_T_365) begin
                                                                                                                                                                                                                                                  bmem_data <= 32'hfc042e23;
                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                  if (_T_368) begin
                                                                                                                                                                                                                                                    bmem_data <= 32'hfc042c23;
                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                    if (_T_371) begin
                                                                                                                                                                                                                                                      bmem_data <= 32'hfe042423;
                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                      if (_T_374) begin
                                                                                                                                                                                                                                                        bmem_data <= 32'hfec42783;
                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                        if (_T_377) begin
                                                                                                                                                                                                                                                          bmem_data <= 32'hc78793;
                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                          if (_T_380) begin
                                                                                                                                                                                                                                                            bmem_data <= 32'hfef42623;
                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                            if (_T_383) begin
                                                                                                                                                                                                                                                              bmem_data <= 32'h3c0006f;
                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                              if (_T_386) begin
                                                                                                                                                                                                                                                                bmem_data <= 32'hfec42503;
                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                if (_T_389) begin
                                                                                                                                                                                                                                                                  bmem_data <= 32'h58000ef;
                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                  if (_T_392) begin
                                                                                                                                                                                                                                                                    bmem_data <= 32'hfca42c23;
                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                    if (_T_395) begin
                                                                                                                                                                                                                                                                      bmem_data <= 32'hfe842783;
                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                      if (_T_398) begin
                                                                                                                                                                                                                                                                        bmem_data <= 32'h178713;
                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                        if (_T_401) begin
                                                                                                                                                                                                                                                                          bmem_data <= 32'hfee42423;
                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                          if (_T_404) begin
                                                                                                                                                                                                                                                                            bmem_data <= 32'h279793;
                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                            if (_T_407) begin
                                                                                                                                                                                                                                                                              bmem_data <= 32'hfdc42703;
                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                              if (_T_410) begin
                                                                                                                                                                                                                                                                                bmem_data <= 32'hf707b3;
                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                if (_T_413) begin
                                                                                                                                                                                                                                                                                  bmem_data <= 32'hfd842703;
                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                  if (_T_416) begin
                                                                                                                                                                                                                                                                                    bmem_data <= 32'he7a023;
                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                    if (_T_419) begin
                                                                                                                                                                                                                                                                                      bmem_data <= 32'hfec42783;
                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                      if (_T_422) begin
                                                                                                                                                                                                                                                                                        bmem_data <= 32'h478793;
                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                        if (_T_425) begin
                                                                                                                                                                                                                                                                                          bmem_data <= 32'hfef42623;
                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                          if (_T_428) begin
                                                                                                                                                                                                                                                                                            bmem_data <= 32'hfe042783;
                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                            if (_T_431) begin
                                                                                                                                                                                                                                                                                              bmem_data <= 32'h27d793;
                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                              if (_T_434) begin
                                                                                                                                                                                                                                                                                                bmem_data <= 32'hfe842703;
                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                if (_T_437) begin
                                                                                                                                                                                                                                                                                                  bmem_data <= 32'hfaf76ee3;
                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                  if (_T_440) begin
                                                                                                                                                                                                                                                                                                    bmem_data <= 32'h13;
                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                    if (_T_443) begin
                                                                                                                                                                                                                                                                                                      bmem_data <= 32'h2c12083;
                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                      if (_T_446) begin
                                                                                                                                                                                                                                                                                                        bmem_data <= 32'h2812403;
                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                        if (_T_449) begin
                                                                                                                                                                                                                                                                                                          bmem_data <= 32'h3010113;
                                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                                          if (_T_452) begin
                                                                                                                                                                                                                                                                                                            bmem_data <= 32'h8067;
                                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                                            if (_T_455) begin
                                                                                                                                                                                                                                                                                                              bmem_data <= 32'hfd010113;
                                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                                              if (_T_458) begin
                                                                                                                                                                                                                                                                                                                bmem_data <= 32'h2112623;
                                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                                if (_T_461) begin
                                                                                                                                                                                                                                                                                                                  bmem_data <= 32'h2812423;
                                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                                  if (_T_464) begin
                                                                                                                                                                                                                                                                                                                    bmem_data <= 32'h3010413;
                                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                                    if (_T_467) begin
                                                                                                                                                                                                                                                                                                                      bmem_data <= 32'hfca42e23;
                                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                                      if (_T_470) begin
                                                                                                                                                                                                                                                                                                                        bmem_data <= 32'h37b7;
                                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                                        if (_T_473) begin
                                                                                                                                                                                                                                                                                                                          bmem_data <= 32'h57c783;
                                                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                                                          if (_T_476) begin
                                                                                                                                                                                                                                                                                                                            bmem_data <= 32'hff7f713;
                                                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                                                            if (_T_479) begin
                                                                                                                                                                                                                                                                                                                              bmem_data <= 32'h37b7;
                                                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                                                              if (_T_482) begin
                                                                                                                                                                                                                                                                                                                                bmem_data <= 32'h176713;
                                                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                                                if (_T_485) begin
                                                                                                                                                                                                                                                                                                                                  bmem_data <= 32'hff77713;
                                                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                                                  if (_T_488) begin
                                                                                                                                                                                                                                                                                                                                    bmem_data <= 32'he782a3;
                                                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                                                    if (_T_491) begin
                                                                                                                                                                                                                                                                                                                                      bmem_data <= 32'h300513;
                                                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                                                      if (_T_494) begin
                                                                                                                                                                                                                                                                                                                                        bmem_data <= 32'hde1ff0ef;
                                                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                                                        if (_T_497) begin
                                                                                                                                                                                                                                                                                                                                          bmem_data <= 32'hfdc42503;
                                                                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                                                                          if (_T_500) begin
                                                                                                                                                                                                                                                                                                                                            bmem_data <= 32'h78000ef;
                                                                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                                                                            if (_T_503) begin
                                                                                                                                                                                                                                                                                                                                              bmem_data <= 32'hfe042623;
                                                                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                                                                              if (_T_506) begin
                                                                                                                                                                                                                                                                                                                                                bmem_data <= 32'h300006f;
                                                                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                                                                if (_T_509) begin
                                                                                                                                                                                                                                                                                                                                                  bmem_data <= 32'h513;
                                                                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                                                                  if (_T_512) begin
                                                                                                                                                                                                                                                                                                                                                    bmem_data <= 32'hdc9ff0ef;
                                                                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                                                                    if (_T_515) begin
                                                                                                                                                                                                                                                                                                                                                      bmem_data <= 32'h50793;
                                                                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                                                                      if (_T_518) begin
                                                                                                                                                                                                                                                                                                                                                        bmem_data <= 32'h78713;
                                                                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                                                                        if (_T_521) begin
                                                                                                                                                                                                                                                                                                                                                          bmem_data <= 32'hfec42783;
                                                                                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                                                                                          if (_T_524) begin
                                                                                                                                                                                                                                                                                                                                                            bmem_data <= 32'hff040693;
                                                                                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                                                                                            if (_T_527) begin
                                                                                                                                                                                                                                                                                                                                                              bmem_data <= 32'hf687b3;
                                                                                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                                                                                              if (_T_530) begin
                                                                                                                                                                                                                                                                                                                                                                bmem_data <= 32'hfee78c23;
                                                                                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                                                                                if (_T_533) begin
                                                                                                                                                                                                                                                                                                                                                                  bmem_data <= 32'hfec42783;
                                                                                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                                                                                  if (_T_536) begin
                                                                                                                                                                                                                                                                                                                                                                    bmem_data <= 32'h178793;
                                                                                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                                                                                    if (_T_539) begin
                                                                                                                                                                                                                                                                                                                                                                      bmem_data <= 32'hfef42623;
                                                                                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                                                                                      if (_T_542) begin
                                                                                                                                                                                                                                                                                                                                                                        bmem_data <= 32'hfec42703;
                                                                                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                                                                                        if (_T_545) begin
                                                                                                                                                                                                                                                                                                                                                                          bmem_data <= 32'h300793;
                                                                                                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                                                                                                          if (_T_548) begin
                                                                                                                                                                                                                                                                                                                                                                            bmem_data <= 32'hfce7f6e3;
                                                                                                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                                                                                                            if (_T_551) begin
                                                                                                                                                                                                                                                                                                                                                                              bmem_data <= 32'h37b7;
                                                                                                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                                                                                                              if (_T_554) begin
                                                                                                                                                                                                                                                                                                                                                                                bmem_data <= 32'h57c783;
                                                                                                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                                                                                                if (_T_557) begin
                                                                                                                                                                                                                                                                                                                                                                                  bmem_data <= 32'hff7f713;
                                                                                                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                                                                                                  if (_T_560) begin
                                                                                                                                                                                                                                                                                                                                                                                    bmem_data <= 32'h37b7;
                                                                                                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                                                                                                    if (_T_563) begin
                                                                                                                                                                                                                                                                                                                                                                                      bmem_data <= 32'hffe77713;
                                                                                                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                                                                                                      if (_T_566) begin
                                                                                                                                                                                                                                                                                                                                                                                        bmem_data <= 32'hff77713;
                                                                                                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                                                                                                        if (_T_569) begin
                                                                                                                                                                                                                                                                                                                                                                                          bmem_data <= 32'he782a3;
                                                                                                                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                                                                                                                          if (_T_572) begin
                                                                                                                                                                                                                                                                                                                                                                                            bmem_data <= 32'hfe842783;
                                                                                                                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                                                                                                                            if (_T_575) begin
                                                                                                                                                                                                                                                                                                                                                                                              bmem_data <= 32'h78513;
                                                                                                                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                                                                                                                              if (_T_578) begin
                                                                                                                                                                                                                                                                                                                                                                                                bmem_data <= 32'h2c12083;
                                                                                                                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                                                                                                                if (_T_581) begin
                                                                                                                                                                                                                                                                                                                                                                                                  bmem_data <= 32'h2812403;
                                                                                                                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                                                                                                                  if (_T_584) begin
                                                                                                                                                                                                                                                                                                                                                                                                    bmem_data <= 32'h3010113;
                                                                                                                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                                                                                                                    if (_T_587) begin
                                                                                                                                                                                                                                                                                                                                                                                                      bmem_data <= 32'h8067;
                                                                                                                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                                                                                                                      if (_T_590) begin
                                                                                                                                                                                                                                                                                                                                                                                                        bmem_data <= 32'hfd010113;
                                                                                                                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                                                                                                                        if (_T_593) begin
                                                                                                                                                                                                                                                                                                                                                                                                          bmem_data <= 32'h2112623;
                                                                                                                                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                                                                                                                                          if (_T_596) begin
                                                                                                                                                                                                                                                                                                                                                                                                            bmem_data <= 32'h2812423;
                                                                                                                                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                                                                                                                                            if (_T_599) begin
                                                                                                                                                                                                                                                                                                                                                                                                              bmem_data <= 32'h3010413;
                                                                                                                                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                                                                                                                                              if (_T_602) begin
                                                                                                                                                                                                                                                                                                                                                                                                                bmem_data <= 32'hfca42e23;
                                                                                                                                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                if (_T_605) begin
                                                                                                                                                                                                                                                                                                                                                                                                                  bmem_data <= 32'hfdc42783;
                                                                                                                                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                  if (_T_608) begin
                                                                                                                                                                                                                                                                                                                                                                                                                    bmem_data <= 32'hfef42423;
                                                                                                                                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                    if (_T_611) begin
                                                                                                                                                                                                                                                                                                                                                                                                                      bmem_data <= 32'h200793;
                                                                                                                                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                      if (_T_614) begin
                                                                                                                                                                                                                                                                                                                                                                                                                        bmem_data <= 32'hfef42623;
                                                                                                                                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                        if (_T_617) begin
                                                                                                                                                                                                                                                                                                                                                                                                                          bmem_data <= 32'h280006f;
                                                                                                                                                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                          if (_T_620) begin
                                                                                                                                                                                                                                                                                                                                                                                                                            bmem_data <= 32'hfec42783;
                                                                                                                                                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                            if (_T_623) begin
                                                                                                                                                                                                                                                                                                                                                                                                                              bmem_data <= 32'hff040713;
                                                                                                                                                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                              if (_T_626) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                bmem_data <= 32'hf707b3;
                                                                                                                                                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                if (_T_629) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                  bmem_data <= 32'hff87c783;
                                                                                                                                                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                  if (_T_632) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                    bmem_data <= 32'h78513;
                                                                                                                                                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                    if (_T_635) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                      bmem_data <= 32'hd25ff0ef;
                                                                                                                                                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                      if (_T_638) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                        bmem_data <= 32'hfec42783;
                                                                                                                                                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                        if (_T_641) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                          bmem_data <= 32'hfff78793;
                                                                                                                                                                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                          if (_T_644) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                            bmem_data <= 32'hfef42623;
                                                                                                                                                                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                            if (_T_647) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                              bmem_data <= 32'hfec42783;
                                                                                                                                                                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                              if (_T_650) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                bmem_data <= 32'hfc07dce3;
                                                                                                                                                                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                if (_T_653) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                  bmem_data <= 32'h13;
                                                                                                                                                                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                  if (_T_656) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                    bmem_data <= 32'h2c12083;
                                                                                                                                                                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                    if (_T_659) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                      bmem_data <= 32'h2812403;
                                                                                                                                                                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                      if (_T_662) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                        bmem_data <= 32'h3010113;
                                                                                                                                                                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                        if (_T_665) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                          bmem_data <= 32'h8067;
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
endmodule
module IMem_Interface( // @[:@3093.2]
  input         clock, // @[:@3094.4]
  input         reset, // @[:@3095.4]
  input  [31:0] io_ibus_addr, // @[:@3096.4]
  output [31:0] io_ibus_inst, // @[:@3096.4]
  output        io_ibus_valid, // @[:@3096.4]
  input  [15:0] io_wbs_m2s_addr, // @[:@3096.4]
  input  [31:0] io_wbs_m2s_data, // @[:@3096.4]
  input         io_wbs_m2s_we, // @[:@3096.4]
  input  [3:0]  io_wbs_m2s_sel, // @[:@3096.4]
  input         io_wbs_m2s_stb, // @[:@3096.4]
  output        io_wbs_ack_o, // @[:@3096.4]
  output [31:0] io_wbs_data_o // @[:@3096.4]
);
  wire  imem_clock; // @[imem_interface.scala 40:20:@3098.4]
  wire [31:0] imem_io_imem_addr; // @[imem_interface.scala 40:20:@3098.4]
  wire [31:0] imem_io_imem_rdata; // @[imem_interface.scala 40:20:@3098.4]
  wire [31:0] imem_io_imem_wdata; // @[imem_interface.scala 40:20:@3098.4]
  wire  imem_io_wr_en; // @[imem_interface.scala 40:20:@3098.4]
  wire  bmem_clock; // @[imem_interface.scala 41:20:@3101.4]
  wire  bmem_reset; // @[imem_interface.scala 41:20:@3101.4]
  wire [31:0] bmem_io_bmem_addr; // @[imem_interface.scala 41:20:@3101.4]
  wire [31:0] bmem_io_bmem_rdata; // @[imem_interface.scala 41:20:@3101.4]
  wire [11:0] ibus_imem_addr; // @[imem_interface.scala 47:41:@3104.4]
  wire [11:0] wbs_imem_addr; // @[imem_interface.scala 49:44:@3106.4]
  reg  ack; // @[imem_interface.scala 54:31:@3107.4]
  reg [31:0] _RAND_0;
  reg [3:0] wb_select; // @[imem_interface.scala 55:27:@3108.4]
  reg [31:0] _RAND_1;
  wire  _T_45; // @[imem_interface.scala 57:24:@3109.4]
  wire  wb_rd_en; // @[imem_interface.scala 57:39:@3110.4]
  wire  wb_wr_en; // @[imem_interface.scala 58:38:@3111.4]
  wire [3:0] _T_46; // @[imem_interface.scala 63:46:@3112.4]
  wire  _T_48; // @[imem_interface.scala 63:84:@3113.4]
  wire  imem_wbs_addr_match; // @[imem_interface.scala 63:29:@3114.4]
  wire  _T_52; // @[imem_interface.scala 70:33:@3118.4]
  wire  imem_wbs_sel; // @[imem_interface.scala 70:46:@3119.4]
  reg  imem_ibus_valid; // @[imem_interface.scala 71:32:@3121.4]
  reg [31:0] _RAND_2;
  wire  _T_57; // @[imem_interface.scala 72:22:@3122.4]
  wire [11:0] imem_addr; // @[imem_interface.scala 80:27:@3128.4]
  wire [31:0] rd_imem_inst; // @[imem_interface.scala 92:23:@3133.4]
  wire [31:0] rd_imem_const; // @[imem_interface.scala 92:23:@3133.4]
  wire  _GEN_2; // @[imem_interface.scala 98:20:@3139.4]
  wire  _T_64; // @[imem_interface.scala 106:18:@3145.4]
  wire [7:0] _T_65; // @[imem_interface.scala 107:33:@3147.6]
  wire  _T_66; // @[imem_interface.scala 108:24:@3151.6]
  wire [7:0] _T_67; // @[imem_interface.scala 109:33:@3153.8]
  wire  _T_68; // @[imem_interface.scala 110:24:@3157.8]
  wire [7:0] _T_69; // @[imem_interface.scala 111:33:@3159.10]
  wire  _T_70; // @[imem_interface.scala 112:24:@3163.10]
  wire [7:0] _T_71; // @[imem_interface.scala 113:33:@3165.12]
  wire  _T_72; // @[imem_interface.scala 114:24:@3169.12]
  wire [15:0] _T_73; // @[imem_interface.scala 115:33:@3171.14]
  wire  _T_74; // @[imem_interface.scala 116:24:@3175.14]
  wire [15:0] _T_75; // @[imem_interface.scala 117:33:@3177.16]
  wire [31:0] _GEN_3; // @[imem_interface.scala 116:54:@3176.14]
  wire [31:0] _GEN_4; // @[imem_interface.scala 114:52:@3170.12]
  wire [31:0] _GEN_5; // @[imem_interface.scala 112:52:@3164.10]
  wire [31:0] _GEN_6; // @[imem_interface.scala 110:52:@3158.8]
  wire [31:0] _GEN_7; // @[imem_interface.scala 108:52:@3152.6]
  reg  bmem_ibus_sel; // @[imem_interface.scala 127:31:@3186.4]
  reg [31:0] _RAND_3;
  wire [3:0] _T_79; // @[imem_interface.scala 128:34:@3187.4]
  wire  _T_81; // @[imem_interface.scala 128:66:@3188.4]
  IMem imem ( // @[imem_interface.scala 40:20:@3098.4]
    .clock(imem_clock),
    .io_imem_addr(imem_io_imem_addr),
    .io_imem_rdata(imem_io_imem_rdata),
    .io_imem_wdata(imem_io_imem_wdata),
    .io_wr_en(imem_io_wr_en)
  );
  BMem bmem ( // @[imem_interface.scala 41:20:@3101.4]
    .clock(bmem_clock),
    .reset(bmem_reset),
    .io_bmem_addr(bmem_io_bmem_addr),
    .io_bmem_rdata(bmem_io_bmem_rdata)
  );
  assign ibus_imem_addr = io_ibus_addr[11:0]; // @[imem_interface.scala 47:41:@3104.4]
  assign wbs_imem_addr = io_wbs_m2s_addr[11:0]; // @[imem_interface.scala 49:44:@3106.4]
  assign _T_45 = io_wbs_m2s_we == 1'h0; // @[imem_interface.scala 57:24:@3109.4]
  assign wb_rd_en = _T_45 & io_wbs_m2s_stb; // @[imem_interface.scala 57:39:@3110.4]
  assign wb_wr_en = io_wbs_m2s_we & io_wbs_m2s_stb; // @[imem_interface.scala 58:38:@3111.4]
  assign _T_46 = io_wbs_m2s_addr[15:12]; // @[imem_interface.scala 63:46:@3112.4]
  assign _T_48 = _T_46 != 4'h0; // @[imem_interface.scala 63:84:@3113.4]
  assign imem_wbs_addr_match = _T_48 == 1'h0; // @[imem_interface.scala 63:29:@3114.4]
  assign _T_52 = wb_rd_en | wb_wr_en; // @[imem_interface.scala 70:33:@3118.4]
  assign imem_wbs_sel = _T_52 & imem_wbs_addr_match; // @[imem_interface.scala 70:46:@3119.4]
  assign _T_57 = imem_wbs_sel == 1'h0; // @[imem_interface.scala 72:22:@3122.4]
  assign imem_addr = imem_wbs_sel ? wbs_imem_addr : ibus_imem_addr; // @[imem_interface.scala 80:27:@3128.4]
  assign rd_imem_inst = imem_ibus_valid ? imem_io_imem_rdata : 32'h0; // @[imem_interface.scala 92:23:@3133.4]
  assign rd_imem_const = imem_ibus_valid ? 32'h0 : imem_io_imem_rdata; // @[imem_interface.scala 92:23:@3133.4]
  assign _GEN_2 = imem_wbs_sel ? io_wbs_m2s_stb : ack; // @[imem_interface.scala 98:20:@3139.4]
  assign _T_64 = wb_select == 4'h1; // @[imem_interface.scala 106:18:@3145.4]
  assign _T_65 = rd_imem_const[7:0]; // @[imem_interface.scala 107:33:@3147.6]
  assign _T_66 = wb_select == 4'h2; // @[imem_interface.scala 108:24:@3151.6]
  assign _T_67 = rd_imem_const[15:8]; // @[imem_interface.scala 109:33:@3153.8]
  assign _T_68 = wb_select == 4'h4; // @[imem_interface.scala 110:24:@3157.8]
  assign _T_69 = rd_imem_const[23:16]; // @[imem_interface.scala 111:33:@3159.10]
  assign _T_70 = wb_select == 4'h8; // @[imem_interface.scala 112:24:@3163.10]
  assign _T_71 = rd_imem_const[31:24]; // @[imem_interface.scala 113:33:@3165.12]
  assign _T_72 = wb_select == 4'h3; // @[imem_interface.scala 114:24:@3169.12]
  assign _T_73 = rd_imem_const[15:0]; // @[imem_interface.scala 115:33:@3171.14]
  assign _T_74 = wb_select == 4'hc; // @[imem_interface.scala 116:24:@3175.14]
  assign _T_75 = rd_imem_const[31:16]; // @[imem_interface.scala 117:33:@3177.16]
  assign _GEN_3 = _T_74 ? {{16'd0}, _T_75} : rd_imem_const; // @[imem_interface.scala 116:54:@3176.14]
  assign _GEN_4 = _T_72 ? {{16'd0}, _T_73} : _GEN_3; // @[imem_interface.scala 114:52:@3170.12]
  assign _GEN_5 = _T_70 ? {{24'd0}, _T_71} : _GEN_4; // @[imem_interface.scala 112:52:@3164.10]
  assign _GEN_6 = _T_68 ? {{24'd0}, _T_69} : _GEN_5; // @[imem_interface.scala 110:52:@3158.8]
  assign _GEN_7 = _T_66 ? {{24'd0}, _T_67} : _GEN_6; // @[imem_interface.scala 108:52:@3152.6]
  assign _T_79 = io_ibus_addr[15:12]; // @[imem_interface.scala 128:34:@3187.4]
  assign _T_81 = _T_79 == 4'h7; // @[imem_interface.scala 128:66:@3188.4]
  assign io_ibus_inst = bmem_ibus_sel ? bmem_io_bmem_rdata : rd_imem_inst; // @[imem_interface.scala 137:19:@3192.4]
  assign io_ibus_valid = bmem_ibus_sel ? 1'h1 : imem_ibus_valid; // @[imem_interface.scala 138:19:@3194.4]
  assign io_wbs_ack_o = ack; // @[imem_interface.scala 123:18:@3184.4]
  assign io_wbs_data_o = _T_64 ? {{24'd0}, _T_65} : _GEN_7; // @[imem_interface.scala 124:18:@3185.4]
  assign imem_clock = clock; // @[:@3099.4]
  assign imem_io_imem_addr = {{20'd0}, imem_addr}; // @[imem_interface.scala 81:21:@3129.4]
  assign imem_io_imem_wdata = io_wbs_m2s_data; // @[imem_interface.scala 87:22:@3130.4]
  assign imem_io_wr_en = imem_wbs_addr_match & wb_wr_en; // @[imem_interface.scala 88:17:@3131.4]
  assign bmem_clock = clock; // @[:@3102.4]
  assign bmem_reset = reset; // @[:@3103.4]
  assign bmem_io_bmem_addr = {{20'd0}, ibus_imem_addr}; // @[imem_interface.scala 130:21:@3190.4]
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
  ack = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  wb_select = _RAND_1[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  imem_ibus_valid = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  bmem_ibus_sel = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      ack <= 1'h1;
    end else begin
      if (imem_wbs_sel) begin
        ack <= io_wbs_m2s_stb;
      end
    end
    wb_select <= io_wbs_m2s_sel;
    if (reset) begin
      imem_ibus_valid <= 1'h1;
    end else begin
      imem_ibus_valid <= _T_57;
    end
    if (reset) begin
      bmem_ibus_sel <= 1'h0;
    end else begin
      bmem_ibus_sel <= _T_81;
    end
  end
endmodule
module WBM_DBus( // @[:@3196.2]
  input  [31:0] io_dbus_addr, // @[:@3199.4]
  input  [31:0] io_dbus_wdata, // @[:@3199.4]
  output [31:0] io_dbus_rdata, // @[:@3199.4]
  input         io_dbus_rd_en, // @[:@3199.4]
  input         io_dbus_wr_en, // @[:@3199.4]
  input  [1:0]  io_dbus_st_type, // @[:@3199.4]
  input  [2:0]  io_dbus_ld_type, // @[:@3199.4]
  output        io_dbus_valid, // @[:@3199.4]
  output [15:0] io_wbm_m2s_addr, // @[:@3199.4]
  output [31:0] io_wbm_m2s_data, // @[:@3199.4]
  output        io_wbm_m2s_we, // @[:@3199.4]
  output [3:0]  io_wbm_m2s_sel, // @[:@3199.4]
  output        io_wbm_m2s_stb, // @[:@3199.4]
  input         io_wbm_ack_i, // @[:@3199.4]
  input  [31:0] io_wbm_data_i // @[:@3199.4]
);
  wire  _T_39; // @[wbm_dbus.scala 35:19:@3203.4]
  wire  _T_40; // @[wbm_dbus.scala 38:26:@3208.6]
  wire  _T_41; // @[wbm_dbus.scala 41:26:@3213.8]
  wire [3:0] _GEN_0; // @[wbm_dbus.scala 41:46:@3214.8]
  wire [3:0] _GEN_1; // @[wbm_dbus.scala 38:47:@3209.6]
  wire [3:0] st_sel_vec; // @[wbm_dbus.scala 35:40:@3204.4]
  wire [1:0] ld_align; // @[wbm_dbus.scala 46:30:@3217.4]
  wire  _T_44; // @[wbm_dbus.scala 51:16:@3220.4]
  wire  _T_45; // @[wbm_dbus.scala 54:23:@3225.6]
  wire  _T_46; // @[wbm_dbus.scala 54:54:@3226.6]
  wire  _T_47; // @[wbm_dbus.scala 54:43:@3227.6]
  wire  _T_48; // @[wbm_dbus.scala 55:34:@3229.8]
  wire [3:0] _T_49; // @[wbm_dbus.scala 55:25:@3230.8]
  wire  _T_50; // @[wbm_dbus.scala 57:23:@3234.8]
  wire  _T_51; // @[wbm_dbus.scala 57:54:@3235.8]
  wire  _T_52; // @[wbm_dbus.scala 57:43:@3236.8]
  wire  _T_54; // @[wbm_dbus.scala 58:21:@3238.10]
  wire  _T_56; // @[wbm_dbus.scala 60:27:@3243.12]
  wire  _T_58; // @[wbm_dbus.scala 62:27:@3248.14]
  wire [3:0] _GEN_3; // @[wbm_dbus.scala 62:37:@3249.14]
  wire [3:0] _GEN_4; // @[wbm_dbus.scala 60:37:@3244.12]
  wire [3:0] _GEN_5; // @[wbm_dbus.scala 58:32:@3239.10]
  wire [3:0] _GEN_6; // @[wbm_dbus.scala 57:75:@3237.8]
  wire [3:0] _GEN_7; // @[wbm_dbus.scala 54:76:@3228.6]
  wire [3:0] ld_sel_vec; // @[wbm_dbus.scala 51:37:@3221.4]
  wire  _T_61; // @[wbm_dbus.scala 74:37:@3260.4]
  assign _T_39 = io_dbus_st_type == 2'h1; // @[wbm_dbus.scala 35:19:@3203.4]
  assign _T_40 = io_dbus_st_type == 2'h2; // @[wbm_dbus.scala 38:26:@3208.6]
  assign _T_41 = io_dbus_st_type == 2'h3; // @[wbm_dbus.scala 41:26:@3213.8]
  assign _GEN_0 = _T_41 ? 4'h1 : 4'h0; // @[wbm_dbus.scala 41:46:@3214.8]
  assign _GEN_1 = _T_40 ? 4'h3 : _GEN_0; // @[wbm_dbus.scala 38:47:@3209.6]
  assign st_sel_vec = _T_39 ? 4'hf : _GEN_1; // @[wbm_dbus.scala 35:40:@3204.4]
  assign ld_align = io_dbus_addr[1:0]; // @[wbm_dbus.scala 46:30:@3217.4]
  assign _T_44 = io_dbus_ld_type == 3'h1; // @[wbm_dbus.scala 51:16:@3220.4]
  assign _T_45 = io_dbus_ld_type == 3'h2; // @[wbm_dbus.scala 54:23:@3225.6]
  assign _T_46 = io_dbus_ld_type == 3'h4; // @[wbm_dbus.scala 54:54:@3226.6]
  assign _T_47 = _T_45 | _T_46; // @[wbm_dbus.scala 54:43:@3227.6]
  assign _T_48 = ld_align[1]; // @[wbm_dbus.scala 55:34:@3229.8]
  assign _T_49 = _T_48 ? 4'hc : 4'h3; // @[wbm_dbus.scala 55:25:@3230.8]
  assign _T_50 = io_dbus_ld_type == 3'h3; // @[wbm_dbus.scala 57:23:@3234.8]
  assign _T_51 = io_dbus_ld_type == 3'h5; // @[wbm_dbus.scala 57:54:@3235.8]
  assign _T_52 = _T_50 | _T_51; // @[wbm_dbus.scala 57:43:@3236.8]
  assign _T_54 = ld_align == 2'h3; // @[wbm_dbus.scala 58:21:@3238.10]
  assign _T_56 = ld_align == 2'h2; // @[wbm_dbus.scala 60:27:@3243.12]
  assign _T_58 = ld_align == 2'h1; // @[wbm_dbus.scala 62:27:@3248.14]
  assign _GEN_3 = _T_58 ? 4'h2 : 4'h1; // @[wbm_dbus.scala 62:37:@3249.14]
  assign _GEN_4 = _T_56 ? 4'h4 : _GEN_3; // @[wbm_dbus.scala 60:37:@3244.12]
  assign _GEN_5 = _T_54 ? 4'h8 : _GEN_4; // @[wbm_dbus.scala 58:32:@3239.10]
  assign _GEN_6 = _T_52 ? _GEN_5 : 4'h0; // @[wbm_dbus.scala 57:75:@3237.8]
  assign _GEN_7 = _T_47 ? _T_49 : _GEN_6; // @[wbm_dbus.scala 54:76:@3228.6]
  assign ld_sel_vec = _T_44 ? 4'hf : _GEN_7; // @[wbm_dbus.scala 51:37:@3221.4]
  assign _T_61 = io_dbus_st_type != 2'h0; // @[wbm_dbus.scala 74:37:@3260.4]
  assign io_dbus_rdata = io_wbm_data_i; // @[wbm_dbus.scala 78:19:@3268.4]
  assign io_dbus_valid = io_wbm_ack_i; // @[wbm_dbus.scala 79:19:@3269.4]
  assign io_wbm_m2s_addr = io_dbus_addr[15:0]; // @[wbm_dbus.scala 71:19:@3257.4]
  assign io_wbm_m2s_data = io_dbus_wdata; // @[wbm_dbus.scala 72:19:@3258.4]
  assign io_wbm_m2s_we = io_dbus_wr_en; // @[wbm_dbus.scala 73:19:@3259.4]
  assign io_wbm_m2s_sel = _T_61 ? st_sel_vec : ld_sel_vec; // @[wbm_dbus.scala 74:19:@3262.4]
  assign io_wbm_m2s_stb = io_dbus_rd_en | io_dbus_wr_en; // @[wbm_dbus.scala 75:19:@3266.4]
endmodule
module UARTTx( // @[:@3271.2]
  input        clock, // @[:@3272.4]
  input        reset, // @[:@3273.4]
  output       io_in_ready, // @[:@3274.4]
  input        io_in_valid, // @[:@3274.4]
  input  [7:0] io_in_bits, // @[:@3274.4]
  output       io_out, // @[:@3274.4]
  input  [9:0] io_div // @[:@3274.4]
);
  reg [9:0] prescaler; // @[uart_tx.scala 23:26:@3276.4]
  reg [31:0] _RAND_0;
  wire  pulse; // @[uart_tx.scala 24:30:@3277.4]
  reg [3:0] counter; // @[uart_tx.scala 27:26:@3278.4]
  reg [31:0] _RAND_1;
  reg [8:0] shifter; // @[uart_tx.scala 28:22:@3279.4]
  reg [31:0] _RAND_2;
  reg  out; // @[uart_tx.scala 29:26:@3280.4]
  reg [31:0] _RAND_3;
  wire  busy; // @[uart_tx.scala 32:28:@3282.4]
  wire  _T_33; // @[uart_tx.scala 33:34:@3283.4]
  wire  state1; // @[uart_tx.scala 33:31:@3284.4]
  wire [8:0] _T_37; // @[Cat.scala 30:58:@3288.6]
  wire [8:0] _GEN_0; // @[uart_tx.scala 37:16:@3287.4]
  wire [3:0] _GEN_1; // @[uart_tx.scala 37:16:@3287.4]
  wire [10:0] _T_53; // @[uart_tx.scala 45:37:@3300.6]
  wire [10:0] _T_54; // @[uart_tx.scala 45:37:@3301.6]
  wire [9:0] _T_55; // @[uart_tx.scala 45:37:@3302.6]
  wire [10:0] _T_57; // @[uart_tx.scala 45:55:@3303.6]
  wire [10:0] _T_58; // @[uart_tx.scala 45:55:@3304.6]
  wire [9:0] _T_59; // @[uart_tx.scala 45:55:@3305.6]
  wire [9:0] _T_60; // @[uart_tx.scala 45:21:@3306.6]
  wire [4:0] _T_62; // @[uart_tx.scala 48:26:@3309.8]
  wire [4:0] _T_63; // @[uart_tx.scala 48:26:@3310.8]
  wire [3:0] _T_64; // @[uart_tx.scala 48:26:@3311.8]
  wire [7:0] _T_66; // @[uart_tx.scala 49:38:@3313.8]
  wire [8:0] _T_67; // @[Cat.scala 30:58:@3314.8]
  wire  _T_68; // @[uart_tx.scala 50:25:@3316.8]
  wire [3:0] _GEN_2; // @[uart_tx.scala 47:17:@3308.6]
  wire [8:0] _GEN_3; // @[uart_tx.scala 47:17:@3308.6]
  wire  _GEN_4; // @[uart_tx.scala 47:17:@3308.6]
  wire [9:0] _GEN_5; // @[uart_tx.scala 44:16:@3299.4]
  wire [3:0] _GEN_6; // @[uart_tx.scala 44:16:@3299.4]
  wire  _GEN_8; // @[uart_tx.scala 44:16:@3299.4]
  assign pulse = prescaler == 10'h0; // @[uart_tx.scala 24:30:@3277.4]
  assign busy = counter != 4'h0; // @[uart_tx.scala 32:28:@3282.4]
  assign _T_33 = busy == 1'h0; // @[uart_tx.scala 33:34:@3283.4]
  assign state1 = io_in_valid & _T_33; // @[uart_tx.scala 33:31:@3284.4]
  assign _T_37 = {io_in_bits,1'h0}; // @[Cat.scala 30:58:@3288.6]
  assign _GEN_0 = state1 ? _T_37 : shifter; // @[uart_tx.scala 37:16:@3287.4]
  assign _GEN_1 = state1 ? 4'hb : counter; // @[uart_tx.scala 37:16:@3287.4]
  assign _T_53 = io_div - 10'h1; // @[uart_tx.scala 45:37:@3300.6]
  assign _T_54 = $unsigned(_T_53); // @[uart_tx.scala 45:37:@3301.6]
  assign _T_55 = _T_54[9:0]; // @[uart_tx.scala 45:37:@3302.6]
  assign _T_57 = prescaler - 10'h1; // @[uart_tx.scala 45:55:@3303.6]
  assign _T_58 = $unsigned(_T_57); // @[uart_tx.scala 45:55:@3304.6]
  assign _T_59 = _T_58[9:0]; // @[uart_tx.scala 45:55:@3305.6]
  assign _T_60 = pulse ? _T_55 : _T_59; // @[uart_tx.scala 45:21:@3306.6]
  assign _T_62 = counter - 4'h1; // @[uart_tx.scala 48:26:@3309.8]
  assign _T_63 = $unsigned(_T_62); // @[uart_tx.scala 48:26:@3310.8]
  assign _T_64 = _T_63[3:0]; // @[uart_tx.scala 48:26:@3311.8]
  assign _T_66 = shifter[8:1]; // @[uart_tx.scala 49:38:@3313.8]
  assign _T_67 = {1'h1,_T_66}; // @[Cat.scala 30:58:@3314.8]
  assign _T_68 = shifter[0]; // @[uart_tx.scala 50:25:@3316.8]
  assign _GEN_2 = pulse ? _T_64 : _GEN_1; // @[uart_tx.scala 47:17:@3308.6]
  assign _GEN_3 = pulse ? _T_67 : _GEN_0; // @[uart_tx.scala 47:17:@3308.6]
  assign _GEN_4 = pulse ? _T_68 : out; // @[uart_tx.scala 47:17:@3308.6]
  assign _GEN_5 = busy ? _T_60 : prescaler; // @[uart_tx.scala 44:16:@3299.4]
  assign _GEN_6 = busy ? _GEN_2 : _GEN_1; // @[uart_tx.scala 44:16:@3299.4]
  assign _GEN_8 = busy ? _GEN_4 : out; // @[uart_tx.scala 44:16:@3299.4]
  assign io_in_ready = busy == 1'h0; // @[uart_tx.scala 35:17:@3286.4]
  assign io_out = out; // @[uart_tx.scala 30:17:@3281.4]
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
  prescaler = _RAND_0[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  counter = _RAND_1[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  shifter = _RAND_2[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  out = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      prescaler <= 10'h0;
    end else begin
      if (busy) begin
        if (pulse) begin
          prescaler <= _T_55;
        end else begin
          prescaler <= _T_59;
        end
      end
    end
    if (reset) begin
      counter <= 4'h0;
    end else begin
      if (busy) begin
        if (pulse) begin
          counter <= _T_64;
        end else begin
          if (state1) begin
            counter <= 4'hb;
          end
        end
      end else begin
        if (state1) begin
          counter <= 4'hb;
        end
      end
    end
    if (busy) begin
      if (pulse) begin
        shifter <= _T_67;
      end else begin
        if (state1) begin
          shifter <= _T_37;
        end
      end
    end else begin
      if (state1) begin
        shifter <= _T_37;
      end
    end
    if (reset) begin
      out <= 1'h1;
    end else begin
      if (busy) begin
        if (pulse) begin
          out <= _T_68;
        end
      end
    end
  end
endmodule
module UARTRx( // @[:@3321.2]
  input        clock, // @[:@3322.4]
  input        reset, // @[:@3323.4]
  input        io_in, // @[:@3324.4]
  output       io_out_valid, // @[:@3324.4]
  output [7:0] io_out_bits, // @[:@3324.4]
  input  [9:0] io_div // @[:@3324.4]
);
  reg [3:0] data_count; // @[uart_rx.scala 23:34:@3326.4]
  reg [31:0] _RAND_0;
  wire  data_last; // @[uart_rx.scala 24:43:@3327.4]
  reg [9:0] prescaler; // @[uart_rx.scala 27:38:@3328.4]
  reg [31:0] _RAND_1;
  wire  pulse; // @[uart_rx.scala 28:42:@3329.4]
  wire [10:0] _T_19; // @[uart_rx.scala 29:50:@3330.4]
  wire [10:0] _T_20; // @[uart_rx.scala 29:50:@3331.4]
  wire [9:0] _T_21; // @[uart_rx.scala 29:50:@3332.4]
  wire [10:0] _T_23; // @[uart_rx.scala 29:68:@3333.4]
  wire [10:0] _T_24; // @[uart_rx.scala 29:68:@3334.4]
  wire [9:0] _T_25; // @[uart_rx.scala 29:68:@3335.4]
  wire [9:0] prescaler_next; // @[uart_rx.scala 29:34:@3336.4]
  reg [8:0] debounce; // @[uart_rx.scala 32:38:@3337.4]
  reg [31:0] _RAND_2;
  wire [9:0] _T_29; // @[uart_rx.scala 33:52:@3338.4]
  wire [9:0] _GEN_28; // @[uart_rx.scala 33:41:@3339.4]
  wire  debounce_max; // @[uart_rx.scala 33:41:@3339.4]
  reg [7:0] shifter; // @[uart_rx.scala 36:27:@3340.4]
  reg [31:0] _RAND_3;
  reg  valid; // @[uart_rx.scala 37:23:@3341.4]
  reg [31:0] _RAND_4;
  reg  state; // @[uart_rx.scala 44:27:@3345.4]
  reg [31:0] _RAND_5;
  wire  _T_35; // @[Conditional.scala 37:30:@3346.4]
  wire  _T_37; // @[uart_rx.scala 48:13:@3348.6]
  wire [9:0] _T_39; // @[uart_rx.scala 50:30:@3350.8]
  wire [8:0] _T_40; // @[uart_rx.scala 50:30:@3351.8]
  wire  _GEN_0; // @[uart_rx.scala 51:29:@3353.8]
  wire [3:0] _GEN_1; // @[uart_rx.scala 51:29:@3353.8]
  wire [9:0] _GEN_2; // @[uart_rx.scala 51:29:@3353.8]
  wire [8:0] _GEN_3; // @[uart_rx.scala 48:21:@3349.6]
  wire  _GEN_4; // @[uart_rx.scala 48:21:@3349.6]
  wire [3:0] _GEN_5; // @[uart_rx.scala 48:21:@3349.6]
  wire [9:0] _GEN_6; // @[uart_rx.scala 48:21:@3349.6]
  wire [4:0] _T_44; // @[uart_rx.scala 62:34:@3365.10]
  wire [4:0] _T_45; // @[uart_rx.scala 62:34:@3366.10]
  wire [3:0] _T_46; // @[uart_rx.scala 62:34:@3367.10]
  wire [6:0] _T_49; // @[uart_rx.scala 70:44:@3375.12]
  wire [7:0] _T_50; // @[Cat.scala 30:58:@3376.12]
  wire  _GEN_7; // @[uart_rx.scala 64:26:@3369.10]
  wire [8:0] _GEN_9; // @[uart_rx.scala 64:26:@3369.10]
  wire [7:0] _GEN_10; // @[uart_rx.scala 64:26:@3369.10]
  wire [3:0] _GEN_11; // @[uart_rx.scala 61:20:@3364.8]
  wire  _GEN_12; // @[uart_rx.scala 61:20:@3364.8]
  wire  _GEN_13; // @[uart_rx.scala 61:20:@3364.8]
  wire [8:0] _GEN_14; // @[uart_rx.scala 61:20:@3364.8]
  wire [7:0] _GEN_15; // @[uart_rx.scala 61:20:@3364.8]
  wire [9:0] _GEN_16; // @[Conditional.scala 39:67:@3362.6]
  wire [3:0] _GEN_17; // @[Conditional.scala 39:67:@3362.6]
  wire  _GEN_18; // @[Conditional.scala 39:67:@3362.6]
  wire  _GEN_19; // @[Conditional.scala 39:67:@3362.6]
  wire [8:0] _GEN_20; // @[Conditional.scala 39:67:@3362.6]
  wire [7:0] _GEN_21; // @[Conditional.scala 39:67:@3362.6]
  wire [8:0] _GEN_22; // @[Conditional.scala 40:58:@3347.4]
  wire  _GEN_23; // @[Conditional.scala 40:58:@3347.4]
  wire [9:0] _GEN_25; // @[Conditional.scala 40:58:@3347.4]
  wire [7:0] _GEN_27; // @[Conditional.scala 40:58:@3347.4]
  assign data_last = data_count == 4'h0; // @[uart_rx.scala 24:43:@3327.4]
  assign pulse = prescaler == 10'h0; // @[uart_rx.scala 28:42:@3329.4]
  assign _T_19 = io_div - 10'h1; // @[uart_rx.scala 29:50:@3330.4]
  assign _T_20 = $unsigned(_T_19); // @[uart_rx.scala 29:50:@3331.4]
  assign _T_21 = _T_20[9:0]; // @[uart_rx.scala 29:50:@3332.4]
  assign _T_23 = prescaler - 10'h1; // @[uart_rx.scala 29:68:@3333.4]
  assign _T_24 = $unsigned(_T_23); // @[uart_rx.scala 29:68:@3334.4]
  assign _T_25 = _T_24[9:0]; // @[uart_rx.scala 29:68:@3335.4]
  assign prescaler_next = pulse ? _T_21 : _T_25; // @[uart_rx.scala 29:34:@3336.4]
  assign _T_29 = io_div / 10'h2; // @[uart_rx.scala 33:52:@3338.4]
  assign _GEN_28 = {{1'd0}, debounce}; // @[uart_rx.scala 33:41:@3339.4]
  assign debounce_max = _GEN_28 == _T_29; // @[uart_rx.scala 33:41:@3339.4]
  assign _T_35 = 1'h0 == state; // @[Conditional.scala 37:30:@3346.4]
  assign _T_37 = io_in == 1'h0; // @[uart_rx.scala 48:13:@3348.6]
  assign _T_39 = debounce + 9'h1; // @[uart_rx.scala 50:30:@3350.8]
  assign _T_40 = debounce + 9'h1; // @[uart_rx.scala 50:30:@3351.8]
  assign _GEN_0 = debounce_max ? 1'h1 : state; // @[uart_rx.scala 51:29:@3353.8]
  assign _GEN_1 = debounce_max ? 4'h8 : data_count; // @[uart_rx.scala 51:29:@3353.8]
  assign _GEN_2 = debounce_max ? prescaler_next : prescaler; // @[uart_rx.scala 51:29:@3353.8]
  assign _GEN_3 = _T_37 ? _T_40 : debounce; // @[uart_rx.scala 48:21:@3349.6]
  assign _GEN_4 = _T_37 ? _GEN_0 : state; // @[uart_rx.scala 48:21:@3349.6]
  assign _GEN_5 = _T_37 ? _GEN_1 : data_count; // @[uart_rx.scala 48:21:@3349.6]
  assign _GEN_6 = _T_37 ? _GEN_2 : prescaler; // @[uart_rx.scala 48:21:@3349.6]
  assign _T_44 = data_count - 4'h1; // @[uart_rx.scala 62:34:@3365.10]
  assign _T_45 = $unsigned(_T_44); // @[uart_rx.scala 62:34:@3366.10]
  assign _T_46 = _T_45[3:0]; // @[uart_rx.scala 62:34:@3367.10]
  assign _T_49 = shifter[7:1]; // @[uart_rx.scala 70:44:@3375.12]
  assign _T_50 = {io_in,_T_49}; // @[Cat.scala 30:58:@3376.12]
  assign _GEN_7 = data_last ? 1'h0 : state; // @[uart_rx.scala 64:26:@3369.10]
  assign _GEN_9 = data_last ? 9'h0 : debounce; // @[uart_rx.scala 64:26:@3369.10]
  assign _GEN_10 = data_last ? shifter : _T_50; // @[uart_rx.scala 64:26:@3369.10]
  assign _GEN_11 = pulse ? _T_46 : data_count; // @[uart_rx.scala 61:20:@3364.8]
  assign _GEN_12 = pulse ? _GEN_7 : state; // @[uart_rx.scala 61:20:@3364.8]
  assign _GEN_13 = pulse ? data_last : 1'h0; // @[uart_rx.scala 61:20:@3364.8]
  assign _GEN_14 = pulse ? _GEN_9 : debounce; // @[uart_rx.scala 61:20:@3364.8]
  assign _GEN_15 = pulse ? _GEN_10 : shifter; // @[uart_rx.scala 61:20:@3364.8]
  assign _GEN_16 = state ? prescaler_next : prescaler; // @[Conditional.scala 39:67:@3362.6]
  assign _GEN_17 = state ? _GEN_11 : data_count; // @[Conditional.scala 39:67:@3362.6]
  assign _GEN_18 = state ? _GEN_12 : state; // @[Conditional.scala 39:67:@3362.6]
  assign _GEN_19 = state ? _GEN_13 : 1'h0; // @[Conditional.scala 39:67:@3362.6]
  assign _GEN_20 = state ? _GEN_14 : debounce; // @[Conditional.scala 39:67:@3362.6]
  assign _GEN_21 = state ? _GEN_15 : shifter; // @[Conditional.scala 39:67:@3362.6]
  assign _GEN_22 = _T_35 ? _GEN_3 : _GEN_20; // @[Conditional.scala 40:58:@3347.4]
  assign _GEN_23 = _T_35 ? _GEN_4 : _GEN_18; // @[Conditional.scala 40:58:@3347.4]
  assign _GEN_25 = _T_35 ? _GEN_6 : _GEN_16; // @[Conditional.scala 40:58:@3347.4]
  assign _GEN_27 = _T_35 ? shifter : _GEN_21; // @[Conditional.scala 40:58:@3347.4]
  assign io_out_valid = valid; // @[uart_rx.scala 39:18:@3343.4]
  assign io_out_bits = shifter; // @[uart_rx.scala 40:18:@3344.4]
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
  data_count = _RAND_0[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  prescaler = _RAND_1[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  debounce = _RAND_2[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  shifter = _RAND_3[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  valid = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  state = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (_T_35) begin
      if (_T_37) begin
        if (debounce_max) begin
          data_count <= 4'h8;
        end
      end
    end else begin
      if (state) begin
        if (pulse) begin
          data_count <= _T_46;
        end
      end
    end
    if (reset) begin
      prescaler <= 10'h0;
    end else begin
      if (_T_35) begin
        if (_T_37) begin
          if (debounce_max) begin
            if (pulse) begin
              prescaler <= _T_21;
            end else begin
              prescaler <= _T_25;
            end
          end
        end
      end else begin
        if (state) begin
          if (pulse) begin
            prescaler <= _T_21;
          end else begin
            prescaler <= _T_25;
          end
        end
      end
    end
    if (reset) begin
      debounce <= 9'h0;
    end else begin
      if (_T_35) begin
        if (_T_37) begin
          debounce <= _T_40;
        end
      end else begin
        if (state) begin
          if (pulse) begin
            if (data_last) begin
              debounce <= 9'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      shifter <= 8'h0;
    end else begin
      if (!(_T_35)) begin
        if (state) begin
          if (pulse) begin
            if (!(data_last)) begin
              shifter <= _T_50;
            end
          end
        end
      end
    end
    if (_T_35) begin
      valid <= 1'h0;
    end else begin
      if (state) begin
        if (pulse) begin
          valid <= data_last;
        end else begin
          valid <= 1'h0;
        end
      end else begin
        valid <= 1'h0;
      end
    end
    if (reset) begin
      state <= 1'h0;
    end else begin
      if (_T_35) begin
        if (_T_37) begin
          if (debounce_max) begin
            state <= 1'h1;
          end
        end
      end else begin
        if (state) begin
          if (pulse) begin
            if (data_last) begin
              state <= 1'h0;
            end
          end
        end
      end
    end
  end
endmodule
module UART( // @[:@3382.2]
  input         clock, // @[:@3383.4]
  input         reset, // @[:@3384.4]
  input         io_uart_select, // @[:@3385.4]
  output        io_txd, // @[:@3385.4]
  input         io_rxd, // @[:@3385.4]
  output        io_uartInt, // @[:@3385.4]
  input  [15:0] io_wbs_m2s_addr, // @[:@3385.4]
  input  [31:0] io_wbs_m2s_data, // @[:@3385.4]
  input         io_wbs_m2s_we, // @[:@3385.4]
  input         io_wbs_m2s_stb, // @[:@3385.4]
  output        io_wbs_ack_o, // @[:@3385.4]
  output [31:0] io_wbs_data_o // @[:@3385.4]
);
  wire  txm_clock; // @[uart.scala 53:19:@3387.4]
  wire  txm_reset; // @[uart.scala 53:19:@3387.4]
  wire  txm_io_in_ready; // @[uart.scala 53:19:@3387.4]
  wire  txm_io_in_valid; // @[uart.scala 53:19:@3387.4]
  wire [7:0] txm_io_in_bits; // @[uart.scala 53:19:@3387.4]
  wire  txm_io_out; // @[uart.scala 53:19:@3387.4]
  wire [9:0] txm_io_div; // @[uart.scala 53:19:@3387.4]
  wire  rxm_clock; // @[uart.scala 54:19:@3390.4]
  wire  rxm_reset; // @[uart.scala 54:19:@3390.4]
  wire  rxm_io_in; // @[uart.scala 54:19:@3390.4]
  wire  rxm_io_out_valid; // @[uart.scala 54:19:@3390.4]
  wire [7:0] rxm_io_out_bits; // @[uart.scala 54:19:@3390.4]
  wire [9:0] rxm_io_div; // @[uart.scala 54:19:@3390.4]
  reg  txen; // @[uart.scala 57:27:@3393.4]
  reg [31:0] _RAND_0;
  reg [7:0] tx_data_r; // @[uart.scala 60:27:@3395.4]
  reg [31:0] _RAND_1;
  reg [7:0] rx_data_r; // @[uart.scala 61:27:@3396.4]
  reg [31:0] _RAND_2;
  reg [7:0] control_r; // @[uart.scala 62:27:@3397.4]
  reg [31:0] _RAND_3;
  reg [9:0] baud_r; // @[uart.scala 63:27:@3398.4]
  reg [31:0] _RAND_4;
  reg [7:0] status_r; // @[uart.scala 64:27:@3399.4]
  reg [31:0] _RAND_5;
  reg [7:0] int_mask_r; // @[uart.scala 65:27:@3400.4]
  reg [31:0] _RAND_6;
  wire [7:0] addr; // @[uart.scala 85:36:@3410.4]
  wire  _T_63; // @[uart.scala 86:21:@3411.4]
  wire  rd_en; // @[uart.scala 86:36:@3412.4]
  wire  wr_en; // @[uart.scala 87:35:@3413.4]
  wire  _T_70; // @[uart.scala 91:32:@3414.4]
  wire  sel_reg_rx; // @[uart.scala 91:56:@3415.4]
  wire  _T_71; // @[uart.scala 92:32:@3416.4]
  wire  sel_reg_tx; // @[uart.scala 92:56:@3417.4]
  wire  _T_72; // @[uart.scala 93:32:@3418.4]
  wire  sel_reg_baud; // @[uart.scala 93:54:@3419.4]
  wire  _T_73; // @[uart.scala 94:32:@3420.4]
  wire  sel_reg_control; // @[uart.scala 94:57:@3421.4]
  wire  _T_74; // @[uart.scala 95:32:@3422.4]
  wire  sel_reg_status; // @[uart.scala 95:56:@3423.4]
  wire  _T_75; // @[uart.scala 96:32:@3424.4]
  wire  sel_reg_int_mask; // @[uart.scala 96:58:@3425.4]
  reg  ack; // @[uart.scala 99:28:@3426.4]
  reg [31:0] _RAND_7;
  reg [7:0] rd_data; // @[uart.scala 104:28:@3430.4]
  reg [31:0] _RAND_8;
  wire  _T_81; // @[uart.scala 106:14:@3431.4]
  wire  _T_82; // @[uart.scala 108:20:@3436.6]
  wire  _T_83; // @[uart.scala 110:20:@3441.8]
  wire  _T_84; // @[uart.scala 112:20:@3446.10]
  wire [7:0] _GEN_0; // @[uart.scala 112:34:@3447.10]
  wire [7:0] _GEN_1; // @[uart.scala 110:38:@3442.8]
  wire [9:0] _GEN_2; // @[uart.scala 108:36:@3437.6]
  wire [9:0] _GEN_3; // @[uart.scala 106:33:@3432.4]
  wire [7:0] _T_86; // @[uart.scala 120:31:@3454.4]
  wire [7:0] _T_89; // @[uart.scala 125:36:@3459.8]
  wire [7:0] _GEN_4; // @[uart.scala 134:32:@3474.12]
  wire [7:0] _GEN_5; // @[uart.scala 131:31:@3469.10]
  wire [7:0] _GEN_6; // @[uart.scala 131:31:@3469.10]
  wire [9:0] _GEN_7; // @[uart.scala 128:29:@3464.8]
  wire [7:0] _GEN_8; // @[uart.scala 128:29:@3464.8]
  wire [7:0] _GEN_9; // @[uart.scala 128:29:@3464.8]
  wire [7:0] _GEN_10; // @[uart.scala 124:22:@3458.6]
  wire [9:0] _GEN_12; // @[uart.scala 124:22:@3458.6]
  wire [7:0] _GEN_13; // @[uart.scala 124:22:@3458.6]
  wire [7:0] _GEN_14; // @[uart.scala 124:22:@3458.6]
  wire [7:0] _GEN_15; // @[uart.scala 123:15:@3457.4]
  wire  _GEN_16; // @[uart.scala 123:15:@3457.4]
  wire [9:0] _GEN_17; // @[uart.scala 123:15:@3457.4]
  wire [7:0] _GEN_18; // @[uart.scala 123:15:@3457.4]
  wire [7:0] _GEN_19; // @[uart.scala 123:15:@3457.4]
  wire [6:0] _T_94; // @[uart.scala 142:33:@3481.6]
  wire [7:0] _T_96; // @[Cat.scala 30:58:@3482.6]
  wire  _T_97; // @[uart.scala 143:20:@3486.6]
  wire [5:0] _T_99; // @[uart.scala 146:33:@3492.8]
  wire  _T_100; // @[uart.scala 146:65:@3493.8]
  wire [7:0] _T_102; // @[Cat.scala 30:58:@3495.8]
  wire [7:0] _GEN_20; // @[uart.scala 143:38:@3487.6]
  wire [7:0] _GEN_21; // @[uart.scala 140:25:@3479.4]
  wire [7:0] _GEN_22; // @[uart.scala 140:25:@3479.4]
  UARTTx txm ( // @[uart.scala 53:19:@3387.4]
    .clock(txm_clock),
    .reset(txm_reset),
    .io_in_ready(txm_io_in_ready),
    .io_in_valid(txm_io_in_valid),
    .io_in_bits(txm_io_in_bits),
    .io_out(txm_io_out),
    .io_div(txm_io_div)
  );
  UARTRx rxm ( // @[uart.scala 54:19:@3390.4]
    .clock(rxm_clock),
    .reset(rxm_reset),
    .io_in(rxm_io_in),
    .io_out_valid(rxm_io_out_valid),
    .io_out_bits(rxm_io_out_bits),
    .io_div(rxm_io_div)
  );
  assign addr = io_wbs_m2s_addr[7:0]; // @[uart.scala 85:36:@3410.4]
  assign _T_63 = io_wbs_m2s_we == 1'h0; // @[uart.scala 86:21:@3411.4]
  assign rd_en = _T_63 & io_wbs_m2s_stb; // @[uart.scala 86:36:@3412.4]
  assign wr_en = io_wbs_m2s_we & io_wbs_m2s_stb; // @[uart.scala 87:35:@3413.4]
  assign _T_70 = addr == 8'h0; // @[uart.scala 91:32:@3414.4]
  assign sel_reg_rx = _T_70 & io_uart_select; // @[uart.scala 91:56:@3415.4]
  assign _T_71 = addr == 8'h1; // @[uart.scala 92:32:@3416.4]
  assign sel_reg_tx = _T_71 & io_uart_select; // @[uart.scala 92:56:@3417.4]
  assign _T_72 = addr == 8'h2; // @[uart.scala 93:32:@3418.4]
  assign sel_reg_baud = _T_72 & io_uart_select; // @[uart.scala 93:54:@3419.4]
  assign _T_73 = addr == 8'h3; // @[uart.scala 94:32:@3420.4]
  assign sel_reg_control = _T_73 & io_uart_select; // @[uart.scala 94:57:@3421.4]
  assign _T_74 = addr == 8'h4; // @[uart.scala 95:32:@3422.4]
  assign sel_reg_status = _T_74 & io_uart_select; // @[uart.scala 95:56:@3423.4]
  assign _T_75 = addr == 8'h5; // @[uart.scala 96:32:@3424.4]
  assign sel_reg_int_mask = _T_75 & io_uart_select; // @[uart.scala 96:58:@3425.4]
  assign _T_81 = rd_en & sel_reg_control; // @[uart.scala 106:14:@3431.4]
  assign _T_82 = rd_en & sel_reg_baud; // @[uart.scala 108:20:@3436.6]
  assign _T_83 = rd_en & sel_reg_status; // @[uart.scala 110:20:@3441.8]
  assign _T_84 = rd_en & sel_reg_rx; // @[uart.scala 112:20:@3446.10]
  assign _GEN_0 = _T_84 ? rx_data_r : 8'h0; // @[uart.scala 112:34:@3447.10]
  assign _GEN_1 = _T_83 ? status_r : _GEN_0; // @[uart.scala 110:38:@3442.8]
  assign _GEN_2 = _T_82 ? baud_r : {{2'd0}, _GEN_1}; // @[uart.scala 108:36:@3437.6]
  assign _GEN_3 = _T_81 ? {{2'd0}, control_r} : _GEN_2; // @[uart.scala 106:33:@3432.4]
  assign _T_86 = status_r & int_mask_r; // @[uart.scala 120:31:@3454.4]
  assign _T_89 = io_wbs_m2s_data[7:0]; // @[uart.scala 125:36:@3459.8]
  assign _GEN_4 = sel_reg_int_mask ? _T_89 : int_mask_r; // @[uart.scala 134:32:@3474.12]
  assign _GEN_5 = sel_reg_control ? _T_89 : control_r; // @[uart.scala 131:31:@3469.10]
  assign _GEN_6 = sel_reg_control ? int_mask_r : _GEN_4; // @[uart.scala 131:31:@3469.10]
  assign _GEN_7 = sel_reg_baud ? {{2'd0}, _T_89} : baud_r; // @[uart.scala 128:29:@3464.8]
  assign _GEN_8 = sel_reg_baud ? control_r : _GEN_5; // @[uart.scala 128:29:@3464.8]
  assign _GEN_9 = sel_reg_baud ? int_mask_r : _GEN_6; // @[uart.scala 128:29:@3464.8]
  assign _GEN_10 = sel_reg_tx ? _T_89 : tx_data_r; // @[uart.scala 124:22:@3458.6]
  assign _GEN_12 = sel_reg_tx ? baud_r : _GEN_7; // @[uart.scala 124:22:@3458.6]
  assign _GEN_13 = sel_reg_tx ? control_r : _GEN_8; // @[uart.scala 124:22:@3458.6]
  assign _GEN_14 = sel_reg_tx ? int_mask_r : _GEN_9; // @[uart.scala 124:22:@3458.6]
  assign _GEN_15 = wr_en ? _GEN_10 : tx_data_r; // @[uart.scala 123:15:@3457.4]
  assign _GEN_16 = wr_en ? sel_reg_tx : 1'h0; // @[uart.scala 123:15:@3457.4]
  assign _GEN_17 = wr_en ? _GEN_12 : baud_r; // @[uart.scala 123:15:@3457.4]
  assign _GEN_18 = wr_en ? _GEN_13 : control_r; // @[uart.scala 123:15:@3457.4]
  assign _GEN_19 = wr_en ? _GEN_14 : int_mask_r; // @[uart.scala 123:15:@3457.4]
  assign _T_94 = status_r[7:1]; // @[uart.scala 142:33:@3481.6]
  assign _T_96 = {_T_94,1'h1}; // @[Cat.scala 30:58:@3482.6]
  assign _T_97 = wr_en & sel_reg_status; // @[uart.scala 143:20:@3486.6]
  assign _T_99 = status_r[7:2]; // @[uart.scala 146:33:@3492.8]
  assign _T_100 = status_r[0]; // @[uart.scala 146:65:@3493.8]
  assign _T_102 = {_T_99,txm_io_in_ready,_T_100}; // @[Cat.scala 30:58:@3495.8]
  assign _GEN_20 = _T_97 ? _T_89 : _T_102; // @[uart.scala 143:38:@3487.6]
  assign _GEN_21 = rxm_io_out_valid ? rxm_io_out_bits : rx_data_r; // @[uart.scala 140:25:@3479.4]
  assign _GEN_22 = rxm_io_out_valid ? _T_96 : _GEN_20; // @[uart.scala 140:25:@3479.4]
  assign io_txd = txm_io_out; // @[uart.scala 82:19:@3409.4]
  assign io_uartInt = _T_86 != 8'h0; // @[uart.scala 120:18:@3456.4]
  assign io_wbs_ack_o = ack; // @[uart.scala 100:19:@3427.4]
  assign io_wbs_data_o = {{24'd0}, rd_data}; // @[uart.scala 117:18:@3453.4]
  assign txm_clock = clock; // @[:@3388.4]
  assign txm_reset = reset; // @[:@3389.4]
  assign txm_io_in_valid = txen; // @[uart.scala 74:19:@3403.4]
  assign txm_io_in_bits = tx_data_r; // @[uart.scala 75:19:@3404.4]
  assign txm_io_div = baud_r; // @[uart.scala 76:19:@3405.4]
  assign rxm_clock = clock; // @[:@3391.4]
  assign rxm_reset = reset; // @[:@3392.4]
  assign rxm_io_in = io_rxd; // @[uart.scala 81:19:@3408.4]
  assign rxm_io_div = baud_r; // @[uart.scala 78:19:@3407.4]
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
  txen = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  tx_data_r = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  rx_data_r = _RAND_2[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  control_r = _RAND_3[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  baud_r = _RAND_4[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  status_r = _RAND_5[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  int_mask_r = _RAND_6[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  ack = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  rd_data = _RAND_8[7:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      txen <= 1'h0;
    end else begin
      if (wr_en) begin
        txen <= sel_reg_tx;
      end else begin
        txen <= 1'h0;
      end
    end
    if (reset) begin
      tx_data_r <= 8'h4a;
    end else begin
      if (wr_en) begin
        if (sel_reg_tx) begin
          tx_data_r <= _T_89;
        end
      end
    end
    if (reset) begin
      rx_data_r <= 8'h0;
    end else begin
      if (rxm_io_out_valid) begin
        rx_data_r <= rxm_io_out_bits;
      end
    end
    if (reset) begin
      control_r <= 8'h0;
    end else begin
      if (wr_en) begin
        if (!(sel_reg_tx)) begin
          if (!(sel_reg_baud)) begin
            if (sel_reg_control) begin
              control_r <= _T_89;
            end
          end
        end
      end
    end
    if (reset) begin
      baud_r <= 10'h8;
    end else begin
      if (wr_en) begin
        if (!(sel_reg_tx)) begin
          if (sel_reg_baud) begin
            baud_r <= {{2'd0}, _T_89};
          end
        end
      end
    end
    if (reset) begin
      status_r <= 8'h0;
    end else begin
      if (rxm_io_out_valid) begin
        status_r <= _T_96;
      end else begin
        if (_T_97) begin
          status_r <= _T_89;
        end else begin
          status_r <= _T_102;
        end
      end
    end
    if (reset) begin
      int_mask_r <= 8'h1;
    end else begin
      if (wr_en) begin
        if (!(sel_reg_tx)) begin
          if (!(sel_reg_baud)) begin
            if (!(sel_reg_control)) begin
              if (sel_reg_int_mask) begin
                int_mask_r <= _T_89;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      ack <= 1'h0;
    end else begin
      ack <= io_wbs_m2s_stb;
    end
    if (reset) begin
      rd_data <= 8'h0;
    end else begin
      rd_data <= _GEN_3[7:0];
    end
  end
endmodule
module SPI( // @[:@3499.2]
  input         clock, // @[:@3500.4]
  input         reset, // @[:@3501.4]
  input         io_spi_select, // @[:@3502.4]
  output        io_spi_cs, // @[:@3502.4]
  output        io_spi_clk, // @[:@3502.4]
  output        io_spi_mosi, // @[:@3502.4]
  input         io_spi_miso, // @[:@3502.4]
  output        io_spi_intr, // @[:@3502.4]
  input  [15:0] io_wbs_m2s_addr, // @[:@3502.4]
  input  [31:0] io_wbs_m2s_data, // @[:@3502.4]
  input         io_wbs_m2s_we, // @[:@3502.4]
  input         io_wbs_m2s_stb, // @[:@3502.4]
  output        io_wbs_ack_o, // @[:@3502.4]
  output [31:0] io_wbs_data_o // @[:@3502.4]
);
  reg  ack_o; // @[spi.scala 65:25:@3504.4]
  reg [31:0] _RAND_0;
  reg [7:0] rd_data; // @[spi.scala 66:25:@3505.4]
  reg [31:0] _RAND_1;
  reg  sclk_r; // @[spi.scala 69:23:@3507.4]
  reg [31:0] _RAND_2;
  reg  mosi_r; // @[spi.scala 70:23:@3508.4]
  reg [31:0] _RAND_3;
  reg  read_wait_done; // @[spi.scala 75:31:@3515.4]
  reg [31:0] _RAND_4;
  reg [7:0] reg_rxdata; // @[spi.scala 78:28:@3518.4]
  reg [31:0] _RAND_5;
  reg [7:0] reg_txdata; // @[spi.scala 79:28:@3519.4]
  reg [31:0] _RAND_6;
  reg  reg_ssmask; // @[spi.scala 80:28:@3520.4]
  reg [31:0] _RAND_7;
  reg [7:0] rx_shift_data; // @[spi.scala 82:30:@3521.4]
  reg [31:0] _RAND_8;
  reg [7:0] tx_shift_data; // @[spi.scala 83:30:@3522.4]
  reg [31:0] _RAND_9;
  reg  rx_latch_flag; // @[spi.scala 84:30:@3523.4]
  reg [31:0] _RAND_10;
  reg  bit_iroe; // @[spi.scala 87:27:@3524.4]
  reg [31:0] _RAND_11;
  reg  bit_itoe; // @[spi.scala 88:27:@3525.4]
  reg [31:0] _RAND_12;
  reg  bit_itrdy; // @[spi.scala 89:27:@3526.4]
  reg [31:0] _RAND_13;
  reg  bit_irrdy; // @[spi.scala 90:27:@3527.4]
  reg [31:0] _RAND_14;
  reg  bit_ie; // @[spi.scala 91:27:@3528.4]
  reg [31:0] _RAND_15;
  reg  bit_sso; // @[spi.scala 92:27:@3529.4]
  reg [31:0] _RAND_16;
  reg  bit_toe; // @[spi.scala 95:27:@3530.4]
  reg [31:0] _RAND_17;
  reg  bit_roe; // @[spi.scala 96:27:@3531.4]
  reg [31:0] _RAND_18;
  reg  bit_trdy; // @[spi.scala 97:27:@3532.4]
  reg [31:0] _RAND_19;
  reg  bit_rrdy; // @[spi.scala 98:27:@3533.4]
  reg [31:0] _RAND_20;
  reg  bit_tmt; // @[spi.scala 99:27:@3534.4]
  reg [31:0] _RAND_21;
  reg  bit_e; // @[spi.scala 100:27:@3535.4]
  reg [31:0] _RAND_22;
  wire [7:0] addr; // @[spi.scala 106:33:@3536.4]
  wire  _T_104; // @[spi.scala 108:19:@3537.4]
  wire  rd_en; // @[spi.scala 108:34:@3538.4]
  wire  wr_en; // @[spi.scala 109:33:@3541.4]
  wire  _T_115; // @[spi.scala 113:32:@3545.4]
  wire  sel_reg_rx; // @[spi.scala 113:54:@3546.4]
  wire  _T_116; // @[spi.scala 114:32:@3547.4]
  wire  sel_reg_tx; // @[spi.scala 114:54:@3548.4]
  wire  _T_118; // @[spi.scala 116:32:@3551.4]
  wire  sel_reg_control; // @[spi.scala 116:55:@3552.4]
  wire  _T_119; // @[spi.scala 117:32:@3553.4]
  wire  sel_reg_status; // @[spi.scala 117:54:@3554.4]
  wire  _T_120; // @[spi.scala 118:32:@3555.4]
  wire  sel_reg_ssmask; // @[spi.scala 118:55:@3556.4]
  wire [7:0] _GEN_0; // @[spi.scala 121:23:@3557.4]
  wire  _T_121; // @[spi.scala 126:14:@3560.4]
  wire  _T_122; // @[spi.scala 126:28:@3561.4]
  wire [7:0] latch_s_data; // @[:@3516.4 :@3517.4 spi.scala 110:16:@3544.4]
  wire [7:0] _GEN_1; // @[spi.scala 126:41:@3562.4]
  wire  _T_123; // @[spi.scala 131:19:@3565.4]
  wire [7:0] reg_status; // @[Cat.scala 30:58:@3572.4]
  wire [7:0] reg_control; // @[Cat.scala 30:58:@3579.4]
  wire  _T_138; // @[spi.scala 138:14:@3580.4]
  wire  _T_139; // @[spi.scala 139:30:@3582.6]
  wire  _T_140; // @[spi.scala 140:30:@3584.6]
  wire  _T_141; // @[spi.scala 141:30:@3586.6]
  wire  _T_142; // @[spi.scala 142:30:@3588.6]
  wire  _T_143; // @[spi.scala 143:30:@3590.6]
  wire  _T_144; // @[spi.scala 144:30:@3592.6]
  wire  _GEN_2; // @[spi.scala 138:34:@3581.4]
  wire  _GEN_3; // @[spi.scala 138:34:@3581.4]
  wire  _GEN_4; // @[spi.scala 138:34:@3581.4]
  wire  _GEN_5; // @[spi.scala 138:34:@3581.4]
  wire  _GEN_6; // @[spi.scala 138:34:@3581.4]
  wire  _GEN_7; // @[spi.scala 138:34:@3581.4]
  wire  _T_145; // @[spi.scala 147:37:@3595.4]
  wire  _T_146; // @[spi.scala 147:58:@3596.4]
  wire  _T_147; // @[spi.scala 147:47:@3597.4]
  wire  _T_148; // @[spi.scala 147:25:@3598.4]
  wire  _T_149; // @[spi.scala 147:83:@3599.4]
  wire  _T_150; // @[spi.scala 147:70:@3600.4]
  wire  _T_151; // @[spi.scala 147:108:@3601.4]
  wire  _T_155; // @[spi.scala 154:39:@3609.6]
  wire  _T_156; // @[spi.scala 154:30:@3610.6]
  wire  _GEN_8; // @[spi.scala 154:59:@3611.6]
  wire  _GEN_9; // @[spi.scala 152:15:@3604.4]
  wire  _T_160; // @[spi.scala 161:35:@3620.6]
  wire  _T_161; // @[spi.scala 161:30:@3621.6]
  wire  _GEN_10; // @[spi.scala 161:43:@3622.6]
  wire  _GEN_11; // @[spi.scala 159:15:@3615.4]
  reg [4:0] clock_cnt; // @[spi.scala 166:31:@3625.4]
  reg [31:0] _RAND_23;
  reg [5:0] data_cnt; // @[spi.scala 167:31:@3626.4]
  reg [31:0] _RAND_24;
  reg  pending_data; // @[spi.scala 168:31:@3627.4]
  reg [31:0] _RAND_25;
  reg [2:0] n_status; // @[spi.scala 170:31:@3630.4]
  reg [31:0] _RAND_26;
  reg [2:0] p_status; // @[spi.scala 171:31:@3631.4]
  reg [31:0] _RAND_27;
  wire  _T_174; // @[spi.scala 175:27:@3637.6]
  wire  _GEN_12; // @[spi.scala 175:40:@3638.6]
  wire  _GEN_13; // @[spi.scala 173:32:@3633.4]
  wire [7:0] _T_180; // @[spi.scala 181:78:@3644.6]
  wire [7:0] _T_181; // @[spi.scala 181:44:@3645.6]
  wire [7:0] _T_182; // @[spi.scala 181:12:@3646.6]
  wire [7:0] _T_183; // @[spi.scala 180:49:@3647.6]
  wire [7:0] _T_184; // @[spi.scala 180:21:@3648.6]
  wire [7:0] _GEN_14; // @[spi.scala 179:18:@3641.4]
  wire  _T_185; // @[spi.scala 185:16:@3652.4]
  wire  _GEN_15; // @[spi.scala 185:35:@3653.4]
  wire  _T_188; // @[spi.scala 201:21:@3659.4]
  wire  _T_190; // @[spi.scala 201:49:@3660.4]
  wire  _T_191; // @[spi.scala 201:35:@3661.4]
  wire  _T_192; // @[spi.scala 202:18:@3663.6]
  wire  _GEN_16; // @[spi.scala 201:67:@3662.4]
  wire  _T_196; // @[spi.scala 208:59:@3669.4]
  wire  _T_197; // @[spi.scala 208:39:@3670.4]
  wire  _T_199; // @[spi.scala 208:71:@3672.4]
  wire [8:0] _T_203; // @[Cat.scala 30:58:@3680.8]
  wire [8:0] _GEN_18; // @[spi.scala 208:99:@3673.4]
  wire  _T_204; // @[spi.scala 217:20:@3684.4]
  wire  _T_205; // @[spi.scala 217:47:@3685.4]
  wire  _T_206; // @[spi.scala 217:34:@3686.4]
  wire  _GEN_19; // @[spi.scala 219:33:@3691.6]
  wire  _GEN_20; // @[spi.scala 217:62:@3687.4]
  wire  _T_211; // @[spi.scala 223:49:@3695.4]
  wire  _T_212; // @[spi.scala 223:36:@3696.4]
  wire [5:0] _T_215; // @[spi.scala 226:30:@3701.6]
  wire [4:0] _T_216; // @[spi.scala 226:30:@3702.6]
  wire [4:0] _GEN_21; // @[spi.scala 223:63:@3697.4]
  wire [2:0] _GEN_22; // @[spi.scala 235:26:@3713.6]
  wire  _T_229; // @[spi.scala 246:27:@3732.8]
  wire  _T_233; // @[spi.scala 247:53:@3735.10]
  wire  _T_234; // @[spi.scala 247:40:@3736.10]
  wire [2:0] _GEN_24; // @[spi.scala 247:76:@3737.10]
  wire  _T_238; // @[spi.scala 253:53:@3748.12]
  wire  _T_239; // @[spi.scala 253:40:@3749.12]
  wire  _T_242; // @[spi.scala 253:69:@3751.12]
  wire [2:0] _GEN_25; // @[spi.scala 253:105:@3752.12]
  wire  _T_243; // @[spi.scala 258:27:@3760.12]
  wire [2:0] _GEN_27; // @[spi.scala 259:39:@3763.14]
  wire  _T_247; // @[spi.scala 266:27:@3773.14]
  wire  _T_251; // @[spi.scala 267:53:@3776.16]
  wire  _T_252; // @[spi.scala 267:40:@3777.16]
  wire [2:0] _GEN_28; // @[spi.scala 267:77:@3778.16]
  wire [2:0] _GEN_29; // @[spi.scala 266:44:@3774.14]
  wire [2:0] _GEN_30; // @[spi.scala 258:46:@3761.12]
  wire [2:0] _GEN_31; // @[spi.scala 252:41:@3746.10]
  wire [2:0] _GEN_32; // @[spi.scala 246:40:@3733.8]
  wire [2:0] _GEN_33; // @[spi.scala 240:40:@3722.6]
  wire [2:0] _GEN_34; // @[spi.scala 234:32:@3712.4]
  wire  _T_256; // @[spi.scala 276:32:@3790.4]
  wire  _T_259; // @[spi.scala 276:63:@3792.4]
  wire  _T_266; // @[spi.scala 278:73:@3801.6]
  wire  _T_269; // @[spi.scala 278:102:@3803.6]
  wire  _T_274; // @[spi.scala 280:45:@3810.8]
  wire  _T_277; // @[spi.scala 280:76:@3812.8]
  wire  _T_291; // @[spi.scala 282:133:@3825.10]
  wire  _T_292; // @[spi.scala 282:74:@3826.10]
  wire  _T_297; // @[spi.scala 282:174:@3830.10]
  wire [6:0] _T_299; // @[spi.scala 283:28:@3832.12]
  wire [5:0] _T_300; // @[spi.scala 283:28:@3833.12]
  wire [5:0] _GEN_35; // @[spi.scala 282:238:@3831.10]
  wire [5:0] _GEN_36; // @[spi.scala 280:113:@3813.8]
  wire [5:0] _GEN_37; // @[spi.scala 278:138:@3804.6]
  wire [5:0] _GEN_38; // @[spi.scala 276:99:@3793.4]
  reg  wait_one_tick_done; // @[spi.scala 286:37:@3836.4]
  reg [31:0] _RAND_28;
  wire  _T_321; // @[spi.scala 298:72:@3858.6]
  wire [8:0] _T_328; // @[Cat.scala 30:58:@3863.6]
  wire  _T_341; // @[spi.scala 302:80:@3877.10]
  wire [8:0] _T_348; // @[Cat.scala 30:58:@3882.10]
  wire  _GEN_42; // @[spi.scala 301:32:@3875.8]
  wire [8:0] _GEN_43; // @[spi.scala 301:32:@3875.8]
  wire  _GEN_44; // @[spi.scala 300:114:@3874.6]
  wire [8:0] _GEN_45; // @[spi.scala 300:114:@3874.6]
  wire  _GEN_46; // @[spi.scala 297:37:@3856.4]
  wire [8:0] _GEN_47; // @[spi.scala 297:37:@3856.4]
  wire  _GEN_48; // @[spi.scala 310:39:@3894.6]
  wire  _GEN_49; // @[spi.scala 308:36:@3889.4]
  wire  _T_355; // @[spi.scala 314:12:@3897.4]
  wire  _T_356; // @[spi.scala 314:22:@3898.4]
  wire  _T_357; // @[spi.scala 314:31:@3899.4]
  wire  _T_359; // @[spi.scala 316:24:@3904.6]
  wire  _GEN_50; // @[spi.scala 316:43:@3905.6]
  wire  _GEN_51; // @[spi.scala 314:46:@3900.4]
  wire  _T_364; // @[spi.scala 320:40:@3910.4]
  wire  _GEN_52; // @[spi.scala 321:22:@3912.6]
  wire  _GEN_53; // @[spi.scala 321:22:@3912.6]
  wire  _T_367; // @[spi.scala 326:24:@3920.6]
  wire  _GEN_54; // @[spi.scala 326:39:@3921.6]
  wire  _GEN_55; // @[spi.scala 326:39:@3921.6]
  wire  _GEN_56; // @[spi.scala 320:72:@3911.4]
  wire  _GEN_57; // @[spi.scala 320:72:@3911.4]
  wire  _T_370; // @[spi.scala 331:21:@3925.4]
  wire  _T_371; // @[spi.scala 331:34:@3926.4]
  wire  _GEN_58; // @[spi.scala 331:51:@3927.4]
  assign addr = io_wbs_m2s_addr[7:0]; // @[spi.scala 106:33:@3536.4]
  assign _T_104 = io_wbs_m2s_we == 1'h0; // @[spi.scala 108:19:@3537.4]
  assign rd_en = _T_104 & io_wbs_m2s_stb; // @[spi.scala 108:34:@3538.4]
  assign wr_en = io_wbs_m2s_we & io_wbs_m2s_stb; // @[spi.scala 109:33:@3541.4]
  assign _T_115 = addr == 8'h0; // @[spi.scala 113:32:@3545.4]
  assign sel_reg_rx = _T_115 & io_spi_select; // @[spi.scala 113:54:@3546.4]
  assign _T_116 = addr == 8'h1; // @[spi.scala 114:32:@3547.4]
  assign sel_reg_tx = _T_116 & io_spi_select; // @[spi.scala 114:54:@3548.4]
  assign _T_118 = addr == 8'h3; // @[spi.scala 116:32:@3551.4]
  assign sel_reg_control = _T_118 & io_spi_select; // @[spi.scala 116:55:@3552.4]
  assign _T_119 = addr == 8'h4; // @[spi.scala 117:32:@3553.4]
  assign sel_reg_status = _T_119 & io_spi_select; // @[spi.scala 117:54:@3554.4]
  assign _T_120 = addr == 8'h5; // @[spi.scala 118:32:@3555.4]
  assign sel_reg_ssmask = _T_120 & io_spi_select; // @[spi.scala 118:55:@3556.4]
  assign _GEN_0 = rx_latch_flag ? rx_shift_data : reg_rxdata; // @[spi.scala 121:23:@3557.4]
  assign _T_121 = wr_en & sel_reg_tx; // @[spi.scala 126:14:@3560.4]
  assign _T_122 = _T_121 & bit_trdy; // @[spi.scala 126:28:@3561.4]
  assign latch_s_data = io_wbs_m2s_data[7:0]; // @[:@3516.4 :@3517.4 spi.scala 110:16:@3544.4]
  assign _GEN_1 = _T_122 ? latch_s_data : reg_txdata; // @[spi.scala 126:41:@3562.4]
  assign _T_123 = bit_toe | bit_roe; // @[spi.scala 131:19:@3565.4]
  assign reg_status = {bit_e,bit_rrdy,bit_trdy,bit_tmt,bit_toe,bit_roe,2'h0}; // @[Cat.scala 30:58:@3572.4]
  assign reg_control = {bit_sso,1'h0,bit_ie,bit_irrdy,bit_itrdy,1'h0,bit_itoe,bit_iroe}; // @[Cat.scala 30:58:@3579.4]
  assign _T_138 = wr_en & sel_reg_control; // @[spi.scala 138:14:@3580.4]
  assign _T_139 = latch_s_data[0]; // @[spi.scala 139:30:@3582.6]
  assign _T_140 = latch_s_data[1]; // @[spi.scala 140:30:@3584.6]
  assign _T_141 = latch_s_data[3]; // @[spi.scala 141:30:@3586.6]
  assign _T_142 = latch_s_data[4]; // @[spi.scala 142:30:@3588.6]
  assign _T_143 = latch_s_data[5]; // @[spi.scala 143:30:@3590.6]
  assign _T_144 = latch_s_data[7]; // @[spi.scala 144:30:@3592.6]
  assign _GEN_2 = _T_138 ? _T_139 : bit_iroe; // @[spi.scala 138:34:@3581.4]
  assign _GEN_3 = _T_138 ? _T_140 : bit_itoe; // @[spi.scala 138:34:@3581.4]
  assign _GEN_4 = _T_138 ? _T_141 : bit_itrdy; // @[spi.scala 138:34:@3581.4]
  assign _GEN_5 = _T_138 ? _T_142 : bit_irrdy; // @[spi.scala 138:34:@3581.4]
  assign _GEN_6 = _T_138 ? _T_143 : bit_ie; // @[spi.scala 138:34:@3581.4]
  assign _GEN_7 = _T_138 ? _T_144 : bit_sso; // @[spi.scala 138:34:@3581.4]
  assign _T_145 = bit_iroe & bit_roe; // @[spi.scala 147:37:@3595.4]
  assign _T_146 = bit_itoe & bit_toe; // @[spi.scala 147:58:@3596.4]
  assign _T_147 = _T_145 | _T_146; // @[spi.scala 147:47:@3597.4]
  assign _T_148 = bit_ie & _T_147; // @[spi.scala 147:25:@3598.4]
  assign _T_149 = bit_itrdy & bit_trdy; // @[spi.scala 147:83:@3599.4]
  assign _T_150 = _T_148 | _T_149; // @[spi.scala 147:70:@3600.4]
  assign _T_151 = bit_irrdy & bit_rrdy; // @[spi.scala 147:108:@3601.4]
  assign _T_155 = io_wbs_m2s_we | read_wait_done; // @[spi.scala 154:39:@3609.6]
  assign _T_156 = io_wbs_m2s_stb & _T_155; // @[spi.scala 154:30:@3610.6]
  assign _GEN_8 = _T_156 ? 1'h1 : ack_o; // @[spi.scala 154:59:@3611.6]
  assign _GEN_9 = ack_o ? 1'h0 : _GEN_8; // @[spi.scala 152:15:@3604.4]
  assign _T_160 = ~ io_wbs_m2s_we; // @[spi.scala 161:35:@3620.6]
  assign _T_161 = io_wbs_m2s_stb & _T_160; // @[spi.scala 161:30:@3621.6]
  assign _GEN_10 = _T_161 ? 1'h1 : read_wait_done; // @[spi.scala 161:43:@3622.6]
  assign _GEN_11 = ack_o ? 1'h0 : _GEN_10; // @[spi.scala 159:15:@3615.4]
  assign _T_174 = n_status == 3'h1; // @[spi.scala 175:27:@3637.6]
  assign _GEN_12 = _T_174 ? 1'h0 : pending_data; // @[spi.scala 175:40:@3638.6]
  assign _GEN_13 = _T_121 ? 1'h1 : _GEN_12; // @[spi.scala 173:32:@3633.4]
  assign _T_180 = sel_reg_ssmask ? {{7'd0}, reg_ssmask} : 8'h0; // @[spi.scala 181:78:@3644.6]
  assign _T_181 = sel_reg_control ? reg_control : _T_180; // @[spi.scala 181:44:@3645.6]
  assign _T_182 = sel_reg_status ? reg_status : _T_181; // @[spi.scala 181:12:@3646.6]
  assign _T_183 = sel_reg_tx ? reg_txdata : _T_182; // @[spi.scala 180:49:@3647.6]
  assign _T_184 = sel_reg_rx ? reg_rxdata : _T_183; // @[spi.scala 180:21:@3648.6]
  assign _GEN_14 = rd_en ? _T_184 : rd_data; // @[spi.scala 179:18:@3641.4]
  assign _T_185 = wr_en & sel_reg_ssmask; // @[spi.scala 185:16:@3652.4]
  assign _GEN_15 = _T_185 ? _T_139 : reg_ssmask; // @[spi.scala 185:35:@3653.4]
  assign _T_188 = n_status == 3'h3; // @[spi.scala 201:21:@3659.4]
  assign _T_190 = clock_cnt == 5'h3; // @[spi.scala 201:49:@3660.4]
  assign _T_191 = _T_188 & _T_190; // @[spi.scala 201:35:@3661.4]
  assign _T_192 = ~ sclk_r; // @[spi.scala 202:18:@3663.6]
  assign _GEN_16 = _T_191 ? _T_192 : sclk_r; // @[spi.scala 201:67:@3662.4]
  assign _T_196 = 1'h0 == sclk_r; // @[spi.scala 208:59:@3669.4]
  assign _T_197 = _T_190 & _T_196; // @[spi.scala 208:39:@3670.4]
  assign _T_199 = _T_197 & _T_188; // @[spi.scala 208:71:@3672.4]
  assign _T_203 = {rx_shift_data,io_spi_miso}; // @[Cat.scala 30:58:@3680.8]
  assign _GEN_18 = _T_199 ? _T_203 : {{1'd0}, rx_shift_data}; // @[spi.scala 208:99:@3673.4]
  assign _T_204 = p_status == 3'h3; // @[spi.scala 217:20:@3684.4]
  assign _T_205 = n_status != 3'h3; // @[spi.scala 217:47:@3685.4]
  assign _T_206 = _T_204 & _T_205; // @[spi.scala 217:34:@3686.4]
  assign _GEN_19 = rx_latch_flag ? 1'h0 : rx_latch_flag; // @[spi.scala 219:33:@3691.6]
  assign _GEN_20 = _T_206 ? 1'h1 : _GEN_19; // @[spi.scala 217:62:@3687.4]
  assign _T_211 = n_status == 3'h0; // @[spi.scala 223:49:@3695.4]
  assign _T_212 = _T_190 | _T_211; // @[spi.scala 223:36:@3696.4]
  assign _T_215 = clock_cnt + 5'h1; // @[spi.scala 226:30:@3701.6]
  assign _T_216 = clock_cnt + 5'h1; // @[spi.scala 226:30:@3702.6]
  assign _GEN_21 = _T_212 ? 5'h0 : _T_216; // @[spi.scala 223:63:@3697.4]
  assign _GEN_22 = pending_data ? 3'h1 : 3'h0; // @[spi.scala 235:26:@3713.6]
  assign _T_229 = n_status == 3'h2; // @[spi.scala 246:27:@3732.8]
  assign _T_233 = data_cnt == 6'h1; // @[spi.scala 247:53:@3735.10]
  assign _T_234 = _T_190 & _T_233; // @[spi.scala 247:40:@3736.10]
  assign _GEN_24 = _T_234 ? 3'h3 : 3'h2; // @[spi.scala 247:76:@3737.10]
  assign _T_238 = data_cnt == 6'h7; // @[spi.scala 253:53:@3748.12]
  assign _T_239 = _T_190 & _T_238; // @[spi.scala 253:40:@3749.12]
  assign _T_242 = _T_239 & sclk_r; // @[spi.scala 253:69:@3751.12]
  assign _GEN_25 = _T_242 ? 3'h4 : 3'h3; // @[spi.scala 253:105:@3752.12]
  assign _T_243 = n_status == 3'h4; // @[spi.scala 258:27:@3760.12]
  assign _GEN_27 = _T_190 ? 3'h5 : n_status; // @[spi.scala 259:39:@3763.14]
  assign _T_247 = n_status == 3'h5; // @[spi.scala 266:27:@3773.14]
  assign _T_251 = data_cnt == 6'h2; // @[spi.scala 267:53:@3776.16]
  assign _T_252 = _T_190 & _T_251; // @[spi.scala 267:40:@3777.16]
  assign _GEN_28 = _T_252 ? 3'h0 : 3'h5; // @[spi.scala 267:77:@3778.16]
  assign _GEN_29 = _T_247 ? _GEN_28 : 3'h0; // @[spi.scala 266:44:@3774.14]
  assign _GEN_30 = _T_243 ? _GEN_27 : _GEN_29; // @[spi.scala 258:46:@3761.12]
  assign _GEN_31 = _T_188 ? _GEN_25 : _GEN_30; // @[spi.scala 252:41:@3746.10]
  assign _GEN_32 = _T_229 ? _GEN_24 : _GEN_31; // @[spi.scala 246:40:@3733.8]
  assign _GEN_33 = _T_174 ? 3'h2 : _GEN_32; // @[spi.scala 240:40:@3722.6]
  assign _GEN_34 = _T_211 ? _GEN_22 : _GEN_33; // @[spi.scala 234:32:@3712.4]
  assign _T_256 = _T_229 & _T_190; // @[spi.scala 276:32:@3790.4]
  assign _T_259 = _T_256 & _T_233; // @[spi.scala 276:63:@3792.4]
  assign _T_266 = _T_191 & _T_238; // @[spi.scala 278:73:@3801.6]
  assign _T_269 = _T_266 & sclk_r; // @[spi.scala 278:102:@3803.6]
  assign _T_274 = _T_247 & _T_190; // @[spi.scala 280:45:@3810.8]
  assign _T_277 = _T_274 & _T_251; // @[spi.scala 280:76:@3812.8]
  assign _T_291 = _T_191 & sclk_r; // @[spi.scala 282:133:@3825.10]
  assign _T_292 = _T_256 | _T_291; // @[spi.scala 282:74:@3826.10]
  assign _T_297 = _T_292 | _T_274; // @[spi.scala 282:174:@3830.10]
  assign _T_299 = data_cnt + 6'h1; // @[spi.scala 283:28:@3832.12]
  assign _T_300 = data_cnt + 6'h1; // @[spi.scala 283:28:@3833.12]
  assign _GEN_35 = _T_297 ? _T_300 : data_cnt; // @[spi.scala 282:238:@3831.10]
  assign _GEN_36 = _T_277 ? 6'h0 : _GEN_35; // @[spi.scala 280:113:@3813.8]
  assign _GEN_37 = _T_269 ? 6'h0 : _GEN_36; // @[spi.scala 278:138:@3804.6]
  assign _GEN_38 = _T_259 ? 6'h0 : _GEN_37; // @[spi.scala 276:99:@3793.4]
  assign _T_321 = reg_txdata[7]; // @[spi.scala 298:72:@3858.6]
  assign _T_328 = {reg_txdata,1'h0}; // @[Cat.scala 30:58:@3863.6]
  assign _T_341 = tx_shift_data[7]; // @[spi.scala 302:80:@3877.10]
  assign _T_348 = {tx_shift_data,1'h0}; // @[Cat.scala 30:58:@3882.10]
  assign _GEN_42 = wait_one_tick_done ? _T_341 : mosi_r; // @[spi.scala 301:32:@3875.8]
  assign _GEN_43 = wait_one_tick_done ? _T_348 : {{1'd0}, tx_shift_data}; // @[spi.scala 301:32:@3875.8]
  assign _GEN_44 = _T_291 ? _GEN_42 : mosi_r; // @[spi.scala 300:114:@3874.6]
  assign _GEN_45 = _T_291 ? _GEN_43 : {{1'd0}, tx_shift_data}; // @[spi.scala 300:114:@3874.6]
  assign _GEN_46 = _T_229 ? _T_321 : _GEN_44; // @[spi.scala 297:37:@3856.4]
  assign _GEN_47 = _T_229 ? _T_328 : _GEN_45; // @[spi.scala 297:37:@3856.4]
  assign _GEN_48 = _T_121 ? 1'h0 : bit_trdy; // @[spi.scala 310:39:@3894.6]
  assign _GEN_49 = _T_188 ? 1'h1 : _GEN_48; // @[spi.scala 308:36:@3889.4]
  assign _T_355 = bit_trdy == 1'h0; // @[spi.scala 314:12:@3897.4]
  assign _T_356 = _T_355 & wr_en; // @[spi.scala 314:22:@3898.4]
  assign _T_357 = _T_356 & sel_reg_tx; // @[spi.scala 314:31:@3899.4]
  assign _T_359 = wr_en & sel_reg_status; // @[spi.scala 316:24:@3904.6]
  assign _GEN_50 = _T_359 ? 1'h0 : bit_toe; // @[spi.scala 316:43:@3905.6]
  assign _GEN_51 = _T_357 ? 1'h1 : _GEN_50; // @[spi.scala 314:46:@3900.4]
  assign _T_364 = _T_243 & _T_190; // @[spi.scala 320:40:@3910.4]
  assign _GEN_52 = bit_rrdy ? 1'h1 : bit_roe; // @[spi.scala 321:22:@3912.6]
  assign _GEN_53 = bit_rrdy ? bit_rrdy : 1'h1; // @[spi.scala 321:22:@3912.6]
  assign _T_367 = rd_en & sel_reg_rx; // @[spi.scala 326:24:@3920.6]
  assign _GEN_54 = _T_367 ? 1'h0 : bit_rrdy; // @[spi.scala 326:39:@3921.6]
  assign _GEN_55 = _T_367 ? 1'h0 : bit_roe; // @[spi.scala 326:39:@3921.6]
  assign _GEN_56 = _T_364 ? _GEN_52 : _GEN_55; // @[spi.scala 320:72:@3911.4]
  assign _GEN_57 = _T_364 ? _GEN_53 : _GEN_54; // @[spi.scala 320:72:@3911.4]
  assign _T_370 = n_status != 3'h0; // @[spi.scala 331:21:@3925.4]
  assign _T_371 = _T_370 | pending_data; // @[spi.scala 331:34:@3926.4]
  assign _GEN_58 = _T_371 ? 1'h0 : 1'h1; // @[spi.scala 331:51:@3927.4]
  assign io_spi_cs = ~ reg_ssmask; // @[spi.scala 198:13:@3658.4]
  assign io_spi_clk = sclk_r; // @[spi.scala 204:16:@3666.4]
  assign io_spi_mosi = mosi_r; // @[spi.scala 306:15:@3887.4]
  assign io_spi_intr = _T_150 | _T_151; // @[spi.scala 147:14:@3603.4]
  assign io_wbs_ack_o = ack_o; // @[spi.scala 157:15:@3614.4]
  assign io_wbs_data_o = {{24'd0}, rd_data}; // @[spi.scala 183:18:@3651.4]
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
  ack_o = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  rd_data = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  sclk_r = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  mosi_r = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  read_wait_done = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  reg_rxdata = _RAND_5[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  reg_txdata = _RAND_6[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  reg_ssmask = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  rx_shift_data = _RAND_8[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  tx_shift_data = _RAND_9[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  rx_latch_flag = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  bit_iroe = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  bit_itoe = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  bit_itrdy = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  bit_irrdy = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  bit_ie = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  bit_sso = _RAND_16[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  bit_toe = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  bit_roe = _RAND_18[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  bit_trdy = _RAND_19[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  bit_rrdy = _RAND_20[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  bit_tmt = _RAND_21[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  bit_e = _RAND_22[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  clock_cnt = _RAND_23[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  data_cnt = _RAND_24[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  pending_data = _RAND_25[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  n_status = _RAND_26[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  p_status = _RAND_27[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  wait_one_tick_done = _RAND_28[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      ack_o <= 1'h0;
    end else begin
      if (ack_o) begin
        ack_o <= 1'h0;
      end else begin
        if (_T_156) begin
          ack_o <= 1'h1;
        end
      end
    end
    if (reset) begin
      rd_data <= 8'h0;
    end else begin
      if (rd_en) begin
        if (sel_reg_rx) begin
          rd_data <= reg_rxdata;
        end else begin
          if (sel_reg_tx) begin
            rd_data <= reg_txdata;
          end else begin
            if (sel_reg_status) begin
              rd_data <= reg_status;
            end else begin
              if (sel_reg_control) begin
                rd_data <= reg_control;
              end else begin
                if (sel_reg_ssmask) begin
                  rd_data <= {{7'd0}, reg_ssmask};
                end else begin
                  rd_data <= 8'h0;
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      sclk_r <= 1'h0;
    end else begin
      if (_T_191) begin
        sclk_r <= _T_192;
      end
    end
    if (reset) begin
      mosi_r <= 1'h0;
    end else begin
      if (_T_229) begin
        mosi_r <= _T_321;
      end else begin
        if (_T_291) begin
          if (wait_one_tick_done) begin
            mosi_r <= _T_341;
          end
        end
      end
    end
    if (reset) begin
      read_wait_done <= 1'h0;
    end else begin
      if (ack_o) begin
        read_wait_done <= 1'h0;
      end else begin
        if (_T_161) begin
          read_wait_done <= 1'h1;
        end
      end
    end
    if (reset) begin
      reg_rxdata <= 8'h0;
    end else begin
      if (rx_latch_flag) begin
        reg_rxdata <= rx_shift_data;
      end
    end
    if (reset) begin
      reg_txdata <= 8'h35;
    end else begin
      if (_T_122) begin
        reg_txdata <= latch_s_data;
      end
    end
    if (reset) begin
      reg_ssmask <= 1'h0;
    end else begin
      if (_T_185) begin
        reg_ssmask <= _T_139;
      end
    end
    if (reset) begin
      rx_shift_data <= 8'h0;
    end else begin
      rx_shift_data <= _GEN_18[7:0];
    end
    if (reset) begin
      tx_shift_data <= 8'h0;
    end else begin
      tx_shift_data <= _GEN_47[7:0];
    end
    if (reset) begin
      rx_latch_flag <= 1'h0;
    end else begin
      if (_T_206) begin
        rx_latch_flag <= 1'h1;
      end else begin
        if (rx_latch_flag) begin
          rx_latch_flag <= 1'h0;
        end
      end
    end
    if (reset) begin
      bit_iroe <= 1'h0;
    end else begin
      if (_T_138) begin
        bit_iroe <= _T_139;
      end
    end
    if (reset) begin
      bit_itoe <= 1'h0;
    end else begin
      if (_T_138) begin
        bit_itoe <= _T_140;
      end
    end
    if (reset) begin
      bit_itrdy <= 1'h0;
    end else begin
      if (_T_138) begin
        bit_itrdy <= _T_141;
      end
    end
    if (reset) begin
      bit_irrdy <= 1'h0;
    end else begin
      if (_T_138) begin
        bit_irrdy <= _T_142;
      end
    end
    if (reset) begin
      bit_ie <= 1'h0;
    end else begin
      if (_T_138) begin
        bit_ie <= _T_143;
      end
    end
    if (reset) begin
      bit_sso <= 1'h1;
    end else begin
      if (_T_138) begin
        bit_sso <= _T_144;
      end
    end
    if (reset) begin
      bit_toe <= 1'h0;
    end else begin
      if (_T_357) begin
        bit_toe <= 1'h1;
      end else begin
        if (_T_359) begin
          bit_toe <= 1'h0;
        end
      end
    end
    if (reset) begin
      bit_roe <= 1'h0;
    end else begin
      if (_T_364) begin
        if (bit_rrdy) begin
          bit_roe <= 1'h1;
        end
      end else begin
        if (_T_367) begin
          bit_roe <= 1'h0;
        end
      end
    end
    if (reset) begin
      bit_trdy <= 1'h1;
    end else begin
      if (_T_188) begin
        bit_trdy <= 1'h1;
      end else begin
        if (_T_121) begin
          bit_trdy <= 1'h0;
        end
      end
    end
    if (reset) begin
      bit_rrdy <= 1'h0;
    end else begin
      if (_T_364) begin
        if (!(bit_rrdy)) begin
          bit_rrdy <= 1'h1;
        end
      end else begin
        if (_T_367) begin
          bit_rrdy <= 1'h0;
        end
      end
    end
    if (reset) begin
      bit_tmt <= 1'h1;
    end else begin
      if (_T_371) begin
        bit_tmt <= 1'h0;
      end else begin
        bit_tmt <= 1'h1;
      end
    end
    if (reset) begin
      bit_e <= 1'h0;
    end else begin
      bit_e <= _T_123;
    end
    if (reset) begin
      clock_cnt <= 5'h0;
    end else begin
      if (_T_212) begin
        clock_cnt <= 5'h0;
      end else begin
        clock_cnt <= _T_216;
      end
    end
    if (reset) begin
      data_cnt <= 6'h0;
    end else begin
      if (_T_259) begin
        data_cnt <= 6'h0;
      end else begin
        if (_T_269) begin
          data_cnt <= 6'h0;
        end else begin
          if (_T_277) begin
            data_cnt <= 6'h0;
          end else begin
            if (_T_297) begin
              data_cnt <= _T_300;
            end
          end
        end
      end
    end
    if (reset) begin
      pending_data <= 1'h0;
    end else begin
      if (_T_121) begin
        pending_data <= 1'h1;
      end else begin
        if (_T_174) begin
          pending_data <= 1'h0;
        end
      end
    end
    if (reset) begin
      n_status <= 3'h0;
    end else begin
      if (_T_211) begin
        if (pending_data) begin
          n_status <= 3'h1;
        end else begin
          n_status <= 3'h0;
        end
      end else begin
        if (_T_174) begin
          n_status <= 3'h2;
        end else begin
          if (_T_229) begin
            if (_T_234) begin
              n_status <= 3'h3;
            end else begin
              n_status <= 3'h2;
            end
          end else begin
            if (_T_188) begin
              if (_T_242) begin
                n_status <= 3'h4;
              end else begin
                n_status <= 3'h3;
              end
            end else begin
              if (_T_243) begin
                if (_T_190) begin
                  n_status <= 3'h5;
                end
              end else begin
                if (_T_247) begin
                  if (_T_252) begin
                    n_status <= 3'h0;
                  end else begin
                    n_status <= 3'h5;
                  end
                end else begin
                  n_status <= 3'h0;
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      p_status <= 3'h0;
    end else begin
      p_status <= n_status;
    end
    if (reset) begin
      wait_one_tick_done <= 1'h0;
    end else begin
      wait_one_tick_done <= 1'h1;
    end
  end
endmodule
module Interlink_Module( // @[:@3934.2]
  input         clock, // @[:@3935.4]
  input         reset, // @[:@3936.4]
  input  [31:0] io_bus_adr_i, // @[:@3937.4]
  input  [3:0]  io_bus_sel_i, // @[:@3937.4]
  input         io_bus_we_i, // @[:@3937.4]
  input         io_bus_stb_i, // @[:@3937.4]
  output        io_bus_ack_o, // @[:@3937.4]
  output [31:0] io_bus_dat_o, // @[:@3937.4]
  output        io_tmr_val_we, // @[:@3937.4]
  input  [31:0] io_tmr_val_do, // @[:@3937.4]
  output        io_tmr_dat_we, // @[:@3937.4]
  input  [31:0] io_tmr_dat_do, // @[:@3937.4]
  output        io_tmr_duty_we, // @[:@3937.4]
  input  [31:0] io_tmr_duty_do, // @[:@3937.4]
  output        io_tmr_cfg_we, // @[:@3937.4]
  input  [31:0] io_tmr_cfg_do, // @[:@3937.4]
  output        io_qei_count_we, // @[:@3937.4]
  input  [31:0] io_qei_count_do, // @[:@3937.4]
  output        io_qei_cfg_we, // @[:@3937.4]
  input  [31:0] io_qei_cfg_do, // @[:@3937.4]
  input  [15:0] io_qei_speed_do, // @[:@3937.4]
  output        io_pid_kp_we, // @[:@3937.4]
  input  [15:0] io_pid_kp_do, // @[:@3937.4]
  output        io_pid_ki_we, // @[:@3937.4]
  input  [15:0] io_pid_ki_do, // @[:@3937.4]
  output        io_pid_kd_we, // @[:@3937.4]
  input  [15:0] io_pid_kd_do, // @[:@3937.4]
  output        io_pid_ref_we, // @[:@3937.4]
  input  [15:0] io_pid_ref_do, // @[:@3937.4]
  output        io_pid_fb_we, // @[:@3937.4]
  input  [15:0] io_pid_fb_do, // @[:@3937.4]
  output        io_pid_cfg_we, // @[:@3937.4]
  input  [15:0] io_pid_cfg_do, // @[:@3937.4]
  input         io_ba_match // @[:@3937.4]
);
  wire [11:0] reg_offset; // @[interlink.scala 98:35:@3946.4]
  wire  _T_78; // @[interlink.scala 100:50:@3947.4]
  wire  _T_79; // @[interlink.scala 100:81:@3948.4]
  wire  tmr_cfg_sel; // @[interlink.scala 100:66:@3949.4]
  wire  _T_83; // @[interlink.scala 101:81:@3953.4]
  wire  tmr_val_sel; // @[interlink.scala 101:66:@3954.4]
  wire  _T_87; // @[interlink.scala 102:81:@3958.4]
  wire  tmr_dat_sel; // @[interlink.scala 102:66:@3959.4]
  wire  _T_91; // @[interlink.scala 103:81:@3963.4]
  wire  tmr_duty_sel; // @[interlink.scala 103:66:@3964.4]
  wire  _T_94; // @[interlink.scala 105:72:@3967.4]
  wire  _T_95; // @[interlink.scala 105:76:@3968.4]
  wire  _T_121; // @[interlink.scala 112:35:@3994.4]
  wire  _T_122; // @[interlink.scala 112:50:@3995.4]
  wire  tmr_sel; // @[interlink.scala 112:65:@3996.4]
  wire [31:0] _T_123; // @[interlink.scala 114:26:@3997.4]
  wire [31:0] _T_124; // @[interlink.scala 113:57:@3998.4]
  wire [31:0] tmr_do; // @[interlink.scala 113:26:@3999.4]
  wire  _T_128; // @[interlink.scala 118:81:@4002.4]
  wire  qei_count_sel; // @[interlink.scala 118:66:@4003.4]
  wire  _T_138; // @[interlink.scala 122:81:@4013.4]
  wire  qei_cfg_sel; // @[interlink.scala 122:66:@4014.4]
  wire  _T_148; // @[interlink.scala 126:81:@4024.4]
  wire  qei_speed_sel; // @[interlink.scala 126:66:@4025.4]
  wire  _T_155; // @[interlink.scala 130:37:@4033.4]
  wire  qei_sel; // @[interlink.scala 130:52:@4034.4]
  wire [31:0] _T_156; // @[interlink.scala 131:59:@4035.4]
  wire [15:0] _T_236; // @[interlink.scala 187:46:@4137.4]
  wire [31:0] qei_speed_do; // @[interlink.scala 125:27:@4022.4 interlink.scala 187:21:@4138.4]
  wire [31:0] qei_do; // @[interlink.scala 131:26:@4036.4]
  wire  _T_160; // @[interlink.scala 135:81:@4039.4]
  wire  pid_kp_sel; // @[interlink.scala 135:66:@4040.4]
  wire  _T_170; // @[interlink.scala 139:81:@4050.4]
  wire  pid_ki_sel; // @[interlink.scala 139:66:@4051.4]
  wire  _T_180; // @[interlink.scala 143:81:@4061.4]
  wire  pid_kd_sel; // @[interlink.scala 143:66:@4062.4]
  wire  _T_190; // @[interlink.scala 147:81:@4072.4]
  wire  pid_ref_sel; // @[interlink.scala 147:66:@4073.4]
  wire  _T_200; // @[interlink.scala 151:81:@4083.4]
  wire  pid_fb_sel; // @[interlink.scala 151:66:@4084.4]
  wire  _T_210; // @[interlink.scala 155:81:@4094.4]
  wire  pid_cfg_sel; // @[interlink.scala 155:66:@4095.4]
  wire  _T_217; // @[interlink.scala 158:34:@4103.4]
  wire  _T_218; // @[interlink.scala 158:48:@4104.4]
  wire  _T_219; // @[interlink.scala 158:62:@4105.4]
  wire  _T_220; // @[interlink.scala 158:77:@4106.4]
  wire  pid_sel; // @[interlink.scala 158:91:@4107.4]
  wire [15:0] _T_221; // @[interlink.scala 162:46:@4108.4]
  wire [15:0] _T_222; // @[interlink.scala 161:46:@4109.4]
  wire [15:0] _T_223; // @[interlink.scala 160:46:@4110.4]
  wire [15:0] _T_224; // @[interlink.scala 159:53:@4111.4]
  wire [15:0] pid_do; // @[interlink.scala 159:26:@4112.4]
  reg  wb_ack_o; // @[interlink.scala 165:30:@4113.4]
  reg [31:0] _RAND_0;
  reg [31:0] wb_data_o; // @[interlink.scala 166:30:@4114.4]
  reg [31:0] _RAND_1;
  wire [15:0] _T_229; // @[interlink.scala 167:92:@4115.4]
  wire [15:0] _T_231; // @[interlink.scala 167:69:@4116.4]
  wire [31:0] _T_232; // @[interlink.scala 167:48:@4117.4]
  wire [31:0] _T_233; // @[interlink.scala 167:27:@4118.4]
  wire  _T_234; // @[interlink.scala 168:32:@4120.4]
  wire  _T_235; // @[interlink.scala 168:43:@4121.4]
  assign reg_offset = io_bus_adr_i[11:0]; // @[interlink.scala 98:35:@3946.4]
  assign _T_78 = io_bus_stb_i & io_ba_match; // @[interlink.scala 100:50:@3947.4]
  assign _T_79 = reg_offset == 12'h0; // @[interlink.scala 100:81:@3948.4]
  assign tmr_cfg_sel = _T_78 & _T_79; // @[interlink.scala 100:66:@3949.4]
  assign _T_83 = reg_offset == 12'h4; // @[interlink.scala 101:81:@3953.4]
  assign tmr_val_sel = _T_78 & _T_83; // @[interlink.scala 101:66:@3954.4]
  assign _T_87 = reg_offset == 12'h8; // @[interlink.scala 102:81:@3958.4]
  assign tmr_dat_sel = _T_78 & _T_87; // @[interlink.scala 102:66:@3959.4]
  assign _T_91 = reg_offset == 12'hc; // @[interlink.scala 103:81:@3963.4]
  assign tmr_duty_sel = _T_78 & _T_91; // @[interlink.scala 103:66:@3964.4]
  assign _T_94 = io_bus_sel_i[0]; // @[interlink.scala 105:72:@3967.4]
  assign _T_95 = _T_94 & io_bus_we_i; // @[interlink.scala 105:76:@3968.4]
  assign _T_121 = tmr_cfg_sel | tmr_val_sel; // @[interlink.scala 112:35:@3994.4]
  assign _T_122 = _T_121 | tmr_dat_sel; // @[interlink.scala 112:50:@3995.4]
  assign tmr_sel = _T_122 | tmr_duty_sel; // @[interlink.scala 112:65:@3996.4]
  assign _T_123 = tmr_duty_sel ? io_tmr_duty_do : io_tmr_dat_do; // @[interlink.scala 114:26:@3997.4]
  assign _T_124 = tmr_val_sel ? io_tmr_val_do : _T_123; // @[interlink.scala 113:57:@3998.4]
  assign tmr_do = tmr_cfg_sel ? io_tmr_cfg_do : _T_124; // @[interlink.scala 113:26:@3999.4]
  assign _T_128 = reg_offset == 12'h100; // @[interlink.scala 118:81:@4002.4]
  assign qei_count_sel = _T_78 & _T_128; // @[interlink.scala 118:66:@4003.4]
  assign _T_138 = reg_offset == 12'h108; // @[interlink.scala 122:81:@4013.4]
  assign qei_cfg_sel = _T_78 & _T_138; // @[interlink.scala 122:66:@4014.4]
  assign _T_148 = reg_offset == 12'h104; // @[interlink.scala 126:81:@4024.4]
  assign qei_speed_sel = _T_78 & _T_148; // @[interlink.scala 126:66:@4025.4]
  assign _T_155 = qei_count_sel | qei_cfg_sel; // @[interlink.scala 130:37:@4033.4]
  assign qei_sel = _T_155 | qei_speed_sel; // @[interlink.scala 130:52:@4034.4]
  assign _T_156 = qei_cfg_sel ? io_qei_cfg_do : io_qei_count_do; // @[interlink.scala 131:59:@4035.4]
  assign _T_236 = $unsigned(io_qei_speed_do); // @[interlink.scala 187:46:@4137.4]
  assign qei_speed_do = {{16'd0}, _T_236}; // @[interlink.scala 125:27:@4022.4 interlink.scala 187:21:@4138.4]
  assign qei_do = qei_speed_sel ? qei_speed_do : _T_156; // @[interlink.scala 131:26:@4036.4]
  assign _T_160 = reg_offset == 12'h200; // @[interlink.scala 135:81:@4039.4]
  assign pid_kp_sel = _T_78 & _T_160; // @[interlink.scala 135:66:@4040.4]
  assign _T_170 = reg_offset == 12'h204; // @[interlink.scala 139:81:@4050.4]
  assign pid_ki_sel = _T_78 & _T_170; // @[interlink.scala 139:66:@4051.4]
  assign _T_180 = reg_offset == 12'h208; // @[interlink.scala 143:81:@4061.4]
  assign pid_kd_sel = _T_78 & _T_180; // @[interlink.scala 143:66:@4062.4]
  assign _T_190 = reg_offset == 12'h20c; // @[interlink.scala 147:81:@4072.4]
  assign pid_ref_sel = _T_78 & _T_190; // @[interlink.scala 147:66:@4073.4]
  assign _T_200 = reg_offset == 12'h210; // @[interlink.scala 151:81:@4083.4]
  assign pid_fb_sel = _T_78 & _T_200; // @[interlink.scala 151:66:@4084.4]
  assign _T_210 = reg_offset == 12'h214; // @[interlink.scala 155:81:@4094.4]
  assign pid_cfg_sel = _T_78 & _T_210; // @[interlink.scala 155:66:@4095.4]
  assign _T_217 = pid_kp_sel | pid_ki_sel; // @[interlink.scala 158:34:@4103.4]
  assign _T_218 = _T_217 | pid_kd_sel; // @[interlink.scala 158:48:@4104.4]
  assign _T_219 = _T_218 | pid_ref_sel; // @[interlink.scala 158:62:@4105.4]
  assign _T_220 = _T_219 | pid_fb_sel; // @[interlink.scala 158:77:@4106.4]
  assign pid_sel = _T_220 | pid_cfg_sel; // @[interlink.scala 158:91:@4107.4]
  assign _T_221 = pid_fb_sel ? $signed(io_pid_fb_do) : $signed(io_pid_cfg_do); // @[interlink.scala 162:46:@4108.4]
  assign _T_222 = pid_ref_sel ? $signed(io_pid_ref_do) : $signed(_T_221); // @[interlink.scala 161:46:@4109.4]
  assign _T_223 = pid_kd_sel ? $signed(io_pid_kd_do) : $signed(_T_222); // @[interlink.scala 160:46:@4110.4]
  assign _T_224 = pid_ki_sel ? $signed(io_pid_ki_do) : $signed(_T_223); // @[interlink.scala 159:53:@4111.4]
  assign pid_do = pid_kp_sel ? $signed(io_pid_kp_do) : $signed(_T_224); // @[interlink.scala 159:26:@4112.4]
  assign _T_229 = $unsigned(pid_do); // @[interlink.scala 167:92:@4115.4]
  assign _T_231 = pid_sel ? _T_229 : 16'h0; // @[interlink.scala 167:69:@4116.4]
  assign _T_232 = qei_sel ? qei_do : {{16'd0}, _T_231}; // @[interlink.scala 167:48:@4117.4]
  assign _T_233 = tmr_sel ? tmr_do : _T_232; // @[interlink.scala 167:27:@4118.4]
  assign _T_234 = tmr_sel | qei_sel; // @[interlink.scala 168:32:@4120.4]
  assign _T_235 = _T_234 | pid_sel; // @[interlink.scala 168:43:@4121.4]
  assign io_bus_ack_o = wb_ack_o; // @[interlink.scala 171:21:@4124.4]
  assign io_bus_dat_o = wb_data_o; // @[interlink.scala 170:21:@4123.4]
  assign io_tmr_val_we = tmr_val_sel ? _T_95 : 1'h0; // @[interlink.scala 174:21:@4125.4]
  assign io_tmr_dat_we = tmr_dat_sel ? _T_95 : 1'h0; // @[interlink.scala 176:21:@4127.4]
  assign io_tmr_duty_we = tmr_duty_sel ? _T_95 : 1'h0; // @[interlink.scala 178:21:@4129.4]
  assign io_tmr_cfg_we = tmr_cfg_sel ? _T_95 : 1'h0; // @[interlink.scala 180:21:@4131.4]
  assign io_qei_count_we = qei_count_sel ? _T_95 : 1'h0; // @[interlink.scala 183:21:@4133.4]
  assign io_qei_cfg_we = qei_cfg_sel ? _T_95 : 1'h0; // @[interlink.scala 185:21:@4135.4]
  assign io_pid_kp_we = pid_kp_sel ? _T_95 : 1'h0; // @[interlink.scala 189:21:@4139.4]
  assign io_pid_ki_we = pid_ki_sel ? _T_95 : 1'h0; // @[interlink.scala 191:21:@4141.4]
  assign io_pid_kd_we = pid_kd_sel ? _T_95 : 1'h0; // @[interlink.scala 193:21:@4143.4]
  assign io_pid_ref_we = pid_ref_sel ? _T_95 : 1'h0; // @[interlink.scala 195:21:@4145.4]
  assign io_pid_fb_we = pid_fb_sel ? _T_95 : 1'h0; // @[interlink.scala 197:21:@4147.4]
  assign io_pid_cfg_we = pid_cfg_sel ? _T_95 : 1'h0; // @[interlink.scala 199:21:@4149.4]
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
  wb_ack_o = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  wb_data_o = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      wb_ack_o <= 1'h0;
    end else begin
      wb_ack_o <= _T_235;
    end
    if (reset) begin
      wb_data_o <= 32'h0;
    end else begin
      if (tmr_sel) begin
        if (tmr_cfg_sel) begin
          wb_data_o <= io_tmr_cfg_do;
        end else begin
          if (tmr_val_sel) begin
            wb_data_o <= io_tmr_val_do;
          end else begin
            if (tmr_duty_sel) begin
              wb_data_o <= io_tmr_duty_do;
            end else begin
              wb_data_o <= io_tmr_dat_do;
            end
          end
        end
      end else begin
        if (qei_sel) begin
          if (qei_speed_sel) begin
            wb_data_o <= qei_speed_do;
          end else begin
            if (qei_cfg_sel) begin
              wb_data_o <= io_qei_cfg_do;
            end else begin
              wb_data_o <= io_qei_count_do;
            end
          end
        end else begin
          wb_data_o <= {{16'd0}, _T_231};
        end
      end
    end
  end
endmodule
module PWM( // @[:@4152.2]
  input         clock, // @[:@4153.4]
  input         reset, // @[:@4154.4]
  input         io_reg_val_we, // @[:@4155.4]
  input  [31:0] io_reg_val_di, // @[:@4155.4]
  output [31:0] io_reg_val_do, // @[:@4155.4]
  input         io_reg_cfg_we, // @[:@4155.4]
  input  [31:0] io_reg_cfg_di, // @[:@4155.4]
  output [31:0] io_reg_cfg_do, // @[:@4155.4]
  input         io_reg_dat_we, // @[:@4155.4]
  input  [31:0] io_reg_dat_di, // @[:@4155.4]
  output [31:0] io_reg_dat_do, // @[:@4155.4]
  input         io_reg_duty_we, // @[:@4155.4]
  input  [31:0] io_reg_duty_di, // @[:@4155.4]
  output [31:0] io_reg_duty_do, // @[:@4155.4]
  input  [15:0] io_reg_pid_out, // @[:@4155.4]
  output        io_pwm_h, // @[:@4155.4]
  output        io_pwm_l, // @[:@4155.4]
  output        io_irq_out, // @[:@4155.4]
  output        io_rawirq_out // @[:@4155.4]
);
  reg [31:0] value_cur; // @[pwm.scala 44:32:@4157.4]
  reg [31:0] _RAND_0;
  reg [31:0] value_reload; // @[pwm.scala 45:32:@4158.4]
  reg [31:0] _RAND_1;
  reg [31:0] pwm_duty; // @[pwm.scala 46:32:@4159.4]
  reg [31:0] _RAND_2;
  reg [31:0] reg_duty; // @[pwm.scala 47:32:@4160.4]
  reg [31:0] _RAND_3;
  reg  enable; // @[pwm.scala 54:32:@4164.4]
  reg [31:0] _RAND_4;
  reg  stop_out; // @[pwm.scala 56:32:@4165.4]
  reg [31:0] _RAND_5;
  reg  irq_out; // @[pwm.scala 57:32:@4166.4]
  reg [31:0] _RAND_6;
  reg  lastenable; // @[pwm.scala 60:28:@4167.4]
  reg [31:0] _RAND_7;
  reg  updown; // @[pwm.scala 63:32:@4168.4]
  reg [31:0] _RAND_8;
  reg  irq_ena; // @[pwm.scala 66:32:@4169.4]
  reg [31:0] _RAND_9;
  reg  pid_out_sel; // @[pwm.scala 69:32:@4170.4]
  reg [31:0] _RAND_10;
  reg [3:0] pwm_db; // @[pwm.scala 72:32:@4171.4]
  reg [31:0] _RAND_11;
  wire [31:0] _GEN_0; // @[pwm.scala 76:24:@4173.4]
  wire [15:0] _T_65; // @[pwm.scala 82:40:@4178.8]
  wire [31:0] _GEN_1; // @[pwm.scala 81:22:@4177.6]
  wire [31:0] _GEN_2; // @[pwm.scala 80:18:@4176.4]
  reg [31:0] proc_offset; // @[pwm.scala 88:24:@4185.4]
  reg [31:0] _RAND_12;
  reg  pwm_ld; // @[pwm.scala 89:24:@4186.4]
  reg [31:0] _RAND_13;
  reg  pwm_hd; // @[pwm.scala 90:24:@4187.4]
  reg [31:0] _RAND_14;
  wire [4:0] _GEN_25; // @[pwm.scala 93:30:@4188.4]
  wire [4:0] pwm_db_twice; // @[pwm.scala 93:30:@4188.4]
  wire [31:0] _GEN_26; // @[pwm.scala 95:37:@4189.4]
  wire  _T_70; // @[pwm.scala 95:37:@4189.4]
  wire [32:0] _T_71; // @[pwm.scala 95:84:@4190.4]
  wire [32:0] _T_72; // @[pwm.scala 95:84:@4191.4]
  wire [31:0] _T_73; // @[pwm.scala 95:84:@4192.4]
  wire  _T_74; // @[pwm.scala 95:67:@4193.4]
  wire  _T_75; // @[pwm.scala 95:54:@4194.4]
  wire  _T_76; // @[pwm.scala 96:36:@4195.4]
  wire [31:0] _T_80; // @[pwm.scala 96:26:@4199.4]
  wire [31:0] _GEN_30; // @[pwm.scala 97:48:@4202.4]
  wire [32:0] _T_82; // @[pwm.scala 97:48:@4202.4]
  wire [32:0] _T_83; // @[pwm.scala 97:48:@4203.4]
  wire [31:0] _T_84; // @[pwm.scala 97:48:@4204.4]
  wire  _T_86; // @[pwm.scala 98:34:@4207.4]
  wire [32:0] _T_87; // @[pwm.scala 98:79:@4208.4]
  wire [32:0] _T_88; // @[pwm.scala 98:79:@4209.4]
  wire [31:0] _T_89; // @[pwm.scala 98:79:@4210.4]
  wire  _T_90; // @[pwm.scala 98:63:@4211.4]
  wire  _T_94; // @[pwm.scala 104:34:@4219.4]
  wire  _T_95; // @[pwm.scala 104:32:@4220.4]
  wire [2:0] _T_99; // @[Cat.scala 30:58:@4224.4]
  wire [28:0] _T_101; // @[Cat.scala 30:58:@4226.4]
  wire  _T_103; // @[pwm.scala 109:35:@4230.6]
  wire  _T_104; // @[pwm.scala 110:35:@4232.6]
  wire  _T_105; // @[pwm.scala 111:35:@4234.6]
  wire  _T_106; // @[pwm.scala 112:35:@4236.6]
  wire [3:0] _T_107; // @[pwm.scala 113:36:@4238.6]
  wire [4:0] _T_109; // @[pwm.scala 113:42:@4239.6]
  wire [3:0] _T_110; // @[pwm.scala 113:42:@4240.6]
  wire  _GEN_3; // @[pwm.scala 108:23:@4229.4]
  wire  _GEN_4; // @[pwm.scala 108:23:@4229.4]
  wire  _GEN_5; // @[pwm.scala 108:23:@4229.4]
  wire  _GEN_6; // @[pwm.scala 108:23:@4229.4]
  wire [3:0] _GEN_7; // @[pwm.scala 108:23:@4229.4]
  wire [31:0] _GEN_8; // @[pwm.scala 118:29:@4245.4]
  wire [32:0] _T_114; // @[pwm.scala 124:39:@4249.4]
  wire [31:0] value_cur_plus; // @[pwm.scala 124:39:@4250.4]
  wire [32:0] _T_117; // @[pwm.scala 125:39:@4252.4]
  wire [32:0] _T_118; // @[pwm.scala 125:39:@4253.4]
  wire [31:0] value_cur_minus; // @[pwm.scala 125:39:@4254.4]
  wire  _T_127; // @[pwm.scala 135:23:@4267.8]
  wire  _T_131; // @[pwm.scala 138:25:@4271.10]
  wire  _T_134; // @[pwm.scala 143:33:@4277.12]
  wire [31:0] _GEN_9; // @[pwm.scala 143:58:@4278.12]
  wire [31:0] _GEN_11; // @[pwm.scala 138:38:@4272.10]
  wire  _GEN_12; // @[pwm.scala 138:38:@4272.10]
  wire  _T_142; // @[pwm.scala 158:35:@4295.12]
  wire [31:0] _GEN_13; // @[pwm.scala 158:50:@4296.12]
  wire [31:0] _GEN_15; // @[pwm.scala 153:38:@4290.10]
  wire  _GEN_16; // @[pwm.scala 153:38:@4290.10]
  wire [31:0] _GEN_17; // @[pwm.scala 137:31:@4270.8]
  wire  _GEN_18; // @[pwm.scala 137:31:@4270.8]
  wire  _GEN_19; // @[pwm.scala 132:39:@4264.6]
  wire [31:0] _GEN_20; // @[pwm.scala 132:39:@4264.6]
  wire  _GEN_21; // @[pwm.scala 132:39:@4264.6]
  wire [31:0] _GEN_22; // @[pwm.scala 130:29:@4259.4]
  wire  _GEN_23; // @[pwm.scala 130:29:@4259.4]
  wire  _GEN_24; // @[pwm.scala 130:29:@4259.4]
  assign _GEN_0 = io_reg_duty_we ? io_reg_duty_di : reg_duty; // @[pwm.scala 76:24:@4173.4]
  assign _T_65 = $unsigned(io_reg_pid_out); // @[pwm.scala 82:40:@4178.8]
  assign _GEN_1 = pid_out_sel ? {{16'd0}, _T_65} : reg_duty; // @[pwm.scala 81:22:@4177.6]
  assign _GEN_2 = stop_out ? _GEN_1 : pwm_duty; // @[pwm.scala 80:18:@4176.4]
  assign _GEN_25 = {{1'd0}, pwm_db}; // @[pwm.scala 93:30:@4188.4]
  assign pwm_db_twice = _GEN_25 << 1'h1; // @[pwm.scala 93:30:@4188.4]
  assign _GEN_26 = {{27'd0}, pwm_db_twice}; // @[pwm.scala 95:37:@4189.4]
  assign _T_70 = pwm_duty >= _GEN_26; // @[pwm.scala 95:37:@4189.4]
  assign _T_71 = value_reload - _GEN_26; // @[pwm.scala 95:84:@4190.4]
  assign _T_72 = $unsigned(_T_71); // @[pwm.scala 95:84:@4191.4]
  assign _T_73 = _T_72[31:0]; // @[pwm.scala 95:84:@4192.4]
  assign _T_74 = pwm_duty <= _T_73; // @[pwm.scala 95:67:@4193.4]
  assign _T_75 = _T_70 & _T_74; // @[pwm.scala 95:54:@4194.4]
  assign _T_76 = pwm_duty < _GEN_26; // @[pwm.scala 96:36:@4195.4]
  assign _T_80 = _T_76 ? {{27'd0}, pwm_db_twice} : _T_73; // @[pwm.scala 96:26:@4199.4]
  assign _GEN_30 = {{28'd0}, pwm_db}; // @[pwm.scala 97:48:@4202.4]
  assign _T_82 = proc_offset - _GEN_30; // @[pwm.scala 97:48:@4202.4]
  assign _T_83 = $unsigned(_T_82); // @[pwm.scala 97:48:@4203.4]
  assign _T_84 = _T_83[31:0]; // @[pwm.scala 97:48:@4204.4]
  assign _T_86 = value_cur > proc_offset; // @[pwm.scala 98:34:@4207.4]
  assign _T_87 = value_reload - _GEN_30; // @[pwm.scala 98:79:@4208.4]
  assign _T_88 = $unsigned(_T_87); // @[pwm.scala 98:79:@4209.4]
  assign _T_89 = _T_88[31:0]; // @[pwm.scala 98:79:@4210.4]
  assign _T_90 = value_cur < _T_89; // @[pwm.scala 98:63:@4211.4]
  assign _T_94 = ~ irq_out; // @[pwm.scala 104:34:@4219.4]
  assign _T_95 = stop_out & _T_94; // @[pwm.scala 104:32:@4220.4]
  assign _T_99 = {irq_ena,updown,enable}; // @[Cat.scala 30:58:@4224.4]
  assign _T_101 = {24'h0,pwm_db,pid_out_sel}; // @[Cat.scala 30:58:@4226.4]
  assign _T_103 = io_reg_cfg_di[0]; // @[pwm.scala 109:35:@4230.6]
  assign _T_104 = io_reg_cfg_di[1]; // @[pwm.scala 110:35:@4232.6]
  assign _T_105 = io_reg_cfg_di[2]; // @[pwm.scala 111:35:@4234.6]
  assign _T_106 = io_reg_cfg_di[3]; // @[pwm.scala 112:35:@4236.6]
  assign _T_107 = io_reg_cfg_di[7:4]; // @[pwm.scala 113:36:@4238.6]
  assign _T_109 = _T_107 + 4'h2; // @[pwm.scala 113:42:@4239.6]
  assign _T_110 = _T_107 + 4'h2; // @[pwm.scala 113:42:@4240.6]
  assign _GEN_3 = io_reg_cfg_we ? _T_103 : enable; // @[pwm.scala 108:23:@4229.4]
  assign _GEN_4 = io_reg_cfg_we ? _T_104 : updown; // @[pwm.scala 108:23:@4229.4]
  assign _GEN_5 = io_reg_cfg_we ? _T_105 : irq_ena; // @[pwm.scala 108:23:@4229.4]
  assign _GEN_6 = io_reg_cfg_we ? _T_106 : pid_out_sel; // @[pwm.scala 108:23:@4229.4]
  assign _GEN_7 = io_reg_cfg_we ? _T_110 : pwm_db; // @[pwm.scala 108:23:@4229.4]
  assign _GEN_8 = io_reg_val_we ? io_reg_val_di : value_reload; // @[pwm.scala 118:29:@4245.4]
  assign _T_114 = value_cur + 32'h1; // @[pwm.scala 124:39:@4249.4]
  assign value_cur_plus = value_cur + 32'h1; // @[pwm.scala 124:39:@4250.4]
  assign _T_117 = value_cur - 32'h1; // @[pwm.scala 125:39:@4252.4]
  assign _T_118 = $unsigned(_T_117); // @[pwm.scala 125:39:@4253.4]
  assign value_cur_minus = _T_118[31:0]; // @[pwm.scala 125:39:@4254.4]
  assign _T_127 = irq_ena ? _T_95 : 1'h0; // @[pwm.scala 135:23:@4267.8]
  assign _T_131 = lastenable == 1'h0; // @[pwm.scala 138:25:@4271.10]
  assign _T_134 = value_cur == value_reload; // @[pwm.scala 143:33:@4277.12]
  assign _GEN_9 = _T_134 ? 32'h0 : value_cur_plus; // @[pwm.scala 143:58:@4278.12]
  assign _GEN_11 = _T_131 ? 32'h0 : _GEN_9; // @[pwm.scala 138:38:@4272.10]
  assign _GEN_12 = _T_131 ? 1'h0 : _T_134; // @[pwm.scala 138:38:@4272.10]
  assign _T_142 = value_cur == 32'h0; // @[pwm.scala 158:35:@4295.12]
  assign _GEN_13 = _T_142 ? value_reload : value_cur_minus; // @[pwm.scala 158:50:@4296.12]
  assign _GEN_15 = _T_131 ? value_reload : _GEN_13; // @[pwm.scala 153:38:@4290.10]
  assign _GEN_16 = _T_131 ? 1'h0 : _T_142; // @[pwm.scala 153:38:@4290.10]
  assign _GEN_17 = updown ? _GEN_11 : _GEN_15; // @[pwm.scala 137:31:@4270.8]
  assign _GEN_18 = updown ? _GEN_12 : _GEN_16; // @[pwm.scala 137:31:@4270.8]
  assign _GEN_19 = enable ? _T_127 : irq_out; // @[pwm.scala 132:39:@4264.6]
  assign _GEN_20 = enable ? _GEN_17 : value_cur; // @[pwm.scala 132:39:@4264.6]
  assign _GEN_21 = enable ? _GEN_18 : stop_out; // @[pwm.scala 132:39:@4264.6]
  assign _GEN_22 = io_reg_dat_we ? io_reg_dat_di : _GEN_20; // @[pwm.scala 130:29:@4259.4]
  assign _GEN_23 = io_reg_dat_we ? irq_out : _GEN_19; // @[pwm.scala 130:29:@4259.4]
  assign _GEN_24 = io_reg_dat_we ? stop_out : _GEN_21; // @[pwm.scala 130:29:@4259.4]
  assign io_reg_val_do = value_reload; // @[pwm.scala 117:19:@4243.4]
  assign io_reg_cfg_do = {_T_101,_T_99}; // @[pwm.scala 107:20:@4228.4]
  assign io_reg_dat_do = value_cur; // @[pwm.scala 123:19:@4248.4]
  assign io_reg_duty_do = pwm_duty; // @[pwm.scala 75:23:@4172.4]
  assign io_pwm_h = pwm_hd & enable; // @[pwm.scala 99:20:@4215.4]
  assign io_pwm_l = pwm_ld & enable; // @[pwm.scala 100:20:@4217.4]
  assign io_irq_out = irq_out; // @[pwm.scala 103:20:@4218.4]
  assign io_rawirq_out = stop_out & _T_94; // @[pwm.scala 104:20:@4221.4]
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
  value_cur = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  value_reload = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  pwm_duty = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  reg_duty = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  enable = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  stop_out = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  irq_out = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  lastenable = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  updown = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  irq_ena = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  pid_out_sel = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  pwm_db = _RAND_11[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  proc_offset = _RAND_12[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  pwm_ld = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  pwm_hd = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      value_cur <= 32'h0;
    end else begin
      if (io_reg_dat_we) begin
        value_cur <= io_reg_dat_di;
      end else begin
        if (enable) begin
          if (updown) begin
            if (_T_131) begin
              value_cur <= 32'h0;
            end else begin
              if (_T_134) begin
                value_cur <= 32'h0;
              end else begin
                value_cur <= value_cur_plus;
              end
            end
          end else begin
            if (_T_131) begin
              value_cur <= value_reload;
            end else begin
              if (_T_142) begin
                value_cur <= value_reload;
              end else begin
                value_cur <= value_cur_minus;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      value_reload <= 32'hff;
    end else begin
      if (io_reg_val_we) begin
        value_reload <= io_reg_val_di;
      end
    end
    if (reset) begin
      pwm_duty <= 32'h0;
    end else begin
      if (stop_out) begin
        if (pid_out_sel) begin
          pwm_duty <= {{16'd0}, _T_65};
        end else begin
          pwm_duty <= reg_duty;
        end
      end
    end
    if (reset) begin
      reg_duty <= 32'h0;
    end else begin
      if (io_reg_duty_we) begin
        reg_duty <= io_reg_duty_di;
      end
    end
    if (reset) begin
      enable <= 1'h0;
    end else begin
      if (io_reg_cfg_we) begin
        enable <= _T_103;
      end
    end
    if (reset) begin
      stop_out <= 1'h0;
    end else begin
      if (!(io_reg_dat_we)) begin
        if (enable) begin
          if (updown) begin
            if (_T_131) begin
              stop_out <= 1'h0;
            end else begin
              stop_out <= _T_134;
            end
          end else begin
            if (_T_131) begin
              stop_out <= 1'h0;
            end else begin
              stop_out <= _T_142;
            end
          end
        end
      end
    end
    if (reset) begin
      irq_out <= 1'h0;
    end else begin
      if (!(io_reg_dat_we)) begin
        if (enable) begin
          if (irq_ena) begin
            irq_out <= _T_95;
          end else begin
            irq_out <= 1'h0;
          end
        end
      end
    end
    lastenable <= enable;
    if (reset) begin
      updown <= 1'h0;
    end else begin
      if (io_reg_cfg_we) begin
        updown <= _T_104;
      end
    end
    if (reset) begin
      irq_ena <= 1'h0;
    end else begin
      if (io_reg_cfg_we) begin
        irq_ena <= _T_105;
      end
    end
    if (reset) begin
      pid_out_sel <= 1'h0;
    end else begin
      if (io_reg_cfg_we) begin
        pid_out_sel <= _T_106;
      end
    end
    if (reset) begin
      pwm_db <= 4'h2;
    end else begin
      if (io_reg_cfg_we) begin
        pwm_db <= _T_110;
      end
    end
    if (_T_75) begin
      proc_offset <= pwm_duty;
    end else begin
      if (_T_76) begin
        proc_offset <= {{27'd0}, pwm_db_twice};
      end else begin
        proc_offset <= _T_73;
      end
    end
    pwm_ld <= _T_86 & _T_90;
    pwm_hd <= value_cur < _T_84;
  end
endmodule
module Quad_Encoder( // @[:@4308.2]
  input         clock, // @[:@4309.4]
  input         reset, // @[:@4310.4]
  input         io_quad_a, // @[:@4311.4]
  input         io_quad_b, // @[:@4311.4]
  input         io_raw_irq, // @[:@4311.4]
  input         io_reg_count_we, // @[:@4311.4]
  input  [31:0] io_reg_count_di, // @[:@4311.4]
  output [31:0] io_reg_count_do, // @[:@4311.4]
  input         io_reg_cfg_we, // @[:@4311.4]
  input  [31:0] io_reg_cfg_di, // @[:@4311.4]
  output [31:0] io_reg_cfg_do, // @[:@4311.4]
  output [15:0] io_reg_speed_do, // @[:@4311.4]
  output        io_fb_period // @[:@4311.4]
);
  reg [2:0] quad_a_delayed; // @[qei.scala 35:33:@4313.4]
  reg [31:0] _RAND_0;
  reg [2:0] quad_b_delayed; // @[qei.scala 36:33:@4314.4]
  reg [31:0] _RAND_1;
  reg [31:0] count_reg; // @[qei.scala 37:33:@4315.4]
  reg [31:0] _RAND_2;
  reg [15:0] count_reg_2; // @[qei.scala 38:33:@4316.4]
  reg [31:0] _RAND_3;
  reg [15:0] period_count; // @[qei.scala 39:33:@4317.4]
  reg [31:0] _RAND_4;
  reg  speed_enable; // @[qei.scala 41:33:@4318.4]
  reg [31:0] _RAND_5;
  reg  count_sel_2x; // @[qei.scala 42:33:@4319.4]
  reg [31:0] _RAND_6;
  reg [15:0] qei_output; // @[qei.scala 44:33:@4321.4]
  reg [31:0] _RAND_7;
  reg [15:0] qei_speed_count; // @[qei.scala 45:33:@4322.4]
  reg [31:0] _RAND_8;
  reg [15:0] qei_period_count; // @[qei.scala 46:33:@4323.4]
  reg [31:0] _RAND_9;
  reg  period_sel; // @[qei.scala 47:33:@4324.4]
  reg [31:0] _RAND_10;
  wire  _T_51; // @[qei.scala 51:44:@4326.4]
  wire  _T_52; // @[qei.scala 51:63:@4327.4]
  wire [2:0] _T_54; // @[Cat.scala 30:58:@4329.4]
  wire  _T_55; // @[qei.scala 52:44:@4331.4]
  wire  _T_56; // @[qei.scala 52:63:@4332.4]
  wire [2:0] _T_58; // @[Cat.scala 30:58:@4334.4]
  wire  _T_61; // @[qei.scala 54:75:@4337.4]
  wire  count_2x; // @[qei.scala 54:60:@4338.4]
  wire  _T_68; // @[qei.scala 55:78:@4345.4]
  wire  _T_69; // @[qei.scala 55:111:@4346.4]
  wire  count_4x; // @[qei.scala 55:96:@4347.4]
  wire  count_direction; // @[qei.scala 56:60:@4352.4]
  wire  count_pulses; // @[qei.scala 57:29:@4355.4]
  wire [32:0] _T_76; // @[qei.scala 64:36:@4358.8]
  wire [31:0] _T_77; // @[qei.scala 64:36:@4359.8]
  wire [32:0] _T_79; // @[qei.scala 66:36:@4363.8]
  wire [32:0] _T_80; // @[qei.scala 66:36:@4364.8]
  wire [31:0] _T_81; // @[qei.scala 66:36:@4365.8]
  wire [31:0] _GEN_0; // @[qei.scala 63:27:@4357.6]
  wire [31:0] _GEN_1; // @[qei.scala 62:22:@4356.4]
  wire  _T_82; // @[qei.scala 71:20:@4369.4]
  wire [16:0] _T_85; // @[qei.scala 76:38:@4376.8]
  wire [15:0] _T_86; // @[qei.scala 76:38:@4377.8]
  wire [15:0] _GEN_2; // @[qei.scala 72:23:@4371.6]
  wire [15:0] _GEN_3; // @[qei.scala 72:23:@4371.6]
  wire [15:0] _GEN_4; // @[qei.scala 71:37:@4370.4]
  wire [15:0] _GEN_5; // @[qei.scala 71:37:@4370.4]
  wire  _T_89; // @[qei.scala 85:29:@4387.8]
  wire [16:0] _T_92; // @[qei.scala 89:40:@4393.10]
  wire [15:0] _T_93; // @[qei.scala 89:40:@4394.10]
  wire [15:0] _GEN_6; // @[qei.scala 85:40:@4388.8]
  wire [15:0] _GEN_7; // @[qei.scala 85:40:@4388.8]
  wire [15:0] _GEN_8; // @[qei.scala 82:24:@4382.6]
  wire [15:0] _GEN_9; // @[qei.scala 82:24:@4382.6]
  wire [15:0] _GEN_10; // @[qei.scala 81:20:@4381.4]
  wire [15:0] _GEN_11; // @[qei.scala 81:20:@4381.4]
  wire [15:0] _T_94; // @[qei.scala 94:30:@4398.4]
  wire [1:0] _T_96; // @[Cat.scala 30:58:@4400.4]
  wire [29:0] _T_97; // @[Cat.scala 30:58:@4401.4]
  wire  _T_101; // @[qei.scala 106:40:@4413.8]
  wire  _T_102; // @[qei.scala 107:40:@4415.8]
  wire  _T_103; // @[qei.scala 108:40:@4417.8]
  wire  _GEN_12; // @[qei.scala 105:28:@4412.6]
  wire  _GEN_13; // @[qei.scala 105:28:@4412.6]
  wire  _GEN_14; // @[qei.scala 105:28:@4412.6]
  wire [31:0] _GEN_15; // @[qei.scala 103:25:@4408.4]
  wire  _GEN_16; // @[qei.scala 103:25:@4408.4]
  wire  _GEN_17; // @[qei.scala 103:25:@4408.4]
  wire  _GEN_18; // @[qei.scala 103:25:@4408.4]
  assign _T_51 = quad_a_delayed[1]; // @[qei.scala 51:44:@4326.4]
  assign _T_52 = quad_a_delayed[0]; // @[qei.scala 51:63:@4327.4]
  assign _T_54 = {_T_51,_T_52,io_quad_a}; // @[Cat.scala 30:58:@4329.4]
  assign _T_55 = quad_b_delayed[1]; // @[qei.scala 52:44:@4331.4]
  assign _T_56 = quad_b_delayed[0]; // @[qei.scala 52:63:@4332.4]
  assign _T_58 = {_T_55,_T_56,io_quad_b}; // @[Cat.scala 30:58:@4334.4]
  assign _T_61 = quad_a_delayed[2]; // @[qei.scala 54:75:@4337.4]
  assign count_2x = _T_51 ^ _T_61; // @[qei.scala 54:60:@4338.4]
  assign _T_68 = count_2x ^ _T_55; // @[qei.scala 55:78:@4345.4]
  assign _T_69 = quad_b_delayed[2]; // @[qei.scala 55:111:@4346.4]
  assign count_4x = _T_68 ^ _T_69; // @[qei.scala 55:96:@4347.4]
  assign count_direction = _T_51 ^ _T_69; // @[qei.scala 56:60:@4352.4]
  assign count_pulses = count_sel_2x ? count_2x : count_4x; // @[qei.scala 57:29:@4355.4]
  assign _T_76 = count_reg + 32'h1; // @[qei.scala 64:36:@4358.8]
  assign _T_77 = count_reg + 32'h1; // @[qei.scala 64:36:@4359.8]
  assign _T_79 = count_reg - 32'h1; // @[qei.scala 66:36:@4363.8]
  assign _T_80 = $unsigned(_T_79); // @[qei.scala 66:36:@4364.8]
  assign _T_81 = _T_80[31:0]; // @[qei.scala 66:36:@4365.8]
  assign _GEN_0 = count_direction ? _T_77 : _T_81; // @[qei.scala 63:27:@4357.6]
  assign _GEN_1 = count_pulses ? _GEN_0 : count_reg; // @[qei.scala 62:22:@4356.4]
  assign _T_82 = io_raw_irq | count_pulses; // @[qei.scala 71:20:@4369.4]
  assign _T_85 = count_reg_2 + 16'h1; // @[qei.scala 76:38:@4376.8]
  assign _T_86 = count_reg_2 + 16'h1; // @[qei.scala 76:38:@4377.8]
  assign _GEN_2 = io_raw_irq ? count_reg_2 : qei_speed_count; // @[qei.scala 72:23:@4371.6]
  assign _GEN_3 = io_raw_irq ? 16'h0 : _T_86; // @[qei.scala 72:23:@4371.6]
  assign _GEN_4 = _T_82 ? _GEN_2 : qei_speed_count; // @[qei.scala 71:37:@4370.4]
  assign _GEN_5 = _T_82 ? _GEN_3 : count_reg_2; // @[qei.scala 71:37:@4370.4]
  assign _T_89 = period_count == 16'hff; // @[qei.scala 85:29:@4387.8]
  assign _T_92 = period_count + 16'h1; // @[qei.scala 89:40:@4393.10]
  assign _T_93 = period_count + 16'h1; // @[qei.scala 89:40:@4394.10]
  assign _GEN_6 = _T_89 ? period_count : qei_period_count; // @[qei.scala 85:40:@4388.8]
  assign _GEN_7 = _T_89 ? 16'h0 : _T_93; // @[qei.scala 85:40:@4388.8]
  assign _GEN_8 = count_pulses ? period_count : _GEN_6; // @[qei.scala 82:24:@4382.6]
  assign _GEN_9 = count_pulses ? 16'h0 : _GEN_7; // @[qei.scala 82:24:@4382.6]
  assign _GEN_10 = period_sel ? _GEN_8 : qei_period_count; // @[qei.scala 81:20:@4381.4]
  assign _GEN_11 = period_sel ? _GEN_9 : period_count; // @[qei.scala 81:20:@4381.4]
  assign _T_94 = period_sel ? qei_period_count : qei_speed_count; // @[qei.scala 94:30:@4398.4]
  assign _T_96 = {speed_enable,count_sel_2x}; // @[Cat.scala 30:58:@4400.4]
  assign _T_97 = {29'h0,period_sel}; // @[Cat.scala 30:58:@4401.4]
  assign _T_101 = io_reg_cfg_di[0]; // @[qei.scala 106:40:@4413.8]
  assign _T_102 = io_reg_cfg_di[1]; // @[qei.scala 107:40:@4415.8]
  assign _T_103 = io_reg_cfg_di[2]; // @[qei.scala 108:40:@4417.8]
  assign _GEN_12 = io_reg_cfg_we ? _T_101 : count_sel_2x; // @[qei.scala 105:28:@4412.6]
  assign _GEN_13 = io_reg_cfg_we ? _T_102 : speed_enable; // @[qei.scala 105:28:@4412.6]
  assign _GEN_14 = io_reg_cfg_we ? _T_103 : period_sel; // @[qei.scala 105:28:@4412.6]
  assign _GEN_15 = io_reg_count_we ? io_reg_count_di : _GEN_1; // @[qei.scala 103:25:@4408.4]
  assign _GEN_16 = io_reg_count_we ? count_sel_2x : _GEN_12; // @[qei.scala 103:25:@4408.4]
  assign _GEN_17 = io_reg_count_we ? speed_enable : _GEN_13; // @[qei.scala 103:25:@4408.4]
  assign _GEN_18 = io_reg_count_we ? period_sel : _GEN_14; // @[qei.scala 103:25:@4408.4]
  assign io_reg_count_do = count_reg; // @[qei.scala 49:23:@4325.4]
  assign io_reg_cfg_do = {_T_97,_T_96}; // @[qei.scala 97:24:@4403.4]
  assign io_reg_speed_do = $signed(qei_output); // @[qei.scala 100:24:@4406.4]
  assign io_fb_period = period_sel; // @[qei.scala 101:24:@4407.4]
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
  quad_a_delayed = _RAND_0[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  quad_b_delayed = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  count_reg = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  count_reg_2 = _RAND_3[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  period_count = _RAND_4[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  speed_enable = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  count_sel_2x = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  qei_output = _RAND_7[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  qei_speed_count = _RAND_8[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  qei_period_count = _RAND_9[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  period_sel = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      quad_a_delayed <= 3'h0;
    end else begin
      quad_a_delayed <= _T_54;
    end
    if (reset) begin
      quad_b_delayed <= 3'h0;
    end else begin
      quad_b_delayed <= _T_58;
    end
    if (reset) begin
      count_reg <= 32'h0;
    end else begin
      if (io_reg_count_we) begin
        count_reg <= io_reg_count_di;
      end else begin
        if (count_pulses) begin
          if (count_direction) begin
            count_reg <= _T_77;
          end else begin
            count_reg <= _T_81;
          end
        end
      end
    end
    if (reset) begin
      count_reg_2 <= 16'h0;
    end else begin
      if (_T_82) begin
        if (io_raw_irq) begin
          count_reg_2 <= 16'h0;
        end else begin
          count_reg_2 <= _T_86;
        end
      end
    end
    if (reset) begin
      period_count <= 16'h0;
    end else begin
      if (period_sel) begin
        if (count_pulses) begin
          period_count <= 16'h0;
        end else begin
          if (_T_89) begin
            period_count <= 16'h0;
          end else begin
            period_count <= _T_93;
          end
        end
      end
    end
    if (reset) begin
      speed_enable <= 1'h1;
    end else begin
      if (!(io_reg_count_we)) begin
        if (io_reg_cfg_we) begin
          speed_enable <= _T_102;
        end
      end
    end
    if (reset) begin
      count_sel_2x <= 1'h1;
    end else begin
      if (!(io_reg_count_we)) begin
        if (io_reg_cfg_we) begin
          count_sel_2x <= _T_101;
        end
      end
    end
    if (reset) begin
      qei_output <= 16'h0;
    end else begin
      if (period_sel) begin
        qei_output <= qei_period_count;
      end else begin
        qei_output <= qei_speed_count;
      end
    end
    if (reset) begin
      qei_speed_count <= 16'h0;
    end else begin
      if (_T_82) begin
        if (io_raw_irq) begin
          qei_speed_count <= count_reg_2;
        end
      end
    end
    if (reset) begin
      qei_period_count <= 16'h1fff;
    end else begin
      if (period_sel) begin
        if (count_pulses) begin
          qei_period_count <= period_count;
        end else begin
          if (_T_89) begin
            qei_period_count <= period_count;
          end
        end
      end
    end
    if (reset) begin
      period_sel <= 1'h0;
    end else begin
      if (!(io_reg_count_we)) begin
        if (io_reg_cfg_we) begin
          period_sel <= _T_103;
        end
      end
    end
  end
endmodule
module vedic_2x2( // @[:@4421.2]
  input  [1:0] io_a, // @[:@4424.4]
  input  [1:0] io_b, // @[:@4424.4]
  output [3:0] io_c // @[:@4424.4]
);
  wire  _T_11; // @[multiplier.scala 25:21:@4426.4]
  wire  _T_12; // @[multiplier.scala 25:31:@4427.4]
  wire  result0; // @[multiplier.scala 25:25:@4428.4]
  wire  _T_13; // @[multiplier.scala 26:21:@4429.4]
  wire  temp0; // @[multiplier.scala 26:25:@4431.4]
  wire  _T_16; // @[multiplier.scala 27:31:@4433.4]
  wire  temp1; // @[multiplier.scala 27:25:@4434.4]
  wire  temp2; // @[multiplier.scala 28:25:@4437.4]
  wire  result1; // @[multiplier.scala 31:23:@4438.4]
  wire  temp3; // @[multiplier.scala 32:23:@4439.4]
  wire  result2; // @[multiplier.scala 34:23:@4440.4]
  wire  result3; // @[multiplier.scala 35:23:@4441.4]
  wire [1:0] _T_19; // @[Cat.scala 30:58:@4442.4]
  wire [1:0] _T_20; // @[Cat.scala 30:58:@4443.4]
  assign _T_11 = io_a[0]; // @[multiplier.scala 25:21:@4426.4]
  assign _T_12 = io_b[0]; // @[multiplier.scala 25:31:@4427.4]
  assign result0 = _T_11 & _T_12; // @[multiplier.scala 25:25:@4428.4]
  assign _T_13 = io_a[1]; // @[multiplier.scala 26:21:@4429.4]
  assign temp0 = _T_13 & _T_12; // @[multiplier.scala 26:25:@4431.4]
  assign _T_16 = io_b[1]; // @[multiplier.scala 27:31:@4433.4]
  assign temp1 = _T_11 & _T_16; // @[multiplier.scala 27:25:@4434.4]
  assign temp2 = _T_13 & _T_16; // @[multiplier.scala 28:25:@4437.4]
  assign result1 = temp0 ^ temp1; // @[multiplier.scala 31:23:@4438.4]
  assign temp3 = temp0 & temp1; // @[multiplier.scala 32:23:@4439.4]
  assign result2 = temp2 ^ temp3; // @[multiplier.scala 34:23:@4440.4]
  assign result3 = temp2 & temp3; // @[multiplier.scala 35:23:@4441.4]
  assign _T_19 = {result1,result0}; // @[Cat.scala 30:58:@4442.4]
  assign _T_20 = {result3,result2}; // @[Cat.scala 30:58:@4443.4]
  assign io_c = {_T_20,_T_19}; // @[multiplier.scala 37:15:@4445.4]
endmodule
module vedic_4x4( // @[:@4525.2]
  input  [3:0] io_a, // @[:@4528.4]
  input  [3:0] io_b, // @[:@4528.4]
  output [7:0] io_c // @[:@4528.4]
);
  wire [1:0] z1_io_a; // @[multiplier.scala 64:23:@4541.4]
  wire [1:0] z1_io_b; // @[multiplier.scala 64:23:@4541.4]
  wire [3:0] z1_io_c; // @[multiplier.scala 64:23:@4541.4]
  wire [1:0] z2_io_a; // @[multiplier.scala 69:23:@4549.4]
  wire [1:0] z2_io_b; // @[multiplier.scala 69:23:@4549.4]
  wire [3:0] z2_io_c; // @[multiplier.scala 69:23:@4549.4]
  wire [1:0] z3_io_a; // @[multiplier.scala 73:23:@4557.4]
  wire [1:0] z3_io_b; // @[multiplier.scala 73:23:@4557.4]
  wire [3:0] z3_io_c; // @[multiplier.scala 73:23:@4557.4]
  wire [1:0] z4_io_a; // @[multiplier.scala 78:23:@4565.4]
  wire [1:0] z4_io_b; // @[multiplier.scala 78:23:@4565.4]
  wire [3:0] z4_io_c; // @[multiplier.scala 78:23:@4565.4]
  wire [3:0] q0; // @[multiplier.scala 49:21:@4530.4 multiplier.scala 67:15:@4548.4]
  wire [1:0] _T_31; // @[multiplier.scala 83:37:@4573.4]
  wire [3:0] temp1; // @[Cat.scala 30:58:@4574.4]
  wire [3:0] q1; // @[multiplier.scala 50:21:@4531.4 multiplier.scala 72:15:@4556.4]
  wire [4:0] _T_34; // @[multiplier.scala 84:26:@4577.4]
  wire [3:0] q4; // @[multiplier.scala 84:26:@4578.4]
  wire [3:0] q2; // @[multiplier.scala 51:21:@4532.4 multiplier.scala 76:15:@4564.4]
  wire [5:0] temp2; // @[Cat.scala 30:58:@4581.4]
  wire [3:0] q3; // @[multiplier.scala 52:21:@4533.4 multiplier.scala 81:15:@4572.4]
  wire [5:0] temp3; // @[Cat.scala 30:58:@4584.4]
  wire [6:0] _T_42; // @[multiplier.scala 87:24:@4586.4]
  wire [5:0] q5; // @[multiplier.scala 87:24:@4587.4]
  wire [5:0] temp4; // @[Cat.scala 30:58:@4590.4]
  wire [6:0] _T_47; // @[multiplier.scala 89:24:@4592.4]
  wire [5:0] q6; // @[multiplier.scala 89:24:@4593.4]
  wire [1:0] result1; // @[multiplier.scala 91:19:@4595.4]
  vedic_2x2 z1 ( // @[multiplier.scala 64:23:@4541.4]
    .io_a(z1_io_a),
    .io_b(z1_io_b),
    .io_c(z1_io_c)
  );
  vedic_2x2 z2 ( // @[multiplier.scala 69:23:@4549.4]
    .io_a(z2_io_a),
    .io_b(z2_io_b),
    .io_c(z2_io_c)
  );
  vedic_2x2 z3 ( // @[multiplier.scala 73:23:@4557.4]
    .io_a(z3_io_a),
    .io_b(z3_io_b),
    .io_c(z3_io_c)
  );
  vedic_2x2 z4 ( // @[multiplier.scala 78:23:@4565.4]
    .io_a(z4_io_a),
    .io_b(z4_io_b),
    .io_c(z4_io_c)
  );
  assign q0 = z1_io_c; // @[multiplier.scala 49:21:@4530.4 multiplier.scala 67:15:@4548.4]
  assign _T_31 = q0[3:2]; // @[multiplier.scala 83:37:@4573.4]
  assign temp1 = {2'h0,_T_31}; // @[Cat.scala 30:58:@4574.4]
  assign q1 = z2_io_c; // @[multiplier.scala 50:21:@4531.4 multiplier.scala 72:15:@4556.4]
  assign _T_34 = q1 + temp1; // @[multiplier.scala 84:26:@4577.4]
  assign q4 = q1 + temp1; // @[multiplier.scala 84:26:@4578.4]
  assign q2 = z3_io_c; // @[multiplier.scala 51:21:@4532.4 multiplier.scala 76:15:@4564.4]
  assign temp2 = {2'h0,q2}; // @[Cat.scala 30:58:@4581.4]
  assign q3 = z4_io_c; // @[multiplier.scala 52:21:@4533.4 multiplier.scala 81:15:@4572.4]
  assign temp3 = {q3,2'h0}; // @[Cat.scala 30:58:@4584.4]
  assign _T_42 = temp2 + temp3; // @[multiplier.scala 87:24:@4586.4]
  assign q5 = temp2 + temp3; // @[multiplier.scala 87:24:@4587.4]
  assign temp4 = {2'h0,q4}; // @[Cat.scala 30:58:@4590.4]
  assign _T_47 = temp4 + q5; // @[multiplier.scala 89:24:@4592.4]
  assign q6 = temp4 + q5; // @[multiplier.scala 89:24:@4593.4]
  assign result1 = q0[1:0]; // @[multiplier.scala 91:19:@4595.4]
  assign io_c = {q6,result1}; // @[multiplier.scala 94:15:@4598.4]
  assign z1_io_a = io_a[1:0]; // @[multiplier.scala 65:15:@4545.4]
  assign z1_io_b = io_b[1:0]; // @[multiplier.scala 66:15:@4547.4]
  assign z2_io_a = io_a[3:2]; // @[multiplier.scala 70:15:@4553.4]
  assign z2_io_b = io_b[1:0]; // @[multiplier.scala 71:15:@4555.4]
  assign z3_io_a = io_a[1:0]; // @[multiplier.scala 74:15:@4561.4]
  assign z3_io_b = io_b[3:2]; // @[multiplier.scala 75:15:@4563.4]
  assign z4_io_a = io_a[3:2]; // @[multiplier.scala 79:15:@4569.4]
  assign z4_io_b = io_b[3:2]; // @[multiplier.scala 80:15:@4571.4]
endmodule
module vedic_8x8( // @[:@5137.2]
  input  [7:0]  io_a, // @[:@5140.4]
  input  [7:0]  io_b, // @[:@5140.4]
  output [15:0] io_c // @[:@5140.4]
);
  wire [3:0] z1_io_a; // @[multiplier.scala 188:22:@5154.4]
  wire [3:0] z1_io_b; // @[multiplier.scala 188:22:@5154.4]
  wire [7:0] z1_io_c; // @[multiplier.scala 188:22:@5154.4]
  wire [3:0] z2_io_a; // @[multiplier.scala 193:22:@5162.4]
  wire [3:0] z2_io_b; // @[multiplier.scala 193:22:@5162.4]
  wire [7:0] z2_io_c; // @[multiplier.scala 193:22:@5162.4]
  wire [3:0] z3_io_a; // @[multiplier.scala 198:22:@5170.4]
  wire [3:0] z3_io_b; // @[multiplier.scala 198:22:@5170.4]
  wire [7:0] z3_io_c; // @[multiplier.scala 198:22:@5170.4]
  wire [3:0] z4_io_a; // @[multiplier.scala 203:22:@5178.4]
  wire [3:0] z4_io_b; // @[multiplier.scala 203:22:@5178.4]
  wire [7:0] z4_io_c; // @[multiplier.scala 203:22:@5178.4]
  wire [15:0] q0; // @[multiplier.scala 171:20:@5142.4 multiplier.scala 191:14:@5161.4]
  wire [3:0] _T_31; // @[multiplier.scala 210:36:@5186.4]
  wire [7:0] temp1; // @[Cat.scala 30:58:@5187.4]
  wire [15:0] q1; // @[multiplier.scala 172:20:@5143.4 multiplier.scala 196:14:@5169.4]
  wire [7:0] _T_33; // @[multiplier.scala 211:19:@5189.4]
  wire [8:0] _T_34; // @[multiplier.scala 211:25:@5190.4]
  wire [7:0] q4; // @[multiplier.scala 211:25:@5191.4]
  wire [15:0] q2; // @[multiplier.scala 173:20:@5144.4 multiplier.scala 201:14:@5177.4]
  wire [7:0] _T_37; // @[multiplier.scala 212:36:@5193.4]
  wire [11:0] temp2; // @[Cat.scala 30:58:@5194.4]
  wire [15:0] q3; // @[multiplier.scala 174:20:@5145.4 multiplier.scala 206:14:@5185.4]
  wire [7:0] _T_39; // @[multiplier.scala 213:23:@5196.4]
  wire [11:0] temp3; // @[Cat.scala 30:58:@5197.4]
  wire [12:0] _T_42; // @[multiplier.scala 214:23:@5199.4]
  wire [11:0] q5; // @[multiplier.scala 214:23:@5200.4]
  wire [11:0] temp4; // @[Cat.scala 30:58:@5203.4]
  wire [12:0] _T_47; // @[multiplier.scala 218:23:@5205.4]
  wire [11:0] q6; // @[multiplier.scala 218:23:@5206.4]
  wire [3:0] result1; // @[multiplier.scala 220:19:@5208.4]
  vedic_4x4 z1 ( // @[multiplier.scala 188:22:@5154.4]
    .io_a(z1_io_a),
    .io_b(z1_io_b),
    .io_c(z1_io_c)
  );
  vedic_4x4 z2 ( // @[multiplier.scala 193:22:@5162.4]
    .io_a(z2_io_a),
    .io_b(z2_io_b),
    .io_c(z2_io_c)
  );
  vedic_4x4 z3 ( // @[multiplier.scala 198:22:@5170.4]
    .io_a(z3_io_a),
    .io_b(z3_io_b),
    .io_c(z3_io_c)
  );
  vedic_4x4 z4 ( // @[multiplier.scala 203:22:@5178.4]
    .io_a(z4_io_a),
    .io_b(z4_io_b),
    .io_c(z4_io_c)
  );
  assign q0 = {{8'd0}, z1_io_c}; // @[multiplier.scala 171:20:@5142.4 multiplier.scala 191:14:@5161.4]
  assign _T_31 = q0[7:4]; // @[multiplier.scala 210:36:@5186.4]
  assign temp1 = {4'h0,_T_31}; // @[Cat.scala 30:58:@5187.4]
  assign q1 = {{8'd0}, z2_io_c}; // @[multiplier.scala 172:20:@5143.4 multiplier.scala 196:14:@5169.4]
  assign _T_33 = q1[7:0]; // @[multiplier.scala 211:19:@5189.4]
  assign _T_34 = _T_33 + temp1; // @[multiplier.scala 211:25:@5190.4]
  assign q4 = _T_33 + temp1; // @[multiplier.scala 211:25:@5191.4]
  assign q2 = {{8'd0}, z3_io_c}; // @[multiplier.scala 173:20:@5144.4 multiplier.scala 201:14:@5177.4]
  assign _T_37 = q2[7:0]; // @[multiplier.scala 212:36:@5193.4]
  assign temp2 = {4'h0,_T_37}; // @[Cat.scala 30:58:@5194.4]
  assign q3 = {{8'd0}, z4_io_c}; // @[multiplier.scala 174:20:@5145.4 multiplier.scala 206:14:@5185.4]
  assign _T_39 = q3[7:0]; // @[multiplier.scala 213:23:@5196.4]
  assign temp3 = {_T_39,4'h0}; // @[Cat.scala 30:58:@5197.4]
  assign _T_42 = temp2 + temp3; // @[multiplier.scala 214:23:@5199.4]
  assign q5 = temp2 + temp3; // @[multiplier.scala 214:23:@5200.4]
  assign temp4 = {4'h0,q4}; // @[Cat.scala 30:58:@5203.4]
  assign _T_47 = temp4 + q5; // @[multiplier.scala 218:23:@5205.4]
  assign q6 = temp4 + q5; // @[multiplier.scala 218:23:@5206.4]
  assign result1 = q0[3:0]; // @[multiplier.scala 220:19:@5208.4]
  assign io_c = {q6,result1}; // @[multiplier.scala 224:15:@5211.4]
  assign z1_io_a = io_a[3:0]; // @[multiplier.scala 189:14:@5158.4]
  assign z1_io_b = io_b[3:0]; // @[multiplier.scala 190:14:@5160.4]
  assign z2_io_a = io_a[7:4]; // @[multiplier.scala 194:14:@5166.4]
  assign z2_io_b = io_b[3:0]; // @[multiplier.scala 195:14:@5168.4]
  assign z3_io_a = io_a[3:0]; // @[multiplier.scala 199:14:@5174.4]
  assign z3_io_b = io_b[7:4]; // @[multiplier.scala 200:14:@5176.4]
  assign z4_io_a = io_a[7:4]; // @[multiplier.scala 204:14:@5182.4]
  assign z4_io_b = io_b[7:4]; // @[multiplier.scala 205:14:@5184.4]
endmodule
module vedic_16x16( // @[:@6976.2]
  input  [15:0] io_a, // @[:@6979.4]
  input  [15:0] io_b, // @[:@6979.4]
  output [31:0] io_c // @[:@6979.4]
);
  wire [7:0] z1_io_a; // @[multiplier.scala 254:30:@7001.4]
  wire [7:0] z1_io_b; // @[multiplier.scala 254:30:@7001.4]
  wire [15:0] z1_io_c; // @[multiplier.scala 254:30:@7001.4]
  wire [7:0] z2_io_a; // @[multiplier.scala 259:30:@7009.4]
  wire [7:0] z2_io_b; // @[multiplier.scala 259:30:@7009.4]
  wire [15:0] z2_io_c; // @[multiplier.scala 259:30:@7009.4]
  wire [7:0] z3_io_a; // @[multiplier.scala 264:30:@7017.4]
  wire [7:0] z3_io_b; // @[multiplier.scala 264:30:@7017.4]
  wire [15:0] z3_io_c; // @[multiplier.scala 264:30:@7017.4]
  wire [3:0] z4_io_a; // @[multiplier.scala 269:30:@7025.4]
  wire [3:0] z4_io_b; // @[multiplier.scala 269:30:@7025.4]
  wire [7:0] z4_io_c; // @[multiplier.scala 269:30:@7025.4]
  wire [15:0] _T_22; // @[multiplier.scala 250:25:@6992.4]
  wire [15:0] _T_23; // @[multiplier.scala 250:25:@6993.4]
  wire [15:0] _T_24; // @[multiplier.scala 250:38:@6994.4]
  wire [16:0] _T_26; // @[multiplier.scala 250:41:@6995.4]
  wire [15:0] in1_complement; // @[multiplier.scala 250:41:@6996.4]
  wire  _T_27; // @[multiplier.scala 251:32:@6997.4]
  wire [15:0] _T_29; // @[multiplier.scala 251:64:@6999.4]
  wire [15:0] input1; // @[multiplier.scala 251:27:@7000.4]
  wire [7:0] _T_32; // @[multiplier.scala 260:31:@7012.4]
  wire [7:0] _T_35; // @[multiplier.scala 266:29:@7022.4]
  wire [15:0] q0; // @[multiplier.scala 236:28:@6981.4 multiplier.scala 257:22:@7008.4]
  wire [7:0] _T_39; // @[multiplier.scala 275:44:@7033.4]
  wire [15:0] _T_40; // @[Cat.scala 30:58:@7034.4]
  wire [15:0] q1; // @[multiplier.scala 237:28:@6982.4 multiplier.scala 262:22:@7016.4]
  wire [17:0] temp1; // @[multiplier.scala 241:28:@6985.4 multiplier.scala 275:22:@7035.4]
  wire [17:0] _GEN_0; // @[multiplier.scala 276:34:@7037.4]
  wire [18:0] _T_42; // @[multiplier.scala 276:34:@7037.4]
  wire [17:0] _T_43; // @[multiplier.scala 276:34:@7038.4]
  wire [15:0] q2; // @[multiplier.scala 238:28:@6983.4 multiplier.scala 267:22:@7024.4]
  wire [23:0] temp2; // @[Cat.scala 30:58:@7041.4]
  wire [15:0] q3; // @[multiplier.scala 239:28:@6984.4 multiplier.scala 272:22:@7032.4]
  wire [23:0] temp3; // @[Cat.scala 30:58:@7044.4]
  wire [24:0] _T_50; // @[multiplier.scala 279:31:@7046.4]
  wire [23:0] q5; // @[multiplier.scala 279:31:@7047.4]
  wire [15:0] q4; // @[multiplier.scala 246:28:@6989.4 multiplier.scala 276:22:@7039.4]
  wire [23:0] temp4; // @[Cat.scala 30:58:@7050.4]
  wire [24:0] _T_55; // @[multiplier.scala 281:31:@7052.4]
  wire [23:0] q6; // @[multiplier.scala 281:31:@7053.4]
  wire [7:0] result1; // @[multiplier.scala 283:26:@7055.4]
  wire [31:0] result; // @[Cat.scala 30:58:@7057.4]
  wire [31:0] _T_57; // @[multiplier.scala 286:28:@7058.4]
  wire [31:0] _T_58; // @[multiplier.scala 286:43:@7059.4]
  wire [32:0] _T_60; // @[multiplier.scala 286:46:@7060.4]
  wire [31:0] _T_61; // @[multiplier.scala 286:46:@7061.4]
  wire [31:0] result_complement; // @[multiplier.scala 286:46:@7062.4]
  wire [31:0] _T_63; // @[multiplier.scala 288:70:@7064.4]
  vedic_8x8 z1 ( // @[multiplier.scala 254:30:@7001.4]
    .io_a(z1_io_a),
    .io_b(z1_io_b),
    .io_c(z1_io_c)
  );
  vedic_8x8 z2 ( // @[multiplier.scala 259:30:@7009.4]
    .io_a(z2_io_a),
    .io_b(z2_io_b),
    .io_c(z2_io_c)
  );
  vedic_8x8 z3 ( // @[multiplier.scala 264:30:@7017.4]
    .io_a(z3_io_a),
    .io_b(z3_io_b),
    .io_c(z3_io_c)
  );
  vedic_4x4 z4 ( // @[multiplier.scala 269:30:@7025.4]
    .io_a(z4_io_a),
    .io_b(z4_io_b),
    .io_c(z4_io_c)
  );
  assign _T_22 = ~ io_a; // @[multiplier.scala 250:25:@6992.4]
  assign _T_23 = $signed(_T_22); // @[multiplier.scala 250:25:@6993.4]
  assign _T_24 = $unsigned(_T_23); // @[multiplier.scala 250:38:@6994.4]
  assign _T_26 = _T_24 + 16'h1; // @[multiplier.scala 250:41:@6995.4]
  assign in1_complement = _T_24 + 16'h1; // @[multiplier.scala 250:41:@6996.4]
  assign _T_27 = io_a[15]; // @[multiplier.scala 251:32:@6997.4]
  assign _T_29 = $unsigned(io_a); // @[multiplier.scala 251:64:@6999.4]
  assign input1 = _T_27 ? in1_complement : _T_29; // @[multiplier.scala 251:27:@7000.4]
  assign _T_32 = input1[15:8]; // @[multiplier.scala 260:31:@7012.4]
  assign _T_35 = io_b[15:8]; // @[multiplier.scala 266:29:@7022.4]
  assign q0 = z1_io_c; // @[multiplier.scala 236:28:@6981.4 multiplier.scala 257:22:@7008.4]
  assign _T_39 = q0[15:8]; // @[multiplier.scala 275:44:@7033.4]
  assign _T_40 = {8'h0,_T_39}; // @[Cat.scala 30:58:@7034.4]
  assign q1 = z2_io_c; // @[multiplier.scala 237:28:@6982.4 multiplier.scala 262:22:@7016.4]
  assign temp1 = {{2'd0}, _T_40}; // @[multiplier.scala 241:28:@6985.4 multiplier.scala 275:22:@7035.4]
  assign _GEN_0 = {{2'd0}, q1}; // @[multiplier.scala 276:34:@7037.4]
  assign _T_42 = _GEN_0 + temp1; // @[multiplier.scala 276:34:@7037.4]
  assign _T_43 = _GEN_0 + temp1; // @[multiplier.scala 276:34:@7038.4]
  assign q2 = z3_io_c; // @[multiplier.scala 238:28:@6983.4 multiplier.scala 267:22:@7024.4]
  assign temp2 = {8'h0,q2}; // @[Cat.scala 30:58:@7041.4]
  assign q3 = {{8'd0}, z4_io_c}; // @[multiplier.scala 239:28:@6984.4 multiplier.scala 272:22:@7032.4]
  assign temp3 = {q3,8'h0}; // @[Cat.scala 30:58:@7044.4]
  assign _T_50 = temp2 + temp3; // @[multiplier.scala 279:31:@7046.4]
  assign q5 = temp2 + temp3; // @[multiplier.scala 279:31:@7047.4]
  assign q4 = _T_43[15:0]; // @[multiplier.scala 246:28:@6989.4 multiplier.scala 276:22:@7039.4]
  assign temp4 = {8'h0,q4}; // @[Cat.scala 30:58:@7050.4]
  assign _T_55 = temp4 + q5; // @[multiplier.scala 281:31:@7052.4]
  assign q6 = temp4 + q5; // @[multiplier.scala 281:31:@7053.4]
  assign result1 = q0[7:0]; // @[multiplier.scala 283:26:@7055.4]
  assign result = {q6,result1}; // @[Cat.scala 30:58:@7057.4]
  assign _T_57 = ~ result; // @[multiplier.scala 286:28:@7058.4]
  assign _T_58 = $signed(_T_57); // @[multiplier.scala 286:43:@7059.4]
  assign _T_60 = $signed(_T_58) + $signed(32'sh1); // @[multiplier.scala 286:46:@7060.4]
  assign _T_61 = $signed(_T_58) + $signed(32'sh1); // @[multiplier.scala 286:46:@7061.4]
  assign result_complement = $signed(_T_61); // @[multiplier.scala 286:46:@7062.4]
  assign _T_63 = $signed(result); // @[multiplier.scala 288:70:@7064.4]
  assign io_c = _T_27 ? $signed(result_complement) : $signed(_T_63); // @[multiplier.scala 289:22:@7066.4]
  assign z1_io_a = input1[7:0]; // @[multiplier.scala 255:22:@7005.4]
  assign z1_io_b = io_b[7:0]; // @[multiplier.scala 256:22:@7007.4]
  assign z2_io_a = input1[15:8]; // @[multiplier.scala 260:22:@7013.4]
  assign z2_io_b = io_b[7:0]; // @[multiplier.scala 261:22:@7015.4]
  assign z3_io_a = input1[7:0]; // @[multiplier.scala 265:22:@7021.4]
  assign z3_io_b = io_b[15:8]; // @[multiplier.scala 266:22:@7023.4]
  assign z4_io_a = _T_32[3:0]; // @[multiplier.scala 270:22:@7029.4]
  assign z4_io_b = _T_35[3:0]; // @[multiplier.scala 271:22:@7031.4]
endmodule
module PID_Controller( // @[:@12362.2]
  input         clock, // @[:@12363.4]
  input         reset, // @[:@12364.4]
  input         io_fb_period, // @[:@12365.4]
  input         io_raw_irq, // @[:@12365.4]
  input         io_reg_kp_we, // @[:@12365.4]
  input  [15:0] io_reg_kp_di, // @[:@12365.4]
  output [15:0] io_reg_kp_do, // @[:@12365.4]
  input         io_reg_ki_we, // @[:@12365.4]
  input  [15:0] io_reg_ki_di, // @[:@12365.4]
  output [15:0] io_reg_ki_do, // @[:@12365.4]
  input         io_reg_kd_we, // @[:@12365.4]
  input  [15:0] io_reg_kd_di, // @[:@12365.4]
  output [15:0] io_reg_kd_do, // @[:@12365.4]
  input         io_reg_ref_we, // @[:@12365.4]
  input  [15:0] io_reg_ref_di, // @[:@12365.4]
  output [15:0] io_reg_ref_do, // @[:@12365.4]
  input         io_reg_fb_we, // @[:@12365.4]
  input  [15:0] io_reg_fb_di, // @[:@12365.4]
  output [15:0] io_reg_fb_do, // @[:@12365.4]
  input         io_reg_cfg_we, // @[:@12365.4]
  input  [15:0] io_reg_cfg_di, // @[:@12365.4]
  output [15:0] io_reg_cfg_do, // @[:@12365.4]
  input  [15:0] io_speed_fb_in, // @[:@12365.4]
  output [15:0] io_pid_out // @[:@12365.4]
);
  wire [15:0] mul_kp_io_a; // @[pid.scala 110:25:@12415.4]
  wire [15:0] mul_kp_io_b; // @[pid.scala 110:25:@12415.4]
  wire [31:0] mul_kp_io_c; // @[pid.scala 110:25:@12415.4]
  wire [15:0] mul_ki_io_a; // @[pid.scala 116:25:@12423.4]
  wire [15:0] mul_ki_io_b; // @[pid.scala 116:25:@12423.4]
  wire [31:0] mul_ki_io_c; // @[pid.scala 116:25:@12423.4]
  wire [15:0] mul_kd_io_a; // @[pid.scala 122:25:@12431.4]
  wire [15:0] mul_kd_io_b; // @[pid.scala 122:25:@12431.4]
  wire [31:0] mul_kd_io_c; // @[pid.scala 122:25:@12431.4]
  reg [15:0] kp; // @[pid.scala 56:26:@12367.4]
  reg [31:0] _RAND_0;
  reg [15:0] ki; // @[pid.scala 57:26:@12368.4]
  reg [31:0] _RAND_1;
  reg [15:0] kd; // @[pid.scala 58:26:@12369.4]
  reg [31:0] _RAND_2;
  reg [15:0] ref$; // @[pid.scala 59:26:@12370.4]
  reg [31:0] _RAND_3;
  reg [15:0] feedback; // @[pid.scala 60:26:@12371.4]
  reg [31:0] _RAND_4;
  reg [15:0] sigma_old; // @[pid.scala 61:26:@12372.4]
  reg [31:0] _RAND_5;
  reg  fb_sel; // @[pid.scala 62:26:@12373.4]
  reg [31:0] _RAND_6;
  reg [15:0] e_prev1; // @[pid.scala 64:26:@12374.4]
  reg [31:0] _RAND_7;
  reg [15:0] e_prev2; // @[pid.scala 65:26:@12375.4]
  reg [31:0] _RAND_8;
  reg [15:0] reg_pid_out; // @[pid.scala 66:28:@12376.4]
  reg [31:0] _RAND_9;
  wire [15:0] _GEN_0; // @[pid.scala 70:22:@12378.4]
  wire [15:0] _GEN_1; // @[pid.scala 75:22:@12382.4]
  wire [15:0] _GEN_2; // @[pid.scala 80:22:@12386.4]
  wire [15:0] _GEN_3; // @[pid.scala 86:23:@12390.4]
  wire [15:0] _GEN_4; // @[pid.scala 93:24:@12395.6]
  wire [15:0] _GEN_5; // @[pid.scala 92:16:@12394.4]
  wire [31:0] _T_70; // @[Cat.scala 30:58:@12402.4]
  wire [31:0] _T_71; // @[pid.scala 100:49:@12403.4]
  wire  _T_72; // @[pid.scala 102:28:@12406.6]
  wire  _GEN_6; // @[pid.scala 101:23:@12405.4]
  wire [16:0] _T_73; // @[pid.scala 106:27:@12409.4]
  wire [15:0] _T_74; // @[pid.scala 106:27:@12410.4]
  wire [16:0] _T_75; // @[pid.scala 107:27:@12412.4]
  wire [15:0] _T_76; // @[pid.scala 107:27:@12413.4]
  wire [15:0] sigma_new; // @[pid.scala 107:27:@12414.4]
  wire [15:0] _T_78; // @[pid.scala 113:30:@12421.4]
  wire [15:0] prop_out; // @[pid.scala 113:43:@12422.4]
  wire [15:0] _T_80; // @[pid.scala 119:33:@12429.4]
  wire [15:0] integral_out; // @[pid.scala 119:46:@12430.4]
  wire [15:0] _T_82; // @[pid.scala 125:35:@12437.4]
  wire [15:0] derivative_out; // @[pid.scala 125:48:@12438.4]
  wire [16:0] _T_83; // @[pid.scala 128:28:@12439.4]
  wire [15:0] _T_84; // @[pid.scala 128:28:@12440.4]
  wire [15:0] pi_sum; // @[pid.scala 128:28:@12441.4]
  wire  _T_85; // @[pid.scala 129:34:@12442.4]
  wire  _T_86; // @[pid.scala 129:54:@12443.4]
  wire  _T_87; // @[pid.scala 129:39:@12444.4]
  wire  _T_88; // @[pid.scala 129:69:@12445.4]
  wire  _T_90; // @[pid.scala 129:62:@12446.4]
  wire  _T_91; // @[pid.scala 129:59:@12447.4]
  wire  _T_94; // @[pid.scala 130:26:@12449.4]
  wire  _T_97; // @[pid.scala 130:43:@12451.4]
  wire  _T_98; // @[pid.scala 130:40:@12452.4]
  wire  _T_100; // @[pid.scala 130:61:@12454.4]
  wire  pi_sum_overflow; // @[pid.scala 129:75:@12455.4]
  wire [16:0] _T_101; // @[pid.scala 135:29:@12458.8]
  wire [15:0] _T_102; // @[pid.scala 135:29:@12459.8]
  wire [15:0] _T_103; // @[pid.scala 135:29:@12460.8]
  wire [16:0] _T_104; // @[pid.scala 137:24:@12464.8]
  wire [15:0] _T_105; // @[pid.scala 137:24:@12465.8]
  wire [15:0] _T_106; // @[pid.scala 137:24:@12466.8]
  wire [15:0] _GEN_7; // @[pid.scala 134:23:@12457.6]
  wire [16:0] _T_107; // @[pid.scala 141:27:@12471.6]
  wire [15:0] _T_108; // @[pid.scala 141:27:@12472.6]
  wire [15:0] _T_109; // @[pid.scala 141:27:@12473.6]
  wire [15:0] _GEN_8; // @[pid.scala 132:20:@12456.4]
  wire [15:0] _GEN_9; // @[pid.scala 132:20:@12456.4]
  wire [15:0] _GEN_10; // @[pid.scala 132:20:@12456.4]
  wire [15:0] _GEN_11; // @[pid.scala 132:20:@12456.4]
  wire  _T_110; // @[pid.scala 144:54:@12476.4]
  wire  _T_111; // @[pid.scala 144:40:@12477.4]
  wire [15:0] _GEN_12; // @[pid.scala 100:17:@12404.4]
  vedic_16x16 mul_kp ( // @[pid.scala 110:25:@12415.4]
    .io_a(mul_kp_io_a),
    .io_b(mul_kp_io_b),
    .io_c(mul_kp_io_c)
  );
  vedic_16x16 mul_ki ( // @[pid.scala 116:25:@12423.4]
    .io_a(mul_ki_io_a),
    .io_b(mul_ki_io_b),
    .io_c(mul_ki_io_c)
  );
  vedic_16x16 mul_kd ( // @[pid.scala 122:25:@12431.4]
    .io_a(mul_kd_io_a),
    .io_b(mul_kd_io_b),
    .io_c(mul_kd_io_c)
  );
  assign _GEN_0 = io_reg_kp_we ? $signed(io_reg_kp_di) : $signed(kp); // @[pid.scala 70:22:@12378.4]
  assign _GEN_1 = io_reg_ki_we ? $signed(io_reg_ki_di) : $signed(ki); // @[pid.scala 75:22:@12382.4]
  assign _GEN_2 = io_reg_kd_we ? $signed(io_reg_kd_di) : $signed(kd); // @[pid.scala 80:22:@12386.4]
  assign _GEN_3 = io_reg_ref_we ? $signed(io_reg_ref_di) : $signed(ref$); // @[pid.scala 86:23:@12390.4]
  assign _GEN_4 = io_reg_fb_we ? $signed(io_reg_fb_di) : $signed(feedback); // @[pid.scala 93:24:@12395.6]
  assign _GEN_5 = fb_sel ? $signed(_GEN_4) : $signed(io_speed_fb_in); // @[pid.scala 92:16:@12394.4]
  assign _T_70 = {31'h0,fb_sel}; // @[Cat.scala 30:58:@12402.4]
  assign _T_71 = $signed(_T_70); // @[pid.scala 100:49:@12403.4]
  assign _T_72 = io_reg_cfg_di[0]; // @[pid.scala 102:28:@12406.6]
  assign _GEN_6 = io_reg_cfg_we ? _T_72 : fb_sel; // @[pid.scala 101:23:@12405.4]
  assign _T_73 = $signed(e_prev1) - $signed(e_prev2); // @[pid.scala 106:27:@12409.4]
  assign _T_74 = $signed(e_prev1) - $signed(e_prev2); // @[pid.scala 106:27:@12410.4]
  assign _T_75 = $signed(e_prev1) + $signed(sigma_old); // @[pid.scala 107:27:@12412.4]
  assign _T_76 = $signed(e_prev1) + $signed(sigma_old); // @[pid.scala 107:27:@12413.4]
  assign sigma_new = $signed(_T_76); // @[pid.scala 107:27:@12414.4]
  assign _T_78 = mul_kp_io_c[15:0]; // @[pid.scala 113:30:@12421.4]
  assign prop_out = $signed(_T_78); // @[pid.scala 113:43:@12422.4]
  assign _T_80 = mul_ki_io_c[15:0]; // @[pid.scala 119:33:@12429.4]
  assign integral_out = $signed(_T_80); // @[pid.scala 119:46:@12430.4]
  assign _T_82 = mul_kd_io_c[15:0]; // @[pid.scala 125:35:@12437.4]
  assign derivative_out = $signed(_T_82); // @[pid.scala 125:48:@12438.4]
  assign _T_83 = $signed(prop_out) + $signed(integral_out); // @[pid.scala 128:28:@12439.4]
  assign _T_84 = $signed(prop_out) + $signed(integral_out); // @[pid.scala 128:28:@12440.4]
  assign pi_sum = $signed(_T_84); // @[pid.scala 128:28:@12441.4]
  assign _T_85 = prop_out[15]; // @[pid.scala 129:34:@12442.4]
  assign _T_86 = integral_out[15]; // @[pid.scala 129:54:@12443.4]
  assign _T_87 = _T_85 & _T_86; // @[pid.scala 129:39:@12444.4]
  assign _T_88 = pi_sum[15]; // @[pid.scala 129:69:@12445.4]
  assign _T_90 = _T_88 == 1'h0; // @[pid.scala 129:62:@12446.4]
  assign _T_91 = _T_87 & _T_90; // @[pid.scala 129:59:@12447.4]
  assign _T_94 = _T_85 == 1'h0; // @[pid.scala 130:26:@12449.4]
  assign _T_97 = _T_86 == 1'h0; // @[pid.scala 130:43:@12451.4]
  assign _T_98 = _T_94 & _T_97; // @[pid.scala 130:40:@12452.4]
  assign _T_100 = _T_98 & _T_88; // @[pid.scala 130:61:@12454.4]
  assign pi_sum_overflow = _T_91 | _T_100; // @[pid.scala 129:75:@12455.4]
  assign _T_101 = $signed(feedback) - $signed(ref$); // @[pid.scala 135:29:@12458.8]
  assign _T_102 = $signed(feedback) - $signed(ref$); // @[pid.scala 135:29:@12459.8]
  assign _T_103 = $signed(_T_102); // @[pid.scala 135:29:@12460.8]
  assign _T_104 = $signed(ref$) - $signed(feedback); // @[pid.scala 137:24:@12464.8]
  assign _T_105 = $signed(ref$) - $signed(feedback); // @[pid.scala 137:24:@12465.8]
  assign _T_106 = $signed(_T_105); // @[pid.scala 137:24:@12466.8]
  assign _GEN_7 = io_fb_period ? $signed(_T_103) : $signed(_T_106); // @[pid.scala 134:23:@12457.6]
  assign _T_107 = $signed(pi_sum) + $signed(derivative_out); // @[pid.scala 141:27:@12471.6]
  assign _T_108 = $signed(pi_sum) + $signed(derivative_out); // @[pid.scala 141:27:@12472.6]
  assign _T_109 = $signed(_T_108); // @[pid.scala 141:27:@12473.6]
  assign _GEN_8 = io_raw_irq ? $signed(_GEN_7) : $signed(e_prev1); // @[pid.scala 132:20:@12456.4]
  assign _GEN_9 = io_raw_irq ? $signed(e_prev1) : $signed(e_prev2); // @[pid.scala 132:20:@12456.4]
  assign _GEN_10 = io_raw_irq ? $signed(sigma_new) : $signed(sigma_old); // @[pid.scala 132:20:@12456.4]
  assign _GEN_11 = io_raw_irq ? $signed(_T_109) : $signed(reg_pid_out); // @[pid.scala 132:20:@12456.4]
  assign _T_110 = reg_pid_out[15]; // @[pid.scala 144:54:@12476.4]
  assign _T_111 = pi_sum_overflow | _T_110; // @[pid.scala 144:40:@12477.4]
  assign io_reg_kp_do = kp; // @[pid.scala 69:17:@12377.4]
  assign io_reg_ki_do = ki; // @[pid.scala 74:17:@12381.4]
  assign io_reg_kd_do = kd; // @[pid.scala 79:17:@12385.4]
  assign io_reg_ref_do = ref$; // @[pid.scala 85:17:@12389.4]
  assign io_reg_fb_do = feedback; // @[pid.scala 90:17:@12393.4]
  assign _GEN_12 = _T_71[15:0]; // @[pid.scala 100:17:@12404.4]
  assign io_reg_cfg_do = $signed(_GEN_12); // @[pid.scala 100:17:@12404.4]
  assign io_pid_out = _T_111 ? $signed(16'sh0) : $signed(reg_pid_out); // @[pid.scala 144:17:@12479.4]
  assign mul_kp_io_a = e_prev1; // @[pid.scala 111:17:@12418.4]
  assign mul_kp_io_b = $unsigned(kp); // @[pid.scala 112:17:@12420.4]
  assign mul_ki_io_a = $signed(_T_76); // @[pid.scala 117:17:@12426.4]
  assign mul_ki_io_b = $unsigned(ki); // @[pid.scala 118:17:@12428.4]
  assign mul_kd_io_a = $signed(_T_74); // @[pid.scala 123:17:@12434.4]
  assign mul_kd_io_b = $unsigned(kd); // @[pid.scala 124:17:@12436.4]
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
  kp = _RAND_0[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  ki = _RAND_1[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  kd = _RAND_2[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  ref$ = _RAND_3[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  feedback = _RAND_4[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  sigma_old = _RAND_5[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  fb_sel = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  e_prev1 = _RAND_7[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  e_prev2 = _RAND_8[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  reg_pid_out = _RAND_9[15:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      kp <= 16'sh1;
    end else begin
      if (io_reg_kp_we) begin
        kp <= io_reg_kp_di;
      end
    end
    if (reset) begin
      ki <= 16'sh0;
    end else begin
      if (io_reg_ki_we) begin
        ki <= io_reg_ki_di;
      end
    end
    if (reset) begin
      kd <= 16'sh0;
    end else begin
      if (io_reg_kd_we) begin
        kd <= io_reg_kd_di;
      end
    end
    if (reset) begin
      ref$ <= 16'sh14;
    end else begin
      if (io_reg_ref_we) begin
        ref$ <= io_reg_ref_di;
      end
    end
    if (reset) begin
      feedback <= 16'sh0;
    end else begin
      if (fb_sel) begin
        if (io_reg_fb_we) begin
          feedback <= io_reg_fb_di;
        end
      end else begin
        feedback <= io_speed_fb_in;
      end
    end
    if (reset) begin
      sigma_old <= 16'sh0;
    end else begin
      if (io_raw_irq) begin
        sigma_old <= sigma_new;
      end
    end
    if (reset) begin
      fb_sel <= 1'h0;
    end else begin
      if (io_reg_cfg_we) begin
        fb_sel <= _T_72;
      end
    end
    if (reset) begin
      e_prev1 <= 16'sh0;
    end else begin
      if (io_raw_irq) begin
        if (io_fb_period) begin
          e_prev1 <= _T_103;
        end else begin
          e_prev1 <= _T_106;
        end
      end
    end
    if (reset) begin
      e_prev2 <= 16'sh0;
    end else begin
      if (io_raw_irq) begin
        e_prev2 <= e_prev1;
      end
    end
    if (reset) begin
      reg_pid_out <= 16'sh0;
    end else begin
      if (io_raw_irq) begin
        reg_pid_out <= _T_109;
      end
    end
  end
endmodule
module Motor_Top( // @[:@12481.2]
  input         clock, // @[:@12482.4]
  input         reset, // @[:@12483.4]
  input  [15:0] io_wbs_m2s_addr, // @[:@12484.4]
  input  [31:0] io_wbs_m2s_data, // @[:@12484.4]
  input         io_wbs_m2s_we, // @[:@12484.4]
  input  [3:0]  io_wbs_m2s_sel, // @[:@12484.4]
  input         io_wbs_m2s_stb, // @[:@12484.4]
  output        io_wbs_ack_o, // @[:@12484.4]
  output [31:0] io_wbs_data_o, // @[:@12484.4]
  input         io_ba_match, // @[:@12484.4]
  output        io_motor_irq, // @[:@12484.4]
  input         io_qei_ch_a, // @[:@12484.4]
  input         io_qei_ch_b, // @[:@12484.4]
  output        io_pwm_high, // @[:@12484.4]
  output        io_pwm_low // @[:@12484.4]
);
  wire  interlink_clock; // @[motor_top.scala 37:26:@12486.4]
  wire  interlink_reset; // @[motor_top.scala 37:26:@12486.4]
  wire [31:0] interlink_io_bus_adr_i; // @[motor_top.scala 37:26:@12486.4]
  wire [3:0] interlink_io_bus_sel_i; // @[motor_top.scala 37:26:@12486.4]
  wire  interlink_io_bus_we_i; // @[motor_top.scala 37:26:@12486.4]
  wire  interlink_io_bus_stb_i; // @[motor_top.scala 37:26:@12486.4]
  wire  interlink_io_bus_ack_o; // @[motor_top.scala 37:26:@12486.4]
  wire [31:0] interlink_io_bus_dat_o; // @[motor_top.scala 37:26:@12486.4]
  wire  interlink_io_tmr_val_we; // @[motor_top.scala 37:26:@12486.4]
  wire [31:0] interlink_io_tmr_val_do; // @[motor_top.scala 37:26:@12486.4]
  wire  interlink_io_tmr_dat_we; // @[motor_top.scala 37:26:@12486.4]
  wire [31:0] interlink_io_tmr_dat_do; // @[motor_top.scala 37:26:@12486.4]
  wire  interlink_io_tmr_duty_we; // @[motor_top.scala 37:26:@12486.4]
  wire [31:0] interlink_io_tmr_duty_do; // @[motor_top.scala 37:26:@12486.4]
  wire  interlink_io_tmr_cfg_we; // @[motor_top.scala 37:26:@12486.4]
  wire [31:0] interlink_io_tmr_cfg_do; // @[motor_top.scala 37:26:@12486.4]
  wire  interlink_io_qei_count_we; // @[motor_top.scala 37:26:@12486.4]
  wire [31:0] interlink_io_qei_count_do; // @[motor_top.scala 37:26:@12486.4]
  wire  interlink_io_qei_cfg_we; // @[motor_top.scala 37:26:@12486.4]
  wire [31:0] interlink_io_qei_cfg_do; // @[motor_top.scala 37:26:@12486.4]
  wire [15:0] interlink_io_qei_speed_do; // @[motor_top.scala 37:26:@12486.4]
  wire  interlink_io_pid_kp_we; // @[motor_top.scala 37:26:@12486.4]
  wire [15:0] interlink_io_pid_kp_do; // @[motor_top.scala 37:26:@12486.4]
  wire  interlink_io_pid_ki_we; // @[motor_top.scala 37:26:@12486.4]
  wire [15:0] interlink_io_pid_ki_do; // @[motor_top.scala 37:26:@12486.4]
  wire  interlink_io_pid_kd_we; // @[motor_top.scala 37:26:@12486.4]
  wire [15:0] interlink_io_pid_kd_do; // @[motor_top.scala 37:26:@12486.4]
  wire  interlink_io_pid_ref_we; // @[motor_top.scala 37:26:@12486.4]
  wire [15:0] interlink_io_pid_ref_do; // @[motor_top.scala 37:26:@12486.4]
  wire  interlink_io_pid_fb_we; // @[motor_top.scala 37:26:@12486.4]
  wire [15:0] interlink_io_pid_fb_do; // @[motor_top.scala 37:26:@12486.4]
  wire  interlink_io_pid_cfg_we; // @[motor_top.scala 37:26:@12486.4]
  wire [15:0] interlink_io_pid_cfg_do; // @[motor_top.scala 37:26:@12486.4]
  wire  interlink_io_ba_match; // @[motor_top.scala 37:26:@12486.4]
  wire  pwm_clock; // @[motor_top.scala 53:37:@12497.4]
  wire  pwm_reset; // @[motor_top.scala 53:37:@12497.4]
  wire  pwm_io_reg_val_we; // @[motor_top.scala 53:37:@12497.4]
  wire [31:0] pwm_io_reg_val_di; // @[motor_top.scala 53:37:@12497.4]
  wire [31:0] pwm_io_reg_val_do; // @[motor_top.scala 53:37:@12497.4]
  wire  pwm_io_reg_cfg_we; // @[motor_top.scala 53:37:@12497.4]
  wire [31:0] pwm_io_reg_cfg_di; // @[motor_top.scala 53:37:@12497.4]
  wire [31:0] pwm_io_reg_cfg_do; // @[motor_top.scala 53:37:@12497.4]
  wire  pwm_io_reg_dat_we; // @[motor_top.scala 53:37:@12497.4]
  wire [31:0] pwm_io_reg_dat_di; // @[motor_top.scala 53:37:@12497.4]
  wire [31:0] pwm_io_reg_dat_do; // @[motor_top.scala 53:37:@12497.4]
  wire  pwm_io_reg_duty_we; // @[motor_top.scala 53:37:@12497.4]
  wire [31:0] pwm_io_reg_duty_di; // @[motor_top.scala 53:37:@12497.4]
  wire [31:0] pwm_io_reg_duty_do; // @[motor_top.scala 53:37:@12497.4]
  wire [15:0] pwm_io_reg_pid_out; // @[motor_top.scala 53:37:@12497.4]
  wire  pwm_io_pwm_h; // @[motor_top.scala 53:37:@12497.4]
  wire  pwm_io_pwm_l; // @[motor_top.scala 53:37:@12497.4]
  wire  pwm_io_irq_out; // @[motor_top.scala 53:37:@12497.4]
  wire  pwm_io_rawirq_out; // @[motor_top.scala 53:37:@12497.4]
  wire  qei_clock; // @[motor_top.scala 82:37:@12517.4]
  wire  qei_reset; // @[motor_top.scala 82:37:@12517.4]
  wire  qei_io_quad_a; // @[motor_top.scala 82:37:@12517.4]
  wire  qei_io_quad_b; // @[motor_top.scala 82:37:@12517.4]
  wire  qei_io_raw_irq; // @[motor_top.scala 82:37:@12517.4]
  wire  qei_io_reg_count_we; // @[motor_top.scala 82:37:@12517.4]
  wire [31:0] qei_io_reg_count_di; // @[motor_top.scala 82:37:@12517.4]
  wire [31:0] qei_io_reg_count_do; // @[motor_top.scala 82:37:@12517.4]
  wire  qei_io_reg_cfg_we; // @[motor_top.scala 82:37:@12517.4]
  wire [31:0] qei_io_reg_cfg_di; // @[motor_top.scala 82:37:@12517.4]
  wire [31:0] qei_io_reg_cfg_do; // @[motor_top.scala 82:37:@12517.4]
  wire [15:0] qei_io_reg_speed_do; // @[motor_top.scala 82:37:@12517.4]
  wire  qei_io_fb_period; // @[motor_top.scala 82:37:@12517.4]
  wire  pid_clock; // @[motor_top.scala 98:37:@12530.4]
  wire  pid_reset; // @[motor_top.scala 98:37:@12530.4]
  wire  pid_io_fb_period; // @[motor_top.scala 98:37:@12530.4]
  wire  pid_io_raw_irq; // @[motor_top.scala 98:37:@12530.4]
  wire  pid_io_reg_kp_we; // @[motor_top.scala 98:37:@12530.4]
  wire [15:0] pid_io_reg_kp_di; // @[motor_top.scala 98:37:@12530.4]
  wire [15:0] pid_io_reg_kp_do; // @[motor_top.scala 98:37:@12530.4]
  wire  pid_io_reg_ki_we; // @[motor_top.scala 98:37:@12530.4]
  wire [15:0] pid_io_reg_ki_di; // @[motor_top.scala 98:37:@12530.4]
  wire [15:0] pid_io_reg_ki_do; // @[motor_top.scala 98:37:@12530.4]
  wire  pid_io_reg_kd_we; // @[motor_top.scala 98:37:@12530.4]
  wire [15:0] pid_io_reg_kd_di; // @[motor_top.scala 98:37:@12530.4]
  wire [15:0] pid_io_reg_kd_do; // @[motor_top.scala 98:37:@12530.4]
  wire  pid_io_reg_ref_we; // @[motor_top.scala 98:37:@12530.4]
  wire [15:0] pid_io_reg_ref_di; // @[motor_top.scala 98:37:@12530.4]
  wire [15:0] pid_io_reg_ref_do; // @[motor_top.scala 98:37:@12530.4]
  wire  pid_io_reg_fb_we; // @[motor_top.scala 98:37:@12530.4]
  wire [15:0] pid_io_reg_fb_di; // @[motor_top.scala 98:37:@12530.4]
  wire [15:0] pid_io_reg_fb_do; // @[motor_top.scala 98:37:@12530.4]
  wire  pid_io_reg_cfg_we; // @[motor_top.scala 98:37:@12530.4]
  wire [15:0] pid_io_reg_cfg_di; // @[motor_top.scala 98:37:@12530.4]
  wire [15:0] pid_io_reg_cfg_do; // @[motor_top.scala 98:37:@12530.4]
  wire [15:0] pid_io_speed_fb_in; // @[motor_top.scala 98:37:@12530.4]
  wire [15:0] pid_io_pid_out; // @[motor_top.scala 98:37:@12530.4]
  wire [7:0] _T_48; // @[motor_top.scala 103:41:@12536.4]
  wire [7:0] _T_49; // @[motor_top.scala 103:53:@12537.4]
  wire [15:0] _T_54; // @[motor_top.scala 115:41:@12551.4]
  Interlink_Module interlink ( // @[motor_top.scala 37:26:@12486.4]
    .clock(interlink_clock),
    .reset(interlink_reset),
    .io_bus_adr_i(interlink_io_bus_adr_i),
    .io_bus_sel_i(interlink_io_bus_sel_i),
    .io_bus_we_i(interlink_io_bus_we_i),
    .io_bus_stb_i(interlink_io_bus_stb_i),
    .io_bus_ack_o(interlink_io_bus_ack_o),
    .io_bus_dat_o(interlink_io_bus_dat_o),
    .io_tmr_val_we(interlink_io_tmr_val_we),
    .io_tmr_val_do(interlink_io_tmr_val_do),
    .io_tmr_dat_we(interlink_io_tmr_dat_we),
    .io_tmr_dat_do(interlink_io_tmr_dat_do),
    .io_tmr_duty_we(interlink_io_tmr_duty_we),
    .io_tmr_duty_do(interlink_io_tmr_duty_do),
    .io_tmr_cfg_we(interlink_io_tmr_cfg_we),
    .io_tmr_cfg_do(interlink_io_tmr_cfg_do),
    .io_qei_count_we(interlink_io_qei_count_we),
    .io_qei_count_do(interlink_io_qei_count_do),
    .io_qei_cfg_we(interlink_io_qei_cfg_we),
    .io_qei_cfg_do(interlink_io_qei_cfg_do),
    .io_qei_speed_do(interlink_io_qei_speed_do),
    .io_pid_kp_we(interlink_io_pid_kp_we),
    .io_pid_kp_do(interlink_io_pid_kp_do),
    .io_pid_ki_we(interlink_io_pid_ki_we),
    .io_pid_ki_do(interlink_io_pid_ki_do),
    .io_pid_kd_we(interlink_io_pid_kd_we),
    .io_pid_kd_do(interlink_io_pid_kd_do),
    .io_pid_ref_we(interlink_io_pid_ref_we),
    .io_pid_ref_do(interlink_io_pid_ref_do),
    .io_pid_fb_we(interlink_io_pid_fb_we),
    .io_pid_fb_do(interlink_io_pid_fb_do),
    .io_pid_cfg_we(interlink_io_pid_cfg_we),
    .io_pid_cfg_do(interlink_io_pid_cfg_do),
    .io_ba_match(interlink_io_ba_match)
  );
  PWM pwm ( // @[motor_top.scala 53:37:@12497.4]
    .clock(pwm_clock),
    .reset(pwm_reset),
    .io_reg_val_we(pwm_io_reg_val_we),
    .io_reg_val_di(pwm_io_reg_val_di),
    .io_reg_val_do(pwm_io_reg_val_do),
    .io_reg_cfg_we(pwm_io_reg_cfg_we),
    .io_reg_cfg_di(pwm_io_reg_cfg_di),
    .io_reg_cfg_do(pwm_io_reg_cfg_do),
    .io_reg_dat_we(pwm_io_reg_dat_we),
    .io_reg_dat_di(pwm_io_reg_dat_di),
    .io_reg_dat_do(pwm_io_reg_dat_do),
    .io_reg_duty_we(pwm_io_reg_duty_we),
    .io_reg_duty_di(pwm_io_reg_duty_di),
    .io_reg_duty_do(pwm_io_reg_duty_do),
    .io_reg_pid_out(pwm_io_reg_pid_out),
    .io_pwm_h(pwm_io_pwm_h),
    .io_pwm_l(pwm_io_pwm_l),
    .io_irq_out(pwm_io_irq_out),
    .io_rawirq_out(pwm_io_rawirq_out)
  );
  Quad_Encoder qei ( // @[motor_top.scala 82:37:@12517.4]
    .clock(qei_clock),
    .reset(qei_reset),
    .io_quad_a(qei_io_quad_a),
    .io_quad_b(qei_io_quad_b),
    .io_raw_irq(qei_io_raw_irq),
    .io_reg_count_we(qei_io_reg_count_we),
    .io_reg_count_di(qei_io_reg_count_di),
    .io_reg_count_do(qei_io_reg_count_do),
    .io_reg_cfg_we(qei_io_reg_cfg_we),
    .io_reg_cfg_di(qei_io_reg_cfg_di),
    .io_reg_cfg_do(qei_io_reg_cfg_do),
    .io_reg_speed_do(qei_io_reg_speed_do),
    .io_fb_period(qei_io_fb_period)
  );
  PID_Controller pid ( // @[motor_top.scala 98:37:@12530.4]
    .clock(pid_clock),
    .reset(pid_reset),
    .io_fb_period(pid_io_fb_period),
    .io_raw_irq(pid_io_raw_irq),
    .io_reg_kp_we(pid_io_reg_kp_we),
    .io_reg_kp_di(pid_io_reg_kp_di),
    .io_reg_kp_do(pid_io_reg_kp_do),
    .io_reg_ki_we(pid_io_reg_ki_we),
    .io_reg_ki_di(pid_io_reg_ki_di),
    .io_reg_ki_do(pid_io_reg_ki_do),
    .io_reg_kd_we(pid_io_reg_kd_we),
    .io_reg_kd_di(pid_io_reg_kd_di),
    .io_reg_kd_do(pid_io_reg_kd_do),
    .io_reg_ref_we(pid_io_reg_ref_we),
    .io_reg_ref_di(pid_io_reg_ref_di),
    .io_reg_ref_do(pid_io_reg_ref_do),
    .io_reg_fb_we(pid_io_reg_fb_we),
    .io_reg_fb_di(pid_io_reg_fb_di),
    .io_reg_fb_do(pid_io_reg_fb_do),
    .io_reg_cfg_we(pid_io_reg_cfg_we),
    .io_reg_cfg_di(pid_io_reg_cfg_di),
    .io_reg_cfg_do(pid_io_reg_cfg_do),
    .io_speed_fb_in(pid_io_speed_fb_in),
    .io_pid_out(pid_io_pid_out)
  );
  assign _T_48 = io_wbs_m2s_data[7:0]; // @[motor_top.scala 103:41:@12536.4]
  assign _T_49 = $signed(_T_48); // @[motor_top.scala 103:53:@12537.4]
  assign _T_54 = io_wbs_m2s_data[15:0]; // @[motor_top.scala 115:41:@12551.4]
  assign io_wbs_ack_o = interlink_io_bus_ack_o; // @[motor_top.scala 50:29:@12496.4]
  assign io_wbs_data_o = interlink_io_bus_dat_o; // @[motor_top.scala 49:29:@12495.4]
  assign io_motor_irq = pwm_io_irq_out; // @[motor_top.scala 74:29:@12514.4]
  assign io_pwm_high = pwm_io_pwm_h; // @[motor_top.scala 77:29:@12515.4]
  assign io_pwm_low = pwm_io_pwm_l; // @[motor_top.scala 78:29:@12516.4]
  assign interlink_clock = clock; // @[:@12487.4]
  assign interlink_reset = reset; // @[:@12488.4]
  assign interlink_io_bus_adr_i = {{16'd0}, io_wbs_m2s_addr}; // @[motor_top.scala 46:29:@12492.4]
  assign interlink_io_bus_sel_i = io_wbs_m2s_sel; // @[motor_top.scala 47:29:@12493.4]
  assign interlink_io_bus_we_i = io_wbs_m2s_we; // @[motor_top.scala 48:29:@12494.4]
  assign interlink_io_bus_stb_i = io_wbs_m2s_stb; // @[motor_top.scala 44:29:@12490.4]
  assign interlink_io_tmr_val_do = pwm_io_reg_val_do; // @[motor_top.scala 57:29:@12502.4]
  assign interlink_io_tmr_dat_do = pwm_io_reg_dat_do; // @[motor_top.scala 65:29:@12508.4]
  assign interlink_io_tmr_duty_do = pwm_io_reg_duty_do; // @[motor_top.scala 68:29:@12511.4]
  assign interlink_io_tmr_cfg_do = pwm_io_reg_cfg_do; // @[motor_top.scala 61:29:@12505.4]
  assign interlink_io_qei_count_do = qei_io_reg_count_do; // @[motor_top.scala 89:29:@12525.4]
  assign interlink_io_qei_cfg_do = qei_io_reg_cfg_do; // @[motor_top.scala 93:29:@12528.4]
  assign interlink_io_qei_speed_do = qei_io_reg_speed_do; // @[motor_top.scala 95:29:@12529.4]
  assign interlink_io_pid_kp_do = pid_io_reg_kp_do; // @[motor_top.scala 104:29:@12539.4]
  assign interlink_io_pid_ki_do = pid_io_reg_ki_do; // @[motor_top.scala 108:29:@12544.4]
  assign interlink_io_pid_kd_do = pid_io_reg_kd_do; // @[motor_top.scala 112:29:@12549.4]
  assign interlink_io_pid_ref_do = pid_io_reg_ref_do; // @[motor_top.scala 116:29:@12554.4]
  assign interlink_io_pid_fb_do = pid_io_reg_fb_do; // @[motor_top.scala 120:29:@12559.4]
  assign interlink_io_pid_cfg_do = pid_io_reg_cfg_do; // @[motor_top.scala 124:29:@12564.4]
  assign interlink_io_ba_match = io_ba_match; // @[motor_top.scala 41:29:@12489.4]
  assign pwm_clock = clock; // @[:@12498.4]
  assign pwm_reset = reset; // @[:@12499.4]
  assign pwm_io_reg_val_we = interlink_io_tmr_val_we; // @[motor_top.scala 55:29:@12500.4]
  assign pwm_io_reg_val_di = io_wbs_m2s_data; // @[motor_top.scala 56:29:@12501.4]
  assign pwm_io_reg_cfg_we = interlink_io_tmr_cfg_we; // @[motor_top.scala 59:29:@12503.4]
  assign pwm_io_reg_cfg_di = io_wbs_m2s_data; // @[motor_top.scala 60:29:@12504.4]
  assign pwm_io_reg_dat_we = interlink_io_tmr_dat_we; // @[motor_top.scala 63:29:@12506.4]
  assign pwm_io_reg_dat_di = io_wbs_m2s_data; // @[motor_top.scala 64:29:@12507.4]
  assign pwm_io_reg_duty_we = interlink_io_tmr_duty_we; // @[motor_top.scala 66:29:@12509.4]
  assign pwm_io_reg_duty_di = io_wbs_m2s_data; // @[motor_top.scala 67:29:@12510.4]
  assign pwm_io_reg_pid_out = pid_io_pid_out; // @[motor_top.scala 73:29:@12513.4]
  assign qei_clock = clock; // @[:@12518.4]
  assign qei_reset = reset; // @[:@12519.4]
  assign qei_io_quad_a = io_qei_ch_a; // @[motor_top.scala 83:29:@12520.4]
  assign qei_io_quad_b = io_qei_ch_b; // @[motor_top.scala 84:29:@12521.4]
  assign qei_io_raw_irq = pwm_io_rawirq_out; // @[motor_top.scala 85:29:@12522.4]
  assign qei_io_reg_count_we = interlink_io_qei_count_we; // @[motor_top.scala 87:29:@12523.4]
  assign qei_io_reg_count_di = io_wbs_m2s_data; // @[motor_top.scala 88:29:@12524.4]
  assign qei_io_reg_cfg_we = interlink_io_qei_cfg_we; // @[motor_top.scala 91:29:@12526.4]
  assign qei_io_reg_cfg_di = io_wbs_m2s_data; // @[motor_top.scala 92:29:@12527.4]
  assign pid_clock = clock; // @[:@12531.4]
  assign pid_reset = reset; // @[:@12532.4]
  assign pid_io_fb_period = qei_io_fb_period; // @[motor_top.scala 99:29:@12533.4]
  assign pid_io_raw_irq = pwm_io_rawirq_out; // @[motor_top.scala 127:29:@12566.4]
  assign pid_io_reg_kp_we = interlink_io_pid_kp_we; // @[motor_top.scala 102:29:@12535.4]
  assign pid_io_reg_kp_di = {{8{_T_49[7]}},_T_49}; // @[motor_top.scala 103:29:@12538.4]
  assign pid_io_reg_ki_we = interlink_io_pid_ki_we; // @[motor_top.scala 106:29:@12540.4]
  assign pid_io_reg_ki_di = {{8{_T_49[7]}},_T_49}; // @[motor_top.scala 107:29:@12543.4]
  assign pid_io_reg_kd_we = interlink_io_pid_kd_we; // @[motor_top.scala 110:29:@12545.4]
  assign pid_io_reg_kd_di = {{8{_T_49[7]}},_T_49}; // @[motor_top.scala 111:29:@12548.4]
  assign pid_io_reg_ref_we = interlink_io_pid_ref_we; // @[motor_top.scala 114:29:@12550.4]
  assign pid_io_reg_ref_di = $signed(_T_54); // @[motor_top.scala 115:29:@12553.4]
  assign pid_io_reg_fb_we = interlink_io_pid_fb_we; // @[motor_top.scala 118:29:@12555.4]
  assign pid_io_reg_fb_di = $signed(_T_54); // @[motor_top.scala 119:29:@12558.4]
  assign pid_io_reg_cfg_we = interlink_io_pid_cfg_we; // @[motor_top.scala 122:29:@12560.4]
  assign pid_io_reg_cfg_di = $signed(_T_54); // @[motor_top.scala 123:29:@12563.4]
  assign pid_io_speed_fb_in = qei_io_reg_speed_do; // @[motor_top.scala 100:29:@12534.4]
endmodule
module WB_InterConnect( // @[:@12568.2]
  input         clock, // @[:@12569.4]
  input         reset, // @[:@12570.4]
  input  [31:0] io_dbus_addr, // @[:@12571.4]
  input  [31:0] io_dbus_wdata, // @[:@12571.4]
  output [31:0] io_dbus_rdata, // @[:@12571.4]
  input         io_dbus_rd_en, // @[:@12571.4]
  input         io_dbus_wr_en, // @[:@12571.4]
  input  [1:0]  io_dbus_st_type, // @[:@12571.4]
  input  [2:0]  io_dbus_ld_type, // @[:@12571.4]
  output        io_dbus_valid, // @[:@12571.4]
  input  [31:0] io_ibus_addr, // @[:@12571.4]
  output [31:0] io_ibus_inst, // @[:@12571.4]
  output        io_ibus_valid, // @[:@12571.4]
  output        io_uart_tx, // @[:@12571.4]
  input         io_uart_rx, // @[:@12571.4]
  output        io_uart_irq, // @[:@12571.4]
  output        io_spi_cs, // @[:@12571.4]
  output        io_spi_clk, // @[:@12571.4]
  output        io_spi_mosi, // @[:@12571.4]
  input         io_spi_miso, // @[:@12571.4]
  output        io_spi_irq, // @[:@12571.4]
  input         io_qei_ch_a, // @[:@12571.4]
  input         io_qei_ch_b, // @[:@12571.4]
  output        io_pwm_high, // @[:@12571.4]
  output        io_pwm_low, // @[:@12571.4]
  output        io_motor_irq // @[:@12571.4]
);
  wire  dmem_clock; // @[wb_interconnect.scala 61:24:@12573.4]
  wire  dmem_reset; // @[wb_interconnect.scala 61:24:@12573.4]
  wire [15:0] dmem_io_wbs_m2s_addr; // @[wb_interconnect.scala 61:24:@12573.4]
  wire [31:0] dmem_io_wbs_m2s_data; // @[wb_interconnect.scala 61:24:@12573.4]
  wire  dmem_io_wbs_m2s_we; // @[wb_interconnect.scala 61:24:@12573.4]
  wire [3:0] dmem_io_wbs_m2s_sel; // @[wb_interconnect.scala 61:24:@12573.4]
  wire  dmem_io_wbs_m2s_stb; // @[wb_interconnect.scala 61:24:@12573.4]
  wire  dmem_io_wbs_ack_o; // @[wb_interconnect.scala 61:24:@12573.4]
  wire [31:0] dmem_io_wbs_data_o; // @[wb_interconnect.scala 61:24:@12573.4]
  wire  imem_clock; // @[wb_interconnect.scala 62:24:@12576.4]
  wire  imem_reset; // @[wb_interconnect.scala 62:24:@12576.4]
  wire [31:0] imem_io_ibus_addr; // @[wb_interconnect.scala 62:24:@12576.4]
  wire [31:0] imem_io_ibus_inst; // @[wb_interconnect.scala 62:24:@12576.4]
  wire  imem_io_ibus_valid; // @[wb_interconnect.scala 62:24:@12576.4]
  wire [15:0] imem_io_wbs_m2s_addr; // @[wb_interconnect.scala 62:24:@12576.4]
  wire [31:0] imem_io_wbs_m2s_data; // @[wb_interconnect.scala 62:24:@12576.4]
  wire  imem_io_wbs_m2s_we; // @[wb_interconnect.scala 62:24:@12576.4]
  wire [3:0] imem_io_wbs_m2s_sel; // @[wb_interconnect.scala 62:24:@12576.4]
  wire  imem_io_wbs_m2s_stb; // @[wb_interconnect.scala 62:24:@12576.4]
  wire  imem_io_wbs_ack_o; // @[wb_interconnect.scala 62:24:@12576.4]
  wire [31:0] imem_io_wbs_data_o; // @[wb_interconnect.scala 62:24:@12576.4]
  wire [31:0] wbm_dbus_io_dbus_addr; // @[wb_interconnect.scala 63:24:@12579.4]
  wire [31:0] wbm_dbus_io_dbus_wdata; // @[wb_interconnect.scala 63:24:@12579.4]
  wire [31:0] wbm_dbus_io_dbus_rdata; // @[wb_interconnect.scala 63:24:@12579.4]
  wire  wbm_dbus_io_dbus_rd_en; // @[wb_interconnect.scala 63:24:@12579.4]
  wire  wbm_dbus_io_dbus_wr_en; // @[wb_interconnect.scala 63:24:@12579.4]
  wire [1:0] wbm_dbus_io_dbus_st_type; // @[wb_interconnect.scala 63:24:@12579.4]
  wire [2:0] wbm_dbus_io_dbus_ld_type; // @[wb_interconnect.scala 63:24:@12579.4]
  wire  wbm_dbus_io_dbus_valid; // @[wb_interconnect.scala 63:24:@12579.4]
  wire [15:0] wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 63:24:@12579.4]
  wire [31:0] wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 63:24:@12579.4]
  wire  wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 63:24:@12579.4]
  wire [3:0] wbm_dbus_io_wbm_m2s_sel; // @[wb_interconnect.scala 63:24:@12579.4]
  wire  wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 63:24:@12579.4]
  wire  wbm_dbus_io_wbm_ack_i; // @[wb_interconnect.scala 63:24:@12579.4]
  wire [31:0] wbm_dbus_io_wbm_data_i; // @[wb_interconnect.scala 63:24:@12579.4]
  wire  uart_clock; // @[wb_interconnect.scala 64:24:@12582.4]
  wire  uart_reset; // @[wb_interconnect.scala 64:24:@12582.4]
  wire  uart_io_uart_select; // @[wb_interconnect.scala 64:24:@12582.4]
  wire  uart_io_txd; // @[wb_interconnect.scala 64:24:@12582.4]
  wire  uart_io_rxd; // @[wb_interconnect.scala 64:24:@12582.4]
  wire  uart_io_uartInt; // @[wb_interconnect.scala 64:24:@12582.4]
  wire [15:0] uart_io_wbs_m2s_addr; // @[wb_interconnect.scala 64:24:@12582.4]
  wire [31:0] uart_io_wbs_m2s_data; // @[wb_interconnect.scala 64:24:@12582.4]
  wire  uart_io_wbs_m2s_we; // @[wb_interconnect.scala 64:24:@12582.4]
  wire  uart_io_wbs_m2s_stb; // @[wb_interconnect.scala 64:24:@12582.4]
  wire  uart_io_wbs_ack_o; // @[wb_interconnect.scala 64:24:@12582.4]
  wire [31:0] uart_io_wbs_data_o; // @[wb_interconnect.scala 64:24:@12582.4]
  wire  spi_clock; // @[wb_interconnect.scala 65:24:@12585.4]
  wire  spi_reset; // @[wb_interconnect.scala 65:24:@12585.4]
  wire  spi_io_spi_select; // @[wb_interconnect.scala 65:24:@12585.4]
  wire  spi_io_spi_cs; // @[wb_interconnect.scala 65:24:@12585.4]
  wire  spi_io_spi_clk; // @[wb_interconnect.scala 65:24:@12585.4]
  wire  spi_io_spi_mosi; // @[wb_interconnect.scala 65:24:@12585.4]
  wire  spi_io_spi_miso; // @[wb_interconnect.scala 65:24:@12585.4]
  wire  spi_io_spi_intr; // @[wb_interconnect.scala 65:24:@12585.4]
  wire [15:0] spi_io_wbs_m2s_addr; // @[wb_interconnect.scala 65:24:@12585.4]
  wire [31:0] spi_io_wbs_m2s_data; // @[wb_interconnect.scala 65:24:@12585.4]
  wire  spi_io_wbs_m2s_we; // @[wb_interconnect.scala 65:24:@12585.4]
  wire  spi_io_wbs_m2s_stb; // @[wb_interconnect.scala 65:24:@12585.4]
  wire  spi_io_wbs_ack_o; // @[wb_interconnect.scala 65:24:@12585.4]
  wire [31:0] spi_io_wbs_data_o; // @[wb_interconnect.scala 65:24:@12585.4]
  wire  motor_clock; // @[wb_interconnect.scala 66:24:@12588.4]
  wire  motor_reset; // @[wb_interconnect.scala 66:24:@12588.4]
  wire [15:0] motor_io_wbs_m2s_addr; // @[wb_interconnect.scala 66:24:@12588.4]
  wire [31:0] motor_io_wbs_m2s_data; // @[wb_interconnect.scala 66:24:@12588.4]
  wire  motor_io_wbs_m2s_we; // @[wb_interconnect.scala 66:24:@12588.4]
  wire [3:0] motor_io_wbs_m2s_sel; // @[wb_interconnect.scala 66:24:@12588.4]
  wire  motor_io_wbs_m2s_stb; // @[wb_interconnect.scala 66:24:@12588.4]
  wire  motor_io_wbs_ack_o; // @[wb_interconnect.scala 66:24:@12588.4]
  wire [31:0] motor_io_wbs_data_o; // @[wb_interconnect.scala 66:24:@12588.4]
  wire  motor_io_ba_match; // @[wb_interconnect.scala 66:24:@12588.4]
  wire  motor_io_motor_irq; // @[wb_interconnect.scala 66:24:@12588.4]
  wire  motor_io_qei_ch_a; // @[wb_interconnect.scala 66:24:@12588.4]
  wire  motor_io_qei_ch_b; // @[wb_interconnect.scala 66:24:@12588.4]
  wire  motor_io_pwm_high; // @[wb_interconnect.scala 66:24:@12588.4]
  wire  motor_io_pwm_low; // @[wb_interconnect.scala 66:24:@12588.4]
  wire [3:0] address; // @[wb_interconnect.scala 73:50:@12602.4]
  wire  imem_addr_match; // @[wb_interconnect.scala 74:35:@12603.4]
  wire  dmem_addr_match; // @[wb_interconnect.scala 75:35:@12604.4]
  wire  uart_addr_match; // @[wb_interconnect.scala 76:35:@12605.4]
  wire  spi_addr_match; // @[wb_interconnect.scala 77:35:@12606.4]
  wire  motor_addr_match; // @[wb_interconnect.scala 78:35:@12607.4]
  reg  imem_sel; // @[wb_interconnect.scala 97:22:@12638.4]
  reg [31:0] _RAND_0;
  reg  dmem_sel; // @[wb_interconnect.scala 98:22:@12639.4]
  reg [31:0] _RAND_1;
  reg  uart_sel; // @[wb_interconnect.scala 99:22:@12640.4]
  reg [31:0] _RAND_2;
  reg  spi_sel; // @[wb_interconnect.scala 100:22:@12641.4]
  reg [31:0] _RAND_3;
  reg  motor_sel; // @[wb_interconnect.scala 101:22:@12642.4]
  reg [31:0] _RAND_4;
  wire [31:0] _T_64; // @[wb_interconnect.scala 113:41:@12653.4]
  wire [31:0] _T_65; // @[wb_interconnect.scala 112:39:@12654.4]
  wire [31:0] _T_66; // @[wb_interconnect.scala 111:37:@12655.4]
  wire [31:0] _T_67; // @[wb_interconnect.scala 110:35:@12656.4]
  wire  _T_70; // @[wb_interconnect.scala 118:41:@12659.4]
  wire  _T_71; // @[wb_interconnect.scala 117:39:@12660.4]
  wire  _T_72; // @[wb_interconnect.scala 116:37:@12661.4]
  wire  _T_73; // @[wb_interconnect.scala 115:35:@12662.4]
  DMem_Interface dmem ( // @[wb_interconnect.scala 61:24:@12573.4]
    .clock(dmem_clock),
    .reset(dmem_reset),
    .io_wbs_m2s_addr(dmem_io_wbs_m2s_addr),
    .io_wbs_m2s_data(dmem_io_wbs_m2s_data),
    .io_wbs_m2s_we(dmem_io_wbs_m2s_we),
    .io_wbs_m2s_sel(dmem_io_wbs_m2s_sel),
    .io_wbs_m2s_stb(dmem_io_wbs_m2s_stb),
    .io_wbs_ack_o(dmem_io_wbs_ack_o),
    .io_wbs_data_o(dmem_io_wbs_data_o)
  );
  IMem_Interface imem ( // @[wb_interconnect.scala 62:24:@12576.4]
    .clock(imem_clock),
    .reset(imem_reset),
    .io_ibus_addr(imem_io_ibus_addr),
    .io_ibus_inst(imem_io_ibus_inst),
    .io_ibus_valid(imem_io_ibus_valid),
    .io_wbs_m2s_addr(imem_io_wbs_m2s_addr),
    .io_wbs_m2s_data(imem_io_wbs_m2s_data),
    .io_wbs_m2s_we(imem_io_wbs_m2s_we),
    .io_wbs_m2s_sel(imem_io_wbs_m2s_sel),
    .io_wbs_m2s_stb(imem_io_wbs_m2s_stb),
    .io_wbs_ack_o(imem_io_wbs_ack_o),
    .io_wbs_data_o(imem_io_wbs_data_o)
  );
  WBM_DBus wbm_dbus ( // @[wb_interconnect.scala 63:24:@12579.4]
    .io_dbus_addr(wbm_dbus_io_dbus_addr),
    .io_dbus_wdata(wbm_dbus_io_dbus_wdata),
    .io_dbus_rdata(wbm_dbus_io_dbus_rdata),
    .io_dbus_rd_en(wbm_dbus_io_dbus_rd_en),
    .io_dbus_wr_en(wbm_dbus_io_dbus_wr_en),
    .io_dbus_st_type(wbm_dbus_io_dbus_st_type),
    .io_dbus_ld_type(wbm_dbus_io_dbus_ld_type),
    .io_dbus_valid(wbm_dbus_io_dbus_valid),
    .io_wbm_m2s_addr(wbm_dbus_io_wbm_m2s_addr),
    .io_wbm_m2s_data(wbm_dbus_io_wbm_m2s_data),
    .io_wbm_m2s_we(wbm_dbus_io_wbm_m2s_we),
    .io_wbm_m2s_sel(wbm_dbus_io_wbm_m2s_sel),
    .io_wbm_m2s_stb(wbm_dbus_io_wbm_m2s_stb),
    .io_wbm_ack_i(wbm_dbus_io_wbm_ack_i),
    .io_wbm_data_i(wbm_dbus_io_wbm_data_i)
  );
  UART uart ( // @[wb_interconnect.scala 64:24:@12582.4]
    .clock(uart_clock),
    .reset(uart_reset),
    .io_uart_select(uart_io_uart_select),
    .io_txd(uart_io_txd),
    .io_rxd(uart_io_rxd),
    .io_uartInt(uart_io_uartInt),
    .io_wbs_m2s_addr(uart_io_wbs_m2s_addr),
    .io_wbs_m2s_data(uart_io_wbs_m2s_data),
    .io_wbs_m2s_we(uart_io_wbs_m2s_we),
    .io_wbs_m2s_stb(uart_io_wbs_m2s_stb),
    .io_wbs_ack_o(uart_io_wbs_ack_o),
    .io_wbs_data_o(uart_io_wbs_data_o)
  );
  SPI spi ( // @[wb_interconnect.scala 65:24:@12585.4]
    .clock(spi_clock),
    .reset(spi_reset),
    .io_spi_select(spi_io_spi_select),
    .io_spi_cs(spi_io_spi_cs),
    .io_spi_clk(spi_io_spi_clk),
    .io_spi_mosi(spi_io_spi_mosi),
    .io_spi_miso(spi_io_spi_miso),
    .io_spi_intr(spi_io_spi_intr),
    .io_wbs_m2s_addr(spi_io_wbs_m2s_addr),
    .io_wbs_m2s_data(spi_io_wbs_m2s_data),
    .io_wbs_m2s_we(spi_io_wbs_m2s_we),
    .io_wbs_m2s_stb(spi_io_wbs_m2s_stb),
    .io_wbs_ack_o(spi_io_wbs_ack_o),
    .io_wbs_data_o(spi_io_wbs_data_o)
  );
  Motor_Top motor ( // @[wb_interconnect.scala 66:24:@12588.4]
    .clock(motor_clock),
    .reset(motor_reset),
    .io_wbs_m2s_addr(motor_io_wbs_m2s_addr),
    .io_wbs_m2s_data(motor_io_wbs_m2s_data),
    .io_wbs_m2s_we(motor_io_wbs_m2s_we),
    .io_wbs_m2s_sel(motor_io_wbs_m2s_sel),
    .io_wbs_m2s_stb(motor_io_wbs_m2s_stb),
    .io_wbs_ack_o(motor_io_wbs_ack_o),
    .io_wbs_data_o(motor_io_wbs_data_o),
    .io_ba_match(motor_io_ba_match),
    .io_motor_irq(motor_io_motor_irq),
    .io_qei_ch_a(motor_io_qei_ch_a),
    .io_qei_ch_b(motor_io_qei_ch_b),
    .io_pwm_high(motor_io_pwm_high),
    .io_pwm_low(motor_io_pwm_low)
  );
  assign address = wbm_dbus_io_wbm_m2s_addr[15:12]; // @[wb_interconnect.scala 73:50:@12602.4]
  assign imem_addr_match = address == 4'h0; // @[wb_interconnect.scala 74:35:@12603.4]
  assign dmem_addr_match = address == 4'h1; // @[wb_interconnect.scala 75:35:@12604.4]
  assign uart_addr_match = address == 4'h2; // @[wb_interconnect.scala 76:35:@12605.4]
  assign spi_addr_match = address == 4'h3; // @[wb_interconnect.scala 77:35:@12606.4]
  assign motor_addr_match = address == 4'h4; // @[wb_interconnect.scala 78:35:@12607.4]
  assign _T_64 = motor_sel ? motor_io_wbs_data_o : 32'h0; // @[wb_interconnect.scala 113:41:@12653.4]
  assign _T_65 = spi_sel ? spi_io_wbs_data_o : _T_64; // @[wb_interconnect.scala 112:39:@12654.4]
  assign _T_66 = uart_sel ? uart_io_wbs_data_o : _T_65; // @[wb_interconnect.scala 111:37:@12655.4]
  assign _T_67 = imem_sel ? imem_io_wbs_data_o : _T_66; // @[wb_interconnect.scala 110:35:@12656.4]
  assign _T_70 = motor_sel ? motor_io_wbs_ack_o : 1'h0; // @[wb_interconnect.scala 118:41:@12659.4]
  assign _T_71 = spi_sel ? spi_io_wbs_ack_o : _T_70; // @[wb_interconnect.scala 117:39:@12660.4]
  assign _T_72 = uart_sel ? uart_io_wbs_ack_o : _T_71; // @[wb_interconnect.scala 116:37:@12661.4]
  assign _T_73 = imem_sel ? imem_io_wbs_ack_o : _T_72; // @[wb_interconnect.scala 115:35:@12662.4]
  assign io_dbus_rdata = wbm_dbus_io_dbus_rdata; // @[wb_interconnect.scala 69:20:@12596.4]
  assign io_dbus_valid = wbm_dbus_io_dbus_valid; // @[wb_interconnect.scala 69:20:@12591.4]
  assign io_ibus_inst = imem_io_ibus_inst; // @[wb_interconnect.scala 70:20:@12600.4]
  assign io_ibus_valid = imem_io_ibus_valid; // @[wb_interconnect.scala 70:20:@12599.4]
  assign io_uart_tx = uart_io_txd; // @[wb_interconnect.scala 124:24:@12667.4]
  assign io_uart_irq = uart_io_uartInt; // @[wb_interconnect.scala 125:24:@12668.4]
  assign io_spi_cs = spi_io_spi_cs; // @[wb_interconnect.scala 130:24:@12671.4]
  assign io_spi_clk = spi_io_spi_clk; // @[wb_interconnect.scala 131:24:@12672.4]
  assign io_spi_mosi = spi_io_spi_mosi; // @[wb_interconnect.scala 132:24:@12673.4]
  assign io_spi_irq = spi_io_spi_intr; // @[wb_interconnect.scala 133:24:@12674.4]
  assign io_pwm_high = motor_io_pwm_high; // @[wb_interconnect.scala 139:24:@12678.4]
  assign io_pwm_low = motor_io_pwm_low; // @[wb_interconnect.scala 140:24:@12679.4]
  assign io_motor_irq = motor_io_motor_irq; // @[wb_interconnect.scala 141:24:@12680.4]
  assign dmem_clock = clock; // @[:@12574.4]
  assign dmem_reset = reset; // @[:@12575.4]
  assign dmem_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 81:20:@12613.4]
  assign dmem_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 81:20:@12612.4]
  assign dmem_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 81:20:@12611.4]
  assign dmem_io_wbs_m2s_sel = wbm_dbus_io_wbm_m2s_sel; // @[wb_interconnect.scala 81:20:@12610.4]
  assign dmem_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 81:20:@12609.4]
  assign imem_clock = clock; // @[:@12577.4]
  assign imem_reset = reset; // @[:@12578.4]
  assign imem_io_ibus_addr = io_ibus_addr; // @[wb_interconnect.scala 70:20:@12601.4]
  assign imem_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 85:20:@12619.4]
  assign imem_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 85:20:@12618.4]
  assign imem_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 85:20:@12617.4]
  assign imem_io_wbs_m2s_sel = wbm_dbus_io_wbm_m2s_sel; // @[wb_interconnect.scala 85:20:@12616.4]
  assign imem_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 85:20:@12615.4]
  assign wbm_dbus_io_dbus_addr = io_dbus_addr; // @[wb_interconnect.scala 69:20:@12598.4]
  assign wbm_dbus_io_dbus_wdata = io_dbus_wdata; // @[wb_interconnect.scala 69:20:@12597.4]
  assign wbm_dbus_io_dbus_rd_en = io_dbus_rd_en; // @[wb_interconnect.scala 69:20:@12595.4]
  assign wbm_dbus_io_dbus_wr_en = io_dbus_wr_en; // @[wb_interconnect.scala 69:20:@12594.4]
  assign wbm_dbus_io_dbus_st_type = io_dbus_st_type; // @[wb_interconnect.scala 69:20:@12593.4]
  assign wbm_dbus_io_dbus_ld_type = io_dbus_ld_type; // @[wb_interconnect.scala 69:20:@12592.4]
  assign wbm_dbus_io_wbm_ack_i = dmem_sel ? dmem_io_wbs_ack_o : _T_73; // @[wb_interconnect.scala 114:26:@12664.4]
  assign wbm_dbus_io_wbm_data_i = dmem_sel ? dmem_io_wbs_data_o : _T_67; // @[wb_interconnect.scala 109:26:@12658.4]
  assign uart_clock = clock; // @[:@12583.4]
  assign uart_reset = reset; // @[:@12584.4]
  assign uart_io_uart_select = address == 4'h2; // @[wb_interconnect.scala 122:24:@12665.4]
  assign uart_io_rxd = io_uart_rx; // @[wb_interconnect.scala 123:24:@12666.4]
  assign uart_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 88:20:@12625.4]
  assign uart_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 88:20:@12624.4]
  assign uart_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 88:20:@12623.4]
  assign uart_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 88:20:@12621.4]
  assign spi_clock = clock; // @[:@12586.4]
  assign spi_reset = reset; // @[:@12587.4]
  assign spi_io_spi_select = address == 4'h3; // @[wb_interconnect.scala 128:24:@12669.4]
  assign spi_io_spi_miso = io_spi_miso; // @[wb_interconnect.scala 129:24:@12670.4]
  assign spi_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 91:19:@12631.4]
  assign spi_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 91:19:@12630.4]
  assign spi_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 91:19:@12629.4]
  assign spi_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 91:19:@12627.4]
  assign motor_clock = clock; // @[:@12589.4]
  assign motor_reset = reset; // @[:@12590.4]
  assign motor_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 94:20:@12637.4]
  assign motor_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 94:20:@12636.4]
  assign motor_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 94:20:@12635.4]
  assign motor_io_wbs_m2s_sel = wbm_dbus_io_wbm_m2s_sel; // @[wb_interconnect.scala 94:20:@12634.4]
  assign motor_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 94:20:@12633.4]
  assign motor_io_ba_match = address == 4'h4; // @[wb_interconnect.scala 136:24:@12675.4]
  assign motor_io_qei_ch_a = io_qei_ch_a; // @[wb_interconnect.scala 137:24:@12676.4]
  assign motor_io_qei_ch_b = io_qei_ch_b; // @[wb_interconnect.scala 138:24:@12677.4]
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
  imem_sel = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  dmem_sel = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  uart_sel = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  spi_sel = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  motor_sel = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    imem_sel <= imem_addr_match & imem_io_wbs_m2s_stb;
    dmem_sel <= dmem_addr_match & dmem_io_wbs_m2s_stb;
    uart_sel <= uart_addr_match & uart_io_wbs_m2s_stb;
    spi_sel <= spi_addr_match & spi_io_wbs_m2s_stb;
    motor_sel <= motor_addr_match & motor_io_wbs_m2s_stb;
  end
endmodule
module Processor_Tile( // @[:@12682.2]
  input   clock, // @[:@12683.4]
  input   reset, // @[:@12684.4]
  output  io_uart_tx, // @[:@12685.4]
  input   io_uart_rx, // @[:@12685.4]
  output  io_spi_cs, // @[:@12685.4]
  output  io_spi_clk, // @[:@12685.4]
  output  io_spi_mosi, // @[:@12685.4]
  input   io_spi_miso, // @[:@12685.4]
  input   io_qei_ch_a, // @[:@12685.4]
  input   io_qei_ch_b, // @[:@12685.4]
  output  io_pwm_high, // @[:@12685.4]
  output  io_pwm_low // @[:@12685.4]
);
  wire  core_clock; // @[processor_tile.scala 48:32:@12687.4]
  wire  core_reset; // @[processor_tile.scala 48:32:@12687.4]
  wire  core_io_irq_uart_irq; // @[processor_tile.scala 48:32:@12687.4]
  wire  core_io_irq_spi_irq; // @[processor_tile.scala 48:32:@12687.4]
  wire  core_io_irq_motor_irq; // @[processor_tile.scala 48:32:@12687.4]
  wire [31:0] core_io_ibus_addr; // @[processor_tile.scala 48:32:@12687.4]
  wire [31:0] core_io_ibus_inst; // @[processor_tile.scala 48:32:@12687.4]
  wire  core_io_ibus_valid; // @[processor_tile.scala 48:32:@12687.4]
  wire [31:0] core_io_dbus_addr; // @[processor_tile.scala 48:32:@12687.4]
  wire [31:0] core_io_dbus_wdata; // @[processor_tile.scala 48:32:@12687.4]
  wire [31:0] core_io_dbus_rdata; // @[processor_tile.scala 48:32:@12687.4]
  wire  core_io_dbus_rd_en; // @[processor_tile.scala 48:32:@12687.4]
  wire  core_io_dbus_wr_en; // @[processor_tile.scala 48:32:@12687.4]
  wire [1:0] core_io_dbus_st_type; // @[processor_tile.scala 48:32:@12687.4]
  wire [2:0] core_io_dbus_ld_type; // @[processor_tile.scala 48:32:@12687.4]
  wire  core_io_dbus_valid; // @[processor_tile.scala 48:32:@12687.4]
  wire  wb_inter_connect_clock; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_reset; // @[processor_tile.scala 49:32:@12690.4]
  wire [31:0] wb_inter_connect_io_dbus_addr; // @[processor_tile.scala 49:32:@12690.4]
  wire [31:0] wb_inter_connect_io_dbus_wdata; // @[processor_tile.scala 49:32:@12690.4]
  wire [31:0] wb_inter_connect_io_dbus_rdata; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_dbus_rd_en; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_dbus_wr_en; // @[processor_tile.scala 49:32:@12690.4]
  wire [1:0] wb_inter_connect_io_dbus_st_type; // @[processor_tile.scala 49:32:@12690.4]
  wire [2:0] wb_inter_connect_io_dbus_ld_type; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_dbus_valid; // @[processor_tile.scala 49:32:@12690.4]
  wire [31:0] wb_inter_connect_io_ibus_addr; // @[processor_tile.scala 49:32:@12690.4]
  wire [31:0] wb_inter_connect_io_ibus_inst; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_ibus_valid; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_uart_tx; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_uart_rx; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_uart_irq; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_spi_cs; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_spi_clk; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_spi_mosi; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_spi_miso; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_spi_irq; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_qei_ch_a; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_qei_ch_b; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_pwm_high; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_pwm_low; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_motor_irq; // @[processor_tile.scala 49:32:@12690.4]
  Core core ( // @[processor_tile.scala 48:32:@12687.4]
    .clock(core_clock),
    .reset(core_reset),
    .io_irq_uart_irq(core_io_irq_uart_irq),
    .io_irq_spi_irq(core_io_irq_spi_irq),
    .io_irq_motor_irq(core_io_irq_motor_irq),
    .io_ibus_addr(core_io_ibus_addr),
    .io_ibus_inst(core_io_ibus_inst),
    .io_ibus_valid(core_io_ibus_valid),
    .io_dbus_addr(core_io_dbus_addr),
    .io_dbus_wdata(core_io_dbus_wdata),
    .io_dbus_rdata(core_io_dbus_rdata),
    .io_dbus_rd_en(core_io_dbus_rd_en),
    .io_dbus_wr_en(core_io_dbus_wr_en),
    .io_dbus_st_type(core_io_dbus_st_type),
    .io_dbus_ld_type(core_io_dbus_ld_type),
    .io_dbus_valid(core_io_dbus_valid)
  );
  WB_InterConnect wb_inter_connect ( // @[processor_tile.scala 49:32:@12690.4]
    .clock(wb_inter_connect_clock),
    .reset(wb_inter_connect_reset),
    .io_dbus_addr(wb_inter_connect_io_dbus_addr),
    .io_dbus_wdata(wb_inter_connect_io_dbus_wdata),
    .io_dbus_rdata(wb_inter_connect_io_dbus_rdata),
    .io_dbus_rd_en(wb_inter_connect_io_dbus_rd_en),
    .io_dbus_wr_en(wb_inter_connect_io_dbus_wr_en),
    .io_dbus_st_type(wb_inter_connect_io_dbus_st_type),
    .io_dbus_ld_type(wb_inter_connect_io_dbus_ld_type),
    .io_dbus_valid(wb_inter_connect_io_dbus_valid),
    .io_ibus_addr(wb_inter_connect_io_ibus_addr),
    .io_ibus_inst(wb_inter_connect_io_ibus_inst),
    .io_ibus_valid(wb_inter_connect_io_ibus_valid),
    .io_uart_tx(wb_inter_connect_io_uart_tx),
    .io_uart_rx(wb_inter_connect_io_uart_rx),
    .io_uart_irq(wb_inter_connect_io_uart_irq),
    .io_spi_cs(wb_inter_connect_io_spi_cs),
    .io_spi_clk(wb_inter_connect_io_spi_clk),
    .io_spi_mosi(wb_inter_connect_io_spi_mosi),
    .io_spi_miso(wb_inter_connect_io_spi_miso),
    .io_spi_irq(wb_inter_connect_io_spi_irq),
    .io_qei_ch_a(wb_inter_connect_io_qei_ch_a),
    .io_qei_ch_b(wb_inter_connect_io_qei_ch_b),
    .io_pwm_high(wb_inter_connect_io_pwm_high),
    .io_pwm_low(wb_inter_connect_io_pwm_low),
    .io_motor_irq(wb_inter_connect_io_motor_irq)
  );
  assign io_uart_tx = wb_inter_connect_io_uart_tx; // @[processor_tile.scala 56:32:@12704.4]
  assign io_spi_cs = wb_inter_connect_io_spi_cs; // @[processor_tile.scala 61:32:@12707.4]
  assign io_spi_clk = wb_inter_connect_io_spi_clk; // @[processor_tile.scala 62:32:@12708.4]
  assign io_spi_mosi = wb_inter_connect_io_spi_mosi; // @[processor_tile.scala 63:32:@12709.4]
  assign io_pwm_high = wb_inter_connect_io_pwm_high; // @[processor_tile.scala 68:32:@12712.4]
  assign io_pwm_low = wb_inter_connect_io_pwm_low; // @[processor_tile.scala 69:32:@12713.4]
  assign core_clock = clock; // @[:@12688.4]
  assign core_reset = reset; // @[:@12689.4]
  assign core_io_irq_uart_irq = wb_inter_connect_io_uart_irq; // @[processor_tile.scala 58:32:@12706.4]
  assign core_io_irq_spi_irq = wb_inter_connect_io_spi_irq; // @[processor_tile.scala 65:32:@12711.4]
  assign core_io_irq_motor_irq = wb_inter_connect_io_motor_irq; // @[processor_tile.scala 72:32:@12716.4]
  assign core_io_ibus_inst = wb_inter_connect_io_ibus_inst; // @[processor_tile.scala 52:24:@12694.4]
  assign core_io_ibus_valid = wb_inter_connect_io_ibus_valid; // @[processor_tile.scala 52:24:@12693.4]
  assign core_io_dbus_rdata = wb_inter_connect_io_dbus_rdata; // @[processor_tile.scala 53:24:@12701.4]
  assign core_io_dbus_valid = wb_inter_connect_io_dbus_valid; // @[processor_tile.scala 53:24:@12696.4]
  assign wb_inter_connect_clock = clock; // @[:@12691.4]
  assign wb_inter_connect_reset = reset; // @[:@12692.4]
  assign wb_inter_connect_io_dbus_addr = core_io_dbus_addr; // @[processor_tile.scala 53:24:@12703.4]
  assign wb_inter_connect_io_dbus_wdata = core_io_dbus_wdata; // @[processor_tile.scala 53:24:@12702.4]
  assign wb_inter_connect_io_dbus_rd_en = core_io_dbus_rd_en; // @[processor_tile.scala 53:24:@12700.4]
  assign wb_inter_connect_io_dbus_wr_en = core_io_dbus_wr_en; // @[processor_tile.scala 53:24:@12699.4]
  assign wb_inter_connect_io_dbus_st_type = core_io_dbus_st_type; // @[processor_tile.scala 53:24:@12698.4]
  assign wb_inter_connect_io_dbus_ld_type = core_io_dbus_ld_type; // @[processor_tile.scala 53:24:@12697.4]
  assign wb_inter_connect_io_ibus_addr = core_io_ibus_addr; // @[processor_tile.scala 52:24:@12695.4]
  assign wb_inter_connect_io_uart_rx = io_uart_rx; // @[processor_tile.scala 57:32:@12705.4]
  assign wb_inter_connect_io_spi_miso = io_spi_miso; // @[processor_tile.scala 64:32:@12710.4]
  assign wb_inter_connect_io_qei_ch_a = io_qei_ch_a; // @[processor_tile.scala 70:32:@12714.4]
  assign wb_inter_connect_io_qei_ch_b = io_qei_ch_b; // @[processor_tile.scala 71:32:@12715.4]
endmodule
