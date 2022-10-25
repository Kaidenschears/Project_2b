
_usertests:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  return randstate;
}

int
main(int argc, char *argv[])
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	push   -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	51                   	push   %ecx
    100e:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "usertests starting\n");
    1011:	68 66 5d 00 00       	push   $0x5d66
    1016:	6a 01                	push   $0x1
    1018:	e8 33 3a 00 00       	call   4a50 <printf>

  if(open("usertests.ran", 0) >= 0){
    101d:	59                   	pop    %ecx
    101e:	58                   	pop    %eax
    101f:	6a 00                	push   $0x0
    1021:	68 7a 5d 00 00       	push   $0x5d7a
    1026:	e8 e8 38 00 00       	call   4913 <open>
    102b:	83 c4 10             	add    $0x10,%esp
    102e:	85 c0                	test   %eax,%eax
    1030:	78 13                	js     1045 <main+0x45>
    printf(1, "already ran user tests -- rebuild fs.img\n");
    1032:	52                   	push   %edx
    1033:	52                   	push   %edx
    1034:	68 e4 64 00 00       	push   $0x64e4
    1039:	6a 01                	push   $0x1
    103b:	e8 10 3a 00 00       	call   4a50 <printf>
    exit();
    1040:	e8 8e 38 00 00       	call   48d3 <exit>
  }
  close(open("usertests.ran", O_CREATE));
    1045:	50                   	push   %eax
    1046:	50                   	push   %eax
    1047:	68 00 02 00 00       	push   $0x200
    104c:	68 7a 5d 00 00       	push   $0x5d7a
    1051:	e8 bd 38 00 00       	call   4913 <open>
    1056:	89 04 24             	mov    %eax,(%esp)
    1059:	e8 9d 38 00 00       	call   48fb <close>

  argptest();
    105e:	e8 8d 35 00 00       	call   45f0 <argptest>
  createdelete();
    1063:	e8 b8 11 00 00       	call   2220 <createdelete>
  linkunlink();
    1068:	e8 73 1a 00 00       	call   2ae0 <linkunlink>
  concreate();
    106d:	e8 6e 17 00 00       	call   27e0 <concreate>
  fourfiles();
    1072:	e8 a9 0f 00 00       	call   2020 <fourfiles>
  sharedfd();
    1077:	e8 e4 0d 00 00       	call   1e60 <sharedfd>

  bigargtest();
    107c:	e8 2f 32 00 00       	call   42b0 <bigargtest>
  bigwrite();
    1081:	e8 7a 23 00 00       	call   3400 <bigwrite>
  bigargtest();
    1086:	e8 25 32 00 00       	call   42b0 <bigargtest>
  bsstest();
    108b:	e8 b0 31 00 00       	call   4240 <bsstest>
  sbrktest();
    1090:	e8 ab 2c 00 00       	call   3d40 <sbrktest>
  validatetest();
    1095:	e8 f6 30 00 00       	call   4190 <validatetest>

  opentest();
    109a:	e8 61 03 00 00       	call   1400 <opentest>
  writetest();
    109f:	e8 ec 03 00 00       	call   1490 <writetest>
  writetest1();
    10a4:	e8 c7 05 00 00       	call   1670 <writetest1>
  createtest();
    10a9:	e8 92 07 00 00       	call   1840 <createtest>

  openiputtest();
    10ae:	e8 4d 02 00 00       	call   1300 <openiputtest>
  exitiputtest();
    10b3:	e8 48 01 00 00       	call   1200 <exitiputtest>
  iputtest();
    10b8:	e8 63 00 00 00       	call   1120 <iputtest>

  mem();
    10bd:	e8 ce 0c 00 00       	call   1d90 <mem>
  pipe1();
    10c2:	e8 59 09 00 00       	call   1a20 <pipe1>
  preempt();
    10c7:	e8 e4 0a 00 00       	call   1bb0 <preempt>
  exitwait();
    10cc:	e8 3f 0c 00 00       	call   1d10 <exitwait>

  rmdot();
    10d1:	e8 1a 27 00 00       	call   37f0 <rmdot>
  fourteen();
    10d6:	e8 d5 25 00 00       	call   36b0 <fourteen>
  bigfile();
    10db:	e8 00 24 00 00       	call   34e0 <bigfile>
  subdir();
    10e0:	e8 3b 1c 00 00       	call   2d20 <subdir>
  linktest();
    10e5:	e8 e6 14 00 00       	call   25d0 <linktest>
  unlinkread();
    10ea:	e8 51 13 00 00       	call   2440 <unlinkread>
  dirfile();
    10ef:	e8 7c 28 00 00       	call   3970 <dirfile>
  iref();
    10f4:	e8 77 2a 00 00       	call   3b70 <iref>
  forktest();
    10f9:	e8 92 2b 00 00       	call   3c90 <forktest>
  bigdir(); // slow
    10fe:	e8 ed 1a 00 00       	call   2bf0 <bigdir>

  uio();
    1103:	e8 78 34 00 00       	call   4580 <uio>

  exectest();
    1108:	e8 c3 08 00 00       	call   19d0 <exectest>

  exit();
    110d:	e8 c1 37 00 00       	call   48d3 <exit>
    1112:	66 90                	xchg   %ax,%ax
    1114:	66 90                	xchg   %ax,%ax
    1116:	66 90                	xchg   %ax,%ax
    1118:	66 90                	xchg   %ax,%ax
    111a:	66 90                	xchg   %ax,%ax
    111c:	66 90                	xchg   %ax,%ax
    111e:	66 90                	xchg   %ax,%ax

00001120 <iputtest>:
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "iput test\n");
    1126:	68 0c 4e 00 00       	push   $0x4e0c
    112b:	ff 35 68 6e 00 00    	push   0x6e68
    1131:	e8 1a 39 00 00       	call   4a50 <printf>
  if(mkdir("iputdir") < 0){
    1136:	c7 04 24 9f 4d 00 00 	movl   $0x4d9f,(%esp)
    113d:	e8 f9 37 00 00       	call   493b <mkdir>
    1142:	83 c4 10             	add    $0x10,%esp
    1145:	85 c0                	test   %eax,%eax
    1147:	78 58                	js     11a1 <iputtest+0x81>
  if(chdir("iputdir") < 0){
    1149:	83 ec 0c             	sub    $0xc,%esp
    114c:	68 9f 4d 00 00       	push   $0x4d9f
    1151:	e8 ed 37 00 00       	call   4943 <chdir>
    1156:	83 c4 10             	add    $0x10,%esp
    1159:	85 c0                	test   %eax,%eax
    115b:	0f 88 85 00 00 00    	js     11e6 <iputtest+0xc6>
  if(unlink("../iputdir") < 0){
    1161:	83 ec 0c             	sub    $0xc,%esp
    1164:	68 9c 4d 00 00       	push   $0x4d9c
    1169:	e8 b5 37 00 00       	call   4923 <unlink>
    116e:	83 c4 10             	add    $0x10,%esp
    1171:	85 c0                	test   %eax,%eax
    1173:	78 5a                	js     11cf <iputtest+0xaf>
  if(chdir("/") < 0){
    1175:	83 ec 0c             	sub    $0xc,%esp
    1178:	68 c1 4d 00 00       	push   $0x4dc1
    117d:	e8 c1 37 00 00       	call   4943 <chdir>
    1182:	83 c4 10             	add    $0x10,%esp
    1185:	85 c0                	test   %eax,%eax
    1187:	78 2f                	js     11b8 <iputtest+0x98>
  printf(stdout, "iput test ok\n");
    1189:	83 ec 08             	sub    $0x8,%esp
    118c:	68 44 4e 00 00       	push   $0x4e44
    1191:	ff 35 68 6e 00 00    	push   0x6e68
    1197:	e8 b4 38 00 00       	call   4a50 <printf>
}
    119c:	83 c4 10             	add    $0x10,%esp
    119f:	c9                   	leave  
    11a0:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
    11a1:	50                   	push   %eax
    11a2:	50                   	push   %eax
    11a3:	68 78 4d 00 00       	push   $0x4d78
    11a8:	ff 35 68 6e 00 00    	push   0x6e68
    11ae:	e8 9d 38 00 00       	call   4a50 <printf>
    exit();
    11b3:	e8 1b 37 00 00       	call   48d3 <exit>
    printf(stdout, "chdir / failed\n");
    11b8:	50                   	push   %eax
    11b9:	50                   	push   %eax
    11ba:	68 c3 4d 00 00       	push   $0x4dc3
    11bf:	ff 35 68 6e 00 00    	push   0x6e68
    11c5:	e8 86 38 00 00       	call   4a50 <printf>
    exit();
    11ca:	e8 04 37 00 00       	call   48d3 <exit>
    printf(stdout, "unlink ../iputdir failed\n");
    11cf:	52                   	push   %edx
    11d0:	52                   	push   %edx
    11d1:	68 a7 4d 00 00       	push   $0x4da7
    11d6:	ff 35 68 6e 00 00    	push   0x6e68
    11dc:	e8 6f 38 00 00       	call   4a50 <printf>
    exit();
    11e1:	e8 ed 36 00 00       	call   48d3 <exit>
    printf(stdout, "chdir iputdir failed\n");
    11e6:	51                   	push   %ecx
    11e7:	51                   	push   %ecx
    11e8:	68 86 4d 00 00       	push   $0x4d86
    11ed:	ff 35 68 6e 00 00    	push   0x6e68
    11f3:	e8 58 38 00 00       	call   4a50 <printf>
    exit();
    11f8:	e8 d6 36 00 00       	call   48d3 <exit>
    11fd:	8d 76 00             	lea    0x0(%esi),%esi

00001200 <exitiputtest>:
{
    1200:	55                   	push   %ebp
    1201:	89 e5                	mov    %esp,%ebp
    1203:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exitiput test\n");
    1206:	68 d3 4d 00 00       	push   $0x4dd3
    120b:	ff 35 68 6e 00 00    	push   0x6e68
    1211:	e8 3a 38 00 00       	call   4a50 <printf>
  pid = fork();
    1216:	e8 b0 36 00 00       	call   48cb <fork>
  if(pid < 0){
    121b:	83 c4 10             	add    $0x10,%esp
    121e:	85 c0                	test   %eax,%eax
    1220:	0f 88 8a 00 00 00    	js     12b0 <exitiputtest+0xb0>
  if(pid == 0){
    1226:	75 50                	jne    1278 <exitiputtest+0x78>
    if(mkdir("iputdir") < 0){
    1228:	83 ec 0c             	sub    $0xc,%esp
    122b:	68 9f 4d 00 00       	push   $0x4d9f
    1230:	e8 06 37 00 00       	call   493b <mkdir>
    1235:	83 c4 10             	add    $0x10,%esp
    1238:	85 c0                	test   %eax,%eax
    123a:	0f 88 87 00 00 00    	js     12c7 <exitiputtest+0xc7>
    if(chdir("iputdir") < 0){
    1240:	83 ec 0c             	sub    $0xc,%esp
    1243:	68 9f 4d 00 00       	push   $0x4d9f
    1248:	e8 f6 36 00 00       	call   4943 <chdir>
    124d:	83 c4 10             	add    $0x10,%esp
    1250:	85 c0                	test   %eax,%eax
    1252:	0f 88 86 00 00 00    	js     12de <exitiputtest+0xde>
    if(unlink("../iputdir") < 0){
    1258:	83 ec 0c             	sub    $0xc,%esp
    125b:	68 9c 4d 00 00       	push   $0x4d9c
    1260:	e8 be 36 00 00       	call   4923 <unlink>
    1265:	83 c4 10             	add    $0x10,%esp
    1268:	85 c0                	test   %eax,%eax
    126a:	78 2c                	js     1298 <exitiputtest+0x98>
    exit();
    126c:	e8 62 36 00 00       	call   48d3 <exit>
    1271:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  wait();
    1278:	e8 5e 36 00 00       	call   48db <wait>
  printf(stdout, "exitiput test ok\n");
    127d:	83 ec 08             	sub    $0x8,%esp
    1280:	68 f6 4d 00 00       	push   $0x4df6
    1285:	ff 35 68 6e 00 00    	push   0x6e68
    128b:	e8 c0 37 00 00       	call   4a50 <printf>
}
    1290:	83 c4 10             	add    $0x10,%esp
    1293:	c9                   	leave  
    1294:	c3                   	ret    
    1295:	8d 76 00             	lea    0x0(%esi),%esi
      printf(stdout, "unlink ../iputdir failed\n");
    1298:	83 ec 08             	sub    $0x8,%esp
    129b:	68 a7 4d 00 00       	push   $0x4da7
    12a0:	ff 35 68 6e 00 00    	push   0x6e68
    12a6:	e8 a5 37 00 00       	call   4a50 <printf>
      exit();
    12ab:	e8 23 36 00 00       	call   48d3 <exit>
    printf(stdout, "fork failed\n");
    12b0:	51                   	push   %ecx
    12b1:	51                   	push   %ecx
    12b2:	68 b9 5c 00 00       	push   $0x5cb9
    12b7:	ff 35 68 6e 00 00    	push   0x6e68
    12bd:	e8 8e 37 00 00       	call   4a50 <printf>
    exit();
    12c2:	e8 0c 36 00 00       	call   48d3 <exit>
      printf(stdout, "mkdir failed\n");
    12c7:	52                   	push   %edx
    12c8:	52                   	push   %edx
    12c9:	68 78 4d 00 00       	push   $0x4d78
    12ce:	ff 35 68 6e 00 00    	push   0x6e68
    12d4:	e8 77 37 00 00       	call   4a50 <printf>
      exit();
    12d9:	e8 f5 35 00 00       	call   48d3 <exit>
      printf(stdout, "child chdir failed\n");
    12de:	50                   	push   %eax
    12df:	50                   	push   %eax
    12e0:	68 e2 4d 00 00       	push   $0x4de2
    12e5:	ff 35 68 6e 00 00    	push   0x6e68
    12eb:	e8 60 37 00 00       	call   4a50 <printf>
      exit();
    12f0:	e8 de 35 00 00       	call   48d3 <exit>
    12f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001300 <openiputtest>:
{
    1300:	55                   	push   %ebp
    1301:	89 e5                	mov    %esp,%ebp
    1303:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "openiput test\n");
    1306:	68 08 4e 00 00       	push   $0x4e08
    130b:	ff 35 68 6e 00 00    	push   0x6e68
    1311:	e8 3a 37 00 00       	call   4a50 <printf>
  if(mkdir("oidir") < 0){
    1316:	c7 04 24 17 4e 00 00 	movl   $0x4e17,(%esp)
    131d:	e8 19 36 00 00       	call   493b <mkdir>
    1322:	83 c4 10             	add    $0x10,%esp
    1325:	85 c0                	test   %eax,%eax
    1327:	0f 88 9f 00 00 00    	js     13cc <openiputtest+0xcc>
  pid = fork();
    132d:	e8 99 35 00 00       	call   48cb <fork>
  if(pid < 0){
    1332:	85 c0                	test   %eax,%eax
    1334:	78 7f                	js     13b5 <openiputtest+0xb5>
  if(pid == 0){
    1336:	75 38                	jne    1370 <openiputtest+0x70>
    int fd = open("oidir", O_RDWR);
    1338:	83 ec 08             	sub    $0x8,%esp
    133b:	6a 02                	push   $0x2
    133d:	68 17 4e 00 00       	push   $0x4e17
    1342:	e8 cc 35 00 00       	call   4913 <open>
    if(fd >= 0){
    1347:	83 c4 10             	add    $0x10,%esp
    134a:	85 c0                	test   %eax,%eax
    134c:	78 62                	js     13b0 <openiputtest+0xb0>
      printf(stdout, "open directory for write succeeded\n");
    134e:	83 ec 08             	sub    $0x8,%esp
    1351:	68 9c 5d 00 00       	push   $0x5d9c
    1356:	ff 35 68 6e 00 00    	push   0x6e68
    135c:	e8 ef 36 00 00       	call   4a50 <printf>
      exit();
    1361:	e8 6d 35 00 00       	call   48d3 <exit>
    1366:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    136d:	8d 76 00             	lea    0x0(%esi),%esi
  sleep(1);
    1370:	83 ec 0c             	sub    $0xc,%esp
    1373:	6a 01                	push   $0x1
    1375:	e8 e9 35 00 00       	call   4963 <sleep>
  if(unlink("oidir") != 0){
    137a:	c7 04 24 17 4e 00 00 	movl   $0x4e17,(%esp)
    1381:	e8 9d 35 00 00       	call   4923 <unlink>
    1386:	83 c4 10             	add    $0x10,%esp
    1389:	85 c0                	test   %eax,%eax
    138b:	75 56                	jne    13e3 <openiputtest+0xe3>
  wait();
    138d:	e8 49 35 00 00       	call   48db <wait>
  printf(stdout, "openiput test ok\n");
    1392:	83 ec 08             	sub    $0x8,%esp
    1395:	68 40 4e 00 00       	push   $0x4e40
    139a:	ff 35 68 6e 00 00    	push   0x6e68
    13a0:	e8 ab 36 00 00       	call   4a50 <printf>
}
    13a5:	83 c4 10             	add    $0x10,%esp
    13a8:	c9                   	leave  
    13a9:	c3                   	ret    
    13aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    exit();
    13b0:	e8 1e 35 00 00       	call   48d3 <exit>
    printf(stdout, "fork failed\n");
    13b5:	52                   	push   %edx
    13b6:	52                   	push   %edx
    13b7:	68 b9 5c 00 00       	push   $0x5cb9
    13bc:	ff 35 68 6e 00 00    	push   0x6e68
    13c2:	e8 89 36 00 00       	call   4a50 <printf>
    exit();
    13c7:	e8 07 35 00 00       	call   48d3 <exit>
    printf(stdout, "mkdir oidir failed\n");
    13cc:	51                   	push   %ecx
    13cd:	51                   	push   %ecx
    13ce:	68 1d 4e 00 00       	push   $0x4e1d
    13d3:	ff 35 68 6e 00 00    	push   0x6e68
    13d9:	e8 72 36 00 00       	call   4a50 <printf>
    exit();
    13de:	e8 f0 34 00 00       	call   48d3 <exit>
    printf(stdout, "unlink failed\n");
    13e3:	50                   	push   %eax
    13e4:	50                   	push   %eax
    13e5:	68 31 4e 00 00       	push   $0x4e31
    13ea:	ff 35 68 6e 00 00    	push   0x6e68
    13f0:	e8 5b 36 00 00       	call   4a50 <printf>
    exit();
    13f5:	e8 d9 34 00 00       	call   48d3 <exit>
    13fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001400 <opentest>:
{
    1400:	55                   	push   %ebp
    1401:	89 e5                	mov    %esp,%ebp
    1403:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "open test\n");
    1406:	68 52 4e 00 00       	push   $0x4e52
    140b:	ff 35 68 6e 00 00    	push   0x6e68
    1411:	e8 3a 36 00 00       	call   4a50 <printf>
  fd = open("echo", 0);
    1416:	58                   	pop    %eax
    1417:	5a                   	pop    %edx
    1418:	6a 00                	push   $0x0
    141a:	68 5d 4e 00 00       	push   $0x4e5d
    141f:	e8 ef 34 00 00       	call   4913 <open>
  if(fd < 0){
    1424:	83 c4 10             	add    $0x10,%esp
    1427:	85 c0                	test   %eax,%eax
    1429:	78 36                	js     1461 <opentest+0x61>
  close(fd);
    142b:	83 ec 0c             	sub    $0xc,%esp
    142e:	50                   	push   %eax
    142f:	e8 c7 34 00 00       	call   48fb <close>
  fd = open("doesnotexist", 0);
    1434:	5a                   	pop    %edx
    1435:	59                   	pop    %ecx
    1436:	6a 00                	push   $0x0
    1438:	68 75 4e 00 00       	push   $0x4e75
    143d:	e8 d1 34 00 00       	call   4913 <open>
  if(fd >= 0){
    1442:	83 c4 10             	add    $0x10,%esp
    1445:	85 c0                	test   %eax,%eax
    1447:	79 2f                	jns    1478 <opentest+0x78>
  printf(stdout, "open test ok\n");
    1449:	83 ec 08             	sub    $0x8,%esp
    144c:	68 a0 4e 00 00       	push   $0x4ea0
    1451:	ff 35 68 6e 00 00    	push   0x6e68
    1457:	e8 f4 35 00 00       	call   4a50 <printf>
}
    145c:	83 c4 10             	add    $0x10,%esp
    145f:	c9                   	leave  
    1460:	c3                   	ret    
    printf(stdout, "open echo failed!\n");
    1461:	50                   	push   %eax
    1462:	50                   	push   %eax
    1463:	68 62 4e 00 00       	push   $0x4e62
    1468:	ff 35 68 6e 00 00    	push   0x6e68
    146e:	e8 dd 35 00 00       	call   4a50 <printf>
    exit();
    1473:	e8 5b 34 00 00       	call   48d3 <exit>
    printf(stdout, "open doesnotexist succeeded!\n");
    1478:	50                   	push   %eax
    1479:	50                   	push   %eax
    147a:	68 82 4e 00 00       	push   $0x4e82
    147f:	ff 35 68 6e 00 00    	push   0x6e68
    1485:	e8 c6 35 00 00       	call   4a50 <printf>
    exit();
    148a:	e8 44 34 00 00       	call   48d3 <exit>
    148f:	90                   	nop

00001490 <writetest>:
{
    1490:	55                   	push   %ebp
    1491:	89 e5                	mov    %esp,%ebp
    1493:	56                   	push   %esi
    1494:	53                   	push   %ebx
  printf(stdout, "small file test\n");
    1495:	83 ec 08             	sub    $0x8,%esp
    1498:	68 ae 4e 00 00       	push   $0x4eae
    149d:	ff 35 68 6e 00 00    	push   0x6e68
    14a3:	e8 a8 35 00 00       	call   4a50 <printf>
  fd = open("small", O_CREATE|O_RDWR);
    14a8:	58                   	pop    %eax
    14a9:	5a                   	pop    %edx
    14aa:	68 02 02 00 00       	push   $0x202
    14af:	68 bf 4e 00 00       	push   $0x4ebf
    14b4:	e8 5a 34 00 00       	call   4913 <open>
  if(fd >= 0){
    14b9:	83 c4 10             	add    $0x10,%esp
    14bc:	85 c0                	test   %eax,%eax
    14be:	0f 88 88 01 00 00    	js     164c <writetest+0x1bc>
    printf(stdout, "creat small succeeded; ok\n");
    14c4:	83 ec 08             	sub    $0x8,%esp
    14c7:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 100; i++){
    14c9:	31 db                	xor    %ebx,%ebx
    printf(stdout, "creat small succeeded; ok\n");
    14cb:	68 c5 4e 00 00       	push   $0x4ec5
    14d0:	ff 35 68 6e 00 00    	push   0x6e68
    14d6:	e8 75 35 00 00       	call   4a50 <printf>
    14db:	83 c4 10             	add    $0x10,%esp
    14de:	66 90                	xchg   %ax,%ax
    if(write(fd, "aaaaaaaaaa", 10) != 10){
    14e0:	83 ec 04             	sub    $0x4,%esp
    14e3:	6a 0a                	push   $0xa
    14e5:	68 fc 4e 00 00       	push   $0x4efc
    14ea:	56                   	push   %esi
    14eb:	e8 03 34 00 00       	call   48f3 <write>
    14f0:	83 c4 10             	add    $0x10,%esp
    14f3:	83 f8 0a             	cmp    $0xa,%eax
    14f6:	0f 85 d9 00 00 00    	jne    15d5 <writetest+0x145>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
    14fc:	83 ec 04             	sub    $0x4,%esp
    14ff:	6a 0a                	push   $0xa
    1501:	68 07 4f 00 00       	push   $0x4f07
    1506:	56                   	push   %esi
    1507:	e8 e7 33 00 00       	call   48f3 <write>
    150c:	83 c4 10             	add    $0x10,%esp
    150f:	83 f8 0a             	cmp    $0xa,%eax
    1512:	0f 85 d6 00 00 00    	jne    15ee <writetest+0x15e>
  for(i = 0; i < 100; i++){
    1518:	83 c3 01             	add    $0x1,%ebx
    151b:	83 fb 64             	cmp    $0x64,%ebx
    151e:	75 c0                	jne    14e0 <writetest+0x50>
  printf(stdout, "writes ok\n");
    1520:	83 ec 08             	sub    $0x8,%esp
    1523:	68 12 4f 00 00       	push   $0x4f12
    1528:	ff 35 68 6e 00 00    	push   0x6e68
    152e:	e8 1d 35 00 00       	call   4a50 <printf>
  close(fd);
    1533:	89 34 24             	mov    %esi,(%esp)
    1536:	e8 c0 33 00 00       	call   48fb <close>
  fd = open("small", O_RDONLY);
    153b:	5b                   	pop    %ebx
    153c:	5e                   	pop    %esi
    153d:	6a 00                	push   $0x0
    153f:	68 bf 4e 00 00       	push   $0x4ebf
    1544:	e8 ca 33 00 00       	call   4913 <open>
  if(fd >= 0){
    1549:	83 c4 10             	add    $0x10,%esp
  fd = open("small", O_RDONLY);
    154c:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
    154e:	85 c0                	test   %eax,%eax
    1550:	0f 88 b1 00 00 00    	js     1607 <writetest+0x177>
    printf(stdout, "open small succeeded ok\n");
    1556:	83 ec 08             	sub    $0x8,%esp
    1559:	68 1d 4f 00 00       	push   $0x4f1d
    155e:	ff 35 68 6e 00 00    	push   0x6e68
    1564:	e8 e7 34 00 00       	call   4a50 <printf>
  i = read(fd, buf, 2000);
    1569:	83 c4 0c             	add    $0xc,%esp
    156c:	68 d0 07 00 00       	push   $0x7d0
    1571:	68 a0 95 00 00       	push   $0x95a0
    1576:	53                   	push   %ebx
    1577:	e8 6f 33 00 00       	call   48eb <read>
  if(i == 2000){
    157c:	83 c4 10             	add    $0x10,%esp
    157f:	3d d0 07 00 00       	cmp    $0x7d0,%eax
    1584:	0f 85 94 00 00 00    	jne    161e <writetest+0x18e>
    printf(stdout, "read succeeded ok\n");
    158a:	83 ec 08             	sub    $0x8,%esp
    158d:	68 51 4f 00 00       	push   $0x4f51
    1592:	ff 35 68 6e 00 00    	push   0x6e68
    1598:	e8 b3 34 00 00       	call   4a50 <printf>
  close(fd);
    159d:	89 1c 24             	mov    %ebx,(%esp)
    15a0:	e8 56 33 00 00       	call   48fb <close>
  if(unlink("small") < 0){
    15a5:	c7 04 24 bf 4e 00 00 	movl   $0x4ebf,(%esp)
    15ac:	e8 72 33 00 00       	call   4923 <unlink>
    15b1:	83 c4 10             	add    $0x10,%esp
    15b4:	85 c0                	test   %eax,%eax
    15b6:	78 7d                	js     1635 <writetest+0x1a5>
  printf(stdout, "small file test ok\n");
    15b8:	83 ec 08             	sub    $0x8,%esp
    15bb:	68 79 4f 00 00       	push   $0x4f79
    15c0:	ff 35 68 6e 00 00    	push   0x6e68
    15c6:	e8 85 34 00 00       	call   4a50 <printf>
}
    15cb:	83 c4 10             	add    $0x10,%esp
    15ce:	8d 65 f8             	lea    -0x8(%ebp),%esp
    15d1:	5b                   	pop    %ebx
    15d2:	5e                   	pop    %esi
    15d3:	5d                   	pop    %ebp
    15d4:	c3                   	ret    
      printf(stdout, "error: write aa %d new file failed\n", i);
    15d5:	83 ec 04             	sub    $0x4,%esp
    15d8:	53                   	push   %ebx
    15d9:	68 c0 5d 00 00       	push   $0x5dc0
    15de:	ff 35 68 6e 00 00    	push   0x6e68
    15e4:	e8 67 34 00 00       	call   4a50 <printf>
      exit();
    15e9:	e8 e5 32 00 00       	call   48d3 <exit>
      printf(stdout, "error: write bb %d new file failed\n", i);
    15ee:	83 ec 04             	sub    $0x4,%esp
    15f1:	53                   	push   %ebx
    15f2:	68 e4 5d 00 00       	push   $0x5de4
    15f7:	ff 35 68 6e 00 00    	push   0x6e68
    15fd:	e8 4e 34 00 00       	call   4a50 <printf>
      exit();
    1602:	e8 cc 32 00 00       	call   48d3 <exit>
    printf(stdout, "error: open small failed!\n");
    1607:	51                   	push   %ecx
    1608:	51                   	push   %ecx
    1609:	68 36 4f 00 00       	push   $0x4f36
    160e:	ff 35 68 6e 00 00    	push   0x6e68
    1614:	e8 37 34 00 00       	call   4a50 <printf>
    exit();
    1619:	e8 b5 32 00 00       	call   48d3 <exit>
    printf(stdout, "read failed\n");
    161e:	52                   	push   %edx
    161f:	52                   	push   %edx
    1620:	68 7d 52 00 00       	push   $0x527d
    1625:	ff 35 68 6e 00 00    	push   0x6e68
    162b:	e8 20 34 00 00       	call   4a50 <printf>
    exit();
    1630:	e8 9e 32 00 00       	call   48d3 <exit>
    printf(stdout, "unlink small failed\n");
    1635:	50                   	push   %eax
    1636:	50                   	push   %eax
    1637:	68 64 4f 00 00       	push   $0x4f64
    163c:	ff 35 68 6e 00 00    	push   0x6e68
    1642:	e8 09 34 00 00       	call   4a50 <printf>
    exit();
    1647:	e8 87 32 00 00       	call   48d3 <exit>
    printf(stdout, "error: creat small failed!\n");
    164c:	50                   	push   %eax
    164d:	50                   	push   %eax
    164e:	68 e0 4e 00 00       	push   $0x4ee0
    1653:	ff 35 68 6e 00 00    	push   0x6e68
    1659:	e8 f2 33 00 00       	call   4a50 <printf>
    exit();
    165e:	e8 70 32 00 00       	call   48d3 <exit>
    1663:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    166a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001670 <writetest1>:
{
    1670:	55                   	push   %ebp
    1671:	89 e5                	mov    %esp,%ebp
    1673:	56                   	push   %esi
    1674:	53                   	push   %ebx
  printf(stdout, "big files test\n");
    1675:	83 ec 08             	sub    $0x8,%esp
    1678:	68 8d 4f 00 00       	push   $0x4f8d
    167d:	ff 35 68 6e 00 00    	push   0x6e68
    1683:	e8 c8 33 00 00       	call   4a50 <printf>
  fd = open("big", O_CREATE|O_RDWR);
    1688:	58                   	pop    %eax
    1689:	5a                   	pop    %edx
    168a:	68 02 02 00 00       	push   $0x202
    168f:	68 07 50 00 00       	push   $0x5007
    1694:	e8 7a 32 00 00       	call   4913 <open>
  if(fd < 0){
    1699:	83 c4 10             	add    $0x10,%esp
    169c:	85 c0                	test   %eax,%eax
    169e:	0f 88 61 01 00 00    	js     1805 <writetest1+0x195>
    16a4:	89 c6                	mov    %eax,%esi
  for(i = 0; i < MAXFILE; i++){
    16a6:	31 db                	xor    %ebx,%ebx
    16a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    16af:	90                   	nop
    if(write(fd, buf, 512) != 512){
    16b0:	83 ec 04             	sub    $0x4,%esp
    ((int*)buf)[0] = i;
    16b3:	89 1d a0 95 00 00    	mov    %ebx,0x95a0
    if(write(fd, buf, 512) != 512){
    16b9:	68 00 02 00 00       	push   $0x200
    16be:	68 a0 95 00 00       	push   $0x95a0
    16c3:	56                   	push   %esi
    16c4:	e8 2a 32 00 00       	call   48f3 <write>
    16c9:	83 c4 10             	add    $0x10,%esp
    16cc:	3d 00 02 00 00       	cmp    $0x200,%eax
    16d1:	0f 85 b3 00 00 00    	jne    178a <writetest1+0x11a>
  for(i = 0; i < MAXFILE; i++){
    16d7:	83 c3 01             	add    $0x1,%ebx
    16da:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
    16e0:	75 ce                	jne    16b0 <writetest1+0x40>
  close(fd);
    16e2:	83 ec 0c             	sub    $0xc,%esp
    16e5:	56                   	push   %esi
    16e6:	e8 10 32 00 00       	call   48fb <close>
  fd = open("big", O_RDONLY);
    16eb:	5b                   	pop    %ebx
    16ec:	5e                   	pop    %esi
    16ed:	6a 00                	push   $0x0
    16ef:	68 07 50 00 00       	push   $0x5007
    16f4:	e8 1a 32 00 00       	call   4913 <open>
  if(fd < 0){
    16f9:	83 c4 10             	add    $0x10,%esp
  fd = open("big", O_RDONLY);
    16fc:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    16fe:	85 c0                	test   %eax,%eax
    1700:	0f 88 e8 00 00 00    	js     17ee <writetest1+0x17e>
  n = 0;
    1706:	31 f6                	xor    %esi,%esi
    1708:	eb 1d                	jmp    1727 <writetest1+0xb7>
    170a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(i != 512){
    1710:	3d 00 02 00 00       	cmp    $0x200,%eax
    1715:	0f 85 9f 00 00 00    	jne    17ba <writetest1+0x14a>
    if(((int*)buf)[0] != n){
    171b:	a1 a0 95 00 00       	mov    0x95a0,%eax
    1720:	39 f0                	cmp    %esi,%eax
    1722:	75 7f                	jne    17a3 <writetest1+0x133>
    n++;
    1724:	83 c6 01             	add    $0x1,%esi
    i = read(fd, buf, 512);
    1727:	83 ec 04             	sub    $0x4,%esp
    172a:	68 00 02 00 00       	push   $0x200
    172f:	68 a0 95 00 00       	push   $0x95a0
    1734:	53                   	push   %ebx
    1735:	e8 b1 31 00 00       	call   48eb <read>
    if(i == 0){
    173a:	83 c4 10             	add    $0x10,%esp
    173d:	85 c0                	test   %eax,%eax
    173f:	75 cf                	jne    1710 <writetest1+0xa0>
      if(n == MAXFILE - 1){
    1741:	81 fe 8b 00 00 00    	cmp    $0x8b,%esi
    1747:	0f 84 86 00 00 00    	je     17d3 <writetest1+0x163>
  close(fd);
    174d:	83 ec 0c             	sub    $0xc,%esp
    1750:	53                   	push   %ebx
    1751:	e8 a5 31 00 00       	call   48fb <close>
  if(unlink("big") < 0){
    1756:	c7 04 24 07 50 00 00 	movl   $0x5007,(%esp)
    175d:	e8 c1 31 00 00       	call   4923 <unlink>
    1762:	83 c4 10             	add    $0x10,%esp
    1765:	85 c0                	test   %eax,%eax
    1767:	0f 88 af 00 00 00    	js     181c <writetest1+0x1ac>
  printf(stdout, "big files ok\n");
    176d:	83 ec 08             	sub    $0x8,%esp
    1770:	68 2e 50 00 00       	push   $0x502e
    1775:	ff 35 68 6e 00 00    	push   0x6e68
    177b:	e8 d0 32 00 00       	call   4a50 <printf>
}
    1780:	83 c4 10             	add    $0x10,%esp
    1783:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1786:	5b                   	pop    %ebx
    1787:	5e                   	pop    %esi
    1788:	5d                   	pop    %ebp
    1789:	c3                   	ret    
      printf(stdout, "error: write big file failed\n", i);
    178a:	83 ec 04             	sub    $0x4,%esp
    178d:	53                   	push   %ebx
    178e:	68 b7 4f 00 00       	push   $0x4fb7
    1793:	ff 35 68 6e 00 00    	push   0x6e68
    1799:	e8 b2 32 00 00       	call   4a50 <printf>
      exit();
    179e:	e8 30 31 00 00       	call   48d3 <exit>
      printf(stdout, "read content of block %d is %d\n",
    17a3:	50                   	push   %eax
    17a4:	56                   	push   %esi
    17a5:	68 08 5e 00 00       	push   $0x5e08
    17aa:	ff 35 68 6e 00 00    	push   0x6e68
    17b0:	e8 9b 32 00 00       	call   4a50 <printf>
      exit();
    17b5:	e8 19 31 00 00       	call   48d3 <exit>
      printf(stdout, "read failed %d\n", i);
    17ba:	83 ec 04             	sub    $0x4,%esp
    17bd:	50                   	push   %eax
    17be:	68 0b 50 00 00       	push   $0x500b
    17c3:	ff 35 68 6e 00 00    	push   0x6e68
    17c9:	e8 82 32 00 00       	call   4a50 <printf>
      exit();
    17ce:	e8 00 31 00 00       	call   48d3 <exit>
        printf(stdout, "read only %d blocks from big", n);
    17d3:	52                   	push   %edx
    17d4:	68 8b 00 00 00       	push   $0x8b
    17d9:	68 ee 4f 00 00       	push   $0x4fee
    17de:	ff 35 68 6e 00 00    	push   0x6e68
    17e4:	e8 67 32 00 00       	call   4a50 <printf>
        exit();
    17e9:	e8 e5 30 00 00       	call   48d3 <exit>
    printf(stdout, "error: open big failed!\n");
    17ee:	51                   	push   %ecx
    17ef:	51                   	push   %ecx
    17f0:	68 d5 4f 00 00       	push   $0x4fd5
    17f5:	ff 35 68 6e 00 00    	push   0x6e68
    17fb:	e8 50 32 00 00       	call   4a50 <printf>
    exit();
    1800:	e8 ce 30 00 00       	call   48d3 <exit>
    printf(stdout, "error: creat big failed!\n");
    1805:	50                   	push   %eax
    1806:	50                   	push   %eax
    1807:	68 9d 4f 00 00       	push   $0x4f9d
    180c:	ff 35 68 6e 00 00    	push   0x6e68
    1812:	e8 39 32 00 00       	call   4a50 <printf>
    exit();
    1817:	e8 b7 30 00 00       	call   48d3 <exit>
    printf(stdout, "unlink big failed\n");
    181c:	50                   	push   %eax
    181d:	50                   	push   %eax
    181e:	68 1b 50 00 00       	push   $0x501b
    1823:	ff 35 68 6e 00 00    	push   0x6e68
    1829:	e8 22 32 00 00       	call   4a50 <printf>
    exit();
    182e:	e8 a0 30 00 00       	call   48d3 <exit>
    1833:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    183a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001840 <createtest>:
{
    1840:	55                   	push   %ebp
    1841:	89 e5                	mov    %esp,%ebp
    1843:	53                   	push   %ebx
  name[2] = '\0';
    1844:	bb 30 00 00 00       	mov    $0x30,%ebx
{
    1849:	83 ec 0c             	sub    $0xc,%esp
  printf(stdout, "many creates, followed by unlink test\n");
    184c:	68 28 5e 00 00       	push   $0x5e28
    1851:	ff 35 68 6e 00 00    	push   0x6e68
    1857:	e8 f4 31 00 00       	call   4a50 <printf>
  name[0] = 'a';
    185c:	c6 05 90 95 00 00 61 	movb   $0x61,0x9590
  name[2] = '\0';
    1863:	83 c4 10             	add    $0x10,%esp
    1866:	c6 05 92 95 00 00 00 	movb   $0x0,0x9592
  for(i = 0; i < 52; i++){
    186d:	8d 76 00             	lea    0x0(%esi),%esi
    fd = open(name, O_CREATE|O_RDWR);
    1870:	83 ec 08             	sub    $0x8,%esp
    name[1] = '0' + i;
    1873:	88 1d 91 95 00 00    	mov    %bl,0x9591
  for(i = 0; i < 52; i++){
    1879:	83 c3 01             	add    $0x1,%ebx
    fd = open(name, O_CREATE|O_RDWR);
    187c:	68 02 02 00 00       	push   $0x202
    1881:	68 90 95 00 00       	push   $0x9590
    1886:	e8 88 30 00 00       	call   4913 <open>
    close(fd);
    188b:	89 04 24             	mov    %eax,(%esp)
    188e:	e8 68 30 00 00       	call   48fb <close>
  for(i = 0; i < 52; i++){
    1893:	83 c4 10             	add    $0x10,%esp
    1896:	80 fb 64             	cmp    $0x64,%bl
    1899:	75 d5                	jne    1870 <createtest+0x30>
  name[0] = 'a';
    189b:	c6 05 90 95 00 00 61 	movb   $0x61,0x9590
  name[2] = '\0';
    18a2:	bb 30 00 00 00       	mov    $0x30,%ebx
    18a7:	c6 05 92 95 00 00 00 	movb   $0x0,0x9592
  for(i = 0; i < 52; i++){
    18ae:	66 90                	xchg   %ax,%ax
    unlink(name);
    18b0:	83 ec 0c             	sub    $0xc,%esp
    name[1] = '0' + i;
    18b3:	88 1d 91 95 00 00    	mov    %bl,0x9591
  for(i = 0; i < 52; i++){
    18b9:	83 c3 01             	add    $0x1,%ebx
    unlink(name);
    18bc:	68 90 95 00 00       	push   $0x9590
    18c1:	e8 5d 30 00 00       	call   4923 <unlink>
  for(i = 0; i < 52; i++){
    18c6:	83 c4 10             	add    $0x10,%esp
    18c9:	80 fb 64             	cmp    $0x64,%bl
    18cc:	75 e2                	jne    18b0 <createtest+0x70>
  printf(stdout, "many creates, followed by unlink; ok\n");
    18ce:	83 ec 08             	sub    $0x8,%esp
    18d1:	68 50 5e 00 00       	push   $0x5e50
    18d6:	ff 35 68 6e 00 00    	push   0x6e68
    18dc:	e8 6f 31 00 00       	call   4a50 <printf>
}
    18e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    18e4:	83 c4 10             	add    $0x10,%esp
    18e7:	c9                   	leave  
    18e8:	c3                   	ret    
    18e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000018f0 <dirtest>:
{
    18f0:	55                   	push   %ebp
    18f1:	89 e5                	mov    %esp,%ebp
    18f3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "mkdir test\n");
    18f6:	68 3c 50 00 00       	push   $0x503c
    18fb:	ff 35 68 6e 00 00    	push   0x6e68
    1901:	e8 4a 31 00 00       	call   4a50 <printf>
  if(mkdir("dir0") < 0){
    1906:	c7 04 24 48 50 00 00 	movl   $0x5048,(%esp)
    190d:	e8 29 30 00 00       	call   493b <mkdir>
    1912:	83 c4 10             	add    $0x10,%esp
    1915:	85 c0                	test   %eax,%eax
    1917:	78 58                	js     1971 <dirtest+0x81>
  if(chdir("dir0") < 0){
    1919:	83 ec 0c             	sub    $0xc,%esp
    191c:	68 48 50 00 00       	push   $0x5048
    1921:	e8 1d 30 00 00       	call   4943 <chdir>
    1926:	83 c4 10             	add    $0x10,%esp
    1929:	85 c0                	test   %eax,%eax
    192b:	0f 88 85 00 00 00    	js     19b6 <dirtest+0xc6>
  if(chdir("..") < 0){
    1931:	83 ec 0c             	sub    $0xc,%esp
    1934:	68 ed 55 00 00       	push   $0x55ed
    1939:	e8 05 30 00 00       	call   4943 <chdir>
    193e:	83 c4 10             	add    $0x10,%esp
    1941:	85 c0                	test   %eax,%eax
    1943:	78 5a                	js     199f <dirtest+0xaf>
  if(unlink("dir0") < 0){
    1945:	83 ec 0c             	sub    $0xc,%esp
    1948:	68 48 50 00 00       	push   $0x5048
    194d:	e8 d1 2f 00 00       	call   4923 <unlink>
    1952:	83 c4 10             	add    $0x10,%esp
    1955:	85 c0                	test   %eax,%eax
    1957:	78 2f                	js     1988 <dirtest+0x98>
  printf(stdout, "mkdir test ok\n");
    1959:	83 ec 08             	sub    $0x8,%esp
    195c:	68 85 50 00 00       	push   $0x5085
    1961:	ff 35 68 6e 00 00    	push   0x6e68
    1967:	e8 e4 30 00 00       	call   4a50 <printf>
}
    196c:	83 c4 10             	add    $0x10,%esp
    196f:	c9                   	leave  
    1970:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
    1971:	50                   	push   %eax
    1972:	50                   	push   %eax
    1973:	68 78 4d 00 00       	push   $0x4d78
    1978:	ff 35 68 6e 00 00    	push   0x6e68
    197e:	e8 cd 30 00 00       	call   4a50 <printf>
    exit();
    1983:	e8 4b 2f 00 00       	call   48d3 <exit>
    printf(stdout, "unlink dir0 failed\n");
    1988:	50                   	push   %eax
    1989:	50                   	push   %eax
    198a:	68 71 50 00 00       	push   $0x5071
    198f:	ff 35 68 6e 00 00    	push   0x6e68
    1995:	e8 b6 30 00 00       	call   4a50 <printf>
    exit();
    199a:	e8 34 2f 00 00       	call   48d3 <exit>
    printf(stdout, "chdir .. failed\n");
    199f:	52                   	push   %edx
    19a0:	52                   	push   %edx
    19a1:	68 60 50 00 00       	push   $0x5060
    19a6:	ff 35 68 6e 00 00    	push   0x6e68
    19ac:	e8 9f 30 00 00       	call   4a50 <printf>
    exit();
    19b1:	e8 1d 2f 00 00       	call   48d3 <exit>
    printf(stdout, "chdir dir0 failed\n");
    19b6:	51                   	push   %ecx
    19b7:	51                   	push   %ecx
    19b8:	68 4d 50 00 00       	push   $0x504d
    19bd:	ff 35 68 6e 00 00    	push   0x6e68
    19c3:	e8 88 30 00 00       	call   4a50 <printf>
    exit();
    19c8:	e8 06 2f 00 00       	call   48d3 <exit>
    19cd:	8d 76 00             	lea    0x0(%esi),%esi

000019d0 <exectest>:
{
    19d0:	55                   	push   %ebp
    19d1:	89 e5                	mov    %esp,%ebp
    19d3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exec test\n");
    19d6:	68 94 50 00 00       	push   $0x5094
    19db:	ff 35 68 6e 00 00    	push   0x6e68
    19e1:	e8 6a 30 00 00       	call   4a50 <printf>
  if(exec("echo", echoargv) < 0){
    19e6:	5a                   	pop    %edx
    19e7:	59                   	pop    %ecx
    19e8:	68 6c 6e 00 00       	push   $0x6e6c
    19ed:	68 5d 4e 00 00       	push   $0x4e5d
    19f2:	e8 14 2f 00 00       	call   490b <exec>
    19f7:	83 c4 10             	add    $0x10,%esp
    19fa:	85 c0                	test   %eax,%eax
    19fc:	78 02                	js     1a00 <exectest+0x30>
}
    19fe:	c9                   	leave  
    19ff:	c3                   	ret    
    printf(stdout, "exec echo failed\n");
    1a00:	50                   	push   %eax
    1a01:	50                   	push   %eax
    1a02:	68 9f 50 00 00       	push   $0x509f
    1a07:	ff 35 68 6e 00 00    	push   0x6e68
    1a0d:	e8 3e 30 00 00       	call   4a50 <printf>
    exit();
    1a12:	e8 bc 2e 00 00       	call   48d3 <exit>
    1a17:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1a1e:	66 90                	xchg   %ax,%ax

00001a20 <pipe1>:
{
    1a20:	55                   	push   %ebp
    1a21:	89 e5                	mov    %esp,%ebp
    1a23:	57                   	push   %edi
    1a24:	56                   	push   %esi
  if(pipe(fds) != 0){
    1a25:	8d 45 e0             	lea    -0x20(%ebp),%eax
{
    1a28:	53                   	push   %ebx
    1a29:	83 ec 38             	sub    $0x38,%esp
  if(pipe(fds) != 0){
    1a2c:	50                   	push   %eax
    1a2d:	e8 b1 2e 00 00       	call   48e3 <pipe>
    1a32:	83 c4 10             	add    $0x10,%esp
    1a35:	85 c0                	test   %eax,%eax
    1a37:	0f 85 34 01 00 00    	jne    1b71 <pipe1+0x151>
  pid = fork();
    1a3d:	e8 89 2e 00 00       	call   48cb <fork>
  if(pid == 0){
    1a42:	85 c0                	test   %eax,%eax
    1a44:	0f 84 85 00 00 00    	je     1acf <pipe1+0xaf>
  } else if(pid > 0){
    1a4a:	0f 8e 34 01 00 00    	jle    1b84 <pipe1+0x164>
    close(fds[1]);
    1a50:	83 ec 0c             	sub    $0xc,%esp
    1a53:	ff 75 e4             	push   -0x1c(%ebp)
  seq = 0;
    1a56:	31 db                	xor    %ebx,%ebx
    cc = 1;
    1a58:	be 01 00 00 00       	mov    $0x1,%esi
    close(fds[1]);
    1a5d:	e8 99 2e 00 00       	call   48fb <close>
    total = 0;
    1a62:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    while((n = read(fds[0], buf, cc)) > 0){
    1a69:	83 c4 10             	add    $0x10,%esp
    1a6c:	83 ec 04             	sub    $0x4,%esp
    1a6f:	56                   	push   %esi
    1a70:	68 a0 95 00 00       	push   $0x95a0
    1a75:	ff 75 e0             	push   -0x20(%ebp)
    1a78:	e8 6e 2e 00 00       	call   48eb <read>
    1a7d:	83 c4 10             	add    $0x10,%esp
    1a80:	89 c7                	mov    %eax,%edi
    1a82:	85 c0                	test   %eax,%eax
    1a84:	0f 8e a3 00 00 00    	jle    1b2d <pipe1+0x10d>
    1a8a:	8d 0c 1f             	lea    (%edi,%ebx,1),%ecx
      for(i = 0; i < n; i++){
    1a8d:	31 c0                	xor    %eax,%eax
    1a8f:	90                   	nop
        if((buf[i] & 0xff) != (seq++ & 0xff)){
    1a90:	89 da                	mov    %ebx,%edx
    1a92:	83 c3 01             	add    $0x1,%ebx
    1a95:	38 90 a0 95 00 00    	cmp    %dl,0x95a0(%eax)
    1a9b:	75 18                	jne    1ab5 <pipe1+0x95>
      for(i = 0; i < n; i++){
    1a9d:	83 c0 01             	add    $0x1,%eax
    1aa0:	39 d9                	cmp    %ebx,%ecx
    1aa2:	75 ec                	jne    1a90 <pipe1+0x70>
      cc = cc * 2;
    1aa4:	01 f6                	add    %esi,%esi
    1aa6:	b8 00 20 00 00       	mov    $0x2000,%eax
      total += n;
    1aab:	01 7d d4             	add    %edi,-0x2c(%ebp)
    1aae:	39 c6                	cmp    %eax,%esi
    1ab0:	0f 4f f0             	cmovg  %eax,%esi
    1ab3:	eb b7                	jmp    1a6c <pipe1+0x4c>
          printf(1, "pipe1 oops 2\n");
    1ab5:	83 ec 08             	sub    $0x8,%esp
    1ab8:	68 ce 50 00 00       	push   $0x50ce
    1abd:	6a 01                	push   $0x1
    1abf:	e8 8c 2f 00 00       	call   4a50 <printf>
    1ac4:	83 c4 10             	add    $0x10,%esp
}
    1ac7:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1aca:	5b                   	pop    %ebx
    1acb:	5e                   	pop    %esi
    1acc:	5f                   	pop    %edi
    1acd:	5d                   	pop    %ebp
    1ace:	c3                   	ret    
    close(fds[0]);
    1acf:	83 ec 0c             	sub    $0xc,%esp
    1ad2:	ff 75 e0             	push   -0x20(%ebp)
  seq = 0;
    1ad5:	31 db                	xor    %ebx,%ebx
    close(fds[0]);
    1ad7:	e8 1f 2e 00 00       	call   48fb <close>
    1adc:	83 c4 10             	add    $0x10,%esp
      for(i = 0; i < 1033; i++)
    1adf:	31 c0                	xor    %eax,%eax
    1ae1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        buf[i] = seq++;
    1ae8:	8d 14 18             	lea    (%eax,%ebx,1),%edx
      for(i = 0; i < 1033; i++)
    1aeb:	83 c0 01             	add    $0x1,%eax
        buf[i] = seq++;
    1aee:	88 90 9f 95 00 00    	mov    %dl,0x959f(%eax)
      for(i = 0; i < 1033; i++)
    1af4:	3d 09 04 00 00       	cmp    $0x409,%eax
    1af9:	75 ed                	jne    1ae8 <pipe1+0xc8>
      if(write(fds[1], buf, 1033) != 1033){
    1afb:	83 ec 04             	sub    $0x4,%esp
        buf[i] = seq++;
    1afe:	81 c3 09 04 00 00    	add    $0x409,%ebx
      if(write(fds[1], buf, 1033) != 1033){
    1b04:	68 09 04 00 00       	push   $0x409
    1b09:	68 a0 95 00 00       	push   $0x95a0
    1b0e:	ff 75 e4             	push   -0x1c(%ebp)
    1b11:	e8 dd 2d 00 00       	call   48f3 <write>
    1b16:	83 c4 10             	add    $0x10,%esp
    1b19:	3d 09 04 00 00       	cmp    $0x409,%eax
    1b1e:	75 77                	jne    1b97 <pipe1+0x177>
    for(n = 0; n < 5; n++){
    1b20:	81 fb 2d 14 00 00    	cmp    $0x142d,%ebx
    1b26:	75 b7                	jne    1adf <pipe1+0xbf>
    exit();
    1b28:	e8 a6 2d 00 00       	call   48d3 <exit>
    if(total != 5 * 1033){
    1b2d:	81 7d d4 2d 14 00 00 	cmpl   $0x142d,-0x2c(%ebp)
    1b34:	75 26                	jne    1b5c <pipe1+0x13c>
    close(fds[0]);
    1b36:	83 ec 0c             	sub    $0xc,%esp
    1b39:	ff 75 e0             	push   -0x20(%ebp)
    1b3c:	e8 ba 2d 00 00       	call   48fb <close>
    wait();
    1b41:	e8 95 2d 00 00       	call   48db <wait>
  printf(1, "pipe1 ok\n");
    1b46:	5a                   	pop    %edx
    1b47:	59                   	pop    %ecx
    1b48:	68 f3 50 00 00       	push   $0x50f3
    1b4d:	6a 01                	push   $0x1
    1b4f:	e8 fc 2e 00 00       	call   4a50 <printf>
    1b54:	83 c4 10             	add    $0x10,%esp
    1b57:	e9 6b ff ff ff       	jmp    1ac7 <pipe1+0xa7>
      printf(1, "pipe1 oops 3 total %d\n", total);
    1b5c:	53                   	push   %ebx
    1b5d:	ff 75 d4             	push   -0x2c(%ebp)
    1b60:	68 dc 50 00 00       	push   $0x50dc
    1b65:	6a 01                	push   $0x1
    1b67:	e8 e4 2e 00 00       	call   4a50 <printf>
      exit();
    1b6c:	e8 62 2d 00 00       	call   48d3 <exit>
    printf(1, "pipe() failed\n");
    1b71:	57                   	push   %edi
    1b72:	57                   	push   %edi
    1b73:	68 b1 50 00 00       	push   $0x50b1
    1b78:	6a 01                	push   $0x1
    1b7a:	e8 d1 2e 00 00       	call   4a50 <printf>
    exit();
    1b7f:	e8 4f 2d 00 00       	call   48d3 <exit>
    printf(1, "fork() failed\n");
    1b84:	50                   	push   %eax
    1b85:	50                   	push   %eax
    1b86:	68 fd 50 00 00       	push   $0x50fd
    1b8b:	6a 01                	push   $0x1
    1b8d:	e8 be 2e 00 00       	call   4a50 <printf>
    exit();
    1b92:	e8 3c 2d 00 00       	call   48d3 <exit>
        printf(1, "pipe1 oops 1\n");
    1b97:	56                   	push   %esi
    1b98:	56                   	push   %esi
    1b99:	68 c0 50 00 00       	push   $0x50c0
    1b9e:	6a 01                	push   $0x1
    1ba0:	e8 ab 2e 00 00       	call   4a50 <printf>
        exit();
    1ba5:	e8 29 2d 00 00       	call   48d3 <exit>
    1baa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001bb0 <preempt>:
{
    1bb0:	55                   	push   %ebp
    1bb1:	89 e5                	mov    %esp,%ebp
    1bb3:	57                   	push   %edi
    1bb4:	56                   	push   %esi
    1bb5:	53                   	push   %ebx
    1bb6:	83 ec 24             	sub    $0x24,%esp
  printf(1, "preempt: ");
    1bb9:	68 0c 51 00 00       	push   $0x510c
    1bbe:	6a 01                	push   $0x1
    1bc0:	e8 8b 2e 00 00       	call   4a50 <printf>
  pid1 = fork();
    1bc5:	e8 01 2d 00 00       	call   48cb <fork>
  if(pid1 == 0)
    1bca:	83 c4 10             	add    $0x10,%esp
    1bcd:	85 c0                	test   %eax,%eax
    1bcf:	75 07                	jne    1bd8 <preempt+0x28>
    for(;;)
    1bd1:	eb fe                	jmp    1bd1 <preempt+0x21>
    1bd3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1bd7:	90                   	nop
    1bd8:	89 c3                	mov    %eax,%ebx
  pid2 = fork();
    1bda:	e8 ec 2c 00 00       	call   48cb <fork>
    1bdf:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
    1be1:	85 c0                	test   %eax,%eax
    1be3:	75 0b                	jne    1bf0 <preempt+0x40>
    for(;;)
    1be5:	eb fe                	jmp    1be5 <preempt+0x35>
    1be7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1bee:	66 90                	xchg   %ax,%ax
  pipe(pfds);
    1bf0:	83 ec 0c             	sub    $0xc,%esp
    1bf3:	8d 45 e0             	lea    -0x20(%ebp),%eax
    1bf6:	50                   	push   %eax
    1bf7:	e8 e7 2c 00 00       	call   48e3 <pipe>
  pid3 = fork();
    1bfc:	e8 ca 2c 00 00       	call   48cb <fork>
  if(pid3 == 0){
    1c01:	83 c4 10             	add    $0x10,%esp
  pid3 = fork();
    1c04:	89 c7                	mov    %eax,%edi
  if(pid3 == 0){
    1c06:	85 c0                	test   %eax,%eax
    1c08:	75 3e                	jne    1c48 <preempt+0x98>
    close(pfds[0]);
    1c0a:	83 ec 0c             	sub    $0xc,%esp
    1c0d:	ff 75 e0             	push   -0x20(%ebp)
    1c10:	e8 e6 2c 00 00       	call   48fb <close>
    if(write(pfds[1], "x", 1) != 1)
    1c15:	83 c4 0c             	add    $0xc,%esp
    1c18:	6a 01                	push   $0x1
    1c1a:	68 d1 56 00 00       	push   $0x56d1
    1c1f:	ff 75 e4             	push   -0x1c(%ebp)
    1c22:	e8 cc 2c 00 00       	call   48f3 <write>
    1c27:	83 c4 10             	add    $0x10,%esp
    1c2a:	83 f8 01             	cmp    $0x1,%eax
    1c2d:	0f 85 b8 00 00 00    	jne    1ceb <preempt+0x13b>
    close(pfds[1]);
    1c33:	83 ec 0c             	sub    $0xc,%esp
    1c36:	ff 75 e4             	push   -0x1c(%ebp)
    1c39:	e8 bd 2c 00 00       	call   48fb <close>
    1c3e:	83 c4 10             	add    $0x10,%esp
    for(;;)
    1c41:	eb fe                	jmp    1c41 <preempt+0x91>
    1c43:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1c47:	90                   	nop
  close(pfds[1]);
    1c48:	83 ec 0c             	sub    $0xc,%esp
    1c4b:	ff 75 e4             	push   -0x1c(%ebp)
    1c4e:	e8 a8 2c 00 00       	call   48fb <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
    1c53:	83 c4 0c             	add    $0xc,%esp
    1c56:	68 00 20 00 00       	push   $0x2000
    1c5b:	68 a0 95 00 00       	push   $0x95a0
    1c60:	ff 75 e0             	push   -0x20(%ebp)
    1c63:	e8 83 2c 00 00       	call   48eb <read>
    1c68:	83 c4 10             	add    $0x10,%esp
    1c6b:	83 f8 01             	cmp    $0x1,%eax
    1c6e:	75 67                	jne    1cd7 <preempt+0x127>
  close(pfds[0]);
    1c70:	83 ec 0c             	sub    $0xc,%esp
    1c73:	ff 75 e0             	push   -0x20(%ebp)
    1c76:	e8 80 2c 00 00       	call   48fb <close>
  printf(1, "kill... ");
    1c7b:	58                   	pop    %eax
    1c7c:	5a                   	pop    %edx
    1c7d:	68 3d 51 00 00       	push   $0x513d
    1c82:	6a 01                	push   $0x1
    1c84:	e8 c7 2d 00 00       	call   4a50 <printf>
  kill(pid1);
    1c89:	89 1c 24             	mov    %ebx,(%esp)
    1c8c:	e8 72 2c 00 00       	call   4903 <kill>
  kill(pid2);
    1c91:	89 34 24             	mov    %esi,(%esp)
    1c94:	e8 6a 2c 00 00       	call   4903 <kill>
  kill(pid3);
    1c99:	89 3c 24             	mov    %edi,(%esp)
    1c9c:	e8 62 2c 00 00       	call   4903 <kill>
  printf(1, "wait... ");
    1ca1:	59                   	pop    %ecx
    1ca2:	5b                   	pop    %ebx
    1ca3:	68 46 51 00 00       	push   $0x5146
    1ca8:	6a 01                	push   $0x1
    1caa:	e8 a1 2d 00 00       	call   4a50 <printf>
  wait();
    1caf:	e8 27 2c 00 00       	call   48db <wait>
  wait();
    1cb4:	e8 22 2c 00 00       	call   48db <wait>
  wait();
    1cb9:	e8 1d 2c 00 00       	call   48db <wait>
  printf(1, "preempt ok\n");
    1cbe:	5e                   	pop    %esi
    1cbf:	5f                   	pop    %edi
    1cc0:	68 4f 51 00 00       	push   $0x514f
    1cc5:	6a 01                	push   $0x1
    1cc7:	e8 84 2d 00 00       	call   4a50 <printf>
    1ccc:	83 c4 10             	add    $0x10,%esp
}
    1ccf:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1cd2:	5b                   	pop    %ebx
    1cd3:	5e                   	pop    %esi
    1cd4:	5f                   	pop    %edi
    1cd5:	5d                   	pop    %ebp
    1cd6:	c3                   	ret    
    printf(1, "preempt read error");
    1cd7:	83 ec 08             	sub    $0x8,%esp
    1cda:	68 2a 51 00 00       	push   $0x512a
    1cdf:	6a 01                	push   $0x1
    1ce1:	e8 6a 2d 00 00       	call   4a50 <printf>
    1ce6:	83 c4 10             	add    $0x10,%esp
    1ce9:	eb e4                	jmp    1ccf <preempt+0x11f>
      printf(1, "preempt write error");
    1ceb:	83 ec 08             	sub    $0x8,%esp
    1cee:	68 16 51 00 00       	push   $0x5116
    1cf3:	6a 01                	push   $0x1
    1cf5:	e8 56 2d 00 00       	call   4a50 <printf>
    1cfa:	83 c4 10             	add    $0x10,%esp
    1cfd:	e9 31 ff ff ff       	jmp    1c33 <preempt+0x83>
    1d02:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1d09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001d10 <exitwait>:
{
    1d10:	55                   	push   %ebp
    1d11:	89 e5                	mov    %esp,%ebp
    1d13:	56                   	push   %esi
    1d14:	be 64 00 00 00       	mov    $0x64,%esi
    1d19:	53                   	push   %ebx
    1d1a:	eb 14                	jmp    1d30 <exitwait+0x20>
    1d1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid){
    1d20:	74 68                	je     1d8a <exitwait+0x7a>
      if(wait() != pid){
    1d22:	e8 b4 2b 00 00       	call   48db <wait>
    1d27:	39 d8                	cmp    %ebx,%eax
    1d29:	75 2d                	jne    1d58 <exitwait+0x48>
  for(i = 0; i < 100; i++){
    1d2b:	83 ee 01             	sub    $0x1,%esi
    1d2e:	74 41                	je     1d71 <exitwait+0x61>
    pid = fork();
    1d30:	e8 96 2b 00 00       	call   48cb <fork>
    1d35:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
    1d37:	85 c0                	test   %eax,%eax
    1d39:	79 e5                	jns    1d20 <exitwait+0x10>
      printf(1, "fork failed\n");
    1d3b:	83 ec 08             	sub    $0x8,%esp
    1d3e:	68 b9 5c 00 00       	push   $0x5cb9
    1d43:	6a 01                	push   $0x1
    1d45:	e8 06 2d 00 00       	call   4a50 <printf>
      return;
    1d4a:	83 c4 10             	add    $0x10,%esp
}
    1d4d:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1d50:	5b                   	pop    %ebx
    1d51:	5e                   	pop    %esi
    1d52:	5d                   	pop    %ebp
    1d53:	c3                   	ret    
    1d54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf(1, "wait wrong pid\n");
    1d58:	83 ec 08             	sub    $0x8,%esp
    1d5b:	68 5b 51 00 00       	push   $0x515b
    1d60:	6a 01                	push   $0x1
    1d62:	e8 e9 2c 00 00       	call   4a50 <printf>
        return;
    1d67:	83 c4 10             	add    $0x10,%esp
}
    1d6a:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1d6d:	5b                   	pop    %ebx
    1d6e:	5e                   	pop    %esi
    1d6f:	5d                   	pop    %ebp
    1d70:	c3                   	ret    
  printf(1, "exitwait ok\n");
    1d71:	83 ec 08             	sub    $0x8,%esp
    1d74:	68 6b 51 00 00       	push   $0x516b
    1d79:	6a 01                	push   $0x1
    1d7b:	e8 d0 2c 00 00       	call   4a50 <printf>
    1d80:	83 c4 10             	add    $0x10,%esp
}
    1d83:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1d86:	5b                   	pop    %ebx
    1d87:	5e                   	pop    %esi
    1d88:	5d                   	pop    %ebp
    1d89:	c3                   	ret    
      exit();
    1d8a:	e8 44 2b 00 00       	call   48d3 <exit>
    1d8f:	90                   	nop

00001d90 <mem>:
{
    1d90:	55                   	push   %ebp
    1d91:	89 e5                	mov    %esp,%ebp
    1d93:	56                   	push   %esi
    1d94:	31 f6                	xor    %esi,%esi
    1d96:	53                   	push   %ebx
  printf(1, "mem test\n");
    1d97:	83 ec 08             	sub    $0x8,%esp
    1d9a:	68 78 51 00 00       	push   $0x5178
    1d9f:	6a 01                	push   $0x1
    1da1:	e8 aa 2c 00 00       	call   4a50 <printf>
  ppid = getpid();
    1da6:	e8 a8 2b 00 00       	call   4953 <getpid>
    1dab:	89 c3                	mov    %eax,%ebx
  if((pid = fork()) == 0){
    1dad:	e8 19 2b 00 00       	call   48cb <fork>
    1db2:	83 c4 10             	add    $0x10,%esp
    1db5:	85 c0                	test   %eax,%eax
    1db7:	74 0b                	je     1dc4 <mem+0x34>
    1db9:	e9 8a 00 00 00       	jmp    1e48 <mem+0xb8>
    1dbe:	66 90                	xchg   %ax,%ax
      *(char**)m2 = m1;
    1dc0:	89 30                	mov    %esi,(%eax)
    1dc2:	89 c6                	mov    %eax,%esi
    while((m2 = malloc(10001)) != 0){
    1dc4:	83 ec 0c             	sub    $0xc,%esp
    1dc7:	68 11 27 00 00       	push   $0x2711
    1dcc:	e8 af 2e 00 00       	call   4c80 <malloc>
    1dd1:	83 c4 10             	add    $0x10,%esp
    1dd4:	85 c0                	test   %eax,%eax
    1dd6:	75 e8                	jne    1dc0 <mem+0x30>
    while(m1){
    1dd8:	85 f6                	test   %esi,%esi
    1dda:	74 18                	je     1df4 <mem+0x64>
    1ddc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m2 = *(char**)m1;
    1de0:	89 f0                	mov    %esi,%eax
      free(m1);
    1de2:	83 ec 0c             	sub    $0xc,%esp
      m2 = *(char**)m1;
    1de5:	8b 36                	mov    (%esi),%esi
      free(m1);
    1de7:	50                   	push   %eax
    1de8:	e8 03 2e 00 00       	call   4bf0 <free>
    while(m1){
    1ded:	83 c4 10             	add    $0x10,%esp
    1df0:	85 f6                	test   %esi,%esi
    1df2:	75 ec                	jne    1de0 <mem+0x50>
    m1 = malloc(1024*20);
    1df4:	83 ec 0c             	sub    $0xc,%esp
    1df7:	68 00 50 00 00       	push   $0x5000
    1dfc:	e8 7f 2e 00 00       	call   4c80 <malloc>
    if(m1 == 0){
    1e01:	83 c4 10             	add    $0x10,%esp
    1e04:	85 c0                	test   %eax,%eax
    1e06:	74 20                	je     1e28 <mem+0x98>
    free(m1);
    1e08:	83 ec 0c             	sub    $0xc,%esp
    1e0b:	50                   	push   %eax
    1e0c:	e8 df 2d 00 00       	call   4bf0 <free>
    printf(1, "mem ok\n");
    1e11:	58                   	pop    %eax
    1e12:	5a                   	pop    %edx
    1e13:	68 9c 51 00 00       	push   $0x519c
    1e18:	6a 01                	push   $0x1
    1e1a:	e8 31 2c 00 00       	call   4a50 <printf>
    exit();
    1e1f:	e8 af 2a 00 00       	call   48d3 <exit>
    1e24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "couldn't allocate mem?!!\n");
    1e28:	83 ec 08             	sub    $0x8,%esp
    1e2b:	68 82 51 00 00       	push   $0x5182
    1e30:	6a 01                	push   $0x1
    1e32:	e8 19 2c 00 00       	call   4a50 <printf>
      kill(ppid);
    1e37:	89 1c 24             	mov    %ebx,(%esp)
    1e3a:	e8 c4 2a 00 00       	call   4903 <kill>
      exit();
    1e3f:	e8 8f 2a 00 00       	call   48d3 <exit>
    1e44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
}
    1e48:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1e4b:	5b                   	pop    %ebx
    1e4c:	5e                   	pop    %esi
    1e4d:	5d                   	pop    %ebp
    wait();
    1e4e:	e9 88 2a 00 00       	jmp    48db <wait>
    1e53:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1e5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001e60 <sharedfd>:
{
    1e60:	55                   	push   %ebp
    1e61:	89 e5                	mov    %esp,%ebp
    1e63:	57                   	push   %edi
    1e64:	56                   	push   %esi
    1e65:	53                   	push   %ebx
    1e66:	83 ec 34             	sub    $0x34,%esp
  printf(1, "sharedfd test\n");
    1e69:	68 a4 51 00 00       	push   $0x51a4
    1e6e:	6a 01                	push   $0x1
    1e70:	e8 db 2b 00 00       	call   4a50 <printf>
  unlink("sharedfd");
    1e75:	c7 04 24 b3 51 00 00 	movl   $0x51b3,(%esp)
    1e7c:	e8 a2 2a 00 00       	call   4923 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
    1e81:	5b                   	pop    %ebx
    1e82:	5e                   	pop    %esi
    1e83:	68 02 02 00 00       	push   $0x202
    1e88:	68 b3 51 00 00       	push   $0x51b3
    1e8d:	e8 81 2a 00 00       	call   4913 <open>
  if(fd < 0){
    1e92:	83 c4 10             	add    $0x10,%esp
    1e95:	85 c0                	test   %eax,%eax
    1e97:	0f 88 2a 01 00 00    	js     1fc7 <sharedfd+0x167>
    1e9d:	89 c7                	mov    %eax,%edi
  memset(buf, pid==0?'c':'p', sizeof(buf));
    1e9f:	8d 75 de             	lea    -0x22(%ebp),%esi
    1ea2:	bb e8 03 00 00       	mov    $0x3e8,%ebx
  pid = fork();
    1ea7:	e8 1f 2a 00 00       	call   48cb <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
    1eac:	83 f8 01             	cmp    $0x1,%eax
  pid = fork();
    1eaf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
    1eb2:	19 c0                	sbb    %eax,%eax
    1eb4:	83 ec 04             	sub    $0x4,%esp
    1eb7:	83 e0 f3             	and    $0xfffffff3,%eax
    1eba:	6a 0a                	push   $0xa
    1ebc:	83 c0 70             	add    $0x70,%eax
    1ebf:	50                   	push   %eax
    1ec0:	56                   	push   %esi
    1ec1:	e8 7a 28 00 00       	call   4740 <memset>
    1ec6:	83 c4 10             	add    $0x10,%esp
    1ec9:	eb 0a                	jmp    1ed5 <sharedfd+0x75>
    1ecb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1ecf:	90                   	nop
  for(i = 0; i < 1000; i++){
    1ed0:	83 eb 01             	sub    $0x1,%ebx
    1ed3:	74 26                	je     1efb <sharedfd+0x9b>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
    1ed5:	83 ec 04             	sub    $0x4,%esp
    1ed8:	6a 0a                	push   $0xa
    1eda:	56                   	push   %esi
    1edb:	57                   	push   %edi
    1edc:	e8 12 2a 00 00       	call   48f3 <write>
    1ee1:	83 c4 10             	add    $0x10,%esp
    1ee4:	83 f8 0a             	cmp    $0xa,%eax
    1ee7:	74 e7                	je     1ed0 <sharedfd+0x70>
      printf(1, "fstests: write sharedfd failed\n");
    1ee9:	83 ec 08             	sub    $0x8,%esp
    1eec:	68 a4 5e 00 00       	push   $0x5ea4
    1ef1:	6a 01                	push   $0x1
    1ef3:	e8 58 2b 00 00       	call   4a50 <printf>
      break;
    1ef8:	83 c4 10             	add    $0x10,%esp
  if(pid == 0)
    1efb:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    1efe:	85 c9                	test   %ecx,%ecx
    1f00:	0f 84 f5 00 00 00    	je     1ffb <sharedfd+0x19b>
    wait();
    1f06:	e8 d0 29 00 00       	call   48db <wait>
  close(fd);
    1f0b:	83 ec 0c             	sub    $0xc,%esp
  nc = np = 0;
    1f0e:	31 db                	xor    %ebx,%ebx
  close(fd);
    1f10:	57                   	push   %edi
    1f11:	8d 7d e8             	lea    -0x18(%ebp),%edi
    1f14:	e8 e2 29 00 00       	call   48fb <close>
  fd = open("sharedfd", 0);
    1f19:	58                   	pop    %eax
    1f1a:	5a                   	pop    %edx
    1f1b:	6a 00                	push   $0x0
    1f1d:	68 b3 51 00 00       	push   $0x51b3
    1f22:	e8 ec 29 00 00       	call   4913 <open>
  if(fd < 0){
    1f27:	83 c4 10             	add    $0x10,%esp
  nc = np = 0;
    1f2a:	31 d2                	xor    %edx,%edx
  fd = open("sharedfd", 0);
    1f2c:	89 45 d0             	mov    %eax,-0x30(%ebp)
  if(fd < 0){
    1f2f:	85 c0                	test   %eax,%eax
    1f31:	0f 88 aa 00 00 00    	js     1fe1 <sharedfd+0x181>
    1f37:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1f3e:	66 90                	xchg   %ax,%ax
  while((n = read(fd, buf, sizeof(buf))) > 0){
    1f40:	83 ec 04             	sub    $0x4,%esp
    1f43:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    1f46:	6a 0a                	push   $0xa
    1f48:	56                   	push   %esi
    1f49:	ff 75 d0             	push   -0x30(%ebp)
    1f4c:	e8 9a 29 00 00       	call   48eb <read>
    1f51:	83 c4 10             	add    $0x10,%esp
    1f54:	85 c0                	test   %eax,%eax
    1f56:	7e 28                	jle    1f80 <sharedfd+0x120>
    1f58:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1f5b:	89 f0                	mov    %esi,%eax
    1f5d:	eb 13                	jmp    1f72 <sharedfd+0x112>
    1f5f:	90                   	nop
        np++;
    1f60:	80 f9 70             	cmp    $0x70,%cl
    1f63:	0f 94 c1             	sete   %cl
    1f66:	0f b6 c9             	movzbl %cl,%ecx
    1f69:	01 cb                	add    %ecx,%ebx
    for(i = 0; i < sizeof(buf); i++){
    1f6b:	83 c0 01             	add    $0x1,%eax
    1f6e:	39 f8                	cmp    %edi,%eax
    1f70:	74 ce                	je     1f40 <sharedfd+0xe0>
      if(buf[i] == 'c')
    1f72:	0f b6 08             	movzbl (%eax),%ecx
    1f75:	80 f9 63             	cmp    $0x63,%cl
    1f78:	75 e6                	jne    1f60 <sharedfd+0x100>
        nc++;
    1f7a:	83 c2 01             	add    $0x1,%edx
      if(buf[i] == 'p')
    1f7d:	eb ec                	jmp    1f6b <sharedfd+0x10b>
    1f7f:	90                   	nop
  close(fd);
    1f80:	83 ec 0c             	sub    $0xc,%esp
    1f83:	ff 75 d0             	push   -0x30(%ebp)
    1f86:	e8 70 29 00 00       	call   48fb <close>
  unlink("sharedfd");
    1f8b:	c7 04 24 b3 51 00 00 	movl   $0x51b3,(%esp)
    1f92:	e8 8c 29 00 00       	call   4923 <unlink>
  if(nc == 10000 && np == 10000){
    1f97:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1f9a:	83 c4 10             	add    $0x10,%esp
    1f9d:	81 fa 10 27 00 00    	cmp    $0x2710,%edx
    1fa3:	75 5b                	jne    2000 <sharedfd+0x1a0>
    1fa5:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
    1fab:	75 53                	jne    2000 <sharedfd+0x1a0>
    printf(1, "sharedfd ok\n");
    1fad:	83 ec 08             	sub    $0x8,%esp
    1fb0:	68 bc 51 00 00       	push   $0x51bc
    1fb5:	6a 01                	push   $0x1
    1fb7:	e8 94 2a 00 00       	call   4a50 <printf>
    1fbc:	83 c4 10             	add    $0x10,%esp
}
    1fbf:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1fc2:	5b                   	pop    %ebx
    1fc3:	5e                   	pop    %esi
    1fc4:	5f                   	pop    %edi
    1fc5:	5d                   	pop    %ebp
    1fc6:	c3                   	ret    
    printf(1, "fstests: cannot open sharedfd for writing");
    1fc7:	83 ec 08             	sub    $0x8,%esp
    1fca:	68 78 5e 00 00       	push   $0x5e78
    1fcf:	6a 01                	push   $0x1
    1fd1:	e8 7a 2a 00 00       	call   4a50 <printf>
    return;
    1fd6:	83 c4 10             	add    $0x10,%esp
}
    1fd9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1fdc:	5b                   	pop    %ebx
    1fdd:	5e                   	pop    %esi
    1fde:	5f                   	pop    %edi
    1fdf:	5d                   	pop    %ebp
    1fe0:	c3                   	ret    
    printf(1, "fstests: cannot open sharedfd for reading\n");
    1fe1:	83 ec 08             	sub    $0x8,%esp
    1fe4:	68 c4 5e 00 00       	push   $0x5ec4
    1fe9:	6a 01                	push   $0x1
    1feb:	e8 60 2a 00 00       	call   4a50 <printf>
    return;
    1ff0:	83 c4 10             	add    $0x10,%esp
}
    1ff3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1ff6:	5b                   	pop    %ebx
    1ff7:	5e                   	pop    %esi
    1ff8:	5f                   	pop    %edi
    1ff9:	5d                   	pop    %ebp
    1ffa:	c3                   	ret    
    exit();
    1ffb:	e8 d3 28 00 00       	call   48d3 <exit>
    printf(1, "sharedfd oops %d %d\n", nc, np);
    2000:	53                   	push   %ebx
    2001:	52                   	push   %edx
    2002:	68 c9 51 00 00       	push   $0x51c9
    2007:	6a 01                	push   $0x1
    2009:	e8 42 2a 00 00       	call   4a50 <printf>
    exit();
    200e:	e8 c0 28 00 00       	call   48d3 <exit>
    2013:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    201a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00002020 <fourfiles>:
{
    2020:	55                   	push   %ebp
    2021:	89 e5                	mov    %esp,%ebp
    2023:	57                   	push   %edi
    2024:	56                   	push   %esi
  printf(1, "fourfiles test\n");
    2025:	be de 51 00 00       	mov    $0x51de,%esi
{
    202a:	53                   	push   %ebx
  for(pi = 0; pi < 4; pi++){
    202b:	31 db                	xor    %ebx,%ebx
{
    202d:	83 ec 34             	sub    $0x34,%esp
  char *names[] = { "f0", "f1", "f2", "f3" };
    2030:	c7 45 d8 de 51 00 00 	movl   $0x51de,-0x28(%ebp)
  printf(1, "fourfiles test\n");
    2037:	68 e4 51 00 00       	push   $0x51e4
    203c:	6a 01                	push   $0x1
  char *names[] = { "f0", "f1", "f2", "f3" };
    203e:	c7 45 dc 27 53 00 00 	movl   $0x5327,-0x24(%ebp)
    2045:	c7 45 e0 2b 53 00 00 	movl   $0x532b,-0x20(%ebp)
    204c:	c7 45 e4 e1 51 00 00 	movl   $0x51e1,-0x1c(%ebp)
  printf(1, "fourfiles test\n");
    2053:	e8 f8 29 00 00       	call   4a50 <printf>
    2058:	83 c4 10             	add    $0x10,%esp
    unlink(fname);
    205b:	83 ec 0c             	sub    $0xc,%esp
    205e:	56                   	push   %esi
    205f:	e8 bf 28 00 00       	call   4923 <unlink>
    pid = fork();
    2064:	e8 62 28 00 00       	call   48cb <fork>
    if(pid < 0){
    2069:	83 c4 10             	add    $0x10,%esp
    206c:	85 c0                	test   %eax,%eax
    206e:	0f 88 64 01 00 00    	js     21d8 <fourfiles+0x1b8>
    if(pid == 0){
    2074:	0f 84 e9 00 00 00    	je     2163 <fourfiles+0x143>
  for(pi = 0; pi < 4; pi++){
    207a:	83 c3 01             	add    $0x1,%ebx
    207d:	83 fb 04             	cmp    $0x4,%ebx
    2080:	74 06                	je     2088 <fourfiles+0x68>
    fname = names[pi];
    2082:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
    2086:	eb d3                	jmp    205b <fourfiles+0x3b>
    wait();
    2088:	e8 4e 28 00 00       	call   48db <wait>
  for(i = 0; i < 2; i++){
    208d:	31 f6                	xor    %esi,%esi
    wait();
    208f:	e8 47 28 00 00       	call   48db <wait>
    2094:	e8 42 28 00 00       	call   48db <wait>
    2099:	e8 3d 28 00 00       	call   48db <wait>
    fname = names[i];
    209e:	8b 44 b5 d8          	mov    -0x28(%ebp,%esi,4),%eax
    fd = open(fname, 0);
    20a2:	83 ec 08             	sub    $0x8,%esp
    total = 0;
    20a5:	31 db                	xor    %ebx,%ebx
    fd = open(fname, 0);
    20a7:	6a 00                	push   $0x0
    20a9:	50                   	push   %eax
    fname = names[i];
    20aa:	89 45 d0             	mov    %eax,-0x30(%ebp)
    fd = open(fname, 0);
    20ad:	e8 61 28 00 00       	call   4913 <open>
    while((n = read(fd, buf, sizeof(buf))) > 0){
    20b2:	83 c4 10             	add    $0x10,%esp
    fd = open(fname, 0);
    20b5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while((n = read(fd, buf, sizeof(buf))) > 0){
    20b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    20bf:	90                   	nop
    20c0:	83 ec 04             	sub    $0x4,%esp
    20c3:	68 00 20 00 00       	push   $0x2000
    20c8:	68 a0 95 00 00       	push   $0x95a0
    20cd:	ff 75 d4             	push   -0x2c(%ebp)
    20d0:	e8 16 28 00 00       	call   48eb <read>
    20d5:	83 c4 10             	add    $0x10,%esp
    20d8:	89 c7                	mov    %eax,%edi
    20da:	85 c0                	test   %eax,%eax
    20dc:	7e 20                	jle    20fe <fourfiles+0xde>
      for(j = 0; j < n; j++){
    20de:	31 c0                	xor    %eax,%eax
        if(buf[j] != '0'+i){
    20e0:	83 fe 01             	cmp    $0x1,%esi
    20e3:	0f be 88 a0 95 00 00 	movsbl 0x95a0(%eax),%ecx
    20ea:	19 d2                	sbb    %edx,%edx
    20ec:	83 c2 31             	add    $0x31,%edx
    20ef:	39 d1                	cmp    %edx,%ecx
    20f1:	75 5c                	jne    214f <fourfiles+0x12f>
      for(j = 0; j < n; j++){
    20f3:	83 c0 01             	add    $0x1,%eax
    20f6:	39 c7                	cmp    %eax,%edi
    20f8:	75 e6                	jne    20e0 <fourfiles+0xc0>
      total += n;
    20fa:	01 fb                	add    %edi,%ebx
    20fc:	eb c2                	jmp    20c0 <fourfiles+0xa0>
    close(fd);
    20fe:	83 ec 0c             	sub    $0xc,%esp
    2101:	ff 75 d4             	push   -0x2c(%ebp)
    2104:	e8 f2 27 00 00       	call   48fb <close>
    if(total != 12*500){
    2109:	83 c4 10             	add    $0x10,%esp
    210c:	81 fb 70 17 00 00    	cmp    $0x1770,%ebx
    2112:	0f 85 d4 00 00 00    	jne    21ec <fourfiles+0x1cc>
    unlink(fname);
    2118:	83 ec 0c             	sub    $0xc,%esp
    211b:	ff 75 d0             	push   -0x30(%ebp)
    211e:	e8 00 28 00 00       	call   4923 <unlink>
  for(i = 0; i < 2; i++){
    2123:	83 c4 10             	add    $0x10,%esp
    2126:	83 fe 01             	cmp    $0x1,%esi
    2129:	75 1a                	jne    2145 <fourfiles+0x125>
  printf(1, "fourfiles ok\n");
    212b:	83 ec 08             	sub    $0x8,%esp
    212e:	68 22 52 00 00       	push   $0x5222
    2133:	6a 01                	push   $0x1
    2135:	e8 16 29 00 00       	call   4a50 <printf>
}
    213a:	83 c4 10             	add    $0x10,%esp
    213d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2140:	5b                   	pop    %ebx
    2141:	5e                   	pop    %esi
    2142:	5f                   	pop    %edi
    2143:	5d                   	pop    %ebp
    2144:	c3                   	ret    
    2145:	be 01 00 00 00       	mov    $0x1,%esi
    214a:	e9 4f ff ff ff       	jmp    209e <fourfiles+0x7e>
          printf(1, "wrong char\n");
    214f:	83 ec 08             	sub    $0x8,%esp
    2152:	68 05 52 00 00       	push   $0x5205
    2157:	6a 01                	push   $0x1
    2159:	e8 f2 28 00 00       	call   4a50 <printf>
          exit();
    215e:	e8 70 27 00 00       	call   48d3 <exit>
      fd = open(fname, O_CREATE | O_RDWR);
    2163:	83 ec 08             	sub    $0x8,%esp
    2166:	68 02 02 00 00       	push   $0x202
    216b:	56                   	push   %esi
    216c:	e8 a2 27 00 00       	call   4913 <open>
      if(fd < 0){
    2171:	83 c4 10             	add    $0x10,%esp
      fd = open(fname, O_CREATE | O_RDWR);
    2174:	89 c6                	mov    %eax,%esi
      if(fd < 0){
    2176:	85 c0                	test   %eax,%eax
    2178:	78 45                	js     21bf <fourfiles+0x19f>
      memset(buf, '0'+pi, 512);
    217a:	83 ec 04             	sub    $0x4,%esp
    217d:	83 c3 30             	add    $0x30,%ebx
    2180:	68 00 02 00 00       	push   $0x200
    2185:	53                   	push   %ebx
    2186:	bb 0c 00 00 00       	mov    $0xc,%ebx
    218b:	68 a0 95 00 00       	push   $0x95a0
    2190:	e8 ab 25 00 00       	call   4740 <memset>
    2195:	83 c4 10             	add    $0x10,%esp
        if((n = write(fd, buf, 500)) != 500){
    2198:	83 ec 04             	sub    $0x4,%esp
    219b:	68 f4 01 00 00       	push   $0x1f4
    21a0:	68 a0 95 00 00       	push   $0x95a0
    21a5:	56                   	push   %esi
    21a6:	e8 48 27 00 00       	call   48f3 <write>
    21ab:	83 c4 10             	add    $0x10,%esp
    21ae:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    21b3:	75 4a                	jne    21ff <fourfiles+0x1df>
      for(i = 0; i < 12; i++){
    21b5:	83 eb 01             	sub    $0x1,%ebx
    21b8:	75 de                	jne    2198 <fourfiles+0x178>
      exit();
    21ba:	e8 14 27 00 00       	call   48d3 <exit>
        printf(1, "create failed\n");
    21bf:	51                   	push   %ecx
    21c0:	51                   	push   %ecx
    21c1:	68 7f 54 00 00       	push   $0x547f
    21c6:	6a 01                	push   $0x1
    21c8:	e8 83 28 00 00       	call   4a50 <printf>
        exit();
    21cd:	e8 01 27 00 00       	call   48d3 <exit>
    21d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      printf(1, "fork failed\n");
    21d8:	83 ec 08             	sub    $0x8,%esp
    21db:	68 b9 5c 00 00       	push   $0x5cb9
    21e0:	6a 01                	push   $0x1
    21e2:	e8 69 28 00 00       	call   4a50 <printf>
      exit();
    21e7:	e8 e7 26 00 00       	call   48d3 <exit>
      printf(1, "wrong length %d\n", total);
    21ec:	50                   	push   %eax
    21ed:	53                   	push   %ebx
    21ee:	68 11 52 00 00       	push   $0x5211
    21f3:	6a 01                	push   $0x1
    21f5:	e8 56 28 00 00       	call   4a50 <printf>
      exit();
    21fa:	e8 d4 26 00 00       	call   48d3 <exit>
          printf(1, "write failed %d\n", n);
    21ff:	52                   	push   %edx
    2200:	50                   	push   %eax
    2201:	68 f4 51 00 00       	push   $0x51f4
    2206:	6a 01                	push   $0x1
    2208:	e8 43 28 00 00       	call   4a50 <printf>
          exit();
    220d:	e8 c1 26 00 00       	call   48d3 <exit>
    2212:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00002220 <createdelete>:
{
    2220:	55                   	push   %ebp
    2221:	89 e5                	mov    %esp,%ebp
    2223:	57                   	push   %edi
    2224:	56                   	push   %esi
    2225:	53                   	push   %ebx
  for(pi = 0; pi < 4; pi++){
    2226:	31 db                	xor    %ebx,%ebx
{
    2228:	83 ec 44             	sub    $0x44,%esp
  printf(1, "createdelete test\n");
    222b:	68 30 52 00 00       	push   $0x5230
    2230:	6a 01                	push   $0x1
    2232:	e8 19 28 00 00       	call   4a50 <printf>
    2237:	83 c4 10             	add    $0x10,%esp
    pid = fork();
    223a:	e8 8c 26 00 00       	call   48cb <fork>
    if(pid < 0){
    223f:	85 c0                	test   %eax,%eax
    2241:	0f 88 c3 01 00 00    	js     240a <createdelete+0x1ea>
    if(pid == 0){
    2247:	0f 84 13 01 00 00    	je     2360 <createdelete+0x140>
  for(pi = 0; pi < 4; pi++){
    224d:	83 c3 01             	add    $0x1,%ebx
    2250:	83 fb 04             	cmp    $0x4,%ebx
    2253:	75 e5                	jne    223a <createdelete+0x1a>
    wait();
    2255:	e8 81 26 00 00       	call   48db <wait>
  for(i = 0; i < N; i++){
    225a:	31 f6                	xor    %esi,%esi
    225c:	8d 7d c8             	lea    -0x38(%ebp),%edi
    wait();
    225f:	e8 77 26 00 00       	call   48db <wait>
    2264:	e8 72 26 00 00       	call   48db <wait>
    2269:	e8 6d 26 00 00       	call   48db <wait>
  name[0] = name[1] = name[2] = 0;
    226e:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
  for(i = 0; i < N; i++){
    2272:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if((i == 0 || i >= N/2) && fd < 0){
    2278:	85 f6                	test   %esi,%esi
    227a:	8d 46 30             	lea    0x30(%esi),%eax
    227d:	0f 94 c3             	sete   %bl
    2280:	83 fe 09             	cmp    $0x9,%esi
    2283:	88 45 c7             	mov    %al,-0x39(%ebp)
    2286:	0f 9f c0             	setg   %al
    2289:	09 c3                	or     %eax,%ebx
      } else if((i >= 1 && i < N/2) && fd >= 0){
    228b:	8d 46 ff             	lea    -0x1(%esi),%eax
    228e:	89 45 c0             	mov    %eax,-0x40(%ebp)
      if((i == 0 || i >= N/2) && fd < 0){
    2291:	88 5d c6             	mov    %bl,-0x3a(%ebp)
    2294:	bb 70 00 00 00       	mov    $0x70,%ebx
      fd = open(name, 0);
    2299:	83 ec 08             	sub    $0x8,%esp
      name[1] = '0' + i;
    229c:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      name[0] = 'p' + pi;
    22a0:	88 5d c8             	mov    %bl,-0x38(%ebp)
      fd = open(name, 0);
    22a3:	6a 00                	push   $0x0
    22a5:	57                   	push   %edi
      name[1] = '0' + i;
    22a6:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    22a9:	e8 65 26 00 00       	call   4913 <open>
      if((i == 0 || i >= N/2) && fd < 0){
    22ae:	83 c4 10             	add    $0x10,%esp
    22b1:	80 7d c6 00          	cmpb   $0x0,-0x3a(%ebp)
    22b5:	0f 84 85 00 00 00    	je     2340 <createdelete+0x120>
    22bb:	85 c0                	test   %eax,%eax
    22bd:	0f 88 32 01 00 00    	js     23f5 <createdelete+0x1d5>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    22c3:	83 7d c0 08          	cmpl   $0x8,-0x40(%ebp)
    22c7:	76 7b                	jbe    2344 <createdelete+0x124>
        close(fd);
    22c9:	83 ec 0c             	sub    $0xc,%esp
    22cc:	50                   	push   %eax
    22cd:	e8 29 26 00 00       	call   48fb <close>
    22d2:	83 c4 10             	add    $0x10,%esp
    for(pi = 0; pi < 4; pi++){
    22d5:	83 c3 01             	add    $0x1,%ebx
    22d8:	80 fb 74             	cmp    $0x74,%bl
    22db:	75 bc                	jne    2299 <createdelete+0x79>
  for(i = 0; i < N; i++){
    22dd:	83 c6 01             	add    $0x1,%esi
    22e0:	83 fe 14             	cmp    $0x14,%esi
    22e3:	75 93                	jne    2278 <createdelete+0x58>
    22e5:	be 70 00 00 00       	mov    $0x70,%esi
    22ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    for(pi = 0; pi < 4; pi++){
    22f0:	8d 46 c0             	lea    -0x40(%esi),%eax
      name[0] = 'p' + i;
    22f3:	bb 04 00 00 00       	mov    $0x4,%ebx
    22f8:	88 45 c7             	mov    %al,-0x39(%ebp)
      unlink(name);
    22fb:	83 ec 0c             	sub    $0xc,%esp
      name[0] = 'p' + i;
    22fe:	89 f0                	mov    %esi,%eax
      unlink(name);
    2300:	57                   	push   %edi
      name[0] = 'p' + i;
    2301:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    2304:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
    2308:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    230b:	e8 13 26 00 00       	call   4923 <unlink>
    for(pi = 0; pi < 4; pi++){
    2310:	83 c4 10             	add    $0x10,%esp
    2313:	83 eb 01             	sub    $0x1,%ebx
    2316:	75 e3                	jne    22fb <createdelete+0xdb>
  for(i = 0; i < N; i++){
    2318:	83 c6 01             	add    $0x1,%esi
    231b:	89 f0                	mov    %esi,%eax
    231d:	3c 84                	cmp    $0x84,%al
    231f:	75 cf                	jne    22f0 <createdelete+0xd0>
  printf(1, "createdelete ok\n");
    2321:	83 ec 08             	sub    $0x8,%esp
    2324:	68 43 52 00 00       	push   $0x5243
    2329:	6a 01                	push   $0x1
    232b:	e8 20 27 00 00       	call   4a50 <printf>
}
    2330:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2333:	5b                   	pop    %ebx
    2334:	5e                   	pop    %esi
    2335:	5f                   	pop    %edi
    2336:	5d                   	pop    %ebp
    2337:	c3                   	ret    
    2338:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    233f:	90                   	nop
      } else if((i >= 1 && i < N/2) && fd >= 0){
    2340:	85 c0                	test   %eax,%eax
    2342:	78 91                	js     22d5 <createdelete+0xb5>
        printf(1, "oops createdelete %s did exist\n", name);
    2344:	50                   	push   %eax
    2345:	57                   	push   %edi
    2346:	68 14 5f 00 00       	push   $0x5f14
    234b:	6a 01                	push   $0x1
    234d:	e8 fe 26 00 00       	call   4a50 <printf>
        exit();
    2352:	e8 7c 25 00 00       	call   48d3 <exit>
    2357:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    235e:	66 90                	xchg   %ax,%ax
      name[0] = 'p' + pi;
    2360:	83 c3 70             	add    $0x70,%ebx
      name[2] = '\0';
    2363:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    2367:	be 01 00 00 00       	mov    $0x1,%esi
    236c:	8d 7d c8             	lea    -0x38(%ebp),%edi
      name[0] = 'p' + pi;
    236f:	88 5d c8             	mov    %bl,-0x38(%ebp)
      name[2] = '\0';
    2372:	31 db                	xor    %ebx,%ebx
    2374:	eb 15                	jmp    238b <createdelete+0x16b>
    2376:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    237d:	8d 76 00             	lea    0x0(%esi),%esi
      for(i = 0; i < N; i++){
    2380:	83 fe 14             	cmp    $0x14,%esi
    2383:	74 6b                	je     23f0 <createdelete+0x1d0>
    2385:	83 c3 01             	add    $0x1,%ebx
    2388:	83 c6 01             	add    $0x1,%esi
        fd = open(name, O_CREATE | O_RDWR);
    238b:	83 ec 08             	sub    $0x8,%esp
        name[1] = '0' + i;
    238e:	8d 43 30             	lea    0x30(%ebx),%eax
        fd = open(name, O_CREATE | O_RDWR);
    2391:	68 02 02 00 00       	push   $0x202
    2396:	57                   	push   %edi
        name[1] = '0' + i;
    2397:	88 45 c9             	mov    %al,-0x37(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    239a:	e8 74 25 00 00       	call   4913 <open>
        if(fd < 0){
    239f:	83 c4 10             	add    $0x10,%esp
    23a2:	85 c0                	test   %eax,%eax
    23a4:	78 78                	js     241e <createdelete+0x1fe>
        close(fd);
    23a6:	83 ec 0c             	sub    $0xc,%esp
    23a9:	50                   	push   %eax
    23aa:	e8 4c 25 00 00       	call   48fb <close>
        if(i > 0 && (i % 2 ) == 0){
    23af:	83 c4 10             	add    $0x10,%esp
    23b2:	85 db                	test   %ebx,%ebx
    23b4:	74 cf                	je     2385 <createdelete+0x165>
    23b6:	f6 c3 01             	test   $0x1,%bl
    23b9:	75 c5                	jne    2380 <createdelete+0x160>
          if(unlink(name) < 0){
    23bb:	83 ec 0c             	sub    $0xc,%esp
          name[1] = '0' + (i / 2);
    23be:	89 d8                	mov    %ebx,%eax
          if(unlink(name) < 0){
    23c0:	57                   	push   %edi
          name[1] = '0' + (i / 2);
    23c1:	d1 f8                	sar    %eax
    23c3:	83 c0 30             	add    $0x30,%eax
    23c6:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    23c9:	e8 55 25 00 00       	call   4923 <unlink>
    23ce:	83 c4 10             	add    $0x10,%esp
    23d1:	85 c0                	test   %eax,%eax
    23d3:	79 ab                	jns    2380 <createdelete+0x160>
            printf(1, "unlink failed\n");
    23d5:	52                   	push   %edx
    23d6:	52                   	push   %edx
    23d7:	68 31 4e 00 00       	push   $0x4e31
    23dc:	6a 01                	push   $0x1
    23de:	e8 6d 26 00 00       	call   4a50 <printf>
            exit();
    23e3:	e8 eb 24 00 00       	call   48d3 <exit>
    23e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    23ef:	90                   	nop
      exit();
    23f0:	e8 de 24 00 00       	call   48d3 <exit>
        printf(1, "oops createdelete %s didn't exist\n", name);
    23f5:	83 ec 04             	sub    $0x4,%esp
    23f8:	57                   	push   %edi
    23f9:	68 f0 5e 00 00       	push   $0x5ef0
    23fe:	6a 01                	push   $0x1
    2400:	e8 4b 26 00 00       	call   4a50 <printf>
        exit();
    2405:	e8 c9 24 00 00       	call   48d3 <exit>
      printf(1, "fork failed\n");
    240a:	83 ec 08             	sub    $0x8,%esp
    240d:	68 b9 5c 00 00       	push   $0x5cb9
    2412:	6a 01                	push   $0x1
    2414:	e8 37 26 00 00       	call   4a50 <printf>
      exit();
    2419:	e8 b5 24 00 00       	call   48d3 <exit>
          printf(1, "create failed\n");
    241e:	83 ec 08             	sub    $0x8,%esp
    2421:	68 7f 54 00 00       	push   $0x547f
    2426:	6a 01                	push   $0x1
    2428:	e8 23 26 00 00       	call   4a50 <printf>
          exit();
    242d:	e8 a1 24 00 00       	call   48d3 <exit>
    2432:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00002440 <unlinkread>:
{
    2440:	55                   	push   %ebp
    2441:	89 e5                	mov    %esp,%ebp
    2443:	56                   	push   %esi
    2444:	53                   	push   %ebx
  printf(1, "unlinkread test\n");
    2445:	83 ec 08             	sub    $0x8,%esp
    2448:	68 54 52 00 00       	push   $0x5254
    244d:	6a 01                	push   $0x1
    244f:	e8 fc 25 00 00       	call   4a50 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    2454:	5b                   	pop    %ebx
    2455:	5e                   	pop    %esi
    2456:	68 02 02 00 00       	push   $0x202
    245b:	68 65 52 00 00       	push   $0x5265
    2460:	e8 ae 24 00 00       	call   4913 <open>
  if(fd < 0){
    2465:	83 c4 10             	add    $0x10,%esp
    2468:	85 c0                	test   %eax,%eax
    246a:	0f 88 e6 00 00 00    	js     2556 <unlinkread+0x116>
  write(fd, "hello", 5);
    2470:	83 ec 04             	sub    $0x4,%esp
    2473:	89 c3                	mov    %eax,%ebx
    2475:	6a 05                	push   $0x5
    2477:	68 8a 52 00 00       	push   $0x528a
    247c:	50                   	push   %eax
    247d:	e8 71 24 00 00       	call   48f3 <write>
  close(fd);
    2482:	89 1c 24             	mov    %ebx,(%esp)
    2485:	e8 71 24 00 00       	call   48fb <close>
  fd = open("unlinkread", O_RDWR);
    248a:	58                   	pop    %eax
    248b:	5a                   	pop    %edx
    248c:	6a 02                	push   $0x2
    248e:	68 65 52 00 00       	push   $0x5265
    2493:	e8 7b 24 00 00       	call   4913 <open>
  if(fd < 0){
    2498:	83 c4 10             	add    $0x10,%esp
  fd = open("unlinkread", O_RDWR);
    249b:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    249d:	85 c0                	test   %eax,%eax
    249f:	0f 88 10 01 00 00    	js     25b5 <unlinkread+0x175>
  if(unlink("unlinkread") != 0){
    24a5:	83 ec 0c             	sub    $0xc,%esp
    24a8:	68 65 52 00 00       	push   $0x5265
    24ad:	e8 71 24 00 00       	call   4923 <unlink>
    24b2:	83 c4 10             	add    $0x10,%esp
    24b5:	85 c0                	test   %eax,%eax
    24b7:	0f 85 e5 00 00 00    	jne    25a2 <unlinkread+0x162>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    24bd:	83 ec 08             	sub    $0x8,%esp
    24c0:	68 02 02 00 00       	push   $0x202
    24c5:	68 65 52 00 00       	push   $0x5265
    24ca:	e8 44 24 00 00       	call   4913 <open>
  write(fd1, "yyy", 3);
    24cf:	83 c4 0c             	add    $0xc,%esp
    24d2:	6a 03                	push   $0x3
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    24d4:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    24d6:	68 c2 52 00 00       	push   $0x52c2
    24db:	50                   	push   %eax
    24dc:	e8 12 24 00 00       	call   48f3 <write>
  close(fd1);
    24e1:	89 34 24             	mov    %esi,(%esp)
    24e4:	e8 12 24 00 00       	call   48fb <close>
  if(read(fd, buf, sizeof(buf)) != 5){
    24e9:	83 c4 0c             	add    $0xc,%esp
    24ec:	68 00 20 00 00       	push   $0x2000
    24f1:	68 a0 95 00 00       	push   $0x95a0
    24f6:	53                   	push   %ebx
    24f7:	e8 ef 23 00 00       	call   48eb <read>
    24fc:	83 c4 10             	add    $0x10,%esp
    24ff:	83 f8 05             	cmp    $0x5,%eax
    2502:	0f 85 87 00 00 00    	jne    258f <unlinkread+0x14f>
  if(buf[0] != 'h'){
    2508:	80 3d a0 95 00 00 68 	cmpb   $0x68,0x95a0
    250f:	75 6b                	jne    257c <unlinkread+0x13c>
  if(write(fd, buf, 10) != 10){
    2511:	83 ec 04             	sub    $0x4,%esp
    2514:	6a 0a                	push   $0xa
    2516:	68 a0 95 00 00       	push   $0x95a0
    251b:	53                   	push   %ebx
    251c:	e8 d2 23 00 00       	call   48f3 <write>
    2521:	83 c4 10             	add    $0x10,%esp
    2524:	83 f8 0a             	cmp    $0xa,%eax
    2527:	75 40                	jne    2569 <unlinkread+0x129>
  close(fd);
    2529:	83 ec 0c             	sub    $0xc,%esp
    252c:	53                   	push   %ebx
    252d:	e8 c9 23 00 00       	call   48fb <close>
  unlink("unlinkread");
    2532:	c7 04 24 65 52 00 00 	movl   $0x5265,(%esp)
    2539:	e8 e5 23 00 00       	call   4923 <unlink>
  printf(1, "unlinkread ok\n");
    253e:	58                   	pop    %eax
    253f:	5a                   	pop    %edx
    2540:	68 0d 53 00 00       	push   $0x530d
    2545:	6a 01                	push   $0x1
    2547:	e8 04 25 00 00       	call   4a50 <printf>
}
    254c:	83 c4 10             	add    $0x10,%esp
    254f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    2552:	5b                   	pop    %ebx
    2553:	5e                   	pop    %esi
    2554:	5d                   	pop    %ebp
    2555:	c3                   	ret    
    printf(1, "create unlinkread failed\n");
    2556:	51                   	push   %ecx
    2557:	51                   	push   %ecx
    2558:	68 70 52 00 00       	push   $0x5270
    255d:	6a 01                	push   $0x1
    255f:	e8 ec 24 00 00       	call   4a50 <printf>
    exit();
    2564:	e8 6a 23 00 00       	call   48d3 <exit>
    printf(1, "unlinkread write failed\n");
    2569:	51                   	push   %ecx
    256a:	51                   	push   %ecx
    256b:	68 f4 52 00 00       	push   $0x52f4
    2570:	6a 01                	push   $0x1
    2572:	e8 d9 24 00 00       	call   4a50 <printf>
    exit();
    2577:	e8 57 23 00 00       	call   48d3 <exit>
    printf(1, "unlinkread wrong data\n");
    257c:	53                   	push   %ebx
    257d:	53                   	push   %ebx
    257e:	68 dd 52 00 00       	push   $0x52dd
    2583:	6a 01                	push   $0x1
    2585:	e8 c6 24 00 00       	call   4a50 <printf>
    exit();
    258a:	e8 44 23 00 00       	call   48d3 <exit>
    printf(1, "unlinkread read failed");
    258f:	56                   	push   %esi
    2590:	56                   	push   %esi
    2591:	68 c6 52 00 00       	push   $0x52c6
    2596:	6a 01                	push   $0x1
    2598:	e8 b3 24 00 00       	call   4a50 <printf>
    exit();
    259d:	e8 31 23 00 00       	call   48d3 <exit>
    printf(1, "unlink unlinkread failed\n");
    25a2:	50                   	push   %eax
    25a3:	50                   	push   %eax
    25a4:	68 a8 52 00 00       	push   $0x52a8
    25a9:	6a 01                	push   $0x1
    25ab:	e8 a0 24 00 00       	call   4a50 <printf>
    exit();
    25b0:	e8 1e 23 00 00       	call   48d3 <exit>
    printf(1, "open unlinkread failed\n");
    25b5:	50                   	push   %eax
    25b6:	50                   	push   %eax
    25b7:	68 90 52 00 00       	push   $0x5290
    25bc:	6a 01                	push   $0x1
    25be:	e8 8d 24 00 00       	call   4a50 <printf>
    exit();
    25c3:	e8 0b 23 00 00       	call   48d3 <exit>
    25c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    25cf:	90                   	nop

000025d0 <linktest>:
{
    25d0:	55                   	push   %ebp
    25d1:	89 e5                	mov    %esp,%ebp
    25d3:	53                   	push   %ebx
    25d4:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "linktest\n");
    25d7:	68 1c 53 00 00       	push   $0x531c
    25dc:	6a 01                	push   $0x1
    25de:	e8 6d 24 00 00       	call   4a50 <printf>
  unlink("lf1");
    25e3:	c7 04 24 26 53 00 00 	movl   $0x5326,(%esp)
    25ea:	e8 34 23 00 00       	call   4923 <unlink>
  unlink("lf2");
    25ef:	c7 04 24 2a 53 00 00 	movl   $0x532a,(%esp)
    25f6:	e8 28 23 00 00       	call   4923 <unlink>
  fd = open("lf1", O_CREATE|O_RDWR);
    25fb:	58                   	pop    %eax
    25fc:	5a                   	pop    %edx
    25fd:	68 02 02 00 00       	push   $0x202
    2602:	68 26 53 00 00       	push   $0x5326
    2607:	e8 07 23 00 00       	call   4913 <open>
  if(fd < 0){
    260c:	83 c4 10             	add    $0x10,%esp
    260f:	85 c0                	test   %eax,%eax
    2611:	0f 88 1e 01 00 00    	js     2735 <linktest+0x165>
  if(write(fd, "hello", 5) != 5){
    2617:	83 ec 04             	sub    $0x4,%esp
    261a:	89 c3                	mov    %eax,%ebx
    261c:	6a 05                	push   $0x5
    261e:	68 8a 52 00 00       	push   $0x528a
    2623:	50                   	push   %eax
    2624:	e8 ca 22 00 00       	call   48f3 <write>
    2629:	83 c4 10             	add    $0x10,%esp
    262c:	83 f8 05             	cmp    $0x5,%eax
    262f:	0f 85 98 01 00 00    	jne    27cd <linktest+0x1fd>
  close(fd);
    2635:	83 ec 0c             	sub    $0xc,%esp
    2638:	53                   	push   %ebx
    2639:	e8 bd 22 00 00       	call   48fb <close>
  if(link("lf1", "lf2") < 0){
    263e:	5b                   	pop    %ebx
    263f:	58                   	pop    %eax
    2640:	68 2a 53 00 00       	push   $0x532a
    2645:	68 26 53 00 00       	push   $0x5326
    264a:	e8 e4 22 00 00       	call   4933 <link>
    264f:	83 c4 10             	add    $0x10,%esp
    2652:	85 c0                	test   %eax,%eax
    2654:	0f 88 60 01 00 00    	js     27ba <linktest+0x1ea>
  unlink("lf1");
    265a:	83 ec 0c             	sub    $0xc,%esp
    265d:	68 26 53 00 00       	push   $0x5326
    2662:	e8 bc 22 00 00       	call   4923 <unlink>
  if(open("lf1", 0) >= 0){
    2667:	58                   	pop    %eax
    2668:	5a                   	pop    %edx
    2669:	6a 00                	push   $0x0
    266b:	68 26 53 00 00       	push   $0x5326
    2670:	e8 9e 22 00 00       	call   4913 <open>
    2675:	83 c4 10             	add    $0x10,%esp
    2678:	85 c0                	test   %eax,%eax
    267a:	0f 89 27 01 00 00    	jns    27a7 <linktest+0x1d7>
  fd = open("lf2", 0);
    2680:	83 ec 08             	sub    $0x8,%esp
    2683:	6a 00                	push   $0x0
    2685:	68 2a 53 00 00       	push   $0x532a
    268a:	e8 84 22 00 00       	call   4913 <open>
  if(fd < 0){
    268f:	83 c4 10             	add    $0x10,%esp
  fd = open("lf2", 0);
    2692:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    2694:	85 c0                	test   %eax,%eax
    2696:	0f 88 f8 00 00 00    	js     2794 <linktest+0x1c4>
  if(read(fd, buf, sizeof(buf)) != 5){
    269c:	83 ec 04             	sub    $0x4,%esp
    269f:	68 00 20 00 00       	push   $0x2000
    26a4:	68 a0 95 00 00       	push   $0x95a0
    26a9:	50                   	push   %eax
    26aa:	e8 3c 22 00 00       	call   48eb <read>
    26af:	83 c4 10             	add    $0x10,%esp
    26b2:	83 f8 05             	cmp    $0x5,%eax
    26b5:	0f 85 c6 00 00 00    	jne    2781 <linktest+0x1b1>
  close(fd);
    26bb:	83 ec 0c             	sub    $0xc,%esp
    26be:	53                   	push   %ebx
    26bf:	e8 37 22 00 00       	call   48fb <close>
  if(link("lf2", "lf2") >= 0){
    26c4:	58                   	pop    %eax
    26c5:	5a                   	pop    %edx
    26c6:	68 2a 53 00 00       	push   $0x532a
    26cb:	68 2a 53 00 00       	push   $0x532a
    26d0:	e8 5e 22 00 00       	call   4933 <link>
    26d5:	83 c4 10             	add    $0x10,%esp
    26d8:	85 c0                	test   %eax,%eax
    26da:	0f 89 8e 00 00 00    	jns    276e <linktest+0x19e>
  unlink("lf2");
    26e0:	83 ec 0c             	sub    $0xc,%esp
    26e3:	68 2a 53 00 00       	push   $0x532a
    26e8:	e8 36 22 00 00       	call   4923 <unlink>
  if(link("lf2", "lf1") >= 0){
    26ed:	59                   	pop    %ecx
    26ee:	5b                   	pop    %ebx
    26ef:	68 26 53 00 00       	push   $0x5326
    26f4:	68 2a 53 00 00       	push   $0x532a
    26f9:	e8 35 22 00 00       	call   4933 <link>
    26fe:	83 c4 10             	add    $0x10,%esp
    2701:	85 c0                	test   %eax,%eax
    2703:	79 56                	jns    275b <linktest+0x18b>
  if(link(".", "lf1") >= 0){
    2705:	83 ec 08             	sub    $0x8,%esp
    2708:	68 26 53 00 00       	push   $0x5326
    270d:	68 ee 55 00 00       	push   $0x55ee
    2712:	e8 1c 22 00 00       	call   4933 <link>
    2717:	83 c4 10             	add    $0x10,%esp
    271a:	85 c0                	test   %eax,%eax
    271c:	79 2a                	jns    2748 <linktest+0x178>
  printf(1, "linktest ok\n");
    271e:	83 ec 08             	sub    $0x8,%esp
    2721:	68 c4 53 00 00       	push   $0x53c4
    2726:	6a 01                	push   $0x1
    2728:	e8 23 23 00 00       	call   4a50 <printf>
}
    272d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2730:	83 c4 10             	add    $0x10,%esp
    2733:	c9                   	leave  
    2734:	c3                   	ret    
    printf(1, "create lf1 failed\n");
    2735:	50                   	push   %eax
    2736:	50                   	push   %eax
    2737:	68 2e 53 00 00       	push   $0x532e
    273c:	6a 01                	push   $0x1
    273e:	e8 0d 23 00 00       	call   4a50 <printf>
    exit();
    2743:	e8 8b 21 00 00       	call   48d3 <exit>
    printf(1, "link . lf1 succeeded! oops\n");
    2748:	50                   	push   %eax
    2749:	50                   	push   %eax
    274a:	68 a8 53 00 00       	push   $0x53a8
    274f:	6a 01                	push   $0x1
    2751:	e8 fa 22 00 00       	call   4a50 <printf>
    exit();
    2756:	e8 78 21 00 00       	call   48d3 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    275b:	52                   	push   %edx
    275c:	52                   	push   %edx
    275d:	68 5c 5f 00 00       	push   $0x5f5c
    2762:	6a 01                	push   $0x1
    2764:	e8 e7 22 00 00       	call   4a50 <printf>
    exit();
    2769:	e8 65 21 00 00       	call   48d3 <exit>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    276e:	50                   	push   %eax
    276f:	50                   	push   %eax
    2770:	68 8a 53 00 00       	push   $0x538a
    2775:	6a 01                	push   $0x1
    2777:	e8 d4 22 00 00       	call   4a50 <printf>
    exit();
    277c:	e8 52 21 00 00       	call   48d3 <exit>
    printf(1, "read lf2 failed\n");
    2781:	51                   	push   %ecx
    2782:	51                   	push   %ecx
    2783:	68 79 53 00 00       	push   $0x5379
    2788:	6a 01                	push   $0x1
    278a:	e8 c1 22 00 00       	call   4a50 <printf>
    exit();
    278f:	e8 3f 21 00 00       	call   48d3 <exit>
    printf(1, "open lf2 failed\n");
    2794:	53                   	push   %ebx
    2795:	53                   	push   %ebx
    2796:	68 68 53 00 00       	push   $0x5368
    279b:	6a 01                	push   $0x1
    279d:	e8 ae 22 00 00       	call   4a50 <printf>
    exit();
    27a2:	e8 2c 21 00 00       	call   48d3 <exit>
    printf(1, "unlinked lf1 but it is still there!\n");
    27a7:	50                   	push   %eax
    27a8:	50                   	push   %eax
    27a9:	68 34 5f 00 00       	push   $0x5f34
    27ae:	6a 01                	push   $0x1
    27b0:	e8 9b 22 00 00       	call   4a50 <printf>
    exit();
    27b5:	e8 19 21 00 00       	call   48d3 <exit>
    printf(1, "link lf1 lf2 failed\n");
    27ba:	51                   	push   %ecx
    27bb:	51                   	push   %ecx
    27bc:	68 53 53 00 00       	push   $0x5353
    27c1:	6a 01                	push   $0x1
    27c3:	e8 88 22 00 00       	call   4a50 <printf>
    exit();
    27c8:	e8 06 21 00 00       	call   48d3 <exit>
    printf(1, "write lf1 failed\n");
    27cd:	50                   	push   %eax
    27ce:	50                   	push   %eax
    27cf:	68 41 53 00 00       	push   $0x5341
    27d4:	6a 01                	push   $0x1
    27d6:	e8 75 22 00 00       	call   4a50 <printf>
    exit();
    27db:	e8 f3 20 00 00       	call   48d3 <exit>

000027e0 <concreate>:
{
    27e0:	55                   	push   %ebp
    27e1:	89 e5                	mov    %esp,%ebp
    27e3:	57                   	push   %edi
    27e4:	56                   	push   %esi
  for(i = 0; i < 40; i++){
    27e5:	31 f6                	xor    %esi,%esi
{
    27e7:	53                   	push   %ebx
    27e8:	8d 5d ad             	lea    -0x53(%ebp),%ebx
    27eb:	83 ec 64             	sub    $0x64,%esp
  printf(1, "concreate test\n");
    27ee:	68 d1 53 00 00       	push   $0x53d1
    27f3:	6a 01                	push   $0x1
    27f5:	e8 56 22 00 00       	call   4a50 <printf>
  file[0] = 'C';
    27fa:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
  file[2] = '\0';
    27fe:	83 c4 10             	add    $0x10,%esp
    2801:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
  for(i = 0; i < 40; i++){
    2805:	eb 4c                	jmp    2853 <concreate+0x73>
    2807:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    280e:	66 90                	xchg   %ax,%ax
    2810:	69 c6 ab aa aa aa    	imul   $0xaaaaaaab,%esi,%eax
    if(pid && (i % 3) == 1){
    2816:	3d ab aa aa aa       	cmp    $0xaaaaaaab,%eax
    281b:	0f 83 af 00 00 00    	jae    28d0 <concreate+0xf0>
      fd = open(file, O_CREATE | O_RDWR);
    2821:	83 ec 08             	sub    $0x8,%esp
    2824:	68 02 02 00 00       	push   $0x202
    2829:	53                   	push   %ebx
    282a:	e8 e4 20 00 00       	call   4913 <open>
      if(fd < 0){
    282f:	83 c4 10             	add    $0x10,%esp
    2832:	85 c0                	test   %eax,%eax
    2834:	78 5f                	js     2895 <concreate+0xb5>
      close(fd);
    2836:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 40; i++){
    2839:	83 c6 01             	add    $0x1,%esi
      close(fd);
    283c:	50                   	push   %eax
    283d:	e8 b9 20 00 00       	call   48fb <close>
    2842:	83 c4 10             	add    $0x10,%esp
      wait();
    2845:	e8 91 20 00 00       	call   48db <wait>
  for(i = 0; i < 40; i++){
    284a:	83 fe 28             	cmp    $0x28,%esi
    284d:	0f 84 9f 00 00 00    	je     28f2 <concreate+0x112>
    unlink(file);
    2853:	83 ec 0c             	sub    $0xc,%esp
    file[1] = '0' + i;
    2856:	8d 46 30             	lea    0x30(%esi),%eax
    unlink(file);
    2859:	53                   	push   %ebx
    file[1] = '0' + i;
    285a:	88 45 ae             	mov    %al,-0x52(%ebp)
    unlink(file);
    285d:	e8 c1 20 00 00       	call   4923 <unlink>
    pid = fork();
    2862:	e8 64 20 00 00       	call   48cb <fork>
    if(pid && (i % 3) == 1){
    2867:	83 c4 10             	add    $0x10,%esp
    286a:	85 c0                	test   %eax,%eax
    286c:	75 a2                	jne    2810 <concreate+0x30>
      link("C0", file);
    286e:	69 f6 cd cc cc cc    	imul   $0xcccccccd,%esi,%esi
    } else if(pid == 0 && (i % 5) == 1){
    2874:	81 fe cd cc cc cc    	cmp    $0xcccccccd,%esi
    287a:	73 34                	jae    28b0 <concreate+0xd0>
      fd = open(file, O_CREATE | O_RDWR);
    287c:	83 ec 08             	sub    $0x8,%esp
    287f:	68 02 02 00 00       	push   $0x202
    2884:	53                   	push   %ebx
    2885:	e8 89 20 00 00       	call   4913 <open>
      if(fd < 0){
    288a:	83 c4 10             	add    $0x10,%esp
    288d:	85 c0                	test   %eax,%eax
    288f:	0f 89 39 02 00 00    	jns    2ace <concreate+0x2ee>
        printf(1, "concreate create %s failed\n", file);
    2895:	83 ec 04             	sub    $0x4,%esp
    2898:	53                   	push   %ebx
    2899:	68 e4 53 00 00       	push   $0x53e4
    289e:	6a 01                	push   $0x1
    28a0:	e8 ab 21 00 00       	call   4a50 <printf>
        exit();
    28a5:	e8 29 20 00 00       	call   48d3 <exit>
    28aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      link("C0", file);
    28b0:	83 ec 08             	sub    $0x8,%esp
    28b3:	53                   	push   %ebx
    28b4:	68 e1 53 00 00       	push   $0x53e1
    28b9:	e8 75 20 00 00       	call   4933 <link>
    28be:	83 c4 10             	add    $0x10,%esp
      exit();
    28c1:	e8 0d 20 00 00       	call   48d3 <exit>
    28c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    28cd:	8d 76 00             	lea    0x0(%esi),%esi
      link("C0", file);
    28d0:	83 ec 08             	sub    $0x8,%esp
  for(i = 0; i < 40; i++){
    28d3:	83 c6 01             	add    $0x1,%esi
      link("C0", file);
    28d6:	53                   	push   %ebx
    28d7:	68 e1 53 00 00       	push   $0x53e1
    28dc:	e8 52 20 00 00       	call   4933 <link>
    28e1:	83 c4 10             	add    $0x10,%esp
      wait();
    28e4:	e8 f2 1f 00 00       	call   48db <wait>
  for(i = 0; i < 40; i++){
    28e9:	83 fe 28             	cmp    $0x28,%esi
    28ec:	0f 85 61 ff ff ff    	jne    2853 <concreate+0x73>
  memset(fa, 0, sizeof(fa));
    28f2:	83 ec 04             	sub    $0x4,%esp
    28f5:	8d 45 c0             	lea    -0x40(%ebp),%eax
    28f8:	6a 28                	push   $0x28
    28fa:	6a 00                	push   $0x0
    28fc:	50                   	push   %eax
    28fd:	e8 3e 1e 00 00       	call   4740 <memset>
  fd = open(".", 0);
    2902:	5e                   	pop    %esi
    2903:	5f                   	pop    %edi
    2904:	6a 00                	push   $0x0
    2906:	68 ee 55 00 00       	push   $0x55ee
    290b:	8d 7d b0             	lea    -0x50(%ebp),%edi
    290e:	e8 00 20 00 00       	call   4913 <open>
  n = 0;
    2913:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
  while(read(fd, &de, sizeof(de)) > 0){
    291a:	83 c4 10             	add    $0x10,%esp
  fd = open(".", 0);
    291d:	89 c6                	mov    %eax,%esi
  while(read(fd, &de, sizeof(de)) > 0){
    291f:	90                   	nop
    2920:	83 ec 04             	sub    $0x4,%esp
    2923:	6a 10                	push   $0x10
    2925:	57                   	push   %edi
    2926:	56                   	push   %esi
    2927:	e8 bf 1f 00 00       	call   48eb <read>
    292c:	83 c4 10             	add    $0x10,%esp
    292f:	85 c0                	test   %eax,%eax
    2931:	7e 3d                	jle    2970 <concreate+0x190>
    if(de.inum == 0)
    2933:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    2938:	74 e6                	je     2920 <concreate+0x140>
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    293a:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    293e:	75 e0                	jne    2920 <concreate+0x140>
    2940:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    2944:	75 da                	jne    2920 <concreate+0x140>
      i = de.name[1] - '0';
    2946:	0f be 45 b3          	movsbl -0x4d(%ebp),%eax
    294a:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    294d:	83 f8 27             	cmp    $0x27,%eax
    2950:	0f 87 60 01 00 00    	ja     2ab6 <concreate+0x2d6>
      if(fa[i]){
    2956:	80 7c 05 c0 00       	cmpb   $0x0,-0x40(%ebp,%eax,1)
    295b:	0f 85 3d 01 00 00    	jne    2a9e <concreate+0x2be>
      n++;
    2961:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
      fa[i] = 1;
    2965:	c6 44 05 c0 01       	movb   $0x1,-0x40(%ebp,%eax,1)
      n++;
    296a:	eb b4                	jmp    2920 <concreate+0x140>
    296c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  close(fd);
    2970:	83 ec 0c             	sub    $0xc,%esp
    2973:	56                   	push   %esi
    2974:	e8 82 1f 00 00       	call   48fb <close>
  if(n != 40){
    2979:	83 c4 10             	add    $0x10,%esp
    297c:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    2980:	0f 85 05 01 00 00    	jne    2a8b <concreate+0x2ab>
  for(i = 0; i < 40; i++){
    2986:	31 f6                	xor    %esi,%esi
    2988:	eb 4c                	jmp    29d6 <concreate+0x1f6>
    298a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
       ((i % 3) == 1 && pid != 0)){
    2990:	85 ff                	test   %edi,%edi
    2992:	74 05                	je     2999 <concreate+0x1b9>
    2994:	83 f8 01             	cmp    $0x1,%eax
    2997:	74 6c                	je     2a05 <concreate+0x225>
      unlink(file);
    2999:	83 ec 0c             	sub    $0xc,%esp
    299c:	53                   	push   %ebx
    299d:	e8 81 1f 00 00       	call   4923 <unlink>
      unlink(file);
    29a2:	89 1c 24             	mov    %ebx,(%esp)
    29a5:	e8 79 1f 00 00       	call   4923 <unlink>
      unlink(file);
    29aa:	89 1c 24             	mov    %ebx,(%esp)
    29ad:	e8 71 1f 00 00       	call   4923 <unlink>
      unlink(file);
    29b2:	89 1c 24             	mov    %ebx,(%esp)
    29b5:	e8 69 1f 00 00       	call   4923 <unlink>
    29ba:	83 c4 10             	add    $0x10,%esp
    if(pid == 0)
    29bd:	85 ff                	test   %edi,%edi
    29bf:	0f 84 fc fe ff ff    	je     28c1 <concreate+0xe1>
      wait();
    29c5:	e8 11 1f 00 00       	call   48db <wait>
  for(i = 0; i < 40; i++){
    29ca:	83 c6 01             	add    $0x1,%esi
    29cd:	83 fe 28             	cmp    $0x28,%esi
    29d0:	0f 84 8a 00 00 00    	je     2a60 <concreate+0x280>
    file[1] = '0' + i;
    29d6:	8d 46 30             	lea    0x30(%esi),%eax
    29d9:	88 45 ae             	mov    %al,-0x52(%ebp)
    pid = fork();
    29dc:	e8 ea 1e 00 00       	call   48cb <fork>
    29e1:	89 c7                	mov    %eax,%edi
    if(pid < 0){
    29e3:	85 c0                	test   %eax,%eax
    29e5:	0f 88 8c 00 00 00    	js     2a77 <concreate+0x297>
    if(((i % 3) == 0 && pid == 0) ||
    29eb:	b8 ab aa aa aa       	mov    $0xaaaaaaab,%eax
    29f0:	f7 e6                	mul    %esi
    29f2:	89 d0                	mov    %edx,%eax
    29f4:	83 e2 fe             	and    $0xfffffffe,%edx
    29f7:	d1 e8                	shr    %eax
    29f9:	01 c2                	add    %eax,%edx
    29fb:	89 f0                	mov    %esi,%eax
    29fd:	29 d0                	sub    %edx,%eax
    29ff:	89 c1                	mov    %eax,%ecx
    2a01:	09 f9                	or     %edi,%ecx
    2a03:	75 8b                	jne    2990 <concreate+0x1b0>
      close(open(file, 0));
    2a05:	83 ec 08             	sub    $0x8,%esp
    2a08:	6a 00                	push   $0x0
    2a0a:	53                   	push   %ebx
    2a0b:	e8 03 1f 00 00       	call   4913 <open>
    2a10:	89 04 24             	mov    %eax,(%esp)
    2a13:	e8 e3 1e 00 00       	call   48fb <close>
      close(open(file, 0));
    2a18:	58                   	pop    %eax
    2a19:	5a                   	pop    %edx
    2a1a:	6a 00                	push   $0x0
    2a1c:	53                   	push   %ebx
    2a1d:	e8 f1 1e 00 00       	call   4913 <open>
    2a22:	89 04 24             	mov    %eax,(%esp)
    2a25:	e8 d1 1e 00 00       	call   48fb <close>
      close(open(file, 0));
    2a2a:	59                   	pop    %ecx
    2a2b:	58                   	pop    %eax
    2a2c:	6a 00                	push   $0x0
    2a2e:	53                   	push   %ebx
    2a2f:	e8 df 1e 00 00       	call   4913 <open>
    2a34:	89 04 24             	mov    %eax,(%esp)
    2a37:	e8 bf 1e 00 00       	call   48fb <close>
      close(open(file, 0));
    2a3c:	58                   	pop    %eax
    2a3d:	5a                   	pop    %edx
    2a3e:	6a 00                	push   $0x0
    2a40:	53                   	push   %ebx
    2a41:	e8 cd 1e 00 00       	call   4913 <open>
    2a46:	89 04 24             	mov    %eax,(%esp)
    2a49:	e8 ad 1e 00 00       	call   48fb <close>
    2a4e:	83 c4 10             	add    $0x10,%esp
    2a51:	e9 67 ff ff ff       	jmp    29bd <concreate+0x1dd>
    2a56:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2a5d:	8d 76 00             	lea    0x0(%esi),%esi
  printf(1, "concreate ok\n");
    2a60:	83 ec 08             	sub    $0x8,%esp
    2a63:	68 36 54 00 00       	push   $0x5436
    2a68:	6a 01                	push   $0x1
    2a6a:	e8 e1 1f 00 00       	call   4a50 <printf>
}
    2a6f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2a72:	5b                   	pop    %ebx
    2a73:	5e                   	pop    %esi
    2a74:	5f                   	pop    %edi
    2a75:	5d                   	pop    %ebp
    2a76:	c3                   	ret    
      printf(1, "fork failed\n");
    2a77:	83 ec 08             	sub    $0x8,%esp
    2a7a:	68 b9 5c 00 00       	push   $0x5cb9
    2a7f:	6a 01                	push   $0x1
    2a81:	e8 ca 1f 00 00       	call   4a50 <printf>
      exit();
    2a86:	e8 48 1e 00 00       	call   48d3 <exit>
    printf(1, "concreate not enough files in directory listing\n");
    2a8b:	51                   	push   %ecx
    2a8c:	51                   	push   %ecx
    2a8d:	68 80 5f 00 00       	push   $0x5f80
    2a92:	6a 01                	push   $0x1
    2a94:	e8 b7 1f 00 00       	call   4a50 <printf>
    exit();
    2a99:	e8 35 1e 00 00       	call   48d3 <exit>
        printf(1, "concreate duplicate file %s\n", de.name);
    2a9e:	83 ec 04             	sub    $0x4,%esp
    2aa1:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    2aa4:	50                   	push   %eax
    2aa5:	68 19 54 00 00       	push   $0x5419
    2aaa:	6a 01                	push   $0x1
    2aac:	e8 9f 1f 00 00       	call   4a50 <printf>
        exit();
    2ab1:	e8 1d 1e 00 00       	call   48d3 <exit>
        printf(1, "concreate weird file %s\n", de.name);
    2ab6:	83 ec 04             	sub    $0x4,%esp
    2ab9:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    2abc:	50                   	push   %eax
    2abd:	68 00 54 00 00       	push   $0x5400
    2ac2:	6a 01                	push   $0x1
    2ac4:	e8 87 1f 00 00       	call   4a50 <printf>
        exit();
    2ac9:	e8 05 1e 00 00       	call   48d3 <exit>
      close(fd);
    2ace:	83 ec 0c             	sub    $0xc,%esp
    2ad1:	50                   	push   %eax
    2ad2:	e8 24 1e 00 00       	call   48fb <close>
    2ad7:	83 c4 10             	add    $0x10,%esp
    2ada:	e9 e2 fd ff ff       	jmp    28c1 <concreate+0xe1>
    2adf:	90                   	nop

00002ae0 <linkunlink>:
{
    2ae0:	55                   	push   %ebp
    2ae1:	89 e5                	mov    %esp,%ebp
    2ae3:	57                   	push   %edi
    2ae4:	56                   	push   %esi
    2ae5:	53                   	push   %ebx
    2ae6:	83 ec 24             	sub    $0x24,%esp
  printf(1, "linkunlink test\n");
    2ae9:	68 44 54 00 00       	push   $0x5444
    2aee:	6a 01                	push   $0x1
    2af0:	e8 5b 1f 00 00       	call   4a50 <printf>
  unlink("x");
    2af5:	c7 04 24 d1 56 00 00 	movl   $0x56d1,(%esp)
    2afc:	e8 22 1e 00 00       	call   4923 <unlink>
  pid = fork();
    2b01:	e8 c5 1d 00 00       	call   48cb <fork>
  if(pid < 0){
    2b06:	83 c4 10             	add    $0x10,%esp
  pid = fork();
    2b09:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    2b0c:	85 c0                	test   %eax,%eax
    2b0e:	0f 88 b6 00 00 00    	js     2bca <linkunlink+0xea>
  unsigned int x = (pid ? 1 : 97);
    2b14:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    2b18:	bb 64 00 00 00       	mov    $0x64,%ebx
    if((x % 3) == 0){
    2b1d:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
  unsigned int x = (pid ? 1 : 97);
    2b22:	19 ff                	sbb    %edi,%edi
    2b24:	83 e7 60             	and    $0x60,%edi
    2b27:	83 c7 01             	add    $0x1,%edi
    2b2a:	eb 1e                	jmp    2b4a <linkunlink+0x6a>
    2b2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if((x % 3) == 1){
    2b30:	83 f8 01             	cmp    $0x1,%eax
    2b33:	74 7b                	je     2bb0 <linkunlink+0xd0>
      unlink("x");
    2b35:	83 ec 0c             	sub    $0xc,%esp
    2b38:	68 d1 56 00 00       	push   $0x56d1
    2b3d:	e8 e1 1d 00 00       	call   4923 <unlink>
    2b42:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    2b45:	83 eb 01             	sub    $0x1,%ebx
    2b48:	74 41                	je     2b8b <linkunlink+0xab>
    x = x * 1103515245 + 12345;
    2b4a:	69 cf 6d 4e c6 41    	imul   $0x41c64e6d,%edi,%ecx
    2b50:	8d b9 39 30 00 00    	lea    0x3039(%ecx),%edi
    if((x % 3) == 0){
    2b56:	89 f8                	mov    %edi,%eax
    2b58:	f7 e6                	mul    %esi
    2b5a:	89 d0                	mov    %edx,%eax
    2b5c:	83 e2 fe             	and    $0xfffffffe,%edx
    2b5f:	d1 e8                	shr    %eax
    2b61:	01 c2                	add    %eax,%edx
    2b63:	89 f8                	mov    %edi,%eax
    2b65:	29 d0                	sub    %edx,%eax
    2b67:	75 c7                	jne    2b30 <linkunlink+0x50>
      close(open("x", O_RDWR | O_CREATE));
    2b69:	83 ec 08             	sub    $0x8,%esp
    2b6c:	68 02 02 00 00       	push   $0x202
    2b71:	68 d1 56 00 00       	push   $0x56d1
    2b76:	e8 98 1d 00 00       	call   4913 <open>
    2b7b:	89 04 24             	mov    %eax,(%esp)
    2b7e:	e8 78 1d 00 00       	call   48fb <close>
    2b83:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    2b86:	83 eb 01             	sub    $0x1,%ebx
    2b89:	75 bf                	jne    2b4a <linkunlink+0x6a>
  if(pid)
    2b8b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2b8e:	85 c0                	test   %eax,%eax
    2b90:	74 4b                	je     2bdd <linkunlink+0xfd>
    wait();
    2b92:	e8 44 1d 00 00       	call   48db <wait>
  printf(1, "linkunlink ok\n");
    2b97:	83 ec 08             	sub    $0x8,%esp
    2b9a:	68 59 54 00 00       	push   $0x5459
    2b9f:	6a 01                	push   $0x1
    2ba1:	e8 aa 1e 00 00       	call   4a50 <printf>
}
    2ba6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2ba9:	5b                   	pop    %ebx
    2baa:	5e                   	pop    %esi
    2bab:	5f                   	pop    %edi
    2bac:	5d                   	pop    %ebp
    2bad:	c3                   	ret    
    2bae:	66 90                	xchg   %ax,%ax
      link("cat", "x");
    2bb0:	83 ec 08             	sub    $0x8,%esp
    2bb3:	68 d1 56 00 00       	push   $0x56d1
    2bb8:	68 55 54 00 00       	push   $0x5455
    2bbd:	e8 71 1d 00 00       	call   4933 <link>
    2bc2:	83 c4 10             	add    $0x10,%esp
    2bc5:	e9 7b ff ff ff       	jmp    2b45 <linkunlink+0x65>
    printf(1, "fork failed\n");
    2bca:	52                   	push   %edx
    2bcb:	52                   	push   %edx
    2bcc:	68 b9 5c 00 00       	push   $0x5cb9
    2bd1:	6a 01                	push   $0x1
    2bd3:	e8 78 1e 00 00       	call   4a50 <printf>
    exit();
    2bd8:	e8 f6 1c 00 00       	call   48d3 <exit>
    exit();
    2bdd:	e8 f1 1c 00 00       	call   48d3 <exit>
    2be2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2be9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00002bf0 <bigdir>:
{
    2bf0:	55                   	push   %ebp
    2bf1:	89 e5                	mov    %esp,%ebp
    2bf3:	57                   	push   %edi
    2bf4:	56                   	push   %esi
    2bf5:	53                   	push   %ebx
    2bf6:	83 ec 24             	sub    $0x24,%esp
  printf(1, "bigdir test\n");
    2bf9:	68 68 54 00 00       	push   $0x5468
    2bfe:	6a 01                	push   $0x1
    2c00:	e8 4b 1e 00 00       	call   4a50 <printf>
  unlink("bd");
    2c05:	c7 04 24 75 54 00 00 	movl   $0x5475,(%esp)
    2c0c:	e8 12 1d 00 00       	call   4923 <unlink>
  fd = open("bd", O_CREATE);
    2c11:	5a                   	pop    %edx
    2c12:	59                   	pop    %ecx
    2c13:	68 00 02 00 00       	push   $0x200
    2c18:	68 75 54 00 00       	push   $0x5475
    2c1d:	e8 f1 1c 00 00       	call   4913 <open>
  if(fd < 0){
    2c22:	83 c4 10             	add    $0x10,%esp
    2c25:	85 c0                	test   %eax,%eax
    2c27:	0f 88 de 00 00 00    	js     2d0b <bigdir+0x11b>
  close(fd);
    2c2d:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 500; i++){
    2c30:	31 f6                	xor    %esi,%esi
    2c32:	8d 7d de             	lea    -0x22(%ebp),%edi
  close(fd);
    2c35:	50                   	push   %eax
    2c36:	e8 c0 1c 00 00       	call   48fb <close>
    2c3b:	83 c4 10             	add    $0x10,%esp
    2c3e:	66 90                	xchg   %ax,%ax
    name[1] = '0' + (i / 64);
    2c40:	89 f0                	mov    %esi,%eax
    if(link("bd", name) != 0){
    2c42:	83 ec 08             	sub    $0x8,%esp
    name[0] = 'x';
    2c45:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    name[1] = '0' + (i / 64);
    2c49:	c1 f8 06             	sar    $0x6,%eax
    if(link("bd", name) != 0){
    2c4c:	57                   	push   %edi
    name[1] = '0' + (i / 64);
    2c4d:	83 c0 30             	add    $0x30,%eax
    if(link("bd", name) != 0){
    2c50:	68 75 54 00 00       	push   $0x5475
    name[1] = '0' + (i / 64);
    2c55:	88 45 df             	mov    %al,-0x21(%ebp)
    name[2] = '0' + (i % 64);
    2c58:	89 f0                	mov    %esi,%eax
    2c5a:	83 e0 3f             	and    $0x3f,%eax
    name[3] = '\0';
    2c5d:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    name[2] = '0' + (i % 64);
    2c61:	83 c0 30             	add    $0x30,%eax
    2c64:	88 45 e0             	mov    %al,-0x20(%ebp)
    if(link("bd", name) != 0){
    2c67:	e8 c7 1c 00 00       	call   4933 <link>
    2c6c:	83 c4 10             	add    $0x10,%esp
    2c6f:	89 c3                	mov    %eax,%ebx
    2c71:	85 c0                	test   %eax,%eax
    2c73:	75 6e                	jne    2ce3 <bigdir+0xf3>
  for(i = 0; i < 500; i++){
    2c75:	83 c6 01             	add    $0x1,%esi
    2c78:	81 fe f4 01 00 00    	cmp    $0x1f4,%esi
    2c7e:	75 c0                	jne    2c40 <bigdir+0x50>
  unlink("bd");
    2c80:	83 ec 0c             	sub    $0xc,%esp
    2c83:	68 75 54 00 00       	push   $0x5475
    2c88:	e8 96 1c 00 00       	call   4923 <unlink>
    2c8d:	83 c4 10             	add    $0x10,%esp
    name[1] = '0' + (i / 64);
    2c90:	89 d8                	mov    %ebx,%eax
    if(unlink(name) != 0){
    2c92:	83 ec 0c             	sub    $0xc,%esp
    name[0] = 'x';
    2c95:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    name[1] = '0' + (i / 64);
    2c99:	c1 f8 06             	sar    $0x6,%eax
    if(unlink(name) != 0){
    2c9c:	57                   	push   %edi
    name[1] = '0' + (i / 64);
    2c9d:	83 c0 30             	add    $0x30,%eax
    name[3] = '\0';
    2ca0:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    name[1] = '0' + (i / 64);
    2ca4:	88 45 df             	mov    %al,-0x21(%ebp)
    name[2] = '0' + (i % 64);
    2ca7:	89 d8                	mov    %ebx,%eax
    2ca9:	83 e0 3f             	and    $0x3f,%eax
    2cac:	83 c0 30             	add    $0x30,%eax
    2caf:	88 45 e0             	mov    %al,-0x20(%ebp)
    if(unlink(name) != 0){
    2cb2:	e8 6c 1c 00 00       	call   4923 <unlink>
    2cb7:	83 c4 10             	add    $0x10,%esp
    2cba:	85 c0                	test   %eax,%eax
    2cbc:	75 39                	jne    2cf7 <bigdir+0x107>
  for(i = 0; i < 500; i++){
    2cbe:	83 c3 01             	add    $0x1,%ebx
    2cc1:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    2cc7:	75 c7                	jne    2c90 <bigdir+0xa0>
  printf(1, "bigdir ok\n");
    2cc9:	83 ec 08             	sub    $0x8,%esp
    2ccc:	68 b7 54 00 00       	push   $0x54b7
    2cd1:	6a 01                	push   $0x1
    2cd3:	e8 78 1d 00 00       	call   4a50 <printf>
    2cd8:	83 c4 10             	add    $0x10,%esp
}
    2cdb:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2cde:	5b                   	pop    %ebx
    2cdf:	5e                   	pop    %esi
    2ce0:	5f                   	pop    %edi
    2ce1:	5d                   	pop    %ebp
    2ce2:	c3                   	ret    
      printf(1, "bigdir link failed\n");
    2ce3:	83 ec 08             	sub    $0x8,%esp
    2ce6:	68 8e 54 00 00       	push   $0x548e
    2ceb:	6a 01                	push   $0x1
    2ced:	e8 5e 1d 00 00       	call   4a50 <printf>
      exit();
    2cf2:	e8 dc 1b 00 00       	call   48d3 <exit>
      printf(1, "bigdir unlink failed");
    2cf7:	83 ec 08             	sub    $0x8,%esp
    2cfa:	68 a2 54 00 00       	push   $0x54a2
    2cff:	6a 01                	push   $0x1
    2d01:	e8 4a 1d 00 00       	call   4a50 <printf>
      exit();
    2d06:	e8 c8 1b 00 00       	call   48d3 <exit>
    printf(1, "bigdir create failed\n");
    2d0b:	50                   	push   %eax
    2d0c:	50                   	push   %eax
    2d0d:	68 78 54 00 00       	push   $0x5478
    2d12:	6a 01                	push   $0x1
    2d14:	e8 37 1d 00 00       	call   4a50 <printf>
    exit();
    2d19:	e8 b5 1b 00 00       	call   48d3 <exit>
    2d1e:	66 90                	xchg   %ax,%ax

00002d20 <subdir>:
{
    2d20:	55                   	push   %ebp
    2d21:	89 e5                	mov    %esp,%ebp
    2d23:	53                   	push   %ebx
    2d24:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "subdir test\n");
    2d27:	68 c2 54 00 00       	push   $0x54c2
    2d2c:	6a 01                	push   $0x1
    2d2e:	e8 1d 1d 00 00       	call   4a50 <printf>
  unlink("ff");
    2d33:	c7 04 24 4b 55 00 00 	movl   $0x554b,(%esp)
    2d3a:	e8 e4 1b 00 00       	call   4923 <unlink>
  if(mkdir("dd") != 0){
    2d3f:	c7 04 24 e8 55 00 00 	movl   $0x55e8,(%esp)
    2d46:	e8 f0 1b 00 00       	call   493b <mkdir>
    2d4b:	83 c4 10             	add    $0x10,%esp
    2d4e:	85 c0                	test   %eax,%eax
    2d50:	0f 85 b3 05 00 00    	jne    3309 <subdir+0x5e9>
  fd = open("dd/ff", O_CREATE | O_RDWR);
    2d56:	83 ec 08             	sub    $0x8,%esp
    2d59:	68 02 02 00 00       	push   $0x202
    2d5e:	68 21 55 00 00       	push   $0x5521
    2d63:	e8 ab 1b 00 00       	call   4913 <open>
  if(fd < 0){
    2d68:	83 c4 10             	add    $0x10,%esp
  fd = open("dd/ff", O_CREATE | O_RDWR);
    2d6b:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    2d6d:	85 c0                	test   %eax,%eax
    2d6f:	0f 88 81 05 00 00    	js     32f6 <subdir+0x5d6>
  write(fd, "ff", 2);
    2d75:	83 ec 04             	sub    $0x4,%esp
    2d78:	6a 02                	push   $0x2
    2d7a:	68 4b 55 00 00       	push   $0x554b
    2d7f:	50                   	push   %eax
    2d80:	e8 6e 1b 00 00       	call   48f3 <write>
  close(fd);
    2d85:	89 1c 24             	mov    %ebx,(%esp)
    2d88:	e8 6e 1b 00 00       	call   48fb <close>
  if(unlink("dd") >= 0){
    2d8d:	c7 04 24 e8 55 00 00 	movl   $0x55e8,(%esp)
    2d94:	e8 8a 1b 00 00       	call   4923 <unlink>
    2d99:	83 c4 10             	add    $0x10,%esp
    2d9c:	85 c0                	test   %eax,%eax
    2d9e:	0f 89 3f 05 00 00    	jns    32e3 <subdir+0x5c3>
  if(mkdir("/dd/dd") != 0){
    2da4:	83 ec 0c             	sub    $0xc,%esp
    2da7:	68 fc 54 00 00       	push   $0x54fc
    2dac:	e8 8a 1b 00 00       	call   493b <mkdir>
    2db1:	83 c4 10             	add    $0x10,%esp
    2db4:	85 c0                	test   %eax,%eax
    2db6:	0f 85 14 05 00 00    	jne    32d0 <subdir+0x5b0>
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    2dbc:	83 ec 08             	sub    $0x8,%esp
    2dbf:	68 02 02 00 00       	push   $0x202
    2dc4:	68 1e 55 00 00       	push   $0x551e
    2dc9:	e8 45 1b 00 00       	call   4913 <open>
  if(fd < 0){
    2dce:	83 c4 10             	add    $0x10,%esp
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    2dd1:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    2dd3:	85 c0                	test   %eax,%eax
    2dd5:	0f 88 24 04 00 00    	js     31ff <subdir+0x4df>
  write(fd, "FF", 2);
    2ddb:	83 ec 04             	sub    $0x4,%esp
    2dde:	6a 02                	push   $0x2
    2de0:	68 3f 55 00 00       	push   $0x553f
    2de5:	50                   	push   %eax
    2de6:	e8 08 1b 00 00       	call   48f3 <write>
  close(fd);
    2deb:	89 1c 24             	mov    %ebx,(%esp)
    2dee:	e8 08 1b 00 00       	call   48fb <close>
  fd = open("dd/dd/../ff", 0);
    2df3:	58                   	pop    %eax
    2df4:	5a                   	pop    %edx
    2df5:	6a 00                	push   $0x0
    2df7:	68 42 55 00 00       	push   $0x5542
    2dfc:	e8 12 1b 00 00       	call   4913 <open>
  if(fd < 0){
    2e01:	83 c4 10             	add    $0x10,%esp
  fd = open("dd/dd/../ff", 0);
    2e04:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    2e06:	85 c0                	test   %eax,%eax
    2e08:	0f 88 de 03 00 00    	js     31ec <subdir+0x4cc>
  cc = read(fd, buf, sizeof(buf));
    2e0e:	83 ec 04             	sub    $0x4,%esp
    2e11:	68 00 20 00 00       	push   $0x2000
    2e16:	68 a0 95 00 00       	push   $0x95a0
    2e1b:	50                   	push   %eax
    2e1c:	e8 ca 1a 00 00       	call   48eb <read>
  if(cc != 2 || buf[0] != 'f'){
    2e21:	83 c4 10             	add    $0x10,%esp
    2e24:	83 f8 02             	cmp    $0x2,%eax
    2e27:	0f 85 3a 03 00 00    	jne    3167 <subdir+0x447>
    2e2d:	80 3d a0 95 00 00 66 	cmpb   $0x66,0x95a0
    2e34:	0f 85 2d 03 00 00    	jne    3167 <subdir+0x447>
  close(fd);
    2e3a:	83 ec 0c             	sub    $0xc,%esp
    2e3d:	53                   	push   %ebx
    2e3e:	e8 b8 1a 00 00       	call   48fb <close>
  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    2e43:	59                   	pop    %ecx
    2e44:	5b                   	pop    %ebx
    2e45:	68 82 55 00 00       	push   $0x5582
    2e4a:	68 1e 55 00 00       	push   $0x551e
    2e4f:	e8 df 1a 00 00       	call   4933 <link>
    2e54:	83 c4 10             	add    $0x10,%esp
    2e57:	85 c0                	test   %eax,%eax
    2e59:	0f 85 c6 03 00 00    	jne    3225 <subdir+0x505>
  if(unlink("dd/dd/ff") != 0){
    2e5f:	83 ec 0c             	sub    $0xc,%esp
    2e62:	68 1e 55 00 00       	push   $0x551e
    2e67:	e8 b7 1a 00 00       	call   4923 <unlink>
    2e6c:	83 c4 10             	add    $0x10,%esp
    2e6f:	85 c0                	test   %eax,%eax
    2e71:	0f 85 16 03 00 00    	jne    318d <subdir+0x46d>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    2e77:	83 ec 08             	sub    $0x8,%esp
    2e7a:	6a 00                	push   $0x0
    2e7c:	68 1e 55 00 00       	push   $0x551e
    2e81:	e8 8d 1a 00 00       	call   4913 <open>
    2e86:	83 c4 10             	add    $0x10,%esp
    2e89:	85 c0                	test   %eax,%eax
    2e8b:	0f 89 2c 04 00 00    	jns    32bd <subdir+0x59d>
  if(chdir("dd") != 0){
    2e91:	83 ec 0c             	sub    $0xc,%esp
    2e94:	68 e8 55 00 00       	push   $0x55e8
    2e99:	e8 a5 1a 00 00       	call   4943 <chdir>
    2e9e:	83 c4 10             	add    $0x10,%esp
    2ea1:	85 c0                	test   %eax,%eax
    2ea3:	0f 85 01 04 00 00    	jne    32aa <subdir+0x58a>
  if(chdir("dd/../../dd") != 0){
    2ea9:	83 ec 0c             	sub    $0xc,%esp
    2eac:	68 b6 55 00 00       	push   $0x55b6
    2eb1:	e8 8d 1a 00 00       	call   4943 <chdir>
    2eb6:	83 c4 10             	add    $0x10,%esp
    2eb9:	85 c0                	test   %eax,%eax
    2ebb:	0f 85 b9 02 00 00    	jne    317a <subdir+0x45a>
  if(chdir("dd/../../../dd") != 0){
    2ec1:	83 ec 0c             	sub    $0xc,%esp
    2ec4:	68 dc 55 00 00       	push   $0x55dc
    2ec9:	e8 75 1a 00 00       	call   4943 <chdir>
    2ece:	83 c4 10             	add    $0x10,%esp
    2ed1:	85 c0                	test   %eax,%eax
    2ed3:	0f 85 a1 02 00 00    	jne    317a <subdir+0x45a>
  if(chdir("./..") != 0){
    2ed9:	83 ec 0c             	sub    $0xc,%esp
    2edc:	68 eb 55 00 00       	push   $0x55eb
    2ee1:	e8 5d 1a 00 00       	call   4943 <chdir>
    2ee6:	83 c4 10             	add    $0x10,%esp
    2ee9:	85 c0                	test   %eax,%eax
    2eeb:	0f 85 21 03 00 00    	jne    3212 <subdir+0x4f2>
  fd = open("dd/dd/ffff", 0);
    2ef1:	83 ec 08             	sub    $0x8,%esp
    2ef4:	6a 00                	push   $0x0
    2ef6:	68 82 55 00 00       	push   $0x5582
    2efb:	e8 13 1a 00 00       	call   4913 <open>
  if(fd < 0){
    2f00:	83 c4 10             	add    $0x10,%esp
  fd = open("dd/dd/ffff", 0);
    2f03:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    2f05:	85 c0                	test   %eax,%eax
    2f07:	0f 88 e0 04 00 00    	js     33ed <subdir+0x6cd>
  if(read(fd, buf, sizeof(buf)) != 2){
    2f0d:	83 ec 04             	sub    $0x4,%esp
    2f10:	68 00 20 00 00       	push   $0x2000
    2f15:	68 a0 95 00 00       	push   $0x95a0
    2f1a:	50                   	push   %eax
    2f1b:	e8 cb 19 00 00       	call   48eb <read>
    2f20:	83 c4 10             	add    $0x10,%esp
    2f23:	83 f8 02             	cmp    $0x2,%eax
    2f26:	0f 85 ae 04 00 00    	jne    33da <subdir+0x6ba>
  close(fd);
    2f2c:	83 ec 0c             	sub    $0xc,%esp
    2f2f:	53                   	push   %ebx
    2f30:	e8 c6 19 00 00       	call   48fb <close>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    2f35:	58                   	pop    %eax
    2f36:	5a                   	pop    %edx
    2f37:	6a 00                	push   $0x0
    2f39:	68 1e 55 00 00       	push   $0x551e
    2f3e:	e8 d0 19 00 00       	call   4913 <open>
    2f43:	83 c4 10             	add    $0x10,%esp
    2f46:	85 c0                	test   %eax,%eax
    2f48:	0f 89 65 02 00 00    	jns    31b3 <subdir+0x493>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    2f4e:	83 ec 08             	sub    $0x8,%esp
    2f51:	68 02 02 00 00       	push   $0x202
    2f56:	68 36 56 00 00       	push   $0x5636
    2f5b:	e8 b3 19 00 00       	call   4913 <open>
    2f60:	83 c4 10             	add    $0x10,%esp
    2f63:	85 c0                	test   %eax,%eax
    2f65:	0f 89 35 02 00 00    	jns    31a0 <subdir+0x480>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    2f6b:	83 ec 08             	sub    $0x8,%esp
    2f6e:	68 02 02 00 00       	push   $0x202
    2f73:	68 5b 56 00 00       	push   $0x565b
    2f78:	e8 96 19 00 00       	call   4913 <open>
    2f7d:	83 c4 10             	add    $0x10,%esp
    2f80:	85 c0                	test   %eax,%eax
    2f82:	0f 89 0f 03 00 00    	jns    3297 <subdir+0x577>
  if(open("dd", O_CREATE) >= 0){
    2f88:	83 ec 08             	sub    $0x8,%esp
    2f8b:	68 00 02 00 00       	push   $0x200
    2f90:	68 e8 55 00 00       	push   $0x55e8
    2f95:	e8 79 19 00 00       	call   4913 <open>
    2f9a:	83 c4 10             	add    $0x10,%esp
    2f9d:	85 c0                	test   %eax,%eax
    2f9f:	0f 89 df 02 00 00    	jns    3284 <subdir+0x564>
  if(open("dd", O_RDWR) >= 0){
    2fa5:	83 ec 08             	sub    $0x8,%esp
    2fa8:	6a 02                	push   $0x2
    2faa:	68 e8 55 00 00       	push   $0x55e8
    2faf:	e8 5f 19 00 00       	call   4913 <open>
    2fb4:	83 c4 10             	add    $0x10,%esp
    2fb7:	85 c0                	test   %eax,%eax
    2fb9:	0f 89 b2 02 00 00    	jns    3271 <subdir+0x551>
  if(open("dd", O_WRONLY) >= 0){
    2fbf:	83 ec 08             	sub    $0x8,%esp
    2fc2:	6a 01                	push   $0x1
    2fc4:	68 e8 55 00 00       	push   $0x55e8
    2fc9:	e8 45 19 00 00       	call   4913 <open>
    2fce:	83 c4 10             	add    $0x10,%esp
    2fd1:	85 c0                	test   %eax,%eax
    2fd3:	0f 89 85 02 00 00    	jns    325e <subdir+0x53e>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    2fd9:	83 ec 08             	sub    $0x8,%esp
    2fdc:	68 ca 56 00 00       	push   $0x56ca
    2fe1:	68 36 56 00 00       	push   $0x5636
    2fe6:	e8 48 19 00 00       	call   4933 <link>
    2feb:	83 c4 10             	add    $0x10,%esp
    2fee:	85 c0                	test   %eax,%eax
    2ff0:	0f 84 55 02 00 00    	je     324b <subdir+0x52b>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    2ff6:	83 ec 08             	sub    $0x8,%esp
    2ff9:	68 ca 56 00 00       	push   $0x56ca
    2ffe:	68 5b 56 00 00       	push   $0x565b
    3003:	e8 2b 19 00 00       	call   4933 <link>
    3008:	83 c4 10             	add    $0x10,%esp
    300b:	85 c0                	test   %eax,%eax
    300d:	0f 84 25 02 00 00    	je     3238 <subdir+0x518>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    3013:	83 ec 08             	sub    $0x8,%esp
    3016:	68 82 55 00 00       	push   $0x5582
    301b:	68 21 55 00 00       	push   $0x5521
    3020:	e8 0e 19 00 00       	call   4933 <link>
    3025:	83 c4 10             	add    $0x10,%esp
    3028:	85 c0                	test   %eax,%eax
    302a:	0f 84 a9 01 00 00    	je     31d9 <subdir+0x4b9>
  if(mkdir("dd/ff/ff") == 0){
    3030:	83 ec 0c             	sub    $0xc,%esp
    3033:	68 36 56 00 00       	push   $0x5636
    3038:	e8 fe 18 00 00       	call   493b <mkdir>
    303d:	83 c4 10             	add    $0x10,%esp
    3040:	85 c0                	test   %eax,%eax
    3042:	0f 84 7e 01 00 00    	je     31c6 <subdir+0x4a6>
  if(mkdir("dd/xx/ff") == 0){
    3048:	83 ec 0c             	sub    $0xc,%esp
    304b:	68 5b 56 00 00       	push   $0x565b
    3050:	e8 e6 18 00 00       	call   493b <mkdir>
    3055:	83 c4 10             	add    $0x10,%esp
    3058:	85 c0                	test   %eax,%eax
    305a:	0f 84 67 03 00 00    	je     33c7 <subdir+0x6a7>
  if(mkdir("dd/dd/ffff") == 0){
    3060:	83 ec 0c             	sub    $0xc,%esp
    3063:	68 82 55 00 00       	push   $0x5582
    3068:	e8 ce 18 00 00       	call   493b <mkdir>
    306d:	83 c4 10             	add    $0x10,%esp
    3070:	85 c0                	test   %eax,%eax
    3072:	0f 84 3c 03 00 00    	je     33b4 <subdir+0x694>
  if(unlink("dd/xx/ff") == 0){
    3078:	83 ec 0c             	sub    $0xc,%esp
    307b:	68 5b 56 00 00       	push   $0x565b
    3080:	e8 9e 18 00 00       	call   4923 <unlink>
    3085:	83 c4 10             	add    $0x10,%esp
    3088:	85 c0                	test   %eax,%eax
    308a:	0f 84 11 03 00 00    	je     33a1 <subdir+0x681>
  if(unlink("dd/ff/ff") == 0){
    3090:	83 ec 0c             	sub    $0xc,%esp
    3093:	68 36 56 00 00       	push   $0x5636
    3098:	e8 86 18 00 00       	call   4923 <unlink>
    309d:	83 c4 10             	add    $0x10,%esp
    30a0:	85 c0                	test   %eax,%eax
    30a2:	0f 84 e6 02 00 00    	je     338e <subdir+0x66e>
  if(chdir("dd/ff") == 0){
    30a8:	83 ec 0c             	sub    $0xc,%esp
    30ab:	68 21 55 00 00       	push   $0x5521
    30b0:	e8 8e 18 00 00       	call   4943 <chdir>
    30b5:	83 c4 10             	add    $0x10,%esp
    30b8:	85 c0                	test   %eax,%eax
    30ba:	0f 84 bb 02 00 00    	je     337b <subdir+0x65b>
  if(chdir("dd/xx") == 0){
    30c0:	83 ec 0c             	sub    $0xc,%esp
    30c3:	68 cd 56 00 00       	push   $0x56cd
    30c8:	e8 76 18 00 00       	call   4943 <chdir>
    30cd:	83 c4 10             	add    $0x10,%esp
    30d0:	85 c0                	test   %eax,%eax
    30d2:	0f 84 90 02 00 00    	je     3368 <subdir+0x648>
  if(unlink("dd/dd/ffff") != 0){
    30d8:	83 ec 0c             	sub    $0xc,%esp
    30db:	68 82 55 00 00       	push   $0x5582
    30e0:	e8 3e 18 00 00       	call   4923 <unlink>
    30e5:	83 c4 10             	add    $0x10,%esp
    30e8:	85 c0                	test   %eax,%eax
    30ea:	0f 85 9d 00 00 00    	jne    318d <subdir+0x46d>
  if(unlink("dd/ff") != 0){
    30f0:	83 ec 0c             	sub    $0xc,%esp
    30f3:	68 21 55 00 00       	push   $0x5521
    30f8:	e8 26 18 00 00       	call   4923 <unlink>
    30fd:	83 c4 10             	add    $0x10,%esp
    3100:	85 c0                	test   %eax,%eax
    3102:	0f 85 4d 02 00 00    	jne    3355 <subdir+0x635>
  if(unlink("dd") == 0){
    3108:	83 ec 0c             	sub    $0xc,%esp
    310b:	68 e8 55 00 00       	push   $0x55e8
    3110:	e8 0e 18 00 00       	call   4923 <unlink>
    3115:	83 c4 10             	add    $0x10,%esp
    3118:	85 c0                	test   %eax,%eax
    311a:	0f 84 22 02 00 00    	je     3342 <subdir+0x622>
  if(unlink("dd/dd") < 0){
    3120:	83 ec 0c             	sub    $0xc,%esp
    3123:	68 fd 54 00 00       	push   $0x54fd
    3128:	e8 f6 17 00 00       	call   4923 <unlink>
    312d:	83 c4 10             	add    $0x10,%esp
    3130:	85 c0                	test   %eax,%eax
    3132:	0f 88 f7 01 00 00    	js     332f <subdir+0x60f>
  if(unlink("dd") < 0){
    3138:	83 ec 0c             	sub    $0xc,%esp
    313b:	68 e8 55 00 00       	push   $0x55e8
    3140:	e8 de 17 00 00       	call   4923 <unlink>
    3145:	83 c4 10             	add    $0x10,%esp
    3148:	85 c0                	test   %eax,%eax
    314a:	0f 88 cc 01 00 00    	js     331c <subdir+0x5fc>
  printf(1, "subdir ok\n");
    3150:	83 ec 08             	sub    $0x8,%esp
    3153:	68 ca 57 00 00       	push   $0x57ca
    3158:	6a 01                	push   $0x1
    315a:	e8 f1 18 00 00       	call   4a50 <printf>
}
    315f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3162:	83 c4 10             	add    $0x10,%esp
    3165:	c9                   	leave  
    3166:	c3                   	ret    
    printf(1, "dd/dd/../ff wrong content\n");
    3167:	50                   	push   %eax
    3168:	50                   	push   %eax
    3169:	68 67 55 00 00       	push   $0x5567
    316e:	6a 01                	push   $0x1
    3170:	e8 db 18 00 00       	call   4a50 <printf>
    exit();
    3175:	e8 59 17 00 00       	call   48d3 <exit>
    printf(1, "chdir dd/../../dd failed\n");
    317a:	50                   	push   %eax
    317b:	50                   	push   %eax
    317c:	68 c2 55 00 00       	push   $0x55c2
    3181:	6a 01                	push   $0x1
    3183:	e8 c8 18 00 00       	call   4a50 <printf>
    exit();
    3188:	e8 46 17 00 00       	call   48d3 <exit>
    printf(1, "unlink dd/dd/ff failed\n");
    318d:	50                   	push   %eax
    318e:	50                   	push   %eax
    318f:	68 8d 55 00 00       	push   $0x558d
    3194:	6a 01                	push   $0x1
    3196:	e8 b5 18 00 00       	call   4a50 <printf>
    exit();
    319b:	e8 33 17 00 00       	call   48d3 <exit>
    printf(1, "create dd/ff/ff succeeded!\n");
    31a0:	51                   	push   %ecx
    31a1:	51                   	push   %ecx
    31a2:	68 3f 56 00 00       	push   $0x563f
    31a7:	6a 01                	push   $0x1
    31a9:	e8 a2 18 00 00       	call   4a50 <printf>
    exit();
    31ae:	e8 20 17 00 00       	call   48d3 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    31b3:	53                   	push   %ebx
    31b4:	53                   	push   %ebx
    31b5:	68 24 60 00 00       	push   $0x6024
    31ba:	6a 01                	push   $0x1
    31bc:	e8 8f 18 00 00       	call   4a50 <printf>
    exit();
    31c1:	e8 0d 17 00 00       	call   48d3 <exit>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    31c6:	51                   	push   %ecx
    31c7:	51                   	push   %ecx
    31c8:	68 d3 56 00 00       	push   $0x56d3
    31cd:	6a 01                	push   $0x1
    31cf:	e8 7c 18 00 00       	call   4a50 <printf>
    exit();
    31d4:	e8 fa 16 00 00       	call   48d3 <exit>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    31d9:	53                   	push   %ebx
    31da:	53                   	push   %ebx
    31db:	68 94 60 00 00       	push   $0x6094
    31e0:	6a 01                	push   $0x1
    31e2:	e8 69 18 00 00       	call   4a50 <printf>
    exit();
    31e7:	e8 e7 16 00 00       	call   48d3 <exit>
    printf(1, "open dd/dd/../ff failed\n");
    31ec:	50                   	push   %eax
    31ed:	50                   	push   %eax
    31ee:	68 4e 55 00 00       	push   $0x554e
    31f3:	6a 01                	push   $0x1
    31f5:	e8 56 18 00 00       	call   4a50 <printf>
    exit();
    31fa:	e8 d4 16 00 00       	call   48d3 <exit>
    printf(1, "create dd/dd/ff failed\n");
    31ff:	51                   	push   %ecx
    3200:	51                   	push   %ecx
    3201:	68 27 55 00 00       	push   $0x5527
    3206:	6a 01                	push   $0x1
    3208:	e8 43 18 00 00       	call   4a50 <printf>
    exit();
    320d:	e8 c1 16 00 00       	call   48d3 <exit>
    printf(1, "chdir ./.. failed\n");
    3212:	50                   	push   %eax
    3213:	50                   	push   %eax
    3214:	68 f0 55 00 00       	push   $0x55f0
    3219:	6a 01                	push   $0x1
    321b:	e8 30 18 00 00       	call   4a50 <printf>
    exit();
    3220:	e8 ae 16 00 00       	call   48d3 <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    3225:	52                   	push   %edx
    3226:	52                   	push   %edx
    3227:	68 dc 5f 00 00       	push   $0x5fdc
    322c:	6a 01                	push   $0x1
    322e:	e8 1d 18 00 00       	call   4a50 <printf>
    exit();
    3233:	e8 9b 16 00 00       	call   48d3 <exit>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    3238:	50                   	push   %eax
    3239:	50                   	push   %eax
    323a:	68 70 60 00 00       	push   $0x6070
    323f:	6a 01                	push   $0x1
    3241:	e8 0a 18 00 00       	call   4a50 <printf>
    exit();
    3246:	e8 88 16 00 00       	call   48d3 <exit>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    324b:	50                   	push   %eax
    324c:	50                   	push   %eax
    324d:	68 4c 60 00 00       	push   $0x604c
    3252:	6a 01                	push   $0x1
    3254:	e8 f7 17 00 00       	call   4a50 <printf>
    exit();
    3259:	e8 75 16 00 00       	call   48d3 <exit>
    printf(1, "open dd wronly succeeded!\n");
    325e:	50                   	push   %eax
    325f:	50                   	push   %eax
    3260:	68 af 56 00 00       	push   $0x56af
    3265:	6a 01                	push   $0x1
    3267:	e8 e4 17 00 00       	call   4a50 <printf>
    exit();
    326c:	e8 62 16 00 00       	call   48d3 <exit>
    printf(1, "open dd rdwr succeeded!\n");
    3271:	50                   	push   %eax
    3272:	50                   	push   %eax
    3273:	68 96 56 00 00       	push   $0x5696
    3278:	6a 01                	push   $0x1
    327a:	e8 d1 17 00 00       	call   4a50 <printf>
    exit();
    327f:	e8 4f 16 00 00       	call   48d3 <exit>
    printf(1, "create dd succeeded!\n");
    3284:	50                   	push   %eax
    3285:	50                   	push   %eax
    3286:	68 80 56 00 00       	push   $0x5680
    328b:	6a 01                	push   $0x1
    328d:	e8 be 17 00 00       	call   4a50 <printf>
    exit();
    3292:	e8 3c 16 00 00       	call   48d3 <exit>
    printf(1, "create dd/xx/ff succeeded!\n");
    3297:	52                   	push   %edx
    3298:	52                   	push   %edx
    3299:	68 64 56 00 00       	push   $0x5664
    329e:	6a 01                	push   $0x1
    32a0:	e8 ab 17 00 00       	call   4a50 <printf>
    exit();
    32a5:	e8 29 16 00 00       	call   48d3 <exit>
    printf(1, "chdir dd failed\n");
    32aa:	50                   	push   %eax
    32ab:	50                   	push   %eax
    32ac:	68 a5 55 00 00       	push   $0x55a5
    32b1:	6a 01                	push   $0x1
    32b3:	e8 98 17 00 00       	call   4a50 <printf>
    exit();
    32b8:	e8 16 16 00 00       	call   48d3 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    32bd:	50                   	push   %eax
    32be:	50                   	push   %eax
    32bf:	68 00 60 00 00       	push   $0x6000
    32c4:	6a 01                	push   $0x1
    32c6:	e8 85 17 00 00       	call   4a50 <printf>
    exit();
    32cb:	e8 03 16 00 00       	call   48d3 <exit>
    printf(1, "subdir mkdir dd/dd failed\n");
    32d0:	53                   	push   %ebx
    32d1:	53                   	push   %ebx
    32d2:	68 03 55 00 00       	push   $0x5503
    32d7:	6a 01                	push   $0x1
    32d9:	e8 72 17 00 00       	call   4a50 <printf>
    exit();
    32de:	e8 f0 15 00 00       	call   48d3 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    32e3:	50                   	push   %eax
    32e4:	50                   	push   %eax
    32e5:	68 b4 5f 00 00       	push   $0x5fb4
    32ea:	6a 01                	push   $0x1
    32ec:	e8 5f 17 00 00       	call   4a50 <printf>
    exit();
    32f1:	e8 dd 15 00 00       	call   48d3 <exit>
    printf(1, "create dd/ff failed\n");
    32f6:	50                   	push   %eax
    32f7:	50                   	push   %eax
    32f8:	68 e7 54 00 00       	push   $0x54e7
    32fd:	6a 01                	push   $0x1
    32ff:	e8 4c 17 00 00       	call   4a50 <printf>
    exit();
    3304:	e8 ca 15 00 00       	call   48d3 <exit>
    printf(1, "subdir mkdir dd failed\n");
    3309:	50                   	push   %eax
    330a:	50                   	push   %eax
    330b:	68 cf 54 00 00       	push   $0x54cf
    3310:	6a 01                	push   $0x1
    3312:	e8 39 17 00 00       	call   4a50 <printf>
    exit();
    3317:	e8 b7 15 00 00       	call   48d3 <exit>
    printf(1, "unlink dd failed\n");
    331c:	50                   	push   %eax
    331d:	50                   	push   %eax
    331e:	68 b8 57 00 00       	push   $0x57b8
    3323:	6a 01                	push   $0x1
    3325:	e8 26 17 00 00       	call   4a50 <printf>
    exit();
    332a:	e8 a4 15 00 00       	call   48d3 <exit>
    printf(1, "unlink dd/dd failed\n");
    332f:	52                   	push   %edx
    3330:	52                   	push   %edx
    3331:	68 a3 57 00 00       	push   $0x57a3
    3336:	6a 01                	push   $0x1
    3338:	e8 13 17 00 00       	call   4a50 <printf>
    exit();
    333d:	e8 91 15 00 00       	call   48d3 <exit>
    printf(1, "unlink non-empty dd succeeded!\n");
    3342:	51                   	push   %ecx
    3343:	51                   	push   %ecx
    3344:	68 b8 60 00 00       	push   $0x60b8
    3349:	6a 01                	push   $0x1
    334b:	e8 00 17 00 00       	call   4a50 <printf>
    exit();
    3350:	e8 7e 15 00 00       	call   48d3 <exit>
    printf(1, "unlink dd/ff failed\n");
    3355:	53                   	push   %ebx
    3356:	53                   	push   %ebx
    3357:	68 8e 57 00 00       	push   $0x578e
    335c:	6a 01                	push   $0x1
    335e:	e8 ed 16 00 00       	call   4a50 <printf>
    exit();
    3363:	e8 6b 15 00 00       	call   48d3 <exit>
    printf(1, "chdir dd/xx succeeded!\n");
    3368:	50                   	push   %eax
    3369:	50                   	push   %eax
    336a:	68 76 57 00 00       	push   $0x5776
    336f:	6a 01                	push   $0x1
    3371:	e8 da 16 00 00       	call   4a50 <printf>
    exit();
    3376:	e8 58 15 00 00       	call   48d3 <exit>
    printf(1, "chdir dd/ff succeeded!\n");
    337b:	50                   	push   %eax
    337c:	50                   	push   %eax
    337d:	68 5e 57 00 00       	push   $0x575e
    3382:	6a 01                	push   $0x1
    3384:	e8 c7 16 00 00       	call   4a50 <printf>
    exit();
    3389:	e8 45 15 00 00       	call   48d3 <exit>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    338e:	50                   	push   %eax
    338f:	50                   	push   %eax
    3390:	68 42 57 00 00       	push   $0x5742
    3395:	6a 01                	push   $0x1
    3397:	e8 b4 16 00 00       	call   4a50 <printf>
    exit();
    339c:	e8 32 15 00 00       	call   48d3 <exit>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    33a1:	50                   	push   %eax
    33a2:	50                   	push   %eax
    33a3:	68 26 57 00 00       	push   $0x5726
    33a8:	6a 01                	push   $0x1
    33aa:	e8 a1 16 00 00       	call   4a50 <printf>
    exit();
    33af:	e8 1f 15 00 00       	call   48d3 <exit>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    33b4:	50                   	push   %eax
    33b5:	50                   	push   %eax
    33b6:	68 09 57 00 00       	push   $0x5709
    33bb:	6a 01                	push   $0x1
    33bd:	e8 8e 16 00 00       	call   4a50 <printf>
    exit();
    33c2:	e8 0c 15 00 00       	call   48d3 <exit>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    33c7:	52                   	push   %edx
    33c8:	52                   	push   %edx
    33c9:	68 ee 56 00 00       	push   $0x56ee
    33ce:	6a 01                	push   $0x1
    33d0:	e8 7b 16 00 00       	call   4a50 <printf>
    exit();
    33d5:	e8 f9 14 00 00       	call   48d3 <exit>
    printf(1, "read dd/dd/ffff wrong len\n");
    33da:	51                   	push   %ecx
    33db:	51                   	push   %ecx
    33dc:	68 1b 56 00 00       	push   $0x561b
    33e1:	6a 01                	push   $0x1
    33e3:	e8 68 16 00 00       	call   4a50 <printf>
    exit();
    33e8:	e8 e6 14 00 00       	call   48d3 <exit>
    printf(1, "open dd/dd/ffff failed\n");
    33ed:	53                   	push   %ebx
    33ee:	53                   	push   %ebx
    33ef:	68 03 56 00 00       	push   $0x5603
    33f4:	6a 01                	push   $0x1
    33f6:	e8 55 16 00 00       	call   4a50 <printf>
    exit();
    33fb:	e8 d3 14 00 00       	call   48d3 <exit>

00003400 <bigwrite>:
{
    3400:	55                   	push   %ebp
    3401:	89 e5                	mov    %esp,%ebp
    3403:	56                   	push   %esi
    3404:	53                   	push   %ebx
  for(sz = 499; sz < 12*512; sz += 471){
    3405:	bb f3 01 00 00       	mov    $0x1f3,%ebx
  printf(1, "bigwrite test\n");
    340a:	83 ec 08             	sub    $0x8,%esp
    340d:	68 d5 57 00 00       	push   $0x57d5
    3412:	6a 01                	push   $0x1
    3414:	e8 37 16 00 00       	call   4a50 <printf>
  unlink("bigwrite");
    3419:	c7 04 24 e4 57 00 00 	movl   $0x57e4,(%esp)
    3420:	e8 fe 14 00 00       	call   4923 <unlink>
    3425:	83 c4 10             	add    $0x10,%esp
    3428:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    342f:	90                   	nop
    fd = open("bigwrite", O_CREATE | O_RDWR);
    3430:	83 ec 08             	sub    $0x8,%esp
    3433:	68 02 02 00 00       	push   $0x202
    3438:	68 e4 57 00 00       	push   $0x57e4
    343d:	e8 d1 14 00 00       	call   4913 <open>
    if(fd < 0){
    3442:	83 c4 10             	add    $0x10,%esp
    fd = open("bigwrite", O_CREATE | O_RDWR);
    3445:	89 c6                	mov    %eax,%esi
    if(fd < 0){
    3447:	85 c0                	test   %eax,%eax
    3449:	78 7e                	js     34c9 <bigwrite+0xc9>
      int cc = write(fd, buf, sz);
    344b:	83 ec 04             	sub    $0x4,%esp
    344e:	53                   	push   %ebx
    344f:	68 a0 95 00 00       	push   $0x95a0
    3454:	50                   	push   %eax
    3455:	e8 99 14 00 00       	call   48f3 <write>
      if(cc != sz){
    345a:	83 c4 10             	add    $0x10,%esp
    345d:	39 d8                	cmp    %ebx,%eax
    345f:	75 55                	jne    34b6 <bigwrite+0xb6>
      int cc = write(fd, buf, sz);
    3461:	83 ec 04             	sub    $0x4,%esp
    3464:	53                   	push   %ebx
    3465:	68 a0 95 00 00       	push   $0x95a0
    346a:	56                   	push   %esi
    346b:	e8 83 14 00 00       	call   48f3 <write>
      if(cc != sz){
    3470:	83 c4 10             	add    $0x10,%esp
    3473:	39 d8                	cmp    %ebx,%eax
    3475:	75 3f                	jne    34b6 <bigwrite+0xb6>
    close(fd);
    3477:	83 ec 0c             	sub    $0xc,%esp
  for(sz = 499; sz < 12*512; sz += 471){
    347a:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
    close(fd);
    3480:	56                   	push   %esi
    3481:	e8 75 14 00 00       	call   48fb <close>
    unlink("bigwrite");
    3486:	c7 04 24 e4 57 00 00 	movl   $0x57e4,(%esp)
    348d:	e8 91 14 00 00       	call   4923 <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    3492:	83 c4 10             	add    $0x10,%esp
    3495:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    349b:	75 93                	jne    3430 <bigwrite+0x30>
  printf(1, "bigwrite ok\n");
    349d:	83 ec 08             	sub    $0x8,%esp
    34a0:	68 17 58 00 00       	push   $0x5817
    34a5:	6a 01                	push   $0x1
    34a7:	e8 a4 15 00 00       	call   4a50 <printf>
}
    34ac:	83 c4 10             	add    $0x10,%esp
    34af:	8d 65 f8             	lea    -0x8(%ebp),%esp
    34b2:	5b                   	pop    %ebx
    34b3:	5e                   	pop    %esi
    34b4:	5d                   	pop    %ebp
    34b5:	c3                   	ret    
        printf(1, "write(%d) ret %d\n", sz, cc);
    34b6:	50                   	push   %eax
    34b7:	53                   	push   %ebx
    34b8:	68 05 58 00 00       	push   $0x5805
    34bd:	6a 01                	push   $0x1
    34bf:	e8 8c 15 00 00       	call   4a50 <printf>
        exit();
    34c4:	e8 0a 14 00 00       	call   48d3 <exit>
      printf(1, "cannot create bigwrite\n");
    34c9:	83 ec 08             	sub    $0x8,%esp
    34cc:	68 ed 57 00 00       	push   $0x57ed
    34d1:	6a 01                	push   $0x1
    34d3:	e8 78 15 00 00       	call   4a50 <printf>
      exit();
    34d8:	e8 f6 13 00 00       	call   48d3 <exit>
    34dd:	8d 76 00             	lea    0x0(%esi),%esi

000034e0 <bigfile>:
{
    34e0:	55                   	push   %ebp
    34e1:	89 e5                	mov    %esp,%ebp
    34e3:	57                   	push   %edi
    34e4:	56                   	push   %esi
    34e5:	53                   	push   %ebx
    34e6:	83 ec 14             	sub    $0x14,%esp
  printf(1, "bigfile test\n");
    34e9:	68 24 58 00 00       	push   $0x5824
    34ee:	6a 01                	push   $0x1
    34f0:	e8 5b 15 00 00       	call   4a50 <printf>
  unlink("bigfile");
    34f5:	c7 04 24 40 58 00 00 	movl   $0x5840,(%esp)
    34fc:	e8 22 14 00 00       	call   4923 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    3501:	58                   	pop    %eax
    3502:	5a                   	pop    %edx
    3503:	68 02 02 00 00       	push   $0x202
    3508:	68 40 58 00 00       	push   $0x5840
    350d:	e8 01 14 00 00       	call   4913 <open>
  if(fd < 0){
    3512:	83 c4 10             	add    $0x10,%esp
    3515:	85 c0                	test   %eax,%eax
    3517:	0f 88 5e 01 00 00    	js     367b <bigfile+0x19b>
    351d:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 20; i++){
    351f:	31 db                	xor    %ebx,%ebx
    3521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    memset(buf, i, 600);
    3528:	83 ec 04             	sub    $0x4,%esp
    352b:	68 58 02 00 00       	push   $0x258
    3530:	53                   	push   %ebx
    3531:	68 a0 95 00 00       	push   $0x95a0
    3536:	e8 05 12 00 00       	call   4740 <memset>
    if(write(fd, buf, 600) != 600){
    353b:	83 c4 0c             	add    $0xc,%esp
    353e:	68 58 02 00 00       	push   $0x258
    3543:	68 a0 95 00 00       	push   $0x95a0
    3548:	56                   	push   %esi
    3549:	e8 a5 13 00 00       	call   48f3 <write>
    354e:	83 c4 10             	add    $0x10,%esp
    3551:	3d 58 02 00 00       	cmp    $0x258,%eax
    3556:	0f 85 f8 00 00 00    	jne    3654 <bigfile+0x174>
  for(i = 0; i < 20; i++){
    355c:	83 c3 01             	add    $0x1,%ebx
    355f:	83 fb 14             	cmp    $0x14,%ebx
    3562:	75 c4                	jne    3528 <bigfile+0x48>
  close(fd);
    3564:	83 ec 0c             	sub    $0xc,%esp
    3567:	56                   	push   %esi
    3568:	e8 8e 13 00 00       	call   48fb <close>
  fd = open("bigfile", 0);
    356d:	5e                   	pop    %esi
    356e:	5f                   	pop    %edi
    356f:	6a 00                	push   $0x0
    3571:	68 40 58 00 00       	push   $0x5840
    3576:	e8 98 13 00 00       	call   4913 <open>
  if(fd < 0){
    357b:	83 c4 10             	add    $0x10,%esp
  fd = open("bigfile", 0);
    357e:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    3580:	85 c0                	test   %eax,%eax
    3582:	0f 88 e0 00 00 00    	js     3668 <bigfile+0x188>
  total = 0;
    3588:	31 db                	xor    %ebx,%ebx
  for(i = 0; ; i++){
    358a:	31 ff                	xor    %edi,%edi
    358c:	eb 30                	jmp    35be <bigfile+0xde>
    358e:	66 90                	xchg   %ax,%ax
    if(cc != 300){
    3590:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    3595:	0f 85 91 00 00 00    	jne    362c <bigfile+0x14c>
    if(buf[0] != i/2 || buf[299] != i/2){
    359b:	89 fa                	mov    %edi,%edx
    359d:	0f be 05 a0 95 00 00 	movsbl 0x95a0,%eax
    35a4:	d1 fa                	sar    %edx
    35a6:	39 d0                	cmp    %edx,%eax
    35a8:	75 6e                	jne    3618 <bigfile+0x138>
    35aa:	0f be 15 cb 96 00 00 	movsbl 0x96cb,%edx
    35b1:	39 d0                	cmp    %edx,%eax
    35b3:	75 63                	jne    3618 <bigfile+0x138>
    total += cc;
    35b5:	81 c3 2c 01 00 00    	add    $0x12c,%ebx
  for(i = 0; ; i++){
    35bb:	83 c7 01             	add    $0x1,%edi
    cc = read(fd, buf, 300);
    35be:	83 ec 04             	sub    $0x4,%esp
    35c1:	68 2c 01 00 00       	push   $0x12c
    35c6:	68 a0 95 00 00       	push   $0x95a0
    35cb:	56                   	push   %esi
    35cc:	e8 1a 13 00 00       	call   48eb <read>
    if(cc < 0){
    35d1:	83 c4 10             	add    $0x10,%esp
    35d4:	85 c0                	test   %eax,%eax
    35d6:	78 68                	js     3640 <bigfile+0x160>
    if(cc == 0)
    35d8:	75 b6                	jne    3590 <bigfile+0xb0>
  close(fd);
    35da:	83 ec 0c             	sub    $0xc,%esp
    35dd:	56                   	push   %esi
    35de:	e8 18 13 00 00       	call   48fb <close>
  if(total != 20*600){
    35e3:	83 c4 10             	add    $0x10,%esp
    35e6:	81 fb e0 2e 00 00    	cmp    $0x2ee0,%ebx
    35ec:	0f 85 9c 00 00 00    	jne    368e <bigfile+0x1ae>
  unlink("bigfile");
    35f2:	83 ec 0c             	sub    $0xc,%esp
    35f5:	68 40 58 00 00       	push   $0x5840
    35fa:	e8 24 13 00 00       	call   4923 <unlink>
  printf(1, "bigfile test ok\n");
    35ff:	58                   	pop    %eax
    3600:	5a                   	pop    %edx
    3601:	68 cf 58 00 00       	push   $0x58cf
    3606:	6a 01                	push   $0x1
    3608:	e8 43 14 00 00       	call   4a50 <printf>
}
    360d:	83 c4 10             	add    $0x10,%esp
    3610:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3613:	5b                   	pop    %ebx
    3614:	5e                   	pop    %esi
    3615:	5f                   	pop    %edi
    3616:	5d                   	pop    %ebp
    3617:	c3                   	ret    
      printf(1, "read bigfile wrong data\n");
    3618:	83 ec 08             	sub    $0x8,%esp
    361b:	68 9c 58 00 00       	push   $0x589c
    3620:	6a 01                	push   $0x1
    3622:	e8 29 14 00 00       	call   4a50 <printf>
      exit();
    3627:	e8 a7 12 00 00       	call   48d3 <exit>
      printf(1, "short read bigfile\n");
    362c:	83 ec 08             	sub    $0x8,%esp
    362f:	68 88 58 00 00       	push   $0x5888
    3634:	6a 01                	push   $0x1
    3636:	e8 15 14 00 00       	call   4a50 <printf>
      exit();
    363b:	e8 93 12 00 00       	call   48d3 <exit>
      printf(1, "read bigfile failed\n");
    3640:	83 ec 08             	sub    $0x8,%esp
    3643:	68 73 58 00 00       	push   $0x5873
    3648:	6a 01                	push   $0x1
    364a:	e8 01 14 00 00       	call   4a50 <printf>
      exit();
    364f:	e8 7f 12 00 00       	call   48d3 <exit>
      printf(1, "write bigfile failed\n");
    3654:	83 ec 08             	sub    $0x8,%esp
    3657:	68 48 58 00 00       	push   $0x5848
    365c:	6a 01                	push   $0x1
    365e:	e8 ed 13 00 00       	call   4a50 <printf>
      exit();
    3663:	e8 6b 12 00 00       	call   48d3 <exit>
    printf(1, "cannot open bigfile\n");
    3668:	53                   	push   %ebx
    3669:	53                   	push   %ebx
    366a:	68 5e 58 00 00       	push   $0x585e
    366f:	6a 01                	push   $0x1
    3671:	e8 da 13 00 00       	call   4a50 <printf>
    exit();
    3676:	e8 58 12 00 00       	call   48d3 <exit>
    printf(1, "cannot create bigfile");
    367b:	50                   	push   %eax
    367c:	50                   	push   %eax
    367d:	68 32 58 00 00       	push   $0x5832
    3682:	6a 01                	push   $0x1
    3684:	e8 c7 13 00 00       	call   4a50 <printf>
    exit();
    3689:	e8 45 12 00 00       	call   48d3 <exit>
    printf(1, "read bigfile wrong total\n");
    368e:	51                   	push   %ecx
    368f:	51                   	push   %ecx
    3690:	68 b5 58 00 00       	push   $0x58b5
    3695:	6a 01                	push   $0x1
    3697:	e8 b4 13 00 00       	call   4a50 <printf>
    exit();
    369c:	e8 32 12 00 00       	call   48d3 <exit>
    36a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    36a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    36af:	90                   	nop

000036b0 <fourteen>:
{
    36b0:	55                   	push   %ebp
    36b1:	89 e5                	mov    %esp,%ebp
    36b3:	83 ec 10             	sub    $0x10,%esp
  printf(1, "fourteen test\n");
    36b6:	68 e0 58 00 00       	push   $0x58e0
    36bb:	6a 01                	push   $0x1
    36bd:	e8 8e 13 00 00       	call   4a50 <printf>
  if(mkdir("12345678901234") != 0){
    36c2:	c7 04 24 1b 59 00 00 	movl   $0x591b,(%esp)
    36c9:	e8 6d 12 00 00       	call   493b <mkdir>
    36ce:	83 c4 10             	add    $0x10,%esp
    36d1:	85 c0                	test   %eax,%eax
    36d3:	0f 85 97 00 00 00    	jne    3770 <fourteen+0xc0>
  if(mkdir("12345678901234/123456789012345") != 0){
    36d9:	83 ec 0c             	sub    $0xc,%esp
    36dc:	68 d8 60 00 00       	push   $0x60d8
    36e1:	e8 55 12 00 00       	call   493b <mkdir>
    36e6:	83 c4 10             	add    $0x10,%esp
    36e9:	85 c0                	test   %eax,%eax
    36eb:	0f 85 de 00 00 00    	jne    37cf <fourteen+0x11f>
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    36f1:	83 ec 08             	sub    $0x8,%esp
    36f4:	68 00 02 00 00       	push   $0x200
    36f9:	68 28 61 00 00       	push   $0x6128
    36fe:	e8 10 12 00 00       	call   4913 <open>
  if(fd < 0){
    3703:	83 c4 10             	add    $0x10,%esp
    3706:	85 c0                	test   %eax,%eax
    3708:	0f 88 ae 00 00 00    	js     37bc <fourteen+0x10c>
  close(fd);
    370e:	83 ec 0c             	sub    $0xc,%esp
    3711:	50                   	push   %eax
    3712:	e8 e4 11 00 00       	call   48fb <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    3717:	58                   	pop    %eax
    3718:	5a                   	pop    %edx
    3719:	6a 00                	push   $0x0
    371b:	68 98 61 00 00       	push   $0x6198
    3720:	e8 ee 11 00 00       	call   4913 <open>
  if(fd < 0){
    3725:	83 c4 10             	add    $0x10,%esp
    3728:	85 c0                	test   %eax,%eax
    372a:	78 7d                	js     37a9 <fourteen+0xf9>
  close(fd);
    372c:	83 ec 0c             	sub    $0xc,%esp
    372f:	50                   	push   %eax
    3730:	e8 c6 11 00 00       	call   48fb <close>
  if(mkdir("12345678901234/12345678901234") == 0){
    3735:	c7 04 24 0c 59 00 00 	movl   $0x590c,(%esp)
    373c:	e8 fa 11 00 00       	call   493b <mkdir>
    3741:	83 c4 10             	add    $0x10,%esp
    3744:	85 c0                	test   %eax,%eax
    3746:	74 4e                	je     3796 <fourteen+0xe6>
  if(mkdir("123456789012345/12345678901234") == 0){
    3748:	83 ec 0c             	sub    $0xc,%esp
    374b:	68 34 62 00 00       	push   $0x6234
    3750:	e8 e6 11 00 00       	call   493b <mkdir>
    3755:	83 c4 10             	add    $0x10,%esp
    3758:	85 c0                	test   %eax,%eax
    375a:	74 27                	je     3783 <fourteen+0xd3>
  printf(1, "fourteen ok\n");
    375c:	83 ec 08             	sub    $0x8,%esp
    375f:	68 2a 59 00 00       	push   $0x592a
    3764:	6a 01                	push   $0x1
    3766:	e8 e5 12 00 00       	call   4a50 <printf>
}
    376b:	83 c4 10             	add    $0x10,%esp
    376e:	c9                   	leave  
    376f:	c3                   	ret    
    printf(1, "mkdir 12345678901234 failed\n");
    3770:	50                   	push   %eax
    3771:	50                   	push   %eax
    3772:	68 ef 58 00 00       	push   $0x58ef
    3777:	6a 01                	push   $0x1
    3779:	e8 d2 12 00 00       	call   4a50 <printf>
    exit();
    377e:	e8 50 11 00 00       	call   48d3 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    3783:	50                   	push   %eax
    3784:	50                   	push   %eax
    3785:	68 54 62 00 00       	push   $0x6254
    378a:	6a 01                	push   $0x1
    378c:	e8 bf 12 00 00       	call   4a50 <printf>
    exit();
    3791:	e8 3d 11 00 00       	call   48d3 <exit>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    3796:	52                   	push   %edx
    3797:	52                   	push   %edx
    3798:	68 04 62 00 00       	push   $0x6204
    379d:	6a 01                	push   $0x1
    379f:	e8 ac 12 00 00       	call   4a50 <printf>
    exit();
    37a4:	e8 2a 11 00 00       	call   48d3 <exit>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    37a9:	51                   	push   %ecx
    37aa:	51                   	push   %ecx
    37ab:	68 c8 61 00 00       	push   $0x61c8
    37b0:	6a 01                	push   $0x1
    37b2:	e8 99 12 00 00       	call   4a50 <printf>
    exit();
    37b7:	e8 17 11 00 00       	call   48d3 <exit>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    37bc:	51                   	push   %ecx
    37bd:	51                   	push   %ecx
    37be:	68 58 61 00 00       	push   $0x6158
    37c3:	6a 01                	push   $0x1
    37c5:	e8 86 12 00 00       	call   4a50 <printf>
    exit();
    37ca:	e8 04 11 00 00       	call   48d3 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    37cf:	50                   	push   %eax
    37d0:	50                   	push   %eax
    37d1:	68 f8 60 00 00       	push   $0x60f8
    37d6:	6a 01                	push   $0x1
    37d8:	e8 73 12 00 00       	call   4a50 <printf>
    exit();
    37dd:	e8 f1 10 00 00       	call   48d3 <exit>
    37e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    37e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000037f0 <rmdot>:
{
    37f0:	55                   	push   %ebp
    37f1:	89 e5                	mov    %esp,%ebp
    37f3:	83 ec 10             	sub    $0x10,%esp
  printf(1, "rmdot test\n");
    37f6:	68 37 59 00 00       	push   $0x5937
    37fb:	6a 01                	push   $0x1
    37fd:	e8 4e 12 00 00       	call   4a50 <printf>
  if(mkdir("dots") != 0){
    3802:	c7 04 24 43 59 00 00 	movl   $0x5943,(%esp)
    3809:	e8 2d 11 00 00       	call   493b <mkdir>
    380e:	83 c4 10             	add    $0x10,%esp
    3811:	85 c0                	test   %eax,%eax
    3813:	0f 85 b0 00 00 00    	jne    38c9 <rmdot+0xd9>
  if(chdir("dots") != 0){
    3819:	83 ec 0c             	sub    $0xc,%esp
    381c:	68 43 59 00 00       	push   $0x5943
    3821:	e8 1d 11 00 00       	call   4943 <chdir>
    3826:	83 c4 10             	add    $0x10,%esp
    3829:	85 c0                	test   %eax,%eax
    382b:	0f 85 1d 01 00 00    	jne    394e <rmdot+0x15e>
  if(unlink(".") == 0){
    3831:	83 ec 0c             	sub    $0xc,%esp
    3834:	68 ee 55 00 00       	push   $0x55ee
    3839:	e8 e5 10 00 00       	call   4923 <unlink>
    383e:	83 c4 10             	add    $0x10,%esp
    3841:	85 c0                	test   %eax,%eax
    3843:	0f 84 f2 00 00 00    	je     393b <rmdot+0x14b>
  if(unlink("..") == 0){
    3849:	83 ec 0c             	sub    $0xc,%esp
    384c:	68 ed 55 00 00       	push   $0x55ed
    3851:	e8 cd 10 00 00       	call   4923 <unlink>
    3856:	83 c4 10             	add    $0x10,%esp
    3859:	85 c0                	test   %eax,%eax
    385b:	0f 84 c7 00 00 00    	je     3928 <rmdot+0x138>
  if(chdir("/") != 0){
    3861:	83 ec 0c             	sub    $0xc,%esp
    3864:	68 c1 4d 00 00       	push   $0x4dc1
    3869:	e8 d5 10 00 00       	call   4943 <chdir>
    386e:	83 c4 10             	add    $0x10,%esp
    3871:	85 c0                	test   %eax,%eax
    3873:	0f 85 9c 00 00 00    	jne    3915 <rmdot+0x125>
  if(unlink("dots/.") == 0){
    3879:	83 ec 0c             	sub    $0xc,%esp
    387c:	68 8b 59 00 00       	push   $0x598b
    3881:	e8 9d 10 00 00       	call   4923 <unlink>
    3886:	83 c4 10             	add    $0x10,%esp
    3889:	85 c0                	test   %eax,%eax
    388b:	74 75                	je     3902 <rmdot+0x112>
  if(unlink("dots/..") == 0){
    388d:	83 ec 0c             	sub    $0xc,%esp
    3890:	68 a9 59 00 00       	push   $0x59a9
    3895:	e8 89 10 00 00       	call   4923 <unlink>
    389a:	83 c4 10             	add    $0x10,%esp
    389d:	85 c0                	test   %eax,%eax
    389f:	74 4e                	je     38ef <rmdot+0xff>
  if(unlink("dots") != 0){
    38a1:	83 ec 0c             	sub    $0xc,%esp
    38a4:	68 43 59 00 00       	push   $0x5943
    38a9:	e8 75 10 00 00       	call   4923 <unlink>
    38ae:	83 c4 10             	add    $0x10,%esp
    38b1:	85 c0                	test   %eax,%eax
    38b3:	75 27                	jne    38dc <rmdot+0xec>
  printf(1, "rmdot ok\n");
    38b5:	83 ec 08             	sub    $0x8,%esp
    38b8:	68 de 59 00 00       	push   $0x59de
    38bd:	6a 01                	push   $0x1
    38bf:	e8 8c 11 00 00       	call   4a50 <printf>
}
    38c4:	83 c4 10             	add    $0x10,%esp
    38c7:	c9                   	leave  
    38c8:	c3                   	ret    
    printf(1, "mkdir dots failed\n");
    38c9:	50                   	push   %eax
    38ca:	50                   	push   %eax
    38cb:	68 48 59 00 00       	push   $0x5948
    38d0:	6a 01                	push   $0x1
    38d2:	e8 79 11 00 00       	call   4a50 <printf>
    exit();
    38d7:	e8 f7 0f 00 00       	call   48d3 <exit>
    printf(1, "unlink dots failed!\n");
    38dc:	50                   	push   %eax
    38dd:	50                   	push   %eax
    38de:	68 c9 59 00 00       	push   $0x59c9
    38e3:	6a 01                	push   $0x1
    38e5:	e8 66 11 00 00       	call   4a50 <printf>
    exit();
    38ea:	e8 e4 0f 00 00       	call   48d3 <exit>
    printf(1, "unlink dots/.. worked!\n");
    38ef:	52                   	push   %edx
    38f0:	52                   	push   %edx
    38f1:	68 b1 59 00 00       	push   $0x59b1
    38f6:	6a 01                	push   $0x1
    38f8:	e8 53 11 00 00       	call   4a50 <printf>
    exit();
    38fd:	e8 d1 0f 00 00       	call   48d3 <exit>
    printf(1, "unlink dots/. worked!\n");
    3902:	51                   	push   %ecx
    3903:	51                   	push   %ecx
    3904:	68 92 59 00 00       	push   $0x5992
    3909:	6a 01                	push   $0x1
    390b:	e8 40 11 00 00       	call   4a50 <printf>
    exit();
    3910:	e8 be 0f 00 00       	call   48d3 <exit>
    printf(1, "chdir / failed\n");
    3915:	50                   	push   %eax
    3916:	50                   	push   %eax
    3917:	68 c3 4d 00 00       	push   $0x4dc3
    391c:	6a 01                	push   $0x1
    391e:	e8 2d 11 00 00       	call   4a50 <printf>
    exit();
    3923:	e8 ab 0f 00 00       	call   48d3 <exit>
    printf(1, "rm .. worked!\n");
    3928:	50                   	push   %eax
    3929:	50                   	push   %eax
    392a:	68 7c 59 00 00       	push   $0x597c
    392f:	6a 01                	push   $0x1
    3931:	e8 1a 11 00 00       	call   4a50 <printf>
    exit();
    3936:	e8 98 0f 00 00       	call   48d3 <exit>
    printf(1, "rm . worked!\n");
    393b:	50                   	push   %eax
    393c:	50                   	push   %eax
    393d:	68 6e 59 00 00       	push   $0x596e
    3942:	6a 01                	push   $0x1
    3944:	e8 07 11 00 00       	call   4a50 <printf>
    exit();
    3949:	e8 85 0f 00 00       	call   48d3 <exit>
    printf(1, "chdir dots failed\n");
    394e:	50                   	push   %eax
    394f:	50                   	push   %eax
    3950:	68 5b 59 00 00       	push   $0x595b
    3955:	6a 01                	push   $0x1
    3957:	e8 f4 10 00 00       	call   4a50 <printf>
    exit();
    395c:	e8 72 0f 00 00       	call   48d3 <exit>
    3961:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3968:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    396f:	90                   	nop

00003970 <dirfile>:
{
    3970:	55                   	push   %ebp
    3971:	89 e5                	mov    %esp,%ebp
    3973:	53                   	push   %ebx
    3974:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "dir vs file\n");
    3977:	68 e8 59 00 00       	push   $0x59e8
    397c:	6a 01                	push   $0x1
    397e:	e8 cd 10 00 00       	call   4a50 <printf>
  fd = open("dirfile", O_CREATE);
    3983:	5b                   	pop    %ebx
    3984:	58                   	pop    %eax
    3985:	68 00 02 00 00       	push   $0x200
    398a:	68 f5 59 00 00       	push   $0x59f5
    398f:	e8 7f 0f 00 00       	call   4913 <open>
  if(fd < 0){
    3994:	83 c4 10             	add    $0x10,%esp
    3997:	85 c0                	test   %eax,%eax
    3999:	0f 88 43 01 00 00    	js     3ae2 <dirfile+0x172>
  close(fd);
    399f:	83 ec 0c             	sub    $0xc,%esp
    39a2:	50                   	push   %eax
    39a3:	e8 53 0f 00 00       	call   48fb <close>
  if(chdir("dirfile") == 0){
    39a8:	c7 04 24 f5 59 00 00 	movl   $0x59f5,(%esp)
    39af:	e8 8f 0f 00 00       	call   4943 <chdir>
    39b4:	83 c4 10             	add    $0x10,%esp
    39b7:	85 c0                	test   %eax,%eax
    39b9:	0f 84 10 01 00 00    	je     3acf <dirfile+0x15f>
  fd = open("dirfile/xx", 0);
    39bf:	83 ec 08             	sub    $0x8,%esp
    39c2:	6a 00                	push   $0x0
    39c4:	68 2e 5a 00 00       	push   $0x5a2e
    39c9:	e8 45 0f 00 00       	call   4913 <open>
  if(fd >= 0){
    39ce:	83 c4 10             	add    $0x10,%esp
    39d1:	85 c0                	test   %eax,%eax
    39d3:	0f 89 e3 00 00 00    	jns    3abc <dirfile+0x14c>
  fd = open("dirfile/xx", O_CREATE);
    39d9:	83 ec 08             	sub    $0x8,%esp
    39dc:	68 00 02 00 00       	push   $0x200
    39e1:	68 2e 5a 00 00       	push   $0x5a2e
    39e6:	e8 28 0f 00 00       	call   4913 <open>
  if(fd >= 0){
    39eb:	83 c4 10             	add    $0x10,%esp
    39ee:	85 c0                	test   %eax,%eax
    39f0:	0f 89 c6 00 00 00    	jns    3abc <dirfile+0x14c>
  if(mkdir("dirfile/xx") == 0){
    39f6:	83 ec 0c             	sub    $0xc,%esp
    39f9:	68 2e 5a 00 00       	push   $0x5a2e
    39fe:	e8 38 0f 00 00       	call   493b <mkdir>
    3a03:	83 c4 10             	add    $0x10,%esp
    3a06:	85 c0                	test   %eax,%eax
    3a08:	0f 84 46 01 00 00    	je     3b54 <dirfile+0x1e4>
  if(unlink("dirfile/xx") == 0){
    3a0e:	83 ec 0c             	sub    $0xc,%esp
    3a11:	68 2e 5a 00 00       	push   $0x5a2e
    3a16:	e8 08 0f 00 00       	call   4923 <unlink>
    3a1b:	83 c4 10             	add    $0x10,%esp
    3a1e:	85 c0                	test   %eax,%eax
    3a20:	0f 84 1b 01 00 00    	je     3b41 <dirfile+0x1d1>
  if(link("README", "dirfile/xx") == 0){
    3a26:	83 ec 08             	sub    $0x8,%esp
    3a29:	68 2e 5a 00 00       	push   $0x5a2e
    3a2e:	68 92 5a 00 00       	push   $0x5a92
    3a33:	e8 fb 0e 00 00       	call   4933 <link>
    3a38:	83 c4 10             	add    $0x10,%esp
    3a3b:	85 c0                	test   %eax,%eax
    3a3d:	0f 84 eb 00 00 00    	je     3b2e <dirfile+0x1be>
  if(unlink("dirfile") != 0){
    3a43:	83 ec 0c             	sub    $0xc,%esp
    3a46:	68 f5 59 00 00       	push   $0x59f5
    3a4b:	e8 d3 0e 00 00       	call   4923 <unlink>
    3a50:	83 c4 10             	add    $0x10,%esp
    3a53:	85 c0                	test   %eax,%eax
    3a55:	0f 85 c0 00 00 00    	jne    3b1b <dirfile+0x1ab>
  fd = open(".", O_RDWR);
    3a5b:	83 ec 08             	sub    $0x8,%esp
    3a5e:	6a 02                	push   $0x2
    3a60:	68 ee 55 00 00       	push   $0x55ee
    3a65:	e8 a9 0e 00 00       	call   4913 <open>
  if(fd >= 0){
    3a6a:	83 c4 10             	add    $0x10,%esp
    3a6d:	85 c0                	test   %eax,%eax
    3a6f:	0f 89 93 00 00 00    	jns    3b08 <dirfile+0x198>
  fd = open(".", 0);
    3a75:	83 ec 08             	sub    $0x8,%esp
    3a78:	6a 00                	push   $0x0
    3a7a:	68 ee 55 00 00       	push   $0x55ee
    3a7f:	e8 8f 0e 00 00       	call   4913 <open>
  if(write(fd, "x", 1) > 0){
    3a84:	83 c4 0c             	add    $0xc,%esp
    3a87:	6a 01                	push   $0x1
  fd = open(".", 0);
    3a89:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    3a8b:	68 d1 56 00 00       	push   $0x56d1
    3a90:	50                   	push   %eax
    3a91:	e8 5d 0e 00 00       	call   48f3 <write>
    3a96:	83 c4 10             	add    $0x10,%esp
    3a99:	85 c0                	test   %eax,%eax
    3a9b:	7f 58                	jg     3af5 <dirfile+0x185>
  close(fd);
    3a9d:	83 ec 0c             	sub    $0xc,%esp
    3aa0:	53                   	push   %ebx
    3aa1:	e8 55 0e 00 00       	call   48fb <close>
  printf(1, "dir vs file OK\n");
    3aa6:	58                   	pop    %eax
    3aa7:	5a                   	pop    %edx
    3aa8:	68 c5 5a 00 00       	push   $0x5ac5
    3aad:	6a 01                	push   $0x1
    3aaf:	e8 9c 0f 00 00       	call   4a50 <printf>
}
    3ab4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3ab7:	83 c4 10             	add    $0x10,%esp
    3aba:	c9                   	leave  
    3abb:	c3                   	ret    
    printf(1, "create dirfile/xx succeeded!\n");
    3abc:	50                   	push   %eax
    3abd:	50                   	push   %eax
    3abe:	68 39 5a 00 00       	push   $0x5a39
    3ac3:	6a 01                	push   $0x1
    3ac5:	e8 86 0f 00 00       	call   4a50 <printf>
    exit();
    3aca:	e8 04 0e 00 00       	call   48d3 <exit>
    printf(1, "chdir dirfile succeeded!\n");
    3acf:	52                   	push   %edx
    3ad0:	52                   	push   %edx
    3ad1:	68 14 5a 00 00       	push   $0x5a14
    3ad6:	6a 01                	push   $0x1
    3ad8:	e8 73 0f 00 00       	call   4a50 <printf>
    exit();
    3add:	e8 f1 0d 00 00       	call   48d3 <exit>
    printf(1, "create dirfile failed\n");
    3ae2:	51                   	push   %ecx
    3ae3:	51                   	push   %ecx
    3ae4:	68 fd 59 00 00       	push   $0x59fd
    3ae9:	6a 01                	push   $0x1
    3aeb:	e8 60 0f 00 00       	call   4a50 <printf>
    exit();
    3af0:	e8 de 0d 00 00       	call   48d3 <exit>
    printf(1, "write . succeeded!\n");
    3af5:	51                   	push   %ecx
    3af6:	51                   	push   %ecx
    3af7:	68 b1 5a 00 00       	push   $0x5ab1
    3afc:	6a 01                	push   $0x1
    3afe:	e8 4d 0f 00 00       	call   4a50 <printf>
    exit();
    3b03:	e8 cb 0d 00 00       	call   48d3 <exit>
    printf(1, "open . for writing succeeded!\n");
    3b08:	53                   	push   %ebx
    3b09:	53                   	push   %ebx
    3b0a:	68 a8 62 00 00       	push   $0x62a8
    3b0f:	6a 01                	push   $0x1
    3b11:	e8 3a 0f 00 00       	call   4a50 <printf>
    exit();
    3b16:	e8 b8 0d 00 00       	call   48d3 <exit>
    printf(1, "unlink dirfile failed!\n");
    3b1b:	50                   	push   %eax
    3b1c:	50                   	push   %eax
    3b1d:	68 99 5a 00 00       	push   $0x5a99
    3b22:	6a 01                	push   $0x1
    3b24:	e8 27 0f 00 00       	call   4a50 <printf>
    exit();
    3b29:	e8 a5 0d 00 00       	call   48d3 <exit>
    printf(1, "link to dirfile/xx succeeded!\n");
    3b2e:	50                   	push   %eax
    3b2f:	50                   	push   %eax
    3b30:	68 88 62 00 00       	push   $0x6288
    3b35:	6a 01                	push   $0x1
    3b37:	e8 14 0f 00 00       	call   4a50 <printf>
    exit();
    3b3c:	e8 92 0d 00 00       	call   48d3 <exit>
    printf(1, "unlink dirfile/xx succeeded!\n");
    3b41:	50                   	push   %eax
    3b42:	50                   	push   %eax
    3b43:	68 74 5a 00 00       	push   $0x5a74
    3b48:	6a 01                	push   $0x1
    3b4a:	e8 01 0f 00 00       	call   4a50 <printf>
    exit();
    3b4f:	e8 7f 0d 00 00       	call   48d3 <exit>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    3b54:	50                   	push   %eax
    3b55:	50                   	push   %eax
    3b56:	68 57 5a 00 00       	push   $0x5a57
    3b5b:	6a 01                	push   $0x1
    3b5d:	e8 ee 0e 00 00       	call   4a50 <printf>
    exit();
    3b62:	e8 6c 0d 00 00       	call   48d3 <exit>
    3b67:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3b6e:	66 90                	xchg   %ax,%ax

00003b70 <iref>:
{
    3b70:	55                   	push   %ebp
    3b71:	89 e5                	mov    %esp,%ebp
    3b73:	53                   	push   %ebx
  printf(1, "empty file name\n");
    3b74:	bb 33 00 00 00       	mov    $0x33,%ebx
{
    3b79:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "empty file name\n");
    3b7c:	68 d5 5a 00 00       	push   $0x5ad5
    3b81:	6a 01                	push   $0x1
    3b83:	e8 c8 0e 00 00       	call   4a50 <printf>
    3b88:	83 c4 10             	add    $0x10,%esp
    3b8b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3b8f:	90                   	nop
    if(mkdir("irefd") != 0){
    3b90:	83 ec 0c             	sub    $0xc,%esp
    3b93:	68 e6 5a 00 00       	push   $0x5ae6
    3b98:	e8 9e 0d 00 00       	call   493b <mkdir>
    3b9d:	83 c4 10             	add    $0x10,%esp
    3ba0:	85 c0                	test   %eax,%eax
    3ba2:	0f 85 bb 00 00 00    	jne    3c63 <iref+0xf3>
    if(chdir("irefd") != 0){
    3ba8:	83 ec 0c             	sub    $0xc,%esp
    3bab:	68 e6 5a 00 00       	push   $0x5ae6
    3bb0:	e8 8e 0d 00 00       	call   4943 <chdir>
    3bb5:	83 c4 10             	add    $0x10,%esp
    3bb8:	85 c0                	test   %eax,%eax
    3bba:	0f 85 b7 00 00 00    	jne    3c77 <iref+0x107>
    mkdir("");
    3bc0:	83 ec 0c             	sub    $0xc,%esp
    3bc3:	68 9b 51 00 00       	push   $0x519b
    3bc8:	e8 6e 0d 00 00       	call   493b <mkdir>
    link("README", "");
    3bcd:	59                   	pop    %ecx
    3bce:	58                   	pop    %eax
    3bcf:	68 9b 51 00 00       	push   $0x519b
    3bd4:	68 92 5a 00 00       	push   $0x5a92
    3bd9:	e8 55 0d 00 00       	call   4933 <link>
    fd = open("", O_CREATE);
    3bde:	58                   	pop    %eax
    3bdf:	5a                   	pop    %edx
    3be0:	68 00 02 00 00       	push   $0x200
    3be5:	68 9b 51 00 00       	push   $0x519b
    3bea:	e8 24 0d 00 00       	call   4913 <open>
    if(fd >= 0)
    3bef:	83 c4 10             	add    $0x10,%esp
    3bf2:	85 c0                	test   %eax,%eax
    3bf4:	78 0c                	js     3c02 <iref+0x92>
      close(fd);
    3bf6:	83 ec 0c             	sub    $0xc,%esp
    3bf9:	50                   	push   %eax
    3bfa:	e8 fc 0c 00 00       	call   48fb <close>
    3bff:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    3c02:	83 ec 08             	sub    $0x8,%esp
    3c05:	68 00 02 00 00       	push   $0x200
    3c0a:	68 d0 56 00 00       	push   $0x56d0
    3c0f:	e8 ff 0c 00 00       	call   4913 <open>
    if(fd >= 0)
    3c14:	83 c4 10             	add    $0x10,%esp
    3c17:	85 c0                	test   %eax,%eax
    3c19:	78 0c                	js     3c27 <iref+0xb7>
      close(fd);
    3c1b:	83 ec 0c             	sub    $0xc,%esp
    3c1e:	50                   	push   %eax
    3c1f:	e8 d7 0c 00 00       	call   48fb <close>
    3c24:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    3c27:	83 ec 0c             	sub    $0xc,%esp
    3c2a:	68 d0 56 00 00       	push   $0x56d0
    3c2f:	e8 ef 0c 00 00       	call   4923 <unlink>
  for(i = 0; i < 50 + 1; i++){
    3c34:	83 c4 10             	add    $0x10,%esp
    3c37:	83 eb 01             	sub    $0x1,%ebx
    3c3a:	0f 85 50 ff ff ff    	jne    3b90 <iref+0x20>
  chdir("/");
    3c40:	83 ec 0c             	sub    $0xc,%esp
    3c43:	68 c1 4d 00 00       	push   $0x4dc1
    3c48:	e8 f6 0c 00 00       	call   4943 <chdir>
  printf(1, "empty file name OK\n");
    3c4d:	58                   	pop    %eax
    3c4e:	5a                   	pop    %edx
    3c4f:	68 14 5b 00 00       	push   $0x5b14
    3c54:	6a 01                	push   $0x1
    3c56:	e8 f5 0d 00 00       	call   4a50 <printf>
}
    3c5b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3c5e:	83 c4 10             	add    $0x10,%esp
    3c61:	c9                   	leave  
    3c62:	c3                   	ret    
      printf(1, "mkdir irefd failed\n");
    3c63:	83 ec 08             	sub    $0x8,%esp
    3c66:	68 ec 5a 00 00       	push   $0x5aec
    3c6b:	6a 01                	push   $0x1
    3c6d:	e8 de 0d 00 00       	call   4a50 <printf>
      exit();
    3c72:	e8 5c 0c 00 00       	call   48d3 <exit>
      printf(1, "chdir irefd failed\n");
    3c77:	83 ec 08             	sub    $0x8,%esp
    3c7a:	68 00 5b 00 00       	push   $0x5b00
    3c7f:	6a 01                	push   $0x1
    3c81:	e8 ca 0d 00 00       	call   4a50 <printf>
      exit();
    3c86:	e8 48 0c 00 00       	call   48d3 <exit>
    3c8b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3c8f:	90                   	nop

00003c90 <forktest>:
{
    3c90:	55                   	push   %ebp
    3c91:	89 e5                	mov    %esp,%ebp
    3c93:	53                   	push   %ebx
  for(n=0; n<1000; n++){
    3c94:	31 db                	xor    %ebx,%ebx
{
    3c96:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "fork test\n");
    3c99:	68 28 5b 00 00       	push   $0x5b28
    3c9e:	6a 01                	push   $0x1
    3ca0:	e8 ab 0d 00 00       	call   4a50 <printf>
    3ca5:	83 c4 10             	add    $0x10,%esp
    3ca8:	eb 13                	jmp    3cbd <forktest+0x2d>
    3caa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(pid == 0)
    3cb0:	74 4a                	je     3cfc <forktest+0x6c>
  for(n=0; n<1000; n++){
    3cb2:	83 c3 01             	add    $0x1,%ebx
    3cb5:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    3cbb:	74 6b                	je     3d28 <forktest+0x98>
    pid = fork();
    3cbd:	e8 09 0c 00 00       	call   48cb <fork>
    if(pid < 0)
    3cc2:	85 c0                	test   %eax,%eax
    3cc4:	79 ea                	jns    3cb0 <forktest+0x20>
  for(; n > 0; n--){
    3cc6:	85 db                	test   %ebx,%ebx
    3cc8:	74 14                	je     3cde <forktest+0x4e>
    3cca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(wait() < 0){
    3cd0:	e8 06 0c 00 00       	call   48db <wait>
    3cd5:	85 c0                	test   %eax,%eax
    3cd7:	78 28                	js     3d01 <forktest+0x71>
  for(; n > 0; n--){
    3cd9:	83 eb 01             	sub    $0x1,%ebx
    3cdc:	75 f2                	jne    3cd0 <forktest+0x40>
  if(wait() != -1){
    3cde:	e8 f8 0b 00 00       	call   48db <wait>
    3ce3:	83 f8 ff             	cmp    $0xffffffff,%eax
    3ce6:	75 2d                	jne    3d15 <forktest+0x85>
  printf(1, "fork test OK\n");
    3ce8:	83 ec 08             	sub    $0x8,%esp
    3ceb:	68 5a 5b 00 00       	push   $0x5b5a
    3cf0:	6a 01                	push   $0x1
    3cf2:	e8 59 0d 00 00       	call   4a50 <printf>
}
    3cf7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3cfa:	c9                   	leave  
    3cfb:	c3                   	ret    
      exit();
    3cfc:	e8 d2 0b 00 00       	call   48d3 <exit>
      printf(1, "wait stopped early\n");
    3d01:	83 ec 08             	sub    $0x8,%esp
    3d04:	68 33 5b 00 00       	push   $0x5b33
    3d09:	6a 01                	push   $0x1
    3d0b:	e8 40 0d 00 00       	call   4a50 <printf>
      exit();
    3d10:	e8 be 0b 00 00       	call   48d3 <exit>
    printf(1, "wait got too many\n");
    3d15:	52                   	push   %edx
    3d16:	52                   	push   %edx
    3d17:	68 47 5b 00 00       	push   $0x5b47
    3d1c:	6a 01                	push   $0x1
    3d1e:	e8 2d 0d 00 00       	call   4a50 <printf>
    exit();
    3d23:	e8 ab 0b 00 00       	call   48d3 <exit>
    printf(1, "fork claimed to work 1000 times!\n");
    3d28:	50                   	push   %eax
    3d29:	50                   	push   %eax
    3d2a:	68 c8 62 00 00       	push   $0x62c8
    3d2f:	6a 01                	push   $0x1
    3d31:	e8 1a 0d 00 00       	call   4a50 <printf>
    exit();
    3d36:	e8 98 0b 00 00       	call   48d3 <exit>
    3d3b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3d3f:	90                   	nop

00003d40 <sbrktest>:
{
    3d40:	55                   	push   %ebp
    3d41:	89 e5                	mov    %esp,%ebp
    3d43:	57                   	push   %edi
    3d44:	56                   	push   %esi
  for(i = 0; i < 5000; i++){
    3d45:	31 f6                	xor    %esi,%esi
{
    3d47:	53                   	push   %ebx
    3d48:	83 ec 64             	sub    $0x64,%esp
  printf(stdout, "sbrk test\n");
    3d4b:	68 68 5b 00 00       	push   $0x5b68
    3d50:	ff 35 68 6e 00 00    	push   0x6e68
    3d56:	e8 f5 0c 00 00       	call   4a50 <printf>
  oldbrk = sbrk(0);
    3d5b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3d62:	e8 f4 0b 00 00       	call   495b <sbrk>
  a = sbrk(0);
    3d67:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  oldbrk = sbrk(0);
    3d6e:	89 45 a4             	mov    %eax,-0x5c(%ebp)
  a = sbrk(0);
    3d71:	e8 e5 0b 00 00       	call   495b <sbrk>
    3d76:	83 c4 10             	add    $0x10,%esp
    3d79:	89 c3                	mov    %eax,%ebx
  for(i = 0; i < 5000; i++){
    3d7b:	eb 05                	jmp    3d82 <sbrktest+0x42>
    3d7d:	8d 76 00             	lea    0x0(%esi),%esi
    a = b + 1;
    3d80:	89 c3                	mov    %eax,%ebx
    b = sbrk(1);
    3d82:	83 ec 0c             	sub    $0xc,%esp
    3d85:	6a 01                	push   $0x1
    3d87:	e8 cf 0b 00 00       	call   495b <sbrk>
    if(b != a){
    3d8c:	83 c4 10             	add    $0x10,%esp
    3d8f:	39 d8                	cmp    %ebx,%eax
    3d91:	0f 85 9c 02 00 00    	jne    4033 <sbrktest+0x2f3>
  for(i = 0; i < 5000; i++){
    3d97:	83 c6 01             	add    $0x1,%esi
    *b = 1;
    3d9a:	c6 03 01             	movb   $0x1,(%ebx)
    a = b + 1;
    3d9d:	8d 43 01             	lea    0x1(%ebx),%eax
  for(i = 0; i < 5000; i++){
    3da0:	81 fe 88 13 00 00    	cmp    $0x1388,%esi
    3da6:	75 d8                	jne    3d80 <sbrktest+0x40>
  pid = fork();
    3da8:	e8 1e 0b 00 00       	call   48cb <fork>
    3dad:	89 c6                	mov    %eax,%esi
  if(pid < 0){
    3daf:	85 c0                	test   %eax,%eax
    3db1:	0f 88 02 03 00 00    	js     40b9 <sbrktest+0x379>
  c = sbrk(1);
    3db7:	83 ec 0c             	sub    $0xc,%esp
  if(c != a + 1){
    3dba:	83 c3 02             	add    $0x2,%ebx
  c = sbrk(1);
    3dbd:	6a 01                	push   $0x1
    3dbf:	e8 97 0b 00 00       	call   495b <sbrk>
  c = sbrk(1);
    3dc4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3dcb:	e8 8b 0b 00 00       	call   495b <sbrk>
  if(c != a + 1){
    3dd0:	83 c4 10             	add    $0x10,%esp
    3dd3:	39 c3                	cmp    %eax,%ebx
    3dd5:	0f 85 3b 03 00 00    	jne    4116 <sbrktest+0x3d6>
  if(pid == 0)
    3ddb:	85 f6                	test   %esi,%esi
    3ddd:	0f 84 2e 03 00 00    	je     4111 <sbrktest+0x3d1>
  wait();
    3de3:	e8 f3 0a 00 00       	call   48db <wait>
  a = sbrk(0);
    3de8:	83 ec 0c             	sub    $0xc,%esp
    3deb:	6a 00                	push   $0x0
    3ded:	e8 69 0b 00 00       	call   495b <sbrk>
    3df2:	89 c3                	mov    %eax,%ebx
  amt = (BIG) - (uint)a;
    3df4:	b8 00 00 40 06       	mov    $0x6400000,%eax
    3df9:	29 d8                	sub    %ebx,%eax
  p = sbrk(amt);
    3dfb:	89 04 24             	mov    %eax,(%esp)
    3dfe:	e8 58 0b 00 00       	call   495b <sbrk>
  if (p != a) {
    3e03:	83 c4 10             	add    $0x10,%esp
    3e06:	39 c3                	cmp    %eax,%ebx
    3e08:	0f 85 94 02 00 00    	jne    40a2 <sbrktest+0x362>
  a = sbrk(0);
    3e0e:	83 ec 0c             	sub    $0xc,%esp
    3e11:	6a 00                	push   $0x0
    3e13:	e8 43 0b 00 00       	call   495b <sbrk>
  c = sbrk(-4096);
    3e18:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
  a = sbrk(0);
    3e1f:	89 c3                	mov    %eax,%ebx
  c = sbrk(-4096);
    3e21:	e8 35 0b 00 00       	call   495b <sbrk>
  if(c == (char*)0xffffffff){
    3e26:	83 c4 10             	add    $0x10,%esp
    3e29:	83 f8 ff             	cmp    $0xffffffff,%eax
    3e2c:	0f 84 29 03 00 00    	je     415b <sbrktest+0x41b>
  c = sbrk(0);
    3e32:	83 ec 0c             	sub    $0xc,%esp
    3e35:	6a 00                	push   $0x0
    3e37:	e8 1f 0b 00 00       	call   495b <sbrk>
  if(c != a - 4096){
    3e3c:	8d 93 00 f0 ff ff    	lea    -0x1000(%ebx),%edx
    3e42:	83 c4 10             	add    $0x10,%esp
    3e45:	39 d0                	cmp    %edx,%eax
    3e47:	0f 85 f7 02 00 00    	jne    4144 <sbrktest+0x404>
  a = sbrk(0);
    3e4d:	83 ec 0c             	sub    $0xc,%esp
    3e50:	6a 00                	push   $0x0
    3e52:	e8 04 0b 00 00       	call   495b <sbrk>
  c = sbrk(4096);
    3e57:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
  a = sbrk(0);
    3e5e:	89 c3                	mov    %eax,%ebx
  c = sbrk(4096);
    3e60:	e8 f6 0a 00 00       	call   495b <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    3e65:	83 c4 10             	add    $0x10,%esp
  c = sbrk(4096);
    3e68:	89 c6                	mov    %eax,%esi
  if(c != a || sbrk(0) != a + 4096){
    3e6a:	39 c3                	cmp    %eax,%ebx
    3e6c:	0f 85 bb 02 00 00    	jne    412d <sbrktest+0x3ed>
    3e72:	83 ec 0c             	sub    $0xc,%esp
    3e75:	6a 00                	push   $0x0
    3e77:	e8 df 0a 00 00       	call   495b <sbrk>
    3e7c:	8d 93 00 10 00 00    	lea    0x1000(%ebx),%edx
    3e82:	83 c4 10             	add    $0x10,%esp
    3e85:	39 c2                	cmp    %eax,%edx
    3e87:	0f 85 a0 02 00 00    	jne    412d <sbrktest+0x3ed>
  if(*lastaddr == 99){
    3e8d:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    3e94:	0f 84 36 02 00 00    	je     40d0 <sbrktest+0x390>
  a = sbrk(0);
    3e9a:	83 ec 0c             	sub    $0xc,%esp
    3e9d:	6a 00                	push   $0x0
    3e9f:	e8 b7 0a 00 00       	call   495b <sbrk>
  c = sbrk(-(sbrk(0) - oldbrk));
    3ea4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  a = sbrk(0);
    3eab:	89 c3                	mov    %eax,%ebx
  c = sbrk(-(sbrk(0) - oldbrk));
    3ead:	e8 a9 0a 00 00       	call   495b <sbrk>
    3eb2:	89 c2                	mov    %eax,%edx
    3eb4:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    3eb7:	29 d0                	sub    %edx,%eax
    3eb9:	89 04 24             	mov    %eax,(%esp)
    3ebc:	e8 9a 0a 00 00       	call   495b <sbrk>
  if(c != a){
    3ec1:	83 c4 10             	add    $0x10,%esp
    3ec4:	39 c3                	cmp    %eax,%ebx
    3ec6:	0f 85 bf 01 00 00    	jne    408b <sbrktest+0x34b>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    3ecc:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    3ed1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    ppid = getpid();
    3ed8:	e8 76 0a 00 00       	call   4953 <getpid>
    3edd:	89 c6                	mov    %eax,%esi
    pid = fork();
    3edf:	e8 e7 09 00 00       	call   48cb <fork>
    if(pid < 0){
    3ee4:	85 c0                	test   %eax,%eax
    3ee6:	0f 88 65 01 00 00    	js     4051 <sbrktest+0x311>
    if(pid == 0){
    3eec:	0f 84 77 01 00 00    	je     4069 <sbrktest+0x329>
    wait();
    3ef2:	e8 e4 09 00 00       	call   48db <wait>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    3ef7:	81 c3 50 c3 00 00    	add    $0xc350,%ebx
    3efd:	81 fb 80 84 1e 80    	cmp    $0x801e8480,%ebx
    3f03:	75 d3                	jne    3ed8 <sbrktest+0x198>
  if(pipe(fds) != 0){
    3f05:	83 ec 0c             	sub    $0xc,%esp
    3f08:	8d 45 b8             	lea    -0x48(%ebp),%eax
    3f0b:	50                   	push   %eax
    3f0c:	e8 d2 09 00 00       	call   48e3 <pipe>
    3f11:	83 c4 10             	add    $0x10,%esp
    3f14:	85 c0                	test   %eax,%eax
    3f16:	0f 85 e2 01 00 00    	jne    40fe <sbrktest+0x3be>
    3f1c:	8d 5d c0             	lea    -0x40(%ebp),%ebx
    3f1f:	8d 75 e8             	lea    -0x18(%ebp),%esi
    3f22:	89 df                	mov    %ebx,%edi
    3f24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if((pids[i] = fork()) == 0){
    3f28:	e8 9e 09 00 00       	call   48cb <fork>
    3f2d:	89 07                	mov    %eax,(%edi)
    3f2f:	85 c0                	test   %eax,%eax
    3f31:	0f 84 91 00 00 00    	je     3fc8 <sbrktest+0x288>
    if(pids[i] != -1)
    3f37:	83 f8 ff             	cmp    $0xffffffff,%eax
    3f3a:	74 14                	je     3f50 <sbrktest+0x210>
      read(fds[0], &scratch, 1);
    3f3c:	83 ec 04             	sub    $0x4,%esp
    3f3f:	8d 45 b7             	lea    -0x49(%ebp),%eax
    3f42:	6a 01                	push   $0x1
    3f44:	50                   	push   %eax
    3f45:	ff 75 b8             	push   -0x48(%ebp)
    3f48:	e8 9e 09 00 00       	call   48eb <read>
    3f4d:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3f50:	83 c7 04             	add    $0x4,%edi
    3f53:	39 f7                	cmp    %esi,%edi
    3f55:	75 d1                	jne    3f28 <sbrktest+0x1e8>
  c = sbrk(4096);
    3f57:	83 ec 0c             	sub    $0xc,%esp
    3f5a:	68 00 10 00 00       	push   $0x1000
    3f5f:	e8 f7 09 00 00       	call   495b <sbrk>
    3f64:	83 c4 10             	add    $0x10,%esp
    3f67:	89 c7                	mov    %eax,%edi
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3f69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(pids[i] == -1)
    3f70:	8b 03                	mov    (%ebx),%eax
    3f72:	83 f8 ff             	cmp    $0xffffffff,%eax
    3f75:	74 11                	je     3f88 <sbrktest+0x248>
    kill(pids[i]);
    3f77:	83 ec 0c             	sub    $0xc,%esp
    3f7a:	50                   	push   %eax
    3f7b:	e8 83 09 00 00       	call   4903 <kill>
    wait();
    3f80:	e8 56 09 00 00       	call   48db <wait>
    3f85:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3f88:	83 c3 04             	add    $0x4,%ebx
    3f8b:	39 de                	cmp    %ebx,%esi
    3f8d:	75 e1                	jne    3f70 <sbrktest+0x230>
  if(c == (char*)0xffffffff){
    3f8f:	83 ff ff             	cmp    $0xffffffff,%edi
    3f92:	0f 84 4f 01 00 00    	je     40e7 <sbrktest+0x3a7>
  if(sbrk(0) > oldbrk)
    3f98:	83 ec 0c             	sub    $0xc,%esp
    3f9b:	6a 00                	push   $0x0
    3f9d:	e8 b9 09 00 00       	call   495b <sbrk>
    3fa2:	83 c4 10             	add    $0x10,%esp
    3fa5:	39 45 a4             	cmp    %eax,-0x5c(%ebp)
    3fa8:	72 68                	jb     4012 <sbrktest+0x2d2>
  printf(stdout, "sbrk test OK\n");
    3faa:	83 ec 08             	sub    $0x8,%esp
    3fad:	68 10 5c 00 00       	push   $0x5c10
    3fb2:	ff 35 68 6e 00 00    	push   0x6e68
    3fb8:	e8 93 0a 00 00       	call   4a50 <printf>
}
    3fbd:	83 c4 10             	add    $0x10,%esp
    3fc0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3fc3:	5b                   	pop    %ebx
    3fc4:	5e                   	pop    %esi
    3fc5:	5f                   	pop    %edi
    3fc6:	5d                   	pop    %ebp
    3fc7:	c3                   	ret    
      sbrk(BIG - (uint)sbrk(0));
    3fc8:	83 ec 0c             	sub    $0xc,%esp
    3fcb:	6a 00                	push   $0x0
    3fcd:	e8 89 09 00 00       	call   495b <sbrk>
    3fd2:	89 c2                	mov    %eax,%edx
    3fd4:	b8 00 00 40 06       	mov    $0x6400000,%eax
    3fd9:	29 d0                	sub    %edx,%eax
    3fdb:	89 04 24             	mov    %eax,(%esp)
    3fde:	e8 78 09 00 00       	call   495b <sbrk>
      write(fds[1], "x", 1);
    3fe3:	83 c4 0c             	add    $0xc,%esp
    3fe6:	6a 01                	push   $0x1
    3fe8:	68 d1 56 00 00       	push   $0x56d1
    3fed:	ff 75 bc             	push   -0x44(%ebp)
    3ff0:	e8 fe 08 00 00       	call   48f3 <write>
    3ff5:	83 c4 10             	add    $0x10,%esp
    3ff8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3fff:	90                   	nop
      for(;;) sleep(1000);
    4000:	83 ec 0c             	sub    $0xc,%esp
    4003:	68 e8 03 00 00       	push   $0x3e8
    4008:	e8 56 09 00 00       	call   4963 <sleep>
    400d:	83 c4 10             	add    $0x10,%esp
    4010:	eb ee                	jmp    4000 <sbrktest+0x2c0>
    sbrk(-(sbrk(0) - oldbrk));
    4012:	83 ec 0c             	sub    $0xc,%esp
    4015:	6a 00                	push   $0x0
    4017:	e8 3f 09 00 00       	call   495b <sbrk>
    401c:	89 c2                	mov    %eax,%edx
    401e:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    4021:	29 d0                	sub    %edx,%eax
    4023:	89 04 24             	mov    %eax,(%esp)
    4026:	e8 30 09 00 00       	call   495b <sbrk>
    402b:	83 c4 10             	add    $0x10,%esp
    402e:	e9 77 ff ff ff       	jmp    3faa <sbrktest+0x26a>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    4033:	83 ec 0c             	sub    $0xc,%esp
    4036:	50                   	push   %eax
    4037:	53                   	push   %ebx
    4038:	56                   	push   %esi
    4039:	68 73 5b 00 00       	push   $0x5b73
    403e:	ff 35 68 6e 00 00    	push   0x6e68
    4044:	e8 07 0a 00 00       	call   4a50 <printf>
      exit();
    4049:	83 c4 20             	add    $0x20,%esp
    404c:	e8 82 08 00 00       	call   48d3 <exit>
      printf(stdout, "fork failed\n");
    4051:	83 ec 08             	sub    $0x8,%esp
    4054:	68 b9 5c 00 00       	push   $0x5cb9
    4059:	ff 35 68 6e 00 00    	push   0x6e68
    405f:	e8 ec 09 00 00       	call   4a50 <printf>
      exit();
    4064:	e8 6a 08 00 00       	call   48d3 <exit>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    4069:	0f be 03             	movsbl (%ebx),%eax
    406c:	50                   	push   %eax
    406d:	53                   	push   %ebx
    406e:	68 dc 5b 00 00       	push   $0x5bdc
    4073:	ff 35 68 6e 00 00    	push   0x6e68
    4079:	e8 d2 09 00 00       	call   4a50 <printf>
      kill(ppid);
    407e:	89 34 24             	mov    %esi,(%esp)
    4081:	e8 7d 08 00 00       	call   4903 <kill>
      exit();
    4086:	e8 48 08 00 00       	call   48d3 <exit>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    408b:	50                   	push   %eax
    408c:	53                   	push   %ebx
    408d:	68 bc 63 00 00       	push   $0x63bc
    4092:	ff 35 68 6e 00 00    	push   0x6e68
    4098:	e8 b3 09 00 00       	call   4a50 <printf>
    exit();
    409d:	e8 31 08 00 00       	call   48d3 <exit>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    40a2:	56                   	push   %esi
    40a3:	56                   	push   %esi
    40a4:	68 ec 62 00 00       	push   $0x62ec
    40a9:	ff 35 68 6e 00 00    	push   0x6e68
    40af:	e8 9c 09 00 00       	call   4a50 <printf>
    exit();
    40b4:	e8 1a 08 00 00       	call   48d3 <exit>
    printf(stdout, "sbrk test fork failed\n");
    40b9:	50                   	push   %eax
    40ba:	50                   	push   %eax
    40bb:	68 8e 5b 00 00       	push   $0x5b8e
    40c0:	ff 35 68 6e 00 00    	push   0x6e68
    40c6:	e8 85 09 00 00       	call   4a50 <printf>
    exit();
    40cb:	e8 03 08 00 00       	call   48d3 <exit>
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    40d0:	51                   	push   %ecx
    40d1:	51                   	push   %ecx
    40d2:	68 8c 63 00 00       	push   $0x638c
    40d7:	ff 35 68 6e 00 00    	push   0x6e68
    40dd:	e8 6e 09 00 00       	call   4a50 <printf>
    exit();
    40e2:	e8 ec 07 00 00       	call   48d3 <exit>
    printf(stdout, "failed sbrk leaked memory\n");
    40e7:	50                   	push   %eax
    40e8:	50                   	push   %eax
    40e9:	68 f5 5b 00 00       	push   $0x5bf5
    40ee:	ff 35 68 6e 00 00    	push   0x6e68
    40f4:	e8 57 09 00 00       	call   4a50 <printf>
    exit();
    40f9:	e8 d5 07 00 00       	call   48d3 <exit>
    printf(1, "pipe() failed\n");
    40fe:	52                   	push   %edx
    40ff:	52                   	push   %edx
    4100:	68 b1 50 00 00       	push   $0x50b1
    4105:	6a 01                	push   $0x1
    4107:	e8 44 09 00 00       	call   4a50 <printf>
    exit();
    410c:	e8 c2 07 00 00       	call   48d3 <exit>
    exit();
    4111:	e8 bd 07 00 00       	call   48d3 <exit>
    printf(stdout, "sbrk test failed post-fork\n");
    4116:	57                   	push   %edi
    4117:	57                   	push   %edi
    4118:	68 a5 5b 00 00       	push   $0x5ba5
    411d:	ff 35 68 6e 00 00    	push   0x6e68
    4123:	e8 28 09 00 00       	call   4a50 <printf>
    exit();
    4128:	e8 a6 07 00 00       	call   48d3 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    412d:	56                   	push   %esi
    412e:	53                   	push   %ebx
    412f:	68 64 63 00 00       	push   $0x6364
    4134:	ff 35 68 6e 00 00    	push   0x6e68
    413a:	e8 11 09 00 00       	call   4a50 <printf>
    exit();
    413f:	e8 8f 07 00 00       	call   48d3 <exit>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    4144:	50                   	push   %eax
    4145:	53                   	push   %ebx
    4146:	68 2c 63 00 00       	push   $0x632c
    414b:	ff 35 68 6e 00 00    	push   0x6e68
    4151:	e8 fa 08 00 00       	call   4a50 <printf>
    exit();
    4156:	e8 78 07 00 00       	call   48d3 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    415b:	53                   	push   %ebx
    415c:	53                   	push   %ebx
    415d:	68 c1 5b 00 00       	push   $0x5bc1
    4162:	ff 35 68 6e 00 00    	push   0x6e68
    4168:	e8 e3 08 00 00       	call   4a50 <printf>
    exit();
    416d:	e8 61 07 00 00       	call   48d3 <exit>
    4172:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    4179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00004180 <validateint>:
}
    4180:	c3                   	ret    
    4181:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    4188:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    418f:	90                   	nop

00004190 <validatetest>:
{
    4190:	55                   	push   %ebp
    4191:	89 e5                	mov    %esp,%ebp
    4193:	56                   	push   %esi
  for(p = 4096; p <= (uint)hi; p += 4096){
    4194:	be 00 10 00 00       	mov    $0x1000,%esi
{
    4199:	53                   	push   %ebx
  printf(stdout, "validate test\n");
    419a:	83 ec 08             	sub    $0x8,%esp
    419d:	68 1e 5c 00 00       	push   $0x5c1e
    41a2:	ff 35 68 6e 00 00    	push   0x6e68
    41a8:	e8 a3 08 00 00       	call   4a50 <printf>
    41ad:	83 c4 10             	add    $0x10,%esp
    if((pid = fork()) == 0){
    41b0:	e8 16 07 00 00       	call   48cb <fork>
    41b5:	89 c3                	mov    %eax,%ebx
    41b7:	85 c0                	test   %eax,%eax
    41b9:	74 63                	je     421e <validatetest+0x8e>
    sleep(0);
    41bb:	83 ec 0c             	sub    $0xc,%esp
    41be:	6a 00                	push   $0x0
    41c0:	e8 9e 07 00 00       	call   4963 <sleep>
    sleep(0);
    41c5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    41cc:	e8 92 07 00 00       	call   4963 <sleep>
    kill(pid);
    41d1:	89 1c 24             	mov    %ebx,(%esp)
    41d4:	e8 2a 07 00 00       	call   4903 <kill>
    wait();
    41d9:	e8 fd 06 00 00       	call   48db <wait>
    if(link("nosuchfile", (char*)p) != -1){
    41de:	58                   	pop    %eax
    41df:	5a                   	pop    %edx
    41e0:	56                   	push   %esi
    41e1:	68 2d 5c 00 00       	push   $0x5c2d
    41e6:	e8 48 07 00 00       	call   4933 <link>
    41eb:	83 c4 10             	add    $0x10,%esp
    41ee:	83 f8 ff             	cmp    $0xffffffff,%eax
    41f1:	75 30                	jne    4223 <validatetest+0x93>
  for(p = 4096; p <= (uint)hi; p += 4096){
    41f3:	81 c6 00 10 00 00    	add    $0x1000,%esi
    41f9:	81 fe 00 40 11 00    	cmp    $0x114000,%esi
    41ff:	75 af                	jne    41b0 <validatetest+0x20>
  printf(stdout, "validate ok\n");
    4201:	83 ec 08             	sub    $0x8,%esp
    4204:	68 51 5c 00 00       	push   $0x5c51
    4209:	ff 35 68 6e 00 00    	push   0x6e68
    420f:	e8 3c 08 00 00       	call   4a50 <printf>
}
    4214:	83 c4 10             	add    $0x10,%esp
    4217:	8d 65 f8             	lea    -0x8(%ebp),%esp
    421a:	5b                   	pop    %ebx
    421b:	5e                   	pop    %esi
    421c:	5d                   	pop    %ebp
    421d:	c3                   	ret    
      exit();
    421e:	e8 b0 06 00 00       	call   48d3 <exit>
      printf(stdout, "link should not succeed\n");
    4223:	83 ec 08             	sub    $0x8,%esp
    4226:	68 38 5c 00 00       	push   $0x5c38
    422b:	ff 35 68 6e 00 00    	push   0x6e68
    4231:	e8 1a 08 00 00       	call   4a50 <printf>
      exit();
    4236:	e8 98 06 00 00       	call   48d3 <exit>
    423b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    423f:	90                   	nop

00004240 <bsstest>:
{
    4240:	55                   	push   %ebp
    4241:	89 e5                	mov    %esp,%ebp
    4243:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "bss test\n");
    4246:	68 5e 5c 00 00       	push   $0x5c5e
    424b:	ff 35 68 6e 00 00    	push   0x6e68
    4251:	e8 fa 07 00 00       	call   4a50 <printf>
    4256:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(uninit); i++){
    4259:	31 c0                	xor    %eax,%eax
    425b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    425f:	90                   	nop
    if(uninit[i] != '\0'){
    4260:	80 b8 80 6e 00 00 00 	cmpb   $0x0,0x6e80(%eax)
    4267:	75 22                	jne    428b <bsstest+0x4b>
  for(i = 0; i < sizeof(uninit); i++){
    4269:	83 c0 01             	add    $0x1,%eax
    426c:	3d 10 27 00 00       	cmp    $0x2710,%eax
    4271:	75 ed                	jne    4260 <bsstest+0x20>
  printf(stdout, "bss test ok\n");
    4273:	83 ec 08             	sub    $0x8,%esp
    4276:	68 79 5c 00 00       	push   $0x5c79
    427b:	ff 35 68 6e 00 00    	push   0x6e68
    4281:	e8 ca 07 00 00       	call   4a50 <printf>
}
    4286:	83 c4 10             	add    $0x10,%esp
    4289:	c9                   	leave  
    428a:	c3                   	ret    
      printf(stdout, "bss test failed\n");
    428b:	83 ec 08             	sub    $0x8,%esp
    428e:	68 68 5c 00 00       	push   $0x5c68
    4293:	ff 35 68 6e 00 00    	push   0x6e68
    4299:	e8 b2 07 00 00       	call   4a50 <printf>
      exit();
    429e:	e8 30 06 00 00       	call   48d3 <exit>
    42a3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    42aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000042b0 <bigargtest>:
{
    42b0:	55                   	push   %ebp
    42b1:	89 e5                	mov    %esp,%ebp
    42b3:	83 ec 14             	sub    $0x14,%esp
  unlink("bigarg-ok");
    42b6:	68 86 5c 00 00       	push   $0x5c86
    42bb:	e8 63 06 00 00       	call   4923 <unlink>
  pid = fork();
    42c0:	e8 06 06 00 00       	call   48cb <fork>
  if(pid == 0){
    42c5:	83 c4 10             	add    $0x10,%esp
    42c8:	85 c0                	test   %eax,%eax
    42ca:	74 44                	je     4310 <bigargtest+0x60>
  } else if(pid < 0){
    42cc:	0f 88 c5 00 00 00    	js     4397 <bigargtest+0xe7>
  wait();
    42d2:	e8 04 06 00 00       	call   48db <wait>
  fd = open("bigarg-ok", 0);
    42d7:	83 ec 08             	sub    $0x8,%esp
    42da:	6a 00                	push   $0x0
    42dc:	68 86 5c 00 00       	push   $0x5c86
    42e1:	e8 2d 06 00 00       	call   4913 <open>
  if(fd < 0){
    42e6:	83 c4 10             	add    $0x10,%esp
    42e9:	85 c0                	test   %eax,%eax
    42eb:	0f 88 8f 00 00 00    	js     4380 <bigargtest+0xd0>
  close(fd);
    42f1:	83 ec 0c             	sub    $0xc,%esp
    42f4:	50                   	push   %eax
    42f5:	e8 01 06 00 00       	call   48fb <close>
  unlink("bigarg-ok");
    42fa:	c7 04 24 86 5c 00 00 	movl   $0x5c86,(%esp)
    4301:	e8 1d 06 00 00       	call   4923 <unlink>
}
    4306:	83 c4 10             	add    $0x10,%esp
    4309:	c9                   	leave  
    430a:	c3                   	ret    
    430b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    430f:	90                   	nop
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    4310:	c7 04 85 a0 b5 00 00 	movl   $0x63e0,0xb5a0(,%eax,4)
    4317:	e0 63 00 00 
    for(i = 0; i < MAXARG-1; i++)
    431b:	83 c0 01             	add    $0x1,%eax
    431e:	83 f8 1f             	cmp    $0x1f,%eax
    4321:	75 ed                	jne    4310 <bigargtest+0x60>
    printf(stdout, "bigarg test\n");
    4323:	51                   	push   %ecx
    4324:	51                   	push   %ecx
    4325:	68 90 5c 00 00       	push   $0x5c90
    432a:	ff 35 68 6e 00 00    	push   0x6e68
    args[MAXARG-1] = 0;
    4330:	c7 05 1c b6 00 00 00 	movl   $0x0,0xb61c
    4337:	00 00 00 
    printf(stdout, "bigarg test\n");
    433a:	e8 11 07 00 00       	call   4a50 <printf>
    exec("echo", args);
    433f:	58                   	pop    %eax
    4340:	5a                   	pop    %edx
    4341:	68 a0 b5 00 00       	push   $0xb5a0
    4346:	68 5d 4e 00 00       	push   $0x4e5d
    434b:	e8 bb 05 00 00       	call   490b <exec>
    printf(stdout, "bigarg test ok\n");
    4350:	59                   	pop    %ecx
    4351:	58                   	pop    %eax
    4352:	68 9d 5c 00 00       	push   $0x5c9d
    4357:	ff 35 68 6e 00 00    	push   0x6e68
    435d:	e8 ee 06 00 00       	call   4a50 <printf>
    fd = open("bigarg-ok", O_CREATE);
    4362:	58                   	pop    %eax
    4363:	5a                   	pop    %edx
    4364:	68 00 02 00 00       	push   $0x200
    4369:	68 86 5c 00 00       	push   $0x5c86
    436e:	e8 a0 05 00 00       	call   4913 <open>
    close(fd);
    4373:	89 04 24             	mov    %eax,(%esp)
    4376:	e8 80 05 00 00       	call   48fb <close>
    exit();
    437b:	e8 53 05 00 00       	call   48d3 <exit>
    printf(stdout, "bigarg test failed!\n");
    4380:	50                   	push   %eax
    4381:	50                   	push   %eax
    4382:	68 c6 5c 00 00       	push   $0x5cc6
    4387:	ff 35 68 6e 00 00    	push   0x6e68
    438d:	e8 be 06 00 00       	call   4a50 <printf>
    exit();
    4392:	e8 3c 05 00 00       	call   48d3 <exit>
    printf(stdout, "bigargtest: fork failed\n");
    4397:	52                   	push   %edx
    4398:	52                   	push   %edx
    4399:	68 ad 5c 00 00       	push   $0x5cad
    439e:	ff 35 68 6e 00 00    	push   0x6e68
    43a4:	e8 a7 06 00 00       	call   4a50 <printf>
    exit();
    43a9:	e8 25 05 00 00       	call   48d3 <exit>
    43ae:	66 90                	xchg   %ax,%ax

000043b0 <fsfull>:
{
    43b0:	55                   	push   %ebp
    43b1:	89 e5                	mov    %esp,%ebp
    43b3:	57                   	push   %edi
    43b4:	56                   	push   %esi
  for(nfiles = 0; ; nfiles++){
    43b5:	31 f6                	xor    %esi,%esi
{
    43b7:	53                   	push   %ebx
    43b8:	83 ec 54             	sub    $0x54,%esp
  printf(1, "fsfull test\n");
    43bb:	68 db 5c 00 00       	push   $0x5cdb
    43c0:	6a 01                	push   $0x1
    43c2:	e8 89 06 00 00       	call   4a50 <printf>
    43c7:	83 c4 10             	add    $0x10,%esp
    43ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    name[1] = '0' + nfiles / 1000;
    43d0:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    43d5:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
    printf(1, "writing %s\n", name);
    43da:	83 ec 04             	sub    $0x4,%esp
    name[0] = 'f';
    43dd:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    43e1:	f7 e6                	mul    %esi
    name[5] = '\0';
    43e3:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    name[1] = '0' + nfiles / 1000;
    43e7:	c1 ea 06             	shr    $0x6,%edx
    43ea:	8d 42 30             	lea    0x30(%edx),%eax
    43ed:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    43f0:	69 c2 e8 03 00 00    	imul   $0x3e8,%edx,%eax
    43f6:	89 f2                	mov    %esi,%edx
    43f8:	29 c2                	sub    %eax,%edx
    43fa:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    43ff:	f7 e2                	mul    %edx
    name[3] = '0' + (nfiles % 100) / 10;
    4401:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    4406:	c1 ea 05             	shr    $0x5,%edx
    4409:	83 c2 30             	add    $0x30,%edx
    440c:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    440f:	f7 e6                	mul    %esi
    4411:	c1 ea 05             	shr    $0x5,%edx
    4414:	6b c2 64             	imul   $0x64,%edx,%eax
    4417:	89 f2                	mov    %esi,%edx
    4419:	29 c2                	sub    %eax,%edx
    441b:	89 d0                	mov    %edx,%eax
    441d:	f7 e1                	mul    %ecx
    name[4] = '0' + (nfiles % 10);
    441f:	89 f0                	mov    %esi,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    4421:	c1 ea 03             	shr    $0x3,%edx
    4424:	83 c2 30             	add    $0x30,%edx
    4427:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    442a:	f7 e1                	mul    %ecx
    442c:	89 f0                	mov    %esi,%eax
    442e:	c1 ea 03             	shr    $0x3,%edx
    4431:	8d 14 92             	lea    (%edx,%edx,4),%edx
    4434:	01 d2                	add    %edx,%edx
    4436:	29 d0                	sub    %edx,%eax
    4438:	83 c0 30             	add    $0x30,%eax
    443b:	88 45 ac             	mov    %al,-0x54(%ebp)
    printf(1, "writing %s\n", name);
    443e:	8d 45 a8             	lea    -0x58(%ebp),%eax
    4441:	50                   	push   %eax
    4442:	68 e8 5c 00 00       	push   $0x5ce8
    4447:	6a 01                	push   $0x1
    4449:	e8 02 06 00 00       	call   4a50 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    444e:	58                   	pop    %eax
    444f:	8d 45 a8             	lea    -0x58(%ebp),%eax
    4452:	5a                   	pop    %edx
    4453:	68 02 02 00 00       	push   $0x202
    4458:	50                   	push   %eax
    4459:	e8 b5 04 00 00       	call   4913 <open>
    if(fd < 0){
    445e:	83 c4 10             	add    $0x10,%esp
    int fd = open(name, O_CREATE|O_RDWR);
    4461:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    4463:	85 c0                	test   %eax,%eax
    4465:	78 4f                	js     44b6 <fsfull+0x106>
    int total = 0;
    4467:	31 db                	xor    %ebx,%ebx
    4469:	eb 07                	jmp    4472 <fsfull+0xc2>
    446b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    446f:	90                   	nop
      total += cc;
    4470:	01 c3                	add    %eax,%ebx
      int cc = write(fd, buf, 512);
    4472:	83 ec 04             	sub    $0x4,%esp
    4475:	68 00 02 00 00       	push   $0x200
    447a:	68 a0 95 00 00       	push   $0x95a0
    447f:	57                   	push   %edi
    4480:	e8 6e 04 00 00       	call   48f3 <write>
      if(cc < 512)
    4485:	83 c4 10             	add    $0x10,%esp
    4488:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    448d:	7f e1                	jg     4470 <fsfull+0xc0>
    printf(1, "wrote %d bytes\n", total);
    448f:	83 ec 04             	sub    $0x4,%esp
    4492:	53                   	push   %ebx
    4493:	68 04 5d 00 00       	push   $0x5d04
    4498:	6a 01                	push   $0x1
    449a:	e8 b1 05 00 00       	call   4a50 <printf>
    close(fd);
    449f:	89 3c 24             	mov    %edi,(%esp)
    44a2:	e8 54 04 00 00       	call   48fb <close>
    if(total == 0)
    44a7:	83 c4 10             	add    $0x10,%esp
    44aa:	85 db                	test   %ebx,%ebx
    44ac:	74 1e                	je     44cc <fsfull+0x11c>
  for(nfiles = 0; ; nfiles++){
    44ae:	83 c6 01             	add    $0x1,%esi
    44b1:	e9 1a ff ff ff       	jmp    43d0 <fsfull+0x20>
      printf(1, "open %s failed\n", name);
    44b6:	83 ec 04             	sub    $0x4,%esp
    44b9:	8d 45 a8             	lea    -0x58(%ebp),%eax
    44bc:	50                   	push   %eax
    44bd:	68 f4 5c 00 00       	push   $0x5cf4
    44c2:	6a 01                	push   $0x1
    44c4:	e8 87 05 00 00       	call   4a50 <printf>
      break;
    44c9:	83 c4 10             	add    $0x10,%esp
    name[1] = '0' + nfiles / 1000;
    44cc:	bf d3 4d 62 10       	mov    $0x10624dd3,%edi
    name[2] = '0' + (nfiles % 1000) / 100;
    44d1:	bb 1f 85 eb 51       	mov    $0x51eb851f,%ebx
    44d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    44dd:	8d 76 00             	lea    0x0(%esi),%esi
    name[1] = '0' + nfiles / 1000;
    44e0:	89 f0                	mov    %esi,%eax
    unlink(name);
    44e2:	83 ec 0c             	sub    $0xc,%esp
    name[0] = 'f';
    44e5:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    44e9:	f7 e7                	mul    %edi
    name[5] = '\0';
    44eb:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    name[1] = '0' + nfiles / 1000;
    44ef:	c1 ea 06             	shr    $0x6,%edx
    44f2:	8d 42 30             	lea    0x30(%edx),%eax
    44f5:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    44f8:	69 c2 e8 03 00 00    	imul   $0x3e8,%edx,%eax
    44fe:	89 f2                	mov    %esi,%edx
    4500:	29 c2                	sub    %eax,%edx
    4502:	89 d0                	mov    %edx,%eax
    4504:	f7 e3                	mul    %ebx
    name[3] = '0' + (nfiles % 100) / 10;
    4506:	89 f0                	mov    %esi,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    4508:	c1 ea 05             	shr    $0x5,%edx
    450b:	83 c2 30             	add    $0x30,%edx
    450e:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    4511:	f7 e3                	mul    %ebx
    4513:	c1 ea 05             	shr    $0x5,%edx
    4516:	6b ca 64             	imul   $0x64,%edx,%ecx
    4519:	89 f2                	mov    %esi,%edx
    451b:	29 ca                	sub    %ecx,%edx
    451d:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
    4522:	89 d0                	mov    %edx,%eax
    4524:	f7 e1                	mul    %ecx
    name[4] = '0' + (nfiles % 10);
    4526:	89 f0                	mov    %esi,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    4528:	c1 ea 03             	shr    $0x3,%edx
    452b:	83 c2 30             	add    $0x30,%edx
    452e:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    4531:	f7 e1                	mul    %ecx
    4533:	89 f0                	mov    %esi,%eax
    nfiles--;
    4535:	83 ee 01             	sub    $0x1,%esi
    name[4] = '0' + (nfiles % 10);
    4538:	c1 ea 03             	shr    $0x3,%edx
    453b:	8d 14 92             	lea    (%edx,%edx,4),%edx
    453e:	01 d2                	add    %edx,%edx
    4540:	29 d0                	sub    %edx,%eax
    4542:	83 c0 30             	add    $0x30,%eax
    4545:	88 45 ac             	mov    %al,-0x54(%ebp)
    unlink(name);
    4548:	8d 45 a8             	lea    -0x58(%ebp),%eax
    454b:	50                   	push   %eax
    454c:	e8 d2 03 00 00       	call   4923 <unlink>
  while(nfiles >= 0){
    4551:	83 c4 10             	add    $0x10,%esp
    4554:	83 fe ff             	cmp    $0xffffffff,%esi
    4557:	75 87                	jne    44e0 <fsfull+0x130>
  printf(1, "fsfull test finished\n");
    4559:	83 ec 08             	sub    $0x8,%esp
    455c:	68 14 5d 00 00       	push   $0x5d14
    4561:	6a 01                	push   $0x1
    4563:	e8 e8 04 00 00       	call   4a50 <printf>
}
    4568:	83 c4 10             	add    $0x10,%esp
    456b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    456e:	5b                   	pop    %ebx
    456f:	5e                   	pop    %esi
    4570:	5f                   	pop    %edi
    4571:	5d                   	pop    %ebp
    4572:	c3                   	ret    
    4573:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    457a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00004580 <uio>:
{
    4580:	55                   	push   %ebp
    4581:	89 e5                	mov    %esp,%ebp
    4583:	83 ec 10             	sub    $0x10,%esp
  printf(1, "uio test\n");
    4586:	68 2a 5d 00 00       	push   $0x5d2a
    458b:	6a 01                	push   $0x1
    458d:	e8 be 04 00 00       	call   4a50 <printf>
  pid = fork();
    4592:	e8 34 03 00 00       	call   48cb <fork>
  if(pid == 0){
    4597:	83 c4 10             	add    $0x10,%esp
    459a:	85 c0                	test   %eax,%eax
    459c:	74 1b                	je     45b9 <uio+0x39>
  } else if(pid < 0){
    459e:	78 3d                	js     45dd <uio+0x5d>
  wait();
    45a0:	e8 36 03 00 00       	call   48db <wait>
  printf(1, "uio test done\n");
    45a5:	83 ec 08             	sub    $0x8,%esp
    45a8:	68 34 5d 00 00       	push   $0x5d34
    45ad:	6a 01                	push   $0x1
    45af:	e8 9c 04 00 00       	call   4a50 <printf>
}
    45b4:	83 c4 10             	add    $0x10,%esp
    45b7:	c9                   	leave  
    45b8:	c3                   	ret    
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    45b9:	b8 09 00 00 00       	mov    $0x9,%eax
    45be:	ba 70 00 00 00       	mov    $0x70,%edx
    45c3:	ee                   	out    %al,(%dx)
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    45c4:	ba 71 00 00 00       	mov    $0x71,%edx
    45c9:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
    45ca:	52                   	push   %edx
    45cb:	52                   	push   %edx
    45cc:	68 c0 64 00 00       	push   $0x64c0
    45d1:	6a 01                	push   $0x1
    45d3:	e8 78 04 00 00       	call   4a50 <printf>
    exit();
    45d8:	e8 f6 02 00 00       	call   48d3 <exit>
    printf (1, "fork failed\n");
    45dd:	50                   	push   %eax
    45de:	50                   	push   %eax
    45df:	68 b9 5c 00 00       	push   $0x5cb9
    45e4:	6a 01                	push   $0x1
    45e6:	e8 65 04 00 00       	call   4a50 <printf>
    exit();
    45eb:	e8 e3 02 00 00       	call   48d3 <exit>

000045f0 <argptest>:
{
    45f0:	55                   	push   %ebp
    45f1:	89 e5                	mov    %esp,%ebp
    45f3:	53                   	push   %ebx
    45f4:	83 ec 0c             	sub    $0xc,%esp
  fd = open("init", O_RDONLY);
    45f7:	6a 00                	push   $0x0
    45f9:	68 43 5d 00 00       	push   $0x5d43
    45fe:	e8 10 03 00 00       	call   4913 <open>
  if (fd < 0) {
    4603:	83 c4 10             	add    $0x10,%esp
    4606:	85 c0                	test   %eax,%eax
    4608:	78 39                	js     4643 <argptest+0x53>
  read(fd, sbrk(0) - 1, -1);
    460a:	83 ec 0c             	sub    $0xc,%esp
    460d:	89 c3                	mov    %eax,%ebx
    460f:	6a 00                	push   $0x0
    4611:	e8 45 03 00 00       	call   495b <sbrk>
    4616:	83 c4 0c             	add    $0xc,%esp
    4619:	83 e8 01             	sub    $0x1,%eax
    461c:	6a ff                	push   $0xffffffff
    461e:	50                   	push   %eax
    461f:	53                   	push   %ebx
    4620:	e8 c6 02 00 00       	call   48eb <read>
  close(fd);
    4625:	89 1c 24             	mov    %ebx,(%esp)
    4628:	e8 ce 02 00 00       	call   48fb <close>
  printf(1, "arg test passed\n");
    462d:	58                   	pop    %eax
    462e:	5a                   	pop    %edx
    462f:	68 55 5d 00 00       	push   $0x5d55
    4634:	6a 01                	push   $0x1
    4636:	e8 15 04 00 00       	call   4a50 <printf>
}
    463b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    463e:	83 c4 10             	add    $0x10,%esp
    4641:	c9                   	leave  
    4642:	c3                   	ret    
    printf(2, "open failed\n");
    4643:	51                   	push   %ecx
    4644:	51                   	push   %ecx
    4645:	68 48 5d 00 00       	push   $0x5d48
    464a:	6a 02                	push   $0x2
    464c:	e8 ff 03 00 00       	call   4a50 <printf>
    exit();
    4651:	e8 7d 02 00 00       	call   48d3 <exit>
    4656:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    465d:	8d 76 00             	lea    0x0(%esi),%esi

00004660 <rand>:
  randstate = randstate * 1664525 + 1013904223;
    4660:	69 05 64 6e 00 00 0d 	imul   $0x19660d,0x6e64,%eax
    4667:	66 19 00 
    466a:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    466f:	a3 64 6e 00 00       	mov    %eax,0x6e64
}
    4674:	c3                   	ret    
    4675:	66 90                	xchg   %ax,%ax
    4677:	66 90                	xchg   %ax,%ax
    4679:	66 90                	xchg   %ax,%ax
    467b:	66 90                	xchg   %ax,%ax
    467d:	66 90                	xchg   %ax,%ax
    467f:	90                   	nop

00004680 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    4680:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    4681:	31 c0                	xor    %eax,%eax
{
    4683:	89 e5                	mov    %esp,%ebp
    4685:	53                   	push   %ebx
    4686:	8b 4d 08             	mov    0x8(%ebp),%ecx
    4689:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    468c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    4690:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    4694:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    4697:	83 c0 01             	add    $0x1,%eax
    469a:	84 d2                	test   %dl,%dl
    469c:	75 f2                	jne    4690 <strcpy+0x10>
    ;
  return os;
}
    469e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    46a1:	89 c8                	mov    %ecx,%eax
    46a3:	c9                   	leave  
    46a4:	c3                   	ret    
    46a5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    46ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000046b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    46b0:	55                   	push   %ebp
    46b1:	89 e5                	mov    %esp,%ebp
    46b3:	53                   	push   %ebx
    46b4:	8b 55 08             	mov    0x8(%ebp),%edx
    46b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    46ba:	0f b6 02             	movzbl (%edx),%eax
    46bd:	84 c0                	test   %al,%al
    46bf:	75 17                	jne    46d8 <strcmp+0x28>
    46c1:	eb 3a                	jmp    46fd <strcmp+0x4d>
    46c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    46c7:	90                   	nop
    46c8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    46cc:	83 c2 01             	add    $0x1,%edx
    46cf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    46d2:	84 c0                	test   %al,%al
    46d4:	74 1a                	je     46f0 <strcmp+0x40>
    p++, q++;
    46d6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    46d8:	0f b6 19             	movzbl (%ecx),%ebx
    46db:	38 c3                	cmp    %al,%bl
    46dd:	74 e9                	je     46c8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    46df:	29 d8                	sub    %ebx,%eax
}
    46e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    46e4:	c9                   	leave  
    46e5:	c3                   	ret    
    46e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    46ed:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    46f0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    46f4:	31 c0                	xor    %eax,%eax
    46f6:	29 d8                	sub    %ebx,%eax
}
    46f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    46fb:	c9                   	leave  
    46fc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    46fd:	0f b6 19             	movzbl (%ecx),%ebx
    4700:	31 c0                	xor    %eax,%eax
    4702:	eb db                	jmp    46df <strcmp+0x2f>
    4704:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    470b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    470f:	90                   	nop

00004710 <strlen>:

uint
strlen(const char *s)
{
    4710:	55                   	push   %ebp
    4711:	89 e5                	mov    %esp,%ebp
    4713:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    4716:	80 3a 00             	cmpb   $0x0,(%edx)
    4719:	74 15                	je     4730 <strlen+0x20>
    471b:	31 c0                	xor    %eax,%eax
    471d:	8d 76 00             	lea    0x0(%esi),%esi
    4720:	83 c0 01             	add    $0x1,%eax
    4723:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    4727:	89 c1                	mov    %eax,%ecx
    4729:	75 f5                	jne    4720 <strlen+0x10>
    ;
  return n;
}
    472b:	89 c8                	mov    %ecx,%eax
    472d:	5d                   	pop    %ebp
    472e:	c3                   	ret    
    472f:	90                   	nop
  for(n = 0; s[n]; n++)
    4730:	31 c9                	xor    %ecx,%ecx
}
    4732:	5d                   	pop    %ebp
    4733:	89 c8                	mov    %ecx,%eax
    4735:	c3                   	ret    
    4736:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    473d:	8d 76 00             	lea    0x0(%esi),%esi

00004740 <memset>:

void*
memset(void *dst, int c, uint n)
{
    4740:	55                   	push   %ebp
    4741:	89 e5                	mov    %esp,%ebp
    4743:	57                   	push   %edi
    4744:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    4747:	8b 4d 10             	mov    0x10(%ebp),%ecx
    474a:	8b 45 0c             	mov    0xc(%ebp),%eax
    474d:	89 d7                	mov    %edx,%edi
    474f:	fc                   	cld    
    4750:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    4752:	8b 7d fc             	mov    -0x4(%ebp),%edi
    4755:	89 d0                	mov    %edx,%eax
    4757:	c9                   	leave  
    4758:	c3                   	ret    
    4759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00004760 <strchr>:

char*
strchr(const char *s, char c)
{
    4760:	55                   	push   %ebp
    4761:	89 e5                	mov    %esp,%ebp
    4763:	8b 45 08             	mov    0x8(%ebp),%eax
    4766:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    476a:	0f b6 10             	movzbl (%eax),%edx
    476d:	84 d2                	test   %dl,%dl
    476f:	75 12                	jne    4783 <strchr+0x23>
    4771:	eb 1d                	jmp    4790 <strchr+0x30>
    4773:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    4777:	90                   	nop
    4778:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    477c:	83 c0 01             	add    $0x1,%eax
    477f:	84 d2                	test   %dl,%dl
    4781:	74 0d                	je     4790 <strchr+0x30>
    if(*s == c)
    4783:	38 d1                	cmp    %dl,%cl
    4785:	75 f1                	jne    4778 <strchr+0x18>
      return (char*)s;
  return 0;
}
    4787:	5d                   	pop    %ebp
    4788:	c3                   	ret    
    4789:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    4790:	31 c0                	xor    %eax,%eax
}
    4792:	5d                   	pop    %ebp
    4793:	c3                   	ret    
    4794:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    479b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    479f:	90                   	nop

000047a0 <gets>:

char*
gets(char *buf, int max)
{
    47a0:	55                   	push   %ebp
    47a1:	89 e5                	mov    %esp,%ebp
    47a3:	57                   	push   %edi
    47a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    47a5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    47a8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    47a9:	31 db                	xor    %ebx,%ebx
{
    47ab:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    47ae:	eb 27                	jmp    47d7 <gets+0x37>
    cc = read(0, &c, 1);
    47b0:	83 ec 04             	sub    $0x4,%esp
    47b3:	6a 01                	push   $0x1
    47b5:	57                   	push   %edi
    47b6:	6a 00                	push   $0x0
    47b8:	e8 2e 01 00 00       	call   48eb <read>
    if(cc < 1)
    47bd:	83 c4 10             	add    $0x10,%esp
    47c0:	85 c0                	test   %eax,%eax
    47c2:	7e 1d                	jle    47e1 <gets+0x41>
      break;
    buf[i++] = c;
    47c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    47c8:	8b 55 08             	mov    0x8(%ebp),%edx
    47cb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    47cf:	3c 0a                	cmp    $0xa,%al
    47d1:	74 1d                	je     47f0 <gets+0x50>
    47d3:	3c 0d                	cmp    $0xd,%al
    47d5:	74 19                	je     47f0 <gets+0x50>
  for(i=0; i+1 < max; ){
    47d7:	89 de                	mov    %ebx,%esi
    47d9:	83 c3 01             	add    $0x1,%ebx
    47dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    47df:	7c cf                	jl     47b0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    47e1:	8b 45 08             	mov    0x8(%ebp),%eax
    47e4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    47e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    47eb:	5b                   	pop    %ebx
    47ec:	5e                   	pop    %esi
    47ed:	5f                   	pop    %edi
    47ee:	5d                   	pop    %ebp
    47ef:	c3                   	ret    
  buf[i] = '\0';
    47f0:	8b 45 08             	mov    0x8(%ebp),%eax
    47f3:	89 de                	mov    %ebx,%esi
    47f5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    47f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    47fc:	5b                   	pop    %ebx
    47fd:	5e                   	pop    %esi
    47fe:	5f                   	pop    %edi
    47ff:	5d                   	pop    %ebp
    4800:	c3                   	ret    
    4801:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    4808:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    480f:	90                   	nop

00004810 <stat>:

int
stat(const char *n, struct stat *st)
{
    4810:	55                   	push   %ebp
    4811:	89 e5                	mov    %esp,%ebp
    4813:	56                   	push   %esi
    4814:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    4815:	83 ec 08             	sub    $0x8,%esp
    4818:	6a 00                	push   $0x0
    481a:	ff 75 08             	push   0x8(%ebp)
    481d:	e8 f1 00 00 00       	call   4913 <open>
  if(fd < 0)
    4822:	83 c4 10             	add    $0x10,%esp
    4825:	85 c0                	test   %eax,%eax
    4827:	78 27                	js     4850 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    4829:	83 ec 08             	sub    $0x8,%esp
    482c:	ff 75 0c             	push   0xc(%ebp)
    482f:	89 c3                	mov    %eax,%ebx
    4831:	50                   	push   %eax
    4832:	e8 f4 00 00 00       	call   492b <fstat>
  close(fd);
    4837:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    483a:	89 c6                	mov    %eax,%esi
  close(fd);
    483c:	e8 ba 00 00 00       	call   48fb <close>
  return r;
    4841:	83 c4 10             	add    $0x10,%esp
}
    4844:	8d 65 f8             	lea    -0x8(%ebp),%esp
    4847:	89 f0                	mov    %esi,%eax
    4849:	5b                   	pop    %ebx
    484a:	5e                   	pop    %esi
    484b:	5d                   	pop    %ebp
    484c:	c3                   	ret    
    484d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    4850:	be ff ff ff ff       	mov    $0xffffffff,%esi
    4855:	eb ed                	jmp    4844 <stat+0x34>
    4857:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    485e:	66 90                	xchg   %ax,%ax

00004860 <atoi>:

int
atoi(const char *s)
{
    4860:	55                   	push   %ebp
    4861:	89 e5                	mov    %esp,%ebp
    4863:	53                   	push   %ebx
    4864:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    4867:	0f be 02             	movsbl (%edx),%eax
    486a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    486d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    4870:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    4875:	77 1e                	ja     4895 <atoi+0x35>
    4877:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    487e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    4880:	83 c2 01             	add    $0x1,%edx
    4883:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    4886:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    488a:	0f be 02             	movsbl (%edx),%eax
    488d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    4890:	80 fb 09             	cmp    $0x9,%bl
    4893:	76 eb                	jbe    4880 <atoi+0x20>
  return n;
}
    4895:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    4898:	89 c8                	mov    %ecx,%eax
    489a:	c9                   	leave  
    489b:	c3                   	ret    
    489c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000048a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    48a0:	55                   	push   %ebp
    48a1:	89 e5                	mov    %esp,%ebp
    48a3:	57                   	push   %edi
    48a4:	8b 45 10             	mov    0x10(%ebp),%eax
    48a7:	8b 55 08             	mov    0x8(%ebp),%edx
    48aa:	56                   	push   %esi
    48ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    48ae:	85 c0                	test   %eax,%eax
    48b0:	7e 13                	jle    48c5 <memmove+0x25>
    48b2:	01 d0                	add    %edx,%eax
  dst = vdst;
    48b4:	89 d7                	mov    %edx,%edi
    48b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    48bd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    48c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    48c1:	39 f8                	cmp    %edi,%eax
    48c3:	75 fb                	jne    48c0 <memmove+0x20>
  return vdst;
}
    48c5:	5e                   	pop    %esi
    48c6:	89 d0                	mov    %edx,%eax
    48c8:	5f                   	pop    %edi
    48c9:	5d                   	pop    %ebp
    48ca:	c3                   	ret    

000048cb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    48cb:	b8 01 00 00 00       	mov    $0x1,%eax
    48d0:	cd 40                	int    $0x40
    48d2:	c3                   	ret    

000048d3 <exit>:
SYSCALL(exit)
    48d3:	b8 02 00 00 00       	mov    $0x2,%eax
    48d8:	cd 40                	int    $0x40
    48da:	c3                   	ret    

000048db <wait>:
SYSCALL(wait)
    48db:	b8 03 00 00 00       	mov    $0x3,%eax
    48e0:	cd 40                	int    $0x40
    48e2:	c3                   	ret    

000048e3 <pipe>:
SYSCALL(pipe)
    48e3:	b8 04 00 00 00       	mov    $0x4,%eax
    48e8:	cd 40                	int    $0x40
    48ea:	c3                   	ret    

000048eb <read>:
SYSCALL(read)
    48eb:	b8 05 00 00 00       	mov    $0x5,%eax
    48f0:	cd 40                	int    $0x40
    48f2:	c3                   	ret    

000048f3 <write>:
SYSCALL(write)
    48f3:	b8 10 00 00 00       	mov    $0x10,%eax
    48f8:	cd 40                	int    $0x40
    48fa:	c3                   	ret    

000048fb <close>:
SYSCALL(close)
    48fb:	b8 15 00 00 00       	mov    $0x15,%eax
    4900:	cd 40                	int    $0x40
    4902:	c3                   	ret    

00004903 <kill>:
SYSCALL(kill)
    4903:	b8 06 00 00 00       	mov    $0x6,%eax
    4908:	cd 40                	int    $0x40
    490a:	c3                   	ret    

0000490b <exec>:
SYSCALL(exec)
    490b:	b8 07 00 00 00       	mov    $0x7,%eax
    4910:	cd 40                	int    $0x40
    4912:	c3                   	ret    

00004913 <open>:
SYSCALL(open)
    4913:	b8 0f 00 00 00       	mov    $0xf,%eax
    4918:	cd 40                	int    $0x40
    491a:	c3                   	ret    

0000491b <mknod>:
SYSCALL(mknod)
    491b:	b8 11 00 00 00       	mov    $0x11,%eax
    4920:	cd 40                	int    $0x40
    4922:	c3                   	ret    

00004923 <unlink>:
SYSCALL(unlink)
    4923:	b8 12 00 00 00       	mov    $0x12,%eax
    4928:	cd 40                	int    $0x40
    492a:	c3                   	ret    

0000492b <fstat>:
SYSCALL(fstat)
    492b:	b8 08 00 00 00       	mov    $0x8,%eax
    4930:	cd 40                	int    $0x40
    4932:	c3                   	ret    

00004933 <link>:
SYSCALL(link)
    4933:	b8 13 00 00 00       	mov    $0x13,%eax
    4938:	cd 40                	int    $0x40
    493a:	c3                   	ret    

0000493b <mkdir>:
SYSCALL(mkdir)
    493b:	b8 14 00 00 00       	mov    $0x14,%eax
    4940:	cd 40                	int    $0x40
    4942:	c3                   	ret    

00004943 <chdir>:
SYSCALL(chdir)
    4943:	b8 09 00 00 00       	mov    $0x9,%eax
    4948:	cd 40                	int    $0x40
    494a:	c3                   	ret    

0000494b <dup>:
SYSCALL(dup)
    494b:	b8 0a 00 00 00       	mov    $0xa,%eax
    4950:	cd 40                	int    $0x40
    4952:	c3                   	ret    

00004953 <getpid>:
SYSCALL(getpid)
    4953:	b8 0b 00 00 00       	mov    $0xb,%eax
    4958:	cd 40                	int    $0x40
    495a:	c3                   	ret    

0000495b <sbrk>:
SYSCALL(sbrk)
    495b:	b8 0c 00 00 00       	mov    $0xc,%eax
    4960:	cd 40                	int    $0x40
    4962:	c3                   	ret    

00004963 <sleep>:
SYSCALL(sleep)
    4963:	b8 0d 00 00 00       	mov    $0xd,%eax
    4968:	cd 40                	int    $0x40
    496a:	c3                   	ret    

0000496b <uptime>:
SYSCALL(uptime)
    496b:	b8 0e 00 00 00       	mov    $0xe,%eax
    4970:	cd 40                	int    $0x40
    4972:	c3                   	ret    

00004973 <getpinfo>:

SYSCALL(getpinfo)
    4973:	b8 16 00 00 00       	mov    $0x16,%eax
    4978:	cd 40                	int    $0x40
    497a:	c3                   	ret    

0000497b <settickets>:
SYSCALL(settickets)
    497b:	b8 17 00 00 00       	mov    $0x17,%eax
    4980:	cd 40                	int    $0x40
    4982:	c3                   	ret    

00004983 <mprotect>:
SYSCALL(mprotect)
    4983:	b8 18 00 00 00       	mov    $0x18,%eax
    4988:	cd 40                	int    $0x40
    498a:	c3                   	ret    

0000498b <munprotect>:
SYSCALL(munprotect)
    498b:	b8 19 00 00 00       	mov    $0x19,%eax
    4990:	cd 40                	int    $0x40
    4992:	c3                   	ret    
    4993:	66 90                	xchg   %ax,%ax
    4995:	66 90                	xchg   %ax,%ax
    4997:	66 90                	xchg   %ax,%ax
    4999:	66 90                	xchg   %ax,%ax
    499b:	66 90                	xchg   %ax,%ax
    499d:	66 90                	xchg   %ax,%ax
    499f:	90                   	nop

000049a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    49a0:	55                   	push   %ebp
    49a1:	89 e5                	mov    %esp,%ebp
    49a3:	57                   	push   %edi
    49a4:	56                   	push   %esi
    49a5:	53                   	push   %ebx
    49a6:	83 ec 3c             	sub    $0x3c,%esp
    49a9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    49ac:	89 d1                	mov    %edx,%ecx
{
    49ae:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    49b1:	85 d2                	test   %edx,%edx
    49b3:	0f 89 7f 00 00 00    	jns    4a38 <printint+0x98>
    49b9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    49bd:	74 79                	je     4a38 <printint+0x98>
    neg = 1;
    49bf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    49c6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    49c8:	31 db                	xor    %ebx,%ebx
    49ca:	8d 75 d7             	lea    -0x29(%ebp),%esi
    49cd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    49d0:	89 c8                	mov    %ecx,%eax
    49d2:	31 d2                	xor    %edx,%edx
    49d4:	89 cf                	mov    %ecx,%edi
    49d6:	f7 75 c4             	divl   -0x3c(%ebp)
    49d9:	0f b6 92 70 65 00 00 	movzbl 0x6570(%edx),%edx
    49e0:	89 45 c0             	mov    %eax,-0x40(%ebp)
    49e3:	89 d8                	mov    %ebx,%eax
    49e5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    49e8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    49eb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    49ee:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    49f1:	76 dd                	jbe    49d0 <printint+0x30>
  if(neg)
    49f3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    49f6:	85 c9                	test   %ecx,%ecx
    49f8:	74 0c                	je     4a06 <printint+0x66>
    buf[i++] = '-';
    49fa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    49ff:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    4a01:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    4a06:	8b 7d b8             	mov    -0x48(%ebp),%edi
    4a09:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    4a0d:	eb 07                	jmp    4a16 <printint+0x76>
    4a0f:	90                   	nop
    putc(fd, buf[i]);
    4a10:	0f b6 13             	movzbl (%ebx),%edx
    4a13:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    4a16:	83 ec 04             	sub    $0x4,%esp
    4a19:	88 55 d7             	mov    %dl,-0x29(%ebp)
    4a1c:	6a 01                	push   $0x1
    4a1e:	56                   	push   %esi
    4a1f:	57                   	push   %edi
    4a20:	e8 ce fe ff ff       	call   48f3 <write>
  while(--i >= 0)
    4a25:	83 c4 10             	add    $0x10,%esp
    4a28:	39 de                	cmp    %ebx,%esi
    4a2a:	75 e4                	jne    4a10 <printint+0x70>
}
    4a2c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    4a2f:	5b                   	pop    %ebx
    4a30:	5e                   	pop    %esi
    4a31:	5f                   	pop    %edi
    4a32:	5d                   	pop    %ebp
    4a33:	c3                   	ret    
    4a34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    4a38:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    4a3f:	eb 87                	jmp    49c8 <printint+0x28>
    4a41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    4a48:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    4a4f:	90                   	nop

00004a50 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    4a50:	55                   	push   %ebp
    4a51:	89 e5                	mov    %esp,%ebp
    4a53:	57                   	push   %edi
    4a54:	56                   	push   %esi
    4a55:	53                   	push   %ebx
    4a56:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    4a59:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    4a5c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    4a5f:	0f b6 13             	movzbl (%ebx),%edx
    4a62:	84 d2                	test   %dl,%dl
    4a64:	74 6a                	je     4ad0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    4a66:	8d 45 10             	lea    0x10(%ebp),%eax
    4a69:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    4a6c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    4a6f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    4a71:	89 45 d0             	mov    %eax,-0x30(%ebp)
    4a74:	eb 36                	jmp    4aac <printf+0x5c>
    4a76:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    4a7d:	8d 76 00             	lea    0x0(%esi),%esi
    4a80:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    4a83:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    4a88:	83 f8 25             	cmp    $0x25,%eax
    4a8b:	74 15                	je     4aa2 <printf+0x52>
  write(fd, &c, 1);
    4a8d:	83 ec 04             	sub    $0x4,%esp
    4a90:	88 55 e7             	mov    %dl,-0x19(%ebp)
    4a93:	6a 01                	push   $0x1
    4a95:	57                   	push   %edi
    4a96:	56                   	push   %esi
    4a97:	e8 57 fe ff ff       	call   48f3 <write>
    4a9c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    4a9f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    4aa2:	0f b6 13             	movzbl (%ebx),%edx
    4aa5:	83 c3 01             	add    $0x1,%ebx
    4aa8:	84 d2                	test   %dl,%dl
    4aaa:	74 24                	je     4ad0 <printf+0x80>
    c = fmt[i] & 0xff;
    4aac:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    4aaf:	85 c9                	test   %ecx,%ecx
    4ab1:	74 cd                	je     4a80 <printf+0x30>
      }
    } else if(state == '%'){
    4ab3:	83 f9 25             	cmp    $0x25,%ecx
    4ab6:	75 ea                	jne    4aa2 <printf+0x52>
      if(c == 'd'){
    4ab8:	83 f8 25             	cmp    $0x25,%eax
    4abb:	0f 84 07 01 00 00    	je     4bc8 <printf+0x178>
    4ac1:	83 e8 63             	sub    $0x63,%eax
    4ac4:	83 f8 15             	cmp    $0x15,%eax
    4ac7:	77 17                	ja     4ae0 <printf+0x90>
    4ac9:	ff 24 85 18 65 00 00 	jmp    *0x6518(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    4ad0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    4ad3:	5b                   	pop    %ebx
    4ad4:	5e                   	pop    %esi
    4ad5:	5f                   	pop    %edi
    4ad6:	5d                   	pop    %ebp
    4ad7:	c3                   	ret    
    4ad8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    4adf:	90                   	nop
  write(fd, &c, 1);
    4ae0:	83 ec 04             	sub    $0x4,%esp
    4ae3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    4ae6:	6a 01                	push   $0x1
    4ae8:	57                   	push   %edi
    4ae9:	56                   	push   %esi
    4aea:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    4aee:	e8 00 fe ff ff       	call   48f3 <write>
        putc(fd, c);
    4af3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    4af7:	83 c4 0c             	add    $0xc,%esp
    4afa:	88 55 e7             	mov    %dl,-0x19(%ebp)
    4afd:	6a 01                	push   $0x1
    4aff:	57                   	push   %edi
    4b00:	56                   	push   %esi
    4b01:	e8 ed fd ff ff       	call   48f3 <write>
        putc(fd, c);
    4b06:	83 c4 10             	add    $0x10,%esp
      state = 0;
    4b09:	31 c9                	xor    %ecx,%ecx
    4b0b:	eb 95                	jmp    4aa2 <printf+0x52>
    4b0d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    4b10:	83 ec 0c             	sub    $0xc,%esp
    4b13:	b9 10 00 00 00       	mov    $0x10,%ecx
    4b18:	6a 00                	push   $0x0
    4b1a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    4b1d:	8b 10                	mov    (%eax),%edx
    4b1f:	89 f0                	mov    %esi,%eax
    4b21:	e8 7a fe ff ff       	call   49a0 <printint>
        ap++;
    4b26:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    4b2a:	83 c4 10             	add    $0x10,%esp
      state = 0;
    4b2d:	31 c9                	xor    %ecx,%ecx
    4b2f:	e9 6e ff ff ff       	jmp    4aa2 <printf+0x52>
    4b34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    4b38:	8b 45 d0             	mov    -0x30(%ebp),%eax
    4b3b:	8b 10                	mov    (%eax),%edx
        ap++;
    4b3d:	83 c0 04             	add    $0x4,%eax
    4b40:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    4b43:	85 d2                	test   %edx,%edx
    4b45:	0f 84 8d 00 00 00    	je     4bd8 <printf+0x188>
        while(*s != 0){
    4b4b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    4b4e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    4b50:	84 c0                	test   %al,%al
    4b52:	0f 84 4a ff ff ff    	je     4aa2 <printf+0x52>
    4b58:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    4b5b:	89 d3                	mov    %edx,%ebx
    4b5d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    4b60:	83 ec 04             	sub    $0x4,%esp
          s++;
    4b63:	83 c3 01             	add    $0x1,%ebx
    4b66:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    4b69:	6a 01                	push   $0x1
    4b6b:	57                   	push   %edi
    4b6c:	56                   	push   %esi
    4b6d:	e8 81 fd ff ff       	call   48f3 <write>
        while(*s != 0){
    4b72:	0f b6 03             	movzbl (%ebx),%eax
    4b75:	83 c4 10             	add    $0x10,%esp
    4b78:	84 c0                	test   %al,%al
    4b7a:	75 e4                	jne    4b60 <printf+0x110>
      state = 0;
    4b7c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    4b7f:	31 c9                	xor    %ecx,%ecx
    4b81:	e9 1c ff ff ff       	jmp    4aa2 <printf+0x52>
    4b86:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    4b8d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    4b90:	83 ec 0c             	sub    $0xc,%esp
    4b93:	b9 0a 00 00 00       	mov    $0xa,%ecx
    4b98:	6a 01                	push   $0x1
    4b9a:	e9 7b ff ff ff       	jmp    4b1a <printf+0xca>
    4b9f:	90                   	nop
        putc(fd, *ap);
    4ba0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    4ba3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    4ba6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    4ba8:	6a 01                	push   $0x1
    4baa:	57                   	push   %edi
    4bab:	56                   	push   %esi
        putc(fd, *ap);
    4bac:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    4baf:	e8 3f fd ff ff       	call   48f3 <write>
        ap++;
    4bb4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    4bb8:	83 c4 10             	add    $0x10,%esp
      state = 0;
    4bbb:	31 c9                	xor    %ecx,%ecx
    4bbd:	e9 e0 fe ff ff       	jmp    4aa2 <printf+0x52>
    4bc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    4bc8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    4bcb:	83 ec 04             	sub    $0x4,%esp
    4bce:	e9 2a ff ff ff       	jmp    4afd <printf+0xad>
    4bd3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    4bd7:	90                   	nop
          s = "(null)";
    4bd8:	ba 0e 65 00 00       	mov    $0x650e,%edx
        while(*s != 0){
    4bdd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    4be0:	b8 28 00 00 00       	mov    $0x28,%eax
    4be5:	89 d3                	mov    %edx,%ebx
    4be7:	e9 74 ff ff ff       	jmp    4b60 <printf+0x110>
    4bec:	66 90                	xchg   %ax,%ax
    4bee:	66 90                	xchg   %ax,%ax

00004bf0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    4bf0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4bf1:	a1 20 b6 00 00       	mov    0xb620,%eax
{
    4bf6:	89 e5                	mov    %esp,%ebp
    4bf8:	57                   	push   %edi
    4bf9:	56                   	push   %esi
    4bfa:	53                   	push   %ebx
    4bfb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    4bfe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4c01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    4c08:	89 c2                	mov    %eax,%edx
    4c0a:	8b 00                	mov    (%eax),%eax
    4c0c:	39 ca                	cmp    %ecx,%edx
    4c0e:	73 30                	jae    4c40 <free+0x50>
    4c10:	39 c1                	cmp    %eax,%ecx
    4c12:	72 04                	jb     4c18 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4c14:	39 c2                	cmp    %eax,%edx
    4c16:	72 f0                	jb     4c08 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    4c18:	8b 73 fc             	mov    -0x4(%ebx),%esi
    4c1b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    4c1e:	39 f8                	cmp    %edi,%eax
    4c20:	74 30                	je     4c52 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    4c22:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    4c25:	8b 42 04             	mov    0x4(%edx),%eax
    4c28:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    4c2b:	39 f1                	cmp    %esi,%ecx
    4c2d:	74 3a                	je     4c69 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    4c2f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    4c31:	5b                   	pop    %ebx
  freep = p;
    4c32:	89 15 20 b6 00 00    	mov    %edx,0xb620
}
    4c38:	5e                   	pop    %esi
    4c39:	5f                   	pop    %edi
    4c3a:	5d                   	pop    %ebp
    4c3b:	c3                   	ret    
    4c3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4c40:	39 c2                	cmp    %eax,%edx
    4c42:	72 c4                	jb     4c08 <free+0x18>
    4c44:	39 c1                	cmp    %eax,%ecx
    4c46:	73 c0                	jae    4c08 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    4c48:	8b 73 fc             	mov    -0x4(%ebx),%esi
    4c4b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    4c4e:	39 f8                	cmp    %edi,%eax
    4c50:	75 d0                	jne    4c22 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    4c52:	03 70 04             	add    0x4(%eax),%esi
    4c55:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    4c58:	8b 02                	mov    (%edx),%eax
    4c5a:	8b 00                	mov    (%eax),%eax
    4c5c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    4c5f:	8b 42 04             	mov    0x4(%edx),%eax
    4c62:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    4c65:	39 f1                	cmp    %esi,%ecx
    4c67:	75 c6                	jne    4c2f <free+0x3f>
    p->s.size += bp->s.size;
    4c69:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    4c6c:	89 15 20 b6 00 00    	mov    %edx,0xb620
    p->s.size += bp->s.size;
    4c72:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    4c75:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    4c78:	89 0a                	mov    %ecx,(%edx)
}
    4c7a:	5b                   	pop    %ebx
    4c7b:	5e                   	pop    %esi
    4c7c:	5f                   	pop    %edi
    4c7d:	5d                   	pop    %ebp
    4c7e:	c3                   	ret    
    4c7f:	90                   	nop

00004c80 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    4c80:	55                   	push   %ebp
    4c81:	89 e5                	mov    %esp,%ebp
    4c83:	57                   	push   %edi
    4c84:	56                   	push   %esi
    4c85:	53                   	push   %ebx
    4c86:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    4c89:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    4c8c:	8b 3d 20 b6 00 00    	mov    0xb620,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    4c92:	8d 70 07             	lea    0x7(%eax),%esi
    4c95:	c1 ee 03             	shr    $0x3,%esi
    4c98:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    4c9b:	85 ff                	test   %edi,%edi
    4c9d:	0f 84 9d 00 00 00    	je     4d40 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4ca3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    4ca5:	8b 4a 04             	mov    0x4(%edx),%ecx
    4ca8:	39 f1                	cmp    %esi,%ecx
    4caa:	73 6a                	jae    4d16 <malloc+0x96>
    4cac:	bb 00 10 00 00       	mov    $0x1000,%ebx
    4cb1:	39 de                	cmp    %ebx,%esi
    4cb3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    4cb6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    4cbd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    4cc0:	eb 17                	jmp    4cd9 <malloc+0x59>
    4cc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4cc8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    4cca:	8b 48 04             	mov    0x4(%eax),%ecx
    4ccd:	39 f1                	cmp    %esi,%ecx
    4ccf:	73 4f                	jae    4d20 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    4cd1:	8b 3d 20 b6 00 00    	mov    0xb620,%edi
    4cd7:	89 c2                	mov    %eax,%edx
    4cd9:	39 d7                	cmp    %edx,%edi
    4cdb:	75 eb                	jne    4cc8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    4cdd:	83 ec 0c             	sub    $0xc,%esp
    4ce0:	ff 75 e4             	push   -0x1c(%ebp)
    4ce3:	e8 73 fc ff ff       	call   495b <sbrk>
  if(p == (char*)-1)
    4ce8:	83 c4 10             	add    $0x10,%esp
    4ceb:	83 f8 ff             	cmp    $0xffffffff,%eax
    4cee:	74 1c                	je     4d0c <malloc+0x8c>
  hp->s.size = nu;
    4cf0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    4cf3:	83 ec 0c             	sub    $0xc,%esp
    4cf6:	83 c0 08             	add    $0x8,%eax
    4cf9:	50                   	push   %eax
    4cfa:	e8 f1 fe ff ff       	call   4bf0 <free>
  return freep;
    4cff:	8b 15 20 b6 00 00    	mov    0xb620,%edx
      if((p = morecore(nunits)) == 0)
    4d05:	83 c4 10             	add    $0x10,%esp
    4d08:	85 d2                	test   %edx,%edx
    4d0a:	75 bc                	jne    4cc8 <malloc+0x48>
        return 0;
  }
}
    4d0c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    4d0f:	31 c0                	xor    %eax,%eax
}
    4d11:	5b                   	pop    %ebx
    4d12:	5e                   	pop    %esi
    4d13:	5f                   	pop    %edi
    4d14:	5d                   	pop    %ebp
    4d15:	c3                   	ret    
    if(p->s.size >= nunits){
    4d16:	89 d0                	mov    %edx,%eax
    4d18:	89 fa                	mov    %edi,%edx
    4d1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    4d20:	39 ce                	cmp    %ecx,%esi
    4d22:	74 4c                	je     4d70 <malloc+0xf0>
        p->s.size -= nunits;
    4d24:	29 f1                	sub    %esi,%ecx
    4d26:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    4d29:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    4d2c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    4d2f:	89 15 20 b6 00 00    	mov    %edx,0xb620
}
    4d35:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    4d38:	83 c0 08             	add    $0x8,%eax
}
    4d3b:	5b                   	pop    %ebx
    4d3c:	5e                   	pop    %esi
    4d3d:	5f                   	pop    %edi
    4d3e:	5d                   	pop    %ebp
    4d3f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    4d40:	c7 05 20 b6 00 00 24 	movl   $0xb624,0xb620
    4d47:	b6 00 00 
    base.s.size = 0;
    4d4a:	bf 24 b6 00 00       	mov    $0xb624,%edi
    base.s.ptr = freep = prevp = &base;
    4d4f:	c7 05 24 b6 00 00 24 	movl   $0xb624,0xb624
    4d56:	b6 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4d59:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    4d5b:	c7 05 28 b6 00 00 00 	movl   $0x0,0xb628
    4d62:	00 00 00 
    if(p->s.size >= nunits){
    4d65:	e9 42 ff ff ff       	jmp    4cac <malloc+0x2c>
    4d6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    4d70:	8b 08                	mov    (%eax),%ecx
    4d72:	89 0a                	mov    %ecx,(%edx)
    4d74:	eb b9                	jmp    4d2f <malloc+0xaf>
