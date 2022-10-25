
_sh:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  return 0;
}

int
main(void)
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	push   -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	51                   	push   %ecx
    100e:	83 ec 04             	sub    $0x4,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
    1011:	eb 0e                	jmp    1021 <main+0x21>
    1013:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1017:	90                   	nop
    if(fd >= 3){
    1018:	83 f8 02             	cmp    $0x2,%eax
    101b:	0f 8f 91 00 00 00    	jg     10b2 <main+0xb2>
  while((fd = open("console", O_RDWR)) >= 0){
    1021:	83 ec 08             	sub    $0x8,%esp
    1024:	6a 02                	push   $0x2
    1026:	68 59 23 00 00       	push   $0x2359
    102b:	e8 33 0e 00 00       	call   1e63 <open>
    1030:	83 c4 10             	add    $0x10,%esp
    1033:	85 c0                	test   %eax,%eax
    1035:	79 e1                	jns    1018 <main+0x18>
    1037:	eb 2e                	jmp    1067 <main+0x67>
    1039:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
    1040:	80 3d 02 2a 00 00 20 	cmpb   $0x20,0x2a02
    1047:	0f 84 88 00 00 00    	je     10d5 <main+0xd5>
    104d:	8d 76 00             	lea    0x0(%esi),%esi
int
fork1(void)
{
  int pid;

  pid = fork();
    1050:	e8 c6 0d 00 00       	call   1e1b <fork>
  if(pid == -1)
    1055:	83 f8 ff             	cmp    $0xffffffff,%eax
    1058:	0f 84 c1 00 00 00    	je     111f <main+0x11f>
    if(fork1() == 0)
    105e:	85 c0                	test   %eax,%eax
    1060:	74 5e                	je     10c0 <main+0xc0>
    wait();
    1062:	e8 c4 0d 00 00       	call   1e2b <wait>
  printf(2, "$ ");
    1067:	83 ec 08             	sub    $0x8,%esp
    106a:	68 b8 22 00 00       	push   $0x22b8
    106f:	6a 02                	push   $0x2
    1071:	e8 1a 0f 00 00       	call   1f90 <printf>
  memset(buf, 0, nbuf);
    1076:	83 c4 0c             	add    $0xc,%esp
    1079:	6a 64                	push   $0x64
    107b:	6a 00                	push   $0x0
    107d:	68 00 2a 00 00       	push   $0x2a00
    1082:	e8 09 0c 00 00       	call   1c90 <memset>
  gets(buf, nbuf);
    1087:	58                   	pop    %eax
    1088:	5a                   	pop    %edx
    1089:	6a 64                	push   $0x64
    108b:	68 00 2a 00 00       	push   $0x2a00
    1090:	e8 5b 0c 00 00       	call   1cf0 <gets>
  if(buf[0] == 0) // EOF
    1095:	0f b6 05 00 2a 00 00 	movzbl 0x2a00,%eax
    109c:	83 c4 10             	add    $0x10,%esp
    109f:	84 c0                	test   %al,%al
    10a1:	74 77                	je     111a <main+0x11a>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
    10a3:	3c 63                	cmp    $0x63,%al
    10a5:	75 a9                	jne    1050 <main+0x50>
    10a7:	80 3d 01 2a 00 00 64 	cmpb   $0x64,0x2a01
    10ae:	75 a0                	jne    1050 <main+0x50>
    10b0:	eb 8e                	jmp    1040 <main+0x40>
      close(fd);
    10b2:	83 ec 0c             	sub    $0xc,%esp
    10b5:	50                   	push   %eax
    10b6:	e8 90 0d 00 00       	call   1e4b <close>
      break;
    10bb:	83 c4 10             	add    $0x10,%esp
    10be:	eb a7                	jmp    1067 <main+0x67>
      runcmd(parsecmd(buf));
    10c0:	83 ec 0c             	sub    $0xc,%esp
    10c3:	68 00 2a 00 00       	push   $0x2a00
    10c8:	e8 93 0a 00 00       	call   1b60 <parsecmd>
    10cd:	89 04 24             	mov    %eax,(%esp)
    10d0:	e8 db 00 00 00       	call   11b0 <runcmd>
      buf[strlen(buf)-1] = 0;  // chop \n
    10d5:	83 ec 0c             	sub    $0xc,%esp
    10d8:	68 00 2a 00 00       	push   $0x2a00
    10dd:	e8 7e 0b 00 00       	call   1c60 <strlen>
      if(chdir(buf+3) < 0)
    10e2:	c7 04 24 03 2a 00 00 	movl   $0x2a03,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
    10e9:	c6 80 ff 29 00 00 00 	movb   $0x0,0x29ff(%eax)
      if(chdir(buf+3) < 0)
    10f0:	e8 9e 0d 00 00       	call   1e93 <chdir>
    10f5:	83 c4 10             	add    $0x10,%esp
    10f8:	85 c0                	test   %eax,%eax
    10fa:	0f 89 67 ff ff ff    	jns    1067 <main+0x67>
        printf(2, "cannot cd %s\n", buf+3);
    1100:	51                   	push   %ecx
    1101:	68 03 2a 00 00       	push   $0x2a03
    1106:	68 61 23 00 00       	push   $0x2361
    110b:	6a 02                	push   $0x2
    110d:	e8 7e 0e 00 00       	call   1f90 <printf>
    1112:	83 c4 10             	add    $0x10,%esp
    1115:	e9 4d ff ff ff       	jmp    1067 <main+0x67>
  exit();
    111a:	e8 04 0d 00 00       	call   1e23 <exit>
    panic("fork");
    111f:	83 ec 0c             	sub    $0xc,%esp
    1122:	68 bb 22 00 00       	push   $0x22bb
    1127:	e8 44 00 00 00       	call   1170 <panic>
    112c:	66 90                	xchg   %ax,%ax
    112e:	66 90                	xchg   %ax,%ax

00001130 <getcmd>:
{
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	56                   	push   %esi
    1134:	53                   	push   %ebx
    1135:	8b 75 0c             	mov    0xc(%ebp),%esi
    1138:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(2, "$ ");
    113b:	83 ec 08             	sub    $0x8,%esp
    113e:	68 b8 22 00 00       	push   $0x22b8
    1143:	6a 02                	push   $0x2
    1145:	e8 46 0e 00 00       	call   1f90 <printf>
  memset(buf, 0, nbuf);
    114a:	83 c4 0c             	add    $0xc,%esp
    114d:	56                   	push   %esi
    114e:	6a 00                	push   $0x0
    1150:	53                   	push   %ebx
    1151:	e8 3a 0b 00 00       	call   1c90 <memset>
  gets(buf, nbuf);
    1156:	58                   	pop    %eax
    1157:	5a                   	pop    %edx
    1158:	56                   	push   %esi
    1159:	53                   	push   %ebx
    115a:	e8 91 0b 00 00       	call   1cf0 <gets>
  if(buf[0] == 0) // EOF
    115f:	83 c4 10             	add    $0x10,%esp
    1162:	80 3b 01             	cmpb   $0x1,(%ebx)
    1165:	19 c0                	sbb    %eax,%eax
}
    1167:	8d 65 f8             	lea    -0x8(%ebp),%esp
    116a:	5b                   	pop    %ebx
    116b:	5e                   	pop    %esi
    116c:	5d                   	pop    %ebp
    116d:	c3                   	ret    
    116e:	66 90                	xchg   %ax,%ax

00001170 <panic>:
{
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
    1176:	ff 75 08             	push   0x8(%ebp)
    1179:	68 55 23 00 00       	push   $0x2355
    117e:	6a 02                	push   $0x2
    1180:	e8 0b 0e 00 00       	call   1f90 <printf>
  exit();
    1185:	e8 99 0c 00 00       	call   1e23 <exit>
    118a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001190 <fork1>:
{
    1190:	55                   	push   %ebp
    1191:	89 e5                	mov    %esp,%ebp
    1193:	83 ec 08             	sub    $0x8,%esp
  pid = fork();
    1196:	e8 80 0c 00 00       	call   1e1b <fork>
  if(pid == -1)
    119b:	83 f8 ff             	cmp    $0xffffffff,%eax
    119e:	74 02                	je     11a2 <fork1+0x12>
  return pid;
}
    11a0:	c9                   	leave  
    11a1:	c3                   	ret    
    panic("fork");
    11a2:	83 ec 0c             	sub    $0xc,%esp
    11a5:	68 bb 22 00 00       	push   $0x22bb
    11aa:	e8 c1 ff ff ff       	call   1170 <panic>
    11af:	90                   	nop

000011b0 <runcmd>:
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	53                   	push   %ebx
    11b4:	83 ec 14             	sub    $0x14,%esp
    11b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
    11ba:	85 db                	test   %ebx,%ebx
    11bc:	74 42                	je     1200 <runcmd+0x50>
  switch(cmd->type){
    11be:	83 3b 05             	cmpl   $0x5,(%ebx)
    11c1:	0f 87 e3 00 00 00    	ja     12aa <runcmd+0xfa>
    11c7:	8b 03                	mov    (%ebx),%eax
    11c9:	ff 24 85 70 23 00 00 	jmp    *0x2370(,%eax,4)
    if(ecmd->argv[0] == 0)
    11d0:	8b 43 04             	mov    0x4(%ebx),%eax
    11d3:	85 c0                	test   %eax,%eax
    11d5:	74 29                	je     1200 <runcmd+0x50>
    exec(ecmd->argv[0], ecmd->argv);
    11d7:	8d 53 04             	lea    0x4(%ebx),%edx
    11da:	51                   	push   %ecx
    11db:	51                   	push   %ecx
    11dc:	52                   	push   %edx
    11dd:	50                   	push   %eax
    11de:	e8 78 0c 00 00       	call   1e5b <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    11e3:	83 c4 0c             	add    $0xc,%esp
    11e6:	ff 73 04             	push   0x4(%ebx)
    11e9:	68 c7 22 00 00       	push   $0x22c7
    11ee:	6a 02                	push   $0x2
    11f0:	e8 9b 0d 00 00       	call   1f90 <printf>
    break;
    11f5:	83 c4 10             	add    $0x10,%esp
    11f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11ff:	90                   	nop
    exit();
    1200:	e8 1e 0c 00 00       	call   1e23 <exit>
    if(fork1() == 0)
    1205:	e8 86 ff ff ff       	call   1190 <fork1>
    120a:	85 c0                	test   %eax,%eax
    120c:	75 f2                	jne    1200 <runcmd+0x50>
    120e:	e9 8c 00 00 00       	jmp    129f <runcmd+0xef>
    if(pipe(p) < 0)
    1213:	83 ec 0c             	sub    $0xc,%esp
    1216:	8d 45 f0             	lea    -0x10(%ebp),%eax
    1219:	50                   	push   %eax
    121a:	e8 14 0c 00 00       	call   1e33 <pipe>
    121f:	83 c4 10             	add    $0x10,%esp
    1222:	85 c0                	test   %eax,%eax
    1224:	0f 88 a2 00 00 00    	js     12cc <runcmd+0x11c>
    if(fork1() == 0){
    122a:	e8 61 ff ff ff       	call   1190 <fork1>
    122f:	85 c0                	test   %eax,%eax
    1231:	0f 84 a2 00 00 00    	je     12d9 <runcmd+0x129>
    if(fork1() == 0){
    1237:	e8 54 ff ff ff       	call   1190 <fork1>
    123c:	85 c0                	test   %eax,%eax
    123e:	0f 84 c3 00 00 00    	je     1307 <runcmd+0x157>
    close(p[0]);
    1244:	83 ec 0c             	sub    $0xc,%esp
    1247:	ff 75 f0             	push   -0x10(%ebp)
    124a:	e8 fc 0b 00 00       	call   1e4b <close>
    close(p[1]);
    124f:	58                   	pop    %eax
    1250:	ff 75 f4             	push   -0xc(%ebp)
    1253:	e8 f3 0b 00 00       	call   1e4b <close>
    wait();
    1258:	e8 ce 0b 00 00       	call   1e2b <wait>
    wait();
    125d:	e8 c9 0b 00 00       	call   1e2b <wait>
    break;
    1262:	83 c4 10             	add    $0x10,%esp
    1265:	eb 99                	jmp    1200 <runcmd+0x50>
    if(fork1() == 0)
    1267:	e8 24 ff ff ff       	call   1190 <fork1>
    126c:	85 c0                	test   %eax,%eax
    126e:	74 2f                	je     129f <runcmd+0xef>
    wait();
    1270:	e8 b6 0b 00 00       	call   1e2b <wait>
    runcmd(lcmd->right);
    1275:	83 ec 0c             	sub    $0xc,%esp
    1278:	ff 73 08             	push   0x8(%ebx)
    127b:	e8 30 ff ff ff       	call   11b0 <runcmd>
    close(rcmd->fd);
    1280:	83 ec 0c             	sub    $0xc,%esp
    1283:	ff 73 14             	push   0x14(%ebx)
    1286:	e8 c0 0b 00 00       	call   1e4b <close>
    if(open(rcmd->file, rcmd->mode) < 0){
    128b:	58                   	pop    %eax
    128c:	5a                   	pop    %edx
    128d:	ff 73 10             	push   0x10(%ebx)
    1290:	ff 73 08             	push   0x8(%ebx)
    1293:	e8 cb 0b 00 00       	call   1e63 <open>
    1298:	83 c4 10             	add    $0x10,%esp
    129b:	85 c0                	test   %eax,%eax
    129d:	78 18                	js     12b7 <runcmd+0x107>
      runcmd(bcmd->cmd);
    129f:	83 ec 0c             	sub    $0xc,%esp
    12a2:	ff 73 04             	push   0x4(%ebx)
    12a5:	e8 06 ff ff ff       	call   11b0 <runcmd>
    panic("runcmd");
    12aa:	83 ec 0c             	sub    $0xc,%esp
    12ad:	68 c0 22 00 00       	push   $0x22c0
    12b2:	e8 b9 fe ff ff       	call   1170 <panic>
      printf(2, "open %s failed\n", rcmd->file);
    12b7:	51                   	push   %ecx
    12b8:	ff 73 08             	push   0x8(%ebx)
    12bb:	68 d7 22 00 00       	push   $0x22d7
    12c0:	6a 02                	push   $0x2
    12c2:	e8 c9 0c 00 00       	call   1f90 <printf>
      exit();
    12c7:	e8 57 0b 00 00       	call   1e23 <exit>
      panic("pipe");
    12cc:	83 ec 0c             	sub    $0xc,%esp
    12cf:	68 e7 22 00 00       	push   $0x22e7
    12d4:	e8 97 fe ff ff       	call   1170 <panic>
      close(1);
    12d9:	83 ec 0c             	sub    $0xc,%esp
    12dc:	6a 01                	push   $0x1
    12de:	e8 68 0b 00 00       	call   1e4b <close>
      dup(p[1]);
    12e3:	58                   	pop    %eax
    12e4:	ff 75 f4             	push   -0xc(%ebp)
    12e7:	e8 af 0b 00 00       	call   1e9b <dup>
      close(p[0]);
    12ec:	58                   	pop    %eax
    12ed:	ff 75 f0             	push   -0x10(%ebp)
    12f0:	e8 56 0b 00 00       	call   1e4b <close>
      close(p[1]);
    12f5:	58                   	pop    %eax
    12f6:	ff 75 f4             	push   -0xc(%ebp)
    12f9:	e8 4d 0b 00 00       	call   1e4b <close>
      runcmd(pcmd->left);
    12fe:	5a                   	pop    %edx
    12ff:	ff 73 04             	push   0x4(%ebx)
    1302:	e8 a9 fe ff ff       	call   11b0 <runcmd>
      close(0);
    1307:	83 ec 0c             	sub    $0xc,%esp
    130a:	6a 00                	push   $0x0
    130c:	e8 3a 0b 00 00       	call   1e4b <close>
      dup(p[0]);
    1311:	5a                   	pop    %edx
    1312:	ff 75 f0             	push   -0x10(%ebp)
    1315:	e8 81 0b 00 00       	call   1e9b <dup>
      close(p[0]);
    131a:	59                   	pop    %ecx
    131b:	ff 75 f0             	push   -0x10(%ebp)
    131e:	e8 28 0b 00 00       	call   1e4b <close>
      close(p[1]);
    1323:	58                   	pop    %eax
    1324:	ff 75 f4             	push   -0xc(%ebp)
    1327:	e8 1f 0b 00 00       	call   1e4b <close>
      runcmd(pcmd->right);
    132c:	58                   	pop    %eax
    132d:	ff 73 08             	push   0x8(%ebx)
    1330:	e8 7b fe ff ff       	call   11b0 <runcmd>
    1335:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    133c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001340 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
    1340:	55                   	push   %ebp
    1341:	89 e5                	mov    %esp,%ebp
    1343:	53                   	push   %ebx
    1344:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1347:	6a 54                	push   $0x54
    1349:	e8 72 0e 00 00       	call   21c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    134e:	83 c4 0c             	add    $0xc,%esp
    1351:	6a 54                	push   $0x54
  cmd = malloc(sizeof(*cmd));
    1353:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
    1355:	6a 00                	push   $0x0
    1357:	50                   	push   %eax
    1358:	e8 33 09 00 00       	call   1c90 <memset>
  cmd->type = EXEC;
    135d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
    1363:	89 d8                	mov    %ebx,%eax
    1365:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1368:	c9                   	leave  
    1369:	c3                   	ret    
    136a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001370 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
    1370:	55                   	push   %ebp
    1371:	89 e5                	mov    %esp,%ebp
    1373:	53                   	push   %ebx
    1374:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1377:	6a 18                	push   $0x18
    1379:	e8 42 0e 00 00       	call   21c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    137e:	83 c4 0c             	add    $0xc,%esp
    1381:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
    1383:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
    1385:	6a 00                	push   $0x0
    1387:	50                   	push   %eax
    1388:	e8 03 09 00 00       	call   1c90 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
    138d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
    1390:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
    1396:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
    1399:	8b 45 0c             	mov    0xc(%ebp),%eax
    139c:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
    139f:	8b 45 10             	mov    0x10(%ebp),%eax
    13a2:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
    13a5:	8b 45 14             	mov    0x14(%ebp),%eax
    13a8:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
    13ab:	8b 45 18             	mov    0x18(%ebp),%eax
    13ae:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
    13b1:	89 d8                	mov    %ebx,%eax
    13b3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    13b6:	c9                   	leave  
    13b7:	c3                   	ret    
    13b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13bf:	90                   	nop

000013c0 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
    13c0:	55                   	push   %ebp
    13c1:	89 e5                	mov    %esp,%ebp
    13c3:	53                   	push   %ebx
    13c4:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
    13c7:	6a 0c                	push   $0xc
    13c9:	e8 f2 0d 00 00       	call   21c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    13ce:	83 c4 0c             	add    $0xc,%esp
    13d1:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
    13d3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
    13d5:	6a 00                	push   $0x0
    13d7:	50                   	push   %eax
    13d8:	e8 b3 08 00 00       	call   1c90 <memset>
  cmd->type = PIPE;
  cmd->left = left;
    13dd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
    13e0:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
    13e6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
    13e9:	8b 45 0c             	mov    0xc(%ebp),%eax
    13ec:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
    13ef:	89 d8                	mov    %ebx,%eax
    13f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    13f4:	c9                   	leave  
    13f5:	c3                   	ret    
    13f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13fd:	8d 76 00             	lea    0x0(%esi),%esi

00001400 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
    1400:	55                   	push   %ebp
    1401:	89 e5                	mov    %esp,%ebp
    1403:	53                   	push   %ebx
    1404:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1407:	6a 0c                	push   $0xc
    1409:	e8 b2 0d 00 00       	call   21c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    140e:	83 c4 0c             	add    $0xc,%esp
    1411:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
    1413:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
    1415:	6a 00                	push   $0x0
    1417:	50                   	push   %eax
    1418:	e8 73 08 00 00       	call   1c90 <memset>
  cmd->type = LIST;
  cmd->left = left;
    141d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
    1420:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
    1426:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
    1429:	8b 45 0c             	mov    0xc(%ebp),%eax
    142c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
    142f:	89 d8                	mov    %ebx,%eax
    1431:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1434:	c9                   	leave  
    1435:	c3                   	ret    
    1436:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    143d:	8d 76 00             	lea    0x0(%esi),%esi

00001440 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
    1440:	55                   	push   %ebp
    1441:	89 e5                	mov    %esp,%ebp
    1443:	53                   	push   %ebx
    1444:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1447:	6a 08                	push   $0x8
    1449:	e8 72 0d 00 00       	call   21c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    144e:	83 c4 0c             	add    $0xc,%esp
    1451:	6a 08                	push   $0x8
  cmd = malloc(sizeof(*cmd));
    1453:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
    1455:	6a 00                	push   $0x0
    1457:	50                   	push   %eax
    1458:	e8 33 08 00 00       	call   1c90 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
    145d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
    1460:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
    1466:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
    1469:	89 d8                	mov    %ebx,%eax
    146b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    146e:	c9                   	leave  
    146f:	c3                   	ret    

00001470 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
    1470:	55                   	push   %ebp
    1471:	89 e5                	mov    %esp,%ebp
    1473:	57                   	push   %edi
    1474:	56                   	push   %esi
    1475:	53                   	push   %ebx
    1476:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
    1479:	8b 45 08             	mov    0x8(%ebp),%eax
{
    147c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    147f:	8b 75 10             	mov    0x10(%ebp),%esi
  s = *ps;
    1482:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
    1484:	39 df                	cmp    %ebx,%edi
    1486:	72 0f                	jb     1497 <gettoken+0x27>
    1488:	eb 25                	jmp    14af <gettoken+0x3f>
    148a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
    1490:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
    1493:	39 fb                	cmp    %edi,%ebx
    1495:	74 18                	je     14af <gettoken+0x3f>
    1497:	0f be 07             	movsbl (%edi),%eax
    149a:	83 ec 08             	sub    $0x8,%esp
    149d:	50                   	push   %eax
    149e:	68 dc 29 00 00       	push   $0x29dc
    14a3:	e8 08 08 00 00       	call   1cb0 <strchr>
    14a8:	83 c4 10             	add    $0x10,%esp
    14ab:	85 c0                	test   %eax,%eax
    14ad:	75 e1                	jne    1490 <gettoken+0x20>
  if(q)
    14af:	85 f6                	test   %esi,%esi
    14b1:	74 02                	je     14b5 <gettoken+0x45>
    *q = s;
    14b3:	89 3e                	mov    %edi,(%esi)
  ret = *s;
    14b5:	0f b6 07             	movzbl (%edi),%eax
  switch(*s){
    14b8:	3c 3c                	cmp    $0x3c,%al
    14ba:	0f 8f d0 00 00 00    	jg     1590 <gettoken+0x120>
    14c0:	3c 3a                	cmp    $0x3a,%al
    14c2:	0f 8f b4 00 00 00    	jg     157c <gettoken+0x10c>
    14c8:	84 c0                	test   %al,%al
    14ca:	75 44                	jne    1510 <gettoken+0xa0>
    14cc:	31 f6                	xor    %esi,%esi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
    14ce:	8b 55 14             	mov    0x14(%ebp),%edx
    14d1:	85 d2                	test   %edx,%edx
    14d3:	74 05                	je     14da <gettoken+0x6a>
    *eq = s;
    14d5:	8b 45 14             	mov    0x14(%ebp),%eax
    14d8:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
    14da:	39 df                	cmp    %ebx,%edi
    14dc:	72 09                	jb     14e7 <gettoken+0x77>
    14de:	eb 1f                	jmp    14ff <gettoken+0x8f>
    s++;
    14e0:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
    14e3:	39 fb                	cmp    %edi,%ebx
    14e5:	74 18                	je     14ff <gettoken+0x8f>
    14e7:	0f be 07             	movsbl (%edi),%eax
    14ea:	83 ec 08             	sub    $0x8,%esp
    14ed:	50                   	push   %eax
    14ee:	68 dc 29 00 00       	push   $0x29dc
    14f3:	e8 b8 07 00 00       	call   1cb0 <strchr>
    14f8:	83 c4 10             	add    $0x10,%esp
    14fb:	85 c0                	test   %eax,%eax
    14fd:	75 e1                	jne    14e0 <gettoken+0x70>
  *ps = s;
    14ff:	8b 45 08             	mov    0x8(%ebp),%eax
    1502:	89 38                	mov    %edi,(%eax)
  return ret;
}
    1504:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1507:	89 f0                	mov    %esi,%eax
    1509:	5b                   	pop    %ebx
    150a:	5e                   	pop    %esi
    150b:	5f                   	pop    %edi
    150c:	5d                   	pop    %ebp
    150d:	c3                   	ret    
    150e:	66 90                	xchg   %ax,%ax
  switch(*s){
    1510:	79 5e                	jns    1570 <gettoken+0x100>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    1512:	39 fb                	cmp    %edi,%ebx
    1514:	77 34                	ja     154a <gettoken+0xda>
  if(eq)
    1516:	8b 45 14             	mov    0x14(%ebp),%eax
    1519:	be 61 00 00 00       	mov    $0x61,%esi
    151e:	85 c0                	test   %eax,%eax
    1520:	75 b3                	jne    14d5 <gettoken+0x65>
    1522:	eb db                	jmp    14ff <gettoken+0x8f>
    1524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    1528:	0f be 07             	movsbl (%edi),%eax
    152b:	83 ec 08             	sub    $0x8,%esp
    152e:	50                   	push   %eax
    152f:	68 d4 29 00 00       	push   $0x29d4
    1534:	e8 77 07 00 00       	call   1cb0 <strchr>
    1539:	83 c4 10             	add    $0x10,%esp
    153c:	85 c0                	test   %eax,%eax
    153e:	75 22                	jne    1562 <gettoken+0xf2>
      s++;
    1540:	83 c7 01             	add    $0x1,%edi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    1543:	39 fb                	cmp    %edi,%ebx
    1545:	74 cf                	je     1516 <gettoken+0xa6>
    1547:	0f b6 07             	movzbl (%edi),%eax
    154a:	83 ec 08             	sub    $0x8,%esp
    154d:	0f be f0             	movsbl %al,%esi
    1550:	56                   	push   %esi
    1551:	68 dc 29 00 00       	push   $0x29dc
    1556:	e8 55 07 00 00       	call   1cb0 <strchr>
    155b:	83 c4 10             	add    $0x10,%esp
    155e:	85 c0                	test   %eax,%eax
    1560:	74 c6                	je     1528 <gettoken+0xb8>
    ret = 'a';
    1562:	be 61 00 00 00       	mov    $0x61,%esi
    1567:	e9 62 ff ff ff       	jmp    14ce <gettoken+0x5e>
    156c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
    1570:	3c 26                	cmp    $0x26,%al
    1572:	74 08                	je     157c <gettoken+0x10c>
    1574:	8d 48 d8             	lea    -0x28(%eax),%ecx
    1577:	80 f9 01             	cmp    $0x1,%cl
    157a:	77 96                	ja     1512 <gettoken+0xa2>
  ret = *s;
    157c:	0f be f0             	movsbl %al,%esi
    s++;
    157f:	83 c7 01             	add    $0x1,%edi
    break;
    1582:	e9 47 ff ff ff       	jmp    14ce <gettoken+0x5e>
    1587:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    158e:	66 90                	xchg   %ax,%ax
  switch(*s){
    1590:	3c 3e                	cmp    $0x3e,%al
    1592:	75 1c                	jne    15b0 <gettoken+0x140>
    if(*s == '>'){
    1594:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
    s++;
    1598:	8d 47 01             	lea    0x1(%edi),%eax
    if(*s == '>'){
    159b:	74 1c                	je     15b9 <gettoken+0x149>
    s++;
    159d:	89 c7                	mov    %eax,%edi
    159f:	be 3e 00 00 00       	mov    $0x3e,%esi
    15a4:	e9 25 ff ff ff       	jmp    14ce <gettoken+0x5e>
    15a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
    15b0:	3c 7c                	cmp    $0x7c,%al
    15b2:	74 c8                	je     157c <gettoken+0x10c>
    15b4:	e9 59 ff ff ff       	jmp    1512 <gettoken+0xa2>
      s++;
    15b9:	83 c7 02             	add    $0x2,%edi
      ret = '+';
    15bc:	be 2b 00 00 00       	mov    $0x2b,%esi
    15c1:	e9 08 ff ff ff       	jmp    14ce <gettoken+0x5e>
    15c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15cd:	8d 76 00             	lea    0x0(%esi),%esi

000015d0 <peek>:

int
peek(char **ps, char *es, char *toks)
{
    15d0:	55                   	push   %ebp
    15d1:	89 e5                	mov    %esp,%ebp
    15d3:	57                   	push   %edi
    15d4:	56                   	push   %esi
    15d5:	53                   	push   %ebx
    15d6:	83 ec 0c             	sub    $0xc,%esp
    15d9:	8b 7d 08             	mov    0x8(%ebp),%edi
    15dc:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
    15df:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
    15e1:	39 f3                	cmp    %esi,%ebx
    15e3:	72 12                	jb     15f7 <peek+0x27>
    15e5:	eb 28                	jmp    160f <peek+0x3f>
    15e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15ee:	66 90                	xchg   %ax,%ax
    s++;
    15f0:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
    15f3:	39 de                	cmp    %ebx,%esi
    15f5:	74 18                	je     160f <peek+0x3f>
    15f7:	0f be 03             	movsbl (%ebx),%eax
    15fa:	83 ec 08             	sub    $0x8,%esp
    15fd:	50                   	push   %eax
    15fe:	68 dc 29 00 00       	push   $0x29dc
    1603:	e8 a8 06 00 00       	call   1cb0 <strchr>
    1608:	83 c4 10             	add    $0x10,%esp
    160b:	85 c0                	test   %eax,%eax
    160d:	75 e1                	jne    15f0 <peek+0x20>
  *ps = s;
    160f:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
    1611:	0f be 03             	movsbl (%ebx),%eax
    1614:	31 d2                	xor    %edx,%edx
    1616:	84 c0                	test   %al,%al
    1618:	75 0e                	jne    1628 <peek+0x58>
}
    161a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    161d:	89 d0                	mov    %edx,%eax
    161f:	5b                   	pop    %ebx
    1620:	5e                   	pop    %esi
    1621:	5f                   	pop    %edi
    1622:	5d                   	pop    %ebp
    1623:	c3                   	ret    
    1624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return *s && strchr(toks, *s);
    1628:	83 ec 08             	sub    $0x8,%esp
    162b:	50                   	push   %eax
    162c:	ff 75 10             	push   0x10(%ebp)
    162f:	e8 7c 06 00 00       	call   1cb0 <strchr>
    1634:	83 c4 10             	add    $0x10,%esp
    1637:	31 d2                	xor    %edx,%edx
    1639:	85 c0                	test   %eax,%eax
    163b:	0f 95 c2             	setne  %dl
}
    163e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1641:	5b                   	pop    %ebx
    1642:	89 d0                	mov    %edx,%eax
    1644:	5e                   	pop    %esi
    1645:	5f                   	pop    %edi
    1646:	5d                   	pop    %ebp
    1647:	c3                   	ret    
    1648:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    164f:	90                   	nop

00001650 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
    1650:	55                   	push   %ebp
    1651:	89 e5                	mov    %esp,%ebp
    1653:	57                   	push   %edi
    1654:	56                   	push   %esi
    1655:	53                   	push   %ebx
    1656:	83 ec 2c             	sub    $0x2c,%esp
    1659:	8b 75 0c             	mov    0xc(%ebp),%esi
    165c:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    165f:	90                   	nop
    1660:	83 ec 04             	sub    $0x4,%esp
    1663:	68 09 23 00 00       	push   $0x2309
    1668:	53                   	push   %ebx
    1669:	56                   	push   %esi
    166a:	e8 61 ff ff ff       	call   15d0 <peek>
    166f:	83 c4 10             	add    $0x10,%esp
    1672:	85 c0                	test   %eax,%eax
    1674:	0f 84 f6 00 00 00    	je     1770 <parseredirs+0x120>
    tok = gettoken(ps, es, 0, 0);
    167a:	6a 00                	push   $0x0
    167c:	6a 00                	push   $0x0
    167e:	53                   	push   %ebx
    167f:	56                   	push   %esi
    1680:	e8 eb fd ff ff       	call   1470 <gettoken>
    1685:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
    1687:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    168a:	50                   	push   %eax
    168b:	8d 45 e0             	lea    -0x20(%ebp),%eax
    168e:	50                   	push   %eax
    168f:	53                   	push   %ebx
    1690:	56                   	push   %esi
    1691:	e8 da fd ff ff       	call   1470 <gettoken>
    1696:	83 c4 20             	add    $0x20,%esp
    1699:	83 f8 61             	cmp    $0x61,%eax
    169c:	0f 85 d9 00 00 00    	jne    177b <parseredirs+0x12b>
      panic("missing file for redirection");
    switch(tok){
    16a2:	83 ff 3c             	cmp    $0x3c,%edi
    16a5:	74 69                	je     1710 <parseredirs+0xc0>
    16a7:	83 ff 3e             	cmp    $0x3e,%edi
    16aa:	74 05                	je     16b1 <parseredirs+0x61>
    16ac:	83 ff 2b             	cmp    $0x2b,%edi
    16af:	75 af                	jne    1660 <parseredirs+0x10>
  cmd = malloc(sizeof(*cmd));
    16b1:	83 ec 0c             	sub    $0xc,%esp
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    16b4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    16b7:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
    16ba:	6a 18                	push   $0x18
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    16bc:	89 55 d0             	mov    %edx,-0x30(%ebp)
    16bf:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
    16c2:	e8 f9 0a 00 00       	call   21c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    16c7:	83 c4 0c             	add    $0xc,%esp
    16ca:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
    16cc:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
    16ce:	6a 00                	push   $0x0
    16d0:	50                   	push   %eax
    16d1:	e8 ba 05 00 00       	call   1c90 <memset>
  cmd->type = REDIR;
    16d6:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  cmd->cmd = subcmd;
    16dc:	8b 45 08             	mov    0x8(%ebp),%eax
      break;
    16df:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
    16e2:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
    16e5:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    16e8:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
    16eb:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->mode = mode;
    16ee:	c7 47 10 01 02 00 00 	movl   $0x201,0x10(%edi)
  cmd->efile = efile;
    16f5:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->fd = fd;
    16f8:	c7 47 14 01 00 00 00 	movl   $0x1,0x14(%edi)
      break;
    16ff:	89 7d 08             	mov    %edi,0x8(%ebp)
    1702:	e9 59 ff ff ff       	jmp    1660 <parseredirs+0x10>
    1707:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    170e:	66 90                	xchg   %ax,%ax
  cmd = malloc(sizeof(*cmd));
    1710:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
    1713:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1716:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
    1719:	6a 18                	push   $0x18
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
    171b:	89 55 d0             	mov    %edx,-0x30(%ebp)
    171e:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
    1721:	e8 9a 0a 00 00       	call   21c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    1726:	83 c4 0c             	add    $0xc,%esp
    1729:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
    172b:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
    172d:	6a 00                	push   $0x0
    172f:	50                   	push   %eax
    1730:	e8 5b 05 00 00       	call   1c90 <memset>
  cmd->cmd = subcmd;
    1735:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->file = file;
    1738:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      break;
    173b:	89 7d 08             	mov    %edi,0x8(%ebp)
  cmd->efile = efile;
    173e:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->type = REDIR;
    1741:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
      break;
    1747:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
    174a:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
    174d:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
    1750:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->mode = mode;
    1753:	c7 47 10 00 00 00 00 	movl   $0x0,0x10(%edi)
  cmd->fd = fd;
    175a:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
      break;
    1761:	e9 fa fe ff ff       	jmp    1660 <parseredirs+0x10>
    1766:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    176d:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
  return cmd;
}
    1770:	8b 45 08             	mov    0x8(%ebp),%eax
    1773:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1776:	5b                   	pop    %ebx
    1777:	5e                   	pop    %esi
    1778:	5f                   	pop    %edi
    1779:	5d                   	pop    %ebp
    177a:	c3                   	ret    
      panic("missing file for redirection");
    177b:	83 ec 0c             	sub    $0xc,%esp
    177e:	68 ec 22 00 00       	push   $0x22ec
    1783:	e8 e8 f9 ff ff       	call   1170 <panic>
    1788:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    178f:	90                   	nop

00001790 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
    1790:	55                   	push   %ebp
    1791:	89 e5                	mov    %esp,%ebp
    1793:	57                   	push   %edi
    1794:	56                   	push   %esi
    1795:	53                   	push   %ebx
    1796:	83 ec 30             	sub    $0x30,%esp
    1799:	8b 75 08             	mov    0x8(%ebp),%esi
    179c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
    179f:	68 0c 23 00 00       	push   $0x230c
    17a4:	57                   	push   %edi
    17a5:	56                   	push   %esi
    17a6:	e8 25 fe ff ff       	call   15d0 <peek>
    17ab:	83 c4 10             	add    $0x10,%esp
    17ae:	85 c0                	test   %eax,%eax
    17b0:	0f 85 aa 00 00 00    	jne    1860 <parseexec+0xd0>
  cmd = malloc(sizeof(*cmd));
    17b6:	83 ec 0c             	sub    $0xc,%esp
    17b9:	89 c3                	mov    %eax,%ebx
    17bb:	6a 54                	push   $0x54
    17bd:	e8 fe 09 00 00       	call   21c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    17c2:	83 c4 0c             	add    $0xc,%esp
    17c5:	6a 54                	push   $0x54
    17c7:	6a 00                	push   $0x0
    17c9:	50                   	push   %eax
    17ca:	89 45 d0             	mov    %eax,-0x30(%ebp)
    17cd:	e8 be 04 00 00       	call   1c90 <memset>
  cmd->type = EXEC;
    17d2:	8b 45 d0             	mov    -0x30(%ebp),%eax

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
    17d5:	83 c4 0c             	add    $0xc,%esp
  cmd->type = EXEC;
    17d8:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  ret = parseredirs(ret, ps, es);
    17de:	57                   	push   %edi
    17df:	56                   	push   %esi
    17e0:	50                   	push   %eax
    17e1:	e8 6a fe ff ff       	call   1650 <parseredirs>
  while(!peek(ps, es, "|)&;")){
    17e6:	83 c4 10             	add    $0x10,%esp
  ret = parseredirs(ret, ps, es);
    17e9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
    17ec:	eb 15                	jmp    1803 <parseexec+0x73>
    17ee:	66 90                	xchg   %ax,%ax
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
    17f0:	83 ec 04             	sub    $0x4,%esp
    17f3:	57                   	push   %edi
    17f4:	56                   	push   %esi
    17f5:	ff 75 d4             	push   -0x2c(%ebp)
    17f8:	e8 53 fe ff ff       	call   1650 <parseredirs>
    17fd:	83 c4 10             	add    $0x10,%esp
    1800:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
    1803:	83 ec 04             	sub    $0x4,%esp
    1806:	68 23 23 00 00       	push   $0x2323
    180b:	57                   	push   %edi
    180c:	56                   	push   %esi
    180d:	e8 be fd ff ff       	call   15d0 <peek>
    1812:	83 c4 10             	add    $0x10,%esp
    1815:	85 c0                	test   %eax,%eax
    1817:	75 5f                	jne    1878 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
    1819:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    181c:	50                   	push   %eax
    181d:	8d 45 e0             	lea    -0x20(%ebp),%eax
    1820:	50                   	push   %eax
    1821:	57                   	push   %edi
    1822:	56                   	push   %esi
    1823:	e8 48 fc ff ff       	call   1470 <gettoken>
    1828:	83 c4 10             	add    $0x10,%esp
    182b:	85 c0                	test   %eax,%eax
    182d:	74 49                	je     1878 <parseexec+0xe8>
    if(tok != 'a')
    182f:	83 f8 61             	cmp    $0x61,%eax
    1832:	75 62                	jne    1896 <parseexec+0x106>
    cmd->argv[argc] = q;
    1834:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1837:	8b 55 d0             	mov    -0x30(%ebp),%edx
    183a:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
    cmd->eargv[argc] = eq;
    183e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1841:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
    argc++;
    1845:	83 c3 01             	add    $0x1,%ebx
    if(argc >= MAXARGS)
    1848:	83 fb 0a             	cmp    $0xa,%ebx
    184b:	75 a3                	jne    17f0 <parseexec+0x60>
      panic("too many args");
    184d:	83 ec 0c             	sub    $0xc,%esp
    1850:	68 15 23 00 00       	push   $0x2315
    1855:	e8 16 f9 ff ff       	call   1170 <panic>
    185a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return parseblock(ps, es);
    1860:	89 7d 0c             	mov    %edi,0xc(%ebp)
    1863:	89 75 08             	mov    %esi,0x8(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
    1866:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1869:	5b                   	pop    %ebx
    186a:	5e                   	pop    %esi
    186b:	5f                   	pop    %edi
    186c:	5d                   	pop    %ebp
    return parseblock(ps, es);
    186d:	e9 ae 01 00 00       	jmp    1a20 <parseblock>
    1872:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  cmd->argv[argc] = 0;
    1878:	8b 45 d0             	mov    -0x30(%ebp),%eax
    187b:	c7 44 98 04 00 00 00 	movl   $0x0,0x4(%eax,%ebx,4)
    1882:	00 
  cmd->eargv[argc] = 0;
    1883:	c7 44 98 2c 00 00 00 	movl   $0x0,0x2c(%eax,%ebx,4)
    188a:	00 
}
    188b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    188e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1891:	5b                   	pop    %ebx
    1892:	5e                   	pop    %esi
    1893:	5f                   	pop    %edi
    1894:	5d                   	pop    %ebp
    1895:	c3                   	ret    
      panic("syntax");
    1896:	83 ec 0c             	sub    $0xc,%esp
    1899:	68 0e 23 00 00       	push   $0x230e
    189e:	e8 cd f8 ff ff       	call   1170 <panic>
    18a3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    18aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000018b0 <parsepipe>:
{
    18b0:	55                   	push   %ebp
    18b1:	89 e5                	mov    %esp,%ebp
    18b3:	57                   	push   %edi
    18b4:	56                   	push   %esi
    18b5:	53                   	push   %ebx
    18b6:	83 ec 14             	sub    $0x14,%esp
    18b9:	8b 75 08             	mov    0x8(%ebp),%esi
    18bc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
    18bf:	57                   	push   %edi
    18c0:	56                   	push   %esi
    18c1:	e8 ca fe ff ff       	call   1790 <parseexec>
  if(peek(ps, es, "|")){
    18c6:	83 c4 0c             	add    $0xc,%esp
    18c9:	68 28 23 00 00       	push   $0x2328
  cmd = parseexec(ps, es);
    18ce:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
    18d0:	57                   	push   %edi
    18d1:	56                   	push   %esi
    18d2:	e8 f9 fc ff ff       	call   15d0 <peek>
    18d7:	83 c4 10             	add    $0x10,%esp
    18da:	85 c0                	test   %eax,%eax
    18dc:	75 12                	jne    18f0 <parsepipe+0x40>
}
    18de:	8d 65 f4             	lea    -0xc(%ebp),%esp
    18e1:	89 d8                	mov    %ebx,%eax
    18e3:	5b                   	pop    %ebx
    18e4:	5e                   	pop    %esi
    18e5:	5f                   	pop    %edi
    18e6:	5d                   	pop    %ebp
    18e7:	c3                   	ret    
    18e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    18ef:	90                   	nop
    gettoken(ps, es, 0, 0);
    18f0:	6a 00                	push   $0x0
    18f2:	6a 00                	push   $0x0
    18f4:	57                   	push   %edi
    18f5:	56                   	push   %esi
    18f6:	e8 75 fb ff ff       	call   1470 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
    18fb:	58                   	pop    %eax
    18fc:	5a                   	pop    %edx
    18fd:	57                   	push   %edi
    18fe:	56                   	push   %esi
    18ff:	e8 ac ff ff ff       	call   18b0 <parsepipe>
  cmd = malloc(sizeof(*cmd));
    1904:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = pipecmd(cmd, parsepipe(ps, es));
    190b:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
    190d:	e8 ae 08 00 00       	call   21c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    1912:	83 c4 0c             	add    $0xc,%esp
    1915:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
    1917:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
    1919:	6a 00                	push   $0x0
    191b:	50                   	push   %eax
    191c:	e8 6f 03 00 00       	call   1c90 <memset>
  cmd->left = left;
    1921:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
    1924:	83 c4 10             	add    $0x10,%esp
    1927:	89 f3                	mov    %esi,%ebx
  cmd->type = PIPE;
    1929:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
}
    192f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
    1931:	89 7e 08             	mov    %edi,0x8(%esi)
}
    1934:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1937:	5b                   	pop    %ebx
    1938:	5e                   	pop    %esi
    1939:	5f                   	pop    %edi
    193a:	5d                   	pop    %ebp
    193b:	c3                   	ret    
    193c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001940 <parseline>:
{
    1940:	55                   	push   %ebp
    1941:	89 e5                	mov    %esp,%ebp
    1943:	57                   	push   %edi
    1944:	56                   	push   %esi
    1945:	53                   	push   %ebx
    1946:	83 ec 24             	sub    $0x24,%esp
    1949:	8b 75 08             	mov    0x8(%ebp),%esi
    194c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
    194f:	57                   	push   %edi
    1950:	56                   	push   %esi
    1951:	e8 5a ff ff ff       	call   18b0 <parsepipe>
  while(peek(ps, es, "&")){
    1956:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
    1959:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
    195b:	eb 3b                	jmp    1998 <parseline+0x58>
    195d:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
    1960:	6a 00                	push   $0x0
    1962:	6a 00                	push   $0x0
    1964:	57                   	push   %edi
    1965:	56                   	push   %esi
    1966:	e8 05 fb ff ff       	call   1470 <gettoken>
  cmd = malloc(sizeof(*cmd));
    196b:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1972:	e8 49 08 00 00       	call   21c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    1977:	83 c4 0c             	add    $0xc,%esp
    197a:	6a 08                	push   $0x8
    197c:	6a 00                	push   $0x0
    197e:	50                   	push   %eax
    197f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1982:	e8 09 03 00 00       	call   1c90 <memset>
  cmd->type = BACK;
    1987:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  cmd->cmd = subcmd;
    198a:	83 c4 10             	add    $0x10,%esp
  cmd->type = BACK;
    198d:	c7 02 05 00 00 00    	movl   $0x5,(%edx)
  cmd->cmd = subcmd;
    1993:	89 5a 04             	mov    %ebx,0x4(%edx)
    1996:	89 d3                	mov    %edx,%ebx
  while(peek(ps, es, "&")){
    1998:	83 ec 04             	sub    $0x4,%esp
    199b:	68 2a 23 00 00       	push   $0x232a
    19a0:	57                   	push   %edi
    19a1:	56                   	push   %esi
    19a2:	e8 29 fc ff ff       	call   15d0 <peek>
    19a7:	83 c4 10             	add    $0x10,%esp
    19aa:	85 c0                	test   %eax,%eax
    19ac:	75 b2                	jne    1960 <parseline+0x20>
  if(peek(ps, es, ";")){
    19ae:	83 ec 04             	sub    $0x4,%esp
    19b1:	68 26 23 00 00       	push   $0x2326
    19b6:	57                   	push   %edi
    19b7:	56                   	push   %esi
    19b8:	e8 13 fc ff ff       	call   15d0 <peek>
    19bd:	83 c4 10             	add    $0x10,%esp
    19c0:	85 c0                	test   %eax,%eax
    19c2:	75 0c                	jne    19d0 <parseline+0x90>
}
    19c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    19c7:	89 d8                	mov    %ebx,%eax
    19c9:	5b                   	pop    %ebx
    19ca:	5e                   	pop    %esi
    19cb:	5f                   	pop    %edi
    19cc:	5d                   	pop    %ebp
    19cd:	c3                   	ret    
    19ce:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
    19d0:	6a 00                	push   $0x0
    19d2:	6a 00                	push   $0x0
    19d4:	57                   	push   %edi
    19d5:	56                   	push   %esi
    19d6:	e8 95 fa ff ff       	call   1470 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
    19db:	58                   	pop    %eax
    19dc:	5a                   	pop    %edx
    19dd:	57                   	push   %edi
    19de:	56                   	push   %esi
    19df:	e8 5c ff ff ff       	call   1940 <parseline>
  cmd = malloc(sizeof(*cmd));
    19e4:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = listcmd(cmd, parseline(ps, es));
    19eb:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
    19ed:	e8 ce 07 00 00       	call   21c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    19f2:	83 c4 0c             	add    $0xc,%esp
    19f5:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
    19f7:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
    19f9:	6a 00                	push   $0x0
    19fb:	50                   	push   %eax
    19fc:	e8 8f 02 00 00       	call   1c90 <memset>
  cmd->left = left;
    1a01:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
    1a04:	83 c4 10             	add    $0x10,%esp
    1a07:	89 f3                	mov    %esi,%ebx
  cmd->type = LIST;
    1a09:	c7 06 04 00 00 00    	movl   $0x4,(%esi)
}
    1a0f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
    1a11:	89 7e 08             	mov    %edi,0x8(%esi)
}
    1a14:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1a17:	5b                   	pop    %ebx
    1a18:	5e                   	pop    %esi
    1a19:	5f                   	pop    %edi
    1a1a:	5d                   	pop    %ebp
    1a1b:	c3                   	ret    
    1a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001a20 <parseblock>:
{
    1a20:	55                   	push   %ebp
    1a21:	89 e5                	mov    %esp,%ebp
    1a23:	57                   	push   %edi
    1a24:	56                   	push   %esi
    1a25:	53                   	push   %ebx
    1a26:	83 ec 10             	sub    $0x10,%esp
    1a29:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1a2c:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
    1a2f:	68 0c 23 00 00       	push   $0x230c
    1a34:	56                   	push   %esi
    1a35:	53                   	push   %ebx
    1a36:	e8 95 fb ff ff       	call   15d0 <peek>
    1a3b:	83 c4 10             	add    $0x10,%esp
    1a3e:	85 c0                	test   %eax,%eax
    1a40:	74 4a                	je     1a8c <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
    1a42:	6a 00                	push   $0x0
    1a44:	6a 00                	push   $0x0
    1a46:	56                   	push   %esi
    1a47:	53                   	push   %ebx
    1a48:	e8 23 fa ff ff       	call   1470 <gettoken>
  cmd = parseline(ps, es);
    1a4d:	58                   	pop    %eax
    1a4e:	5a                   	pop    %edx
    1a4f:	56                   	push   %esi
    1a50:	53                   	push   %ebx
    1a51:	e8 ea fe ff ff       	call   1940 <parseline>
  if(!peek(ps, es, ")"))
    1a56:	83 c4 0c             	add    $0xc,%esp
    1a59:	68 48 23 00 00       	push   $0x2348
  cmd = parseline(ps, es);
    1a5e:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
    1a60:	56                   	push   %esi
    1a61:	53                   	push   %ebx
    1a62:	e8 69 fb ff ff       	call   15d0 <peek>
    1a67:	83 c4 10             	add    $0x10,%esp
    1a6a:	85 c0                	test   %eax,%eax
    1a6c:	74 2b                	je     1a99 <parseblock+0x79>
  gettoken(ps, es, 0, 0);
    1a6e:	6a 00                	push   $0x0
    1a70:	6a 00                	push   $0x0
    1a72:	56                   	push   %esi
    1a73:	53                   	push   %ebx
    1a74:	e8 f7 f9 ff ff       	call   1470 <gettoken>
  cmd = parseredirs(cmd, ps, es);
    1a79:	83 c4 0c             	add    $0xc,%esp
    1a7c:	56                   	push   %esi
    1a7d:	53                   	push   %ebx
    1a7e:	57                   	push   %edi
    1a7f:	e8 cc fb ff ff       	call   1650 <parseredirs>
}
    1a84:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1a87:	5b                   	pop    %ebx
    1a88:	5e                   	pop    %esi
    1a89:	5f                   	pop    %edi
    1a8a:	5d                   	pop    %ebp
    1a8b:	c3                   	ret    
    panic("parseblock");
    1a8c:	83 ec 0c             	sub    $0xc,%esp
    1a8f:	68 2c 23 00 00       	push   $0x232c
    1a94:	e8 d7 f6 ff ff       	call   1170 <panic>
    panic("syntax - missing )");
    1a99:	83 ec 0c             	sub    $0xc,%esp
    1a9c:	68 37 23 00 00       	push   $0x2337
    1aa1:	e8 ca f6 ff ff       	call   1170 <panic>
    1aa6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1aad:	8d 76 00             	lea    0x0(%esi),%esi

00001ab0 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
    1ab0:	55                   	push   %ebp
    1ab1:	89 e5                	mov    %esp,%ebp
    1ab3:	53                   	push   %ebx
    1ab4:	83 ec 04             	sub    $0x4,%esp
    1ab7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    1aba:	85 db                	test   %ebx,%ebx
    1abc:	0f 84 8e 00 00 00    	je     1b50 <nulterminate+0xa0>
    return 0;

  switch(cmd->type){
    1ac2:	83 3b 05             	cmpl   $0x5,(%ebx)
    1ac5:	77 61                	ja     1b28 <nulterminate+0x78>
    1ac7:	8b 03                	mov    (%ebx),%eax
    1ac9:	ff 24 85 88 23 00 00 	jmp    *0x2388(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
    1ad0:	83 ec 0c             	sub    $0xc,%esp
    1ad3:	ff 73 04             	push   0x4(%ebx)
    1ad6:	e8 d5 ff ff ff       	call   1ab0 <nulterminate>
    nulterminate(lcmd->right);
    1adb:	58                   	pop    %eax
    1adc:	ff 73 08             	push   0x8(%ebx)
    1adf:	e8 cc ff ff ff       	call   1ab0 <nulterminate>
    break;
    1ae4:	83 c4 10             	add    $0x10,%esp
    1ae7:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
    1ae9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1aec:	c9                   	leave  
    1aed:	c3                   	ret    
    1aee:	66 90                	xchg   %ax,%ax
    nulterminate(bcmd->cmd);
    1af0:	83 ec 0c             	sub    $0xc,%esp
    1af3:	ff 73 04             	push   0x4(%ebx)
    1af6:	e8 b5 ff ff ff       	call   1ab0 <nulterminate>
    break;
    1afb:	89 d8                	mov    %ebx,%eax
    1afd:	83 c4 10             	add    $0x10,%esp
}
    1b00:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1b03:	c9                   	leave  
    1b04:	c3                   	ret    
    1b05:	8d 76 00             	lea    0x0(%esi),%esi
    for(i=0; ecmd->argv[i]; i++)
    1b08:	8b 4b 04             	mov    0x4(%ebx),%ecx
    1b0b:	8d 43 08             	lea    0x8(%ebx),%eax
    1b0e:	85 c9                	test   %ecx,%ecx
    1b10:	74 16                	je     1b28 <nulterminate+0x78>
    1b12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
    1b18:	8b 50 24             	mov    0x24(%eax),%edx
    for(i=0; ecmd->argv[i]; i++)
    1b1b:	83 c0 04             	add    $0x4,%eax
      *ecmd->eargv[i] = 0;
    1b1e:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
    1b21:	8b 50 fc             	mov    -0x4(%eax),%edx
    1b24:	85 d2                	test   %edx,%edx
    1b26:	75 f0                	jne    1b18 <nulterminate+0x68>
  switch(cmd->type){
    1b28:	89 d8                	mov    %ebx,%eax
}
    1b2a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1b2d:	c9                   	leave  
    1b2e:	c3                   	ret    
    1b2f:	90                   	nop
    nulterminate(rcmd->cmd);
    1b30:	83 ec 0c             	sub    $0xc,%esp
    1b33:	ff 73 04             	push   0x4(%ebx)
    1b36:	e8 75 ff ff ff       	call   1ab0 <nulterminate>
    *rcmd->efile = 0;
    1b3b:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
    1b3e:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
    1b41:	c6 00 00             	movb   $0x0,(%eax)
    break;
    1b44:	89 d8                	mov    %ebx,%eax
}
    1b46:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1b49:	c9                   	leave  
    1b4a:	c3                   	ret    
    1b4b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1b4f:	90                   	nop
    return 0;
    1b50:	31 c0                	xor    %eax,%eax
    1b52:	eb 95                	jmp    1ae9 <nulterminate+0x39>
    1b54:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1b5b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1b5f:	90                   	nop

00001b60 <parsecmd>:
{
    1b60:	55                   	push   %ebp
    1b61:	89 e5                	mov    %esp,%ebp
    1b63:	57                   	push   %edi
    1b64:	56                   	push   %esi
  cmd = parseline(&s, es);
    1b65:	8d 7d 08             	lea    0x8(%ebp),%edi
{
    1b68:	53                   	push   %ebx
    1b69:	83 ec 18             	sub    $0x18,%esp
  es = s + strlen(s);
    1b6c:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1b6f:	53                   	push   %ebx
    1b70:	e8 eb 00 00 00       	call   1c60 <strlen>
  cmd = parseline(&s, es);
    1b75:	59                   	pop    %ecx
    1b76:	5e                   	pop    %esi
  es = s + strlen(s);
    1b77:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
    1b79:	53                   	push   %ebx
    1b7a:	57                   	push   %edi
    1b7b:	e8 c0 fd ff ff       	call   1940 <parseline>
  peek(&s, es, "");
    1b80:	83 c4 0c             	add    $0xc,%esp
    1b83:	68 d6 22 00 00       	push   $0x22d6
  cmd = parseline(&s, es);
    1b88:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
    1b8a:	53                   	push   %ebx
    1b8b:	57                   	push   %edi
    1b8c:	e8 3f fa ff ff       	call   15d0 <peek>
  if(s != es){
    1b91:	8b 45 08             	mov    0x8(%ebp),%eax
    1b94:	83 c4 10             	add    $0x10,%esp
    1b97:	39 d8                	cmp    %ebx,%eax
    1b99:	75 13                	jne    1bae <parsecmd+0x4e>
  nulterminate(cmd);
    1b9b:	83 ec 0c             	sub    $0xc,%esp
    1b9e:	56                   	push   %esi
    1b9f:	e8 0c ff ff ff       	call   1ab0 <nulterminate>
}
    1ba4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1ba7:	89 f0                	mov    %esi,%eax
    1ba9:	5b                   	pop    %ebx
    1baa:	5e                   	pop    %esi
    1bab:	5f                   	pop    %edi
    1bac:	5d                   	pop    %ebp
    1bad:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
    1bae:	52                   	push   %edx
    1baf:	50                   	push   %eax
    1bb0:	68 4a 23 00 00       	push   $0x234a
    1bb5:	6a 02                	push   $0x2
    1bb7:	e8 d4 03 00 00       	call   1f90 <printf>
    panic("syntax");
    1bbc:	c7 04 24 0e 23 00 00 	movl   $0x230e,(%esp)
    1bc3:	e8 a8 f5 ff ff       	call   1170 <panic>
    1bc8:	66 90                	xchg   %ax,%ax
    1bca:	66 90                	xchg   %ax,%ax
    1bcc:	66 90                	xchg   %ax,%ax
    1bce:	66 90                	xchg   %ax,%ax

00001bd0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1bd0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1bd1:	31 c0                	xor    %eax,%eax
{
    1bd3:	89 e5                	mov    %esp,%ebp
    1bd5:	53                   	push   %ebx
    1bd6:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1bd9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    1bdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1be0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1be4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1be7:	83 c0 01             	add    $0x1,%eax
    1bea:	84 d2                	test   %dl,%dl
    1bec:	75 f2                	jne    1be0 <strcpy+0x10>
    ;
  return os;
}
    1bee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1bf1:	89 c8                	mov    %ecx,%eax
    1bf3:	c9                   	leave  
    1bf4:	c3                   	ret    
    1bf5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1bfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001c00 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1c00:	55                   	push   %ebp
    1c01:	89 e5                	mov    %esp,%ebp
    1c03:	53                   	push   %ebx
    1c04:	8b 55 08             	mov    0x8(%ebp),%edx
    1c07:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    1c0a:	0f b6 02             	movzbl (%edx),%eax
    1c0d:	84 c0                	test   %al,%al
    1c0f:	75 17                	jne    1c28 <strcmp+0x28>
    1c11:	eb 3a                	jmp    1c4d <strcmp+0x4d>
    1c13:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1c17:	90                   	nop
    1c18:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    1c1c:	83 c2 01             	add    $0x1,%edx
    1c1f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    1c22:	84 c0                	test   %al,%al
    1c24:	74 1a                	je     1c40 <strcmp+0x40>
    p++, q++;
    1c26:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    1c28:	0f b6 19             	movzbl (%ecx),%ebx
    1c2b:	38 c3                	cmp    %al,%bl
    1c2d:	74 e9                	je     1c18 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    1c2f:	29 d8                	sub    %ebx,%eax
}
    1c31:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1c34:	c9                   	leave  
    1c35:	c3                   	ret    
    1c36:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1c3d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    1c40:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    1c44:	31 c0                	xor    %eax,%eax
    1c46:	29 d8                	sub    %ebx,%eax
}
    1c48:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1c4b:	c9                   	leave  
    1c4c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    1c4d:	0f b6 19             	movzbl (%ecx),%ebx
    1c50:	31 c0                	xor    %eax,%eax
    1c52:	eb db                	jmp    1c2f <strcmp+0x2f>
    1c54:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1c5b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1c5f:	90                   	nop

00001c60 <strlen>:

uint
strlen(const char *s)
{
    1c60:	55                   	push   %ebp
    1c61:	89 e5                	mov    %esp,%ebp
    1c63:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    1c66:	80 3a 00             	cmpb   $0x0,(%edx)
    1c69:	74 15                	je     1c80 <strlen+0x20>
    1c6b:	31 c0                	xor    %eax,%eax
    1c6d:	8d 76 00             	lea    0x0(%esi),%esi
    1c70:	83 c0 01             	add    $0x1,%eax
    1c73:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    1c77:	89 c1                	mov    %eax,%ecx
    1c79:	75 f5                	jne    1c70 <strlen+0x10>
    ;
  return n;
}
    1c7b:	89 c8                	mov    %ecx,%eax
    1c7d:	5d                   	pop    %ebp
    1c7e:	c3                   	ret    
    1c7f:	90                   	nop
  for(n = 0; s[n]; n++)
    1c80:	31 c9                	xor    %ecx,%ecx
}
    1c82:	5d                   	pop    %ebp
    1c83:	89 c8                	mov    %ecx,%eax
    1c85:	c3                   	ret    
    1c86:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1c8d:	8d 76 00             	lea    0x0(%esi),%esi

00001c90 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1c90:	55                   	push   %ebp
    1c91:	89 e5                	mov    %esp,%ebp
    1c93:	57                   	push   %edi
    1c94:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1c97:	8b 4d 10             	mov    0x10(%ebp),%ecx
    1c9a:	8b 45 0c             	mov    0xc(%ebp),%eax
    1c9d:	89 d7                	mov    %edx,%edi
    1c9f:	fc                   	cld    
    1ca0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1ca2:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1ca5:	89 d0                	mov    %edx,%eax
    1ca7:	c9                   	leave  
    1ca8:	c3                   	ret    
    1ca9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001cb0 <strchr>:

char*
strchr(const char *s, char c)
{
    1cb0:	55                   	push   %ebp
    1cb1:	89 e5                	mov    %esp,%ebp
    1cb3:	8b 45 08             	mov    0x8(%ebp),%eax
    1cb6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    1cba:	0f b6 10             	movzbl (%eax),%edx
    1cbd:	84 d2                	test   %dl,%dl
    1cbf:	75 12                	jne    1cd3 <strchr+0x23>
    1cc1:	eb 1d                	jmp    1ce0 <strchr+0x30>
    1cc3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1cc7:	90                   	nop
    1cc8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    1ccc:	83 c0 01             	add    $0x1,%eax
    1ccf:	84 d2                	test   %dl,%dl
    1cd1:	74 0d                	je     1ce0 <strchr+0x30>
    if(*s == c)
    1cd3:	38 d1                	cmp    %dl,%cl
    1cd5:	75 f1                	jne    1cc8 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1cd7:	5d                   	pop    %ebp
    1cd8:	c3                   	ret    
    1cd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1ce0:	31 c0                	xor    %eax,%eax
}
    1ce2:	5d                   	pop    %ebp
    1ce3:	c3                   	ret    
    1ce4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1ceb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1cef:	90                   	nop

00001cf0 <gets>:

char*
gets(char *buf, int max)
{
    1cf0:	55                   	push   %ebp
    1cf1:	89 e5                	mov    %esp,%ebp
    1cf3:	57                   	push   %edi
    1cf4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    1cf5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    1cf8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    1cf9:	31 db                	xor    %ebx,%ebx
{
    1cfb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    1cfe:	eb 27                	jmp    1d27 <gets+0x37>
    cc = read(0, &c, 1);
    1d00:	83 ec 04             	sub    $0x4,%esp
    1d03:	6a 01                	push   $0x1
    1d05:	57                   	push   %edi
    1d06:	6a 00                	push   $0x0
    1d08:	e8 2e 01 00 00       	call   1e3b <read>
    if(cc < 1)
    1d0d:	83 c4 10             	add    $0x10,%esp
    1d10:	85 c0                	test   %eax,%eax
    1d12:	7e 1d                	jle    1d31 <gets+0x41>
      break;
    buf[i++] = c;
    1d14:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1d18:	8b 55 08             	mov    0x8(%ebp),%edx
    1d1b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    1d1f:	3c 0a                	cmp    $0xa,%al
    1d21:	74 1d                	je     1d40 <gets+0x50>
    1d23:	3c 0d                	cmp    $0xd,%al
    1d25:	74 19                	je     1d40 <gets+0x50>
  for(i=0; i+1 < max; ){
    1d27:	89 de                	mov    %ebx,%esi
    1d29:	83 c3 01             	add    $0x1,%ebx
    1d2c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1d2f:	7c cf                	jl     1d00 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    1d31:	8b 45 08             	mov    0x8(%ebp),%eax
    1d34:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1d38:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1d3b:	5b                   	pop    %ebx
    1d3c:	5e                   	pop    %esi
    1d3d:	5f                   	pop    %edi
    1d3e:	5d                   	pop    %ebp
    1d3f:	c3                   	ret    
  buf[i] = '\0';
    1d40:	8b 45 08             	mov    0x8(%ebp),%eax
    1d43:	89 de                	mov    %ebx,%esi
    1d45:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    1d49:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1d4c:	5b                   	pop    %ebx
    1d4d:	5e                   	pop    %esi
    1d4e:	5f                   	pop    %edi
    1d4f:	5d                   	pop    %ebp
    1d50:	c3                   	ret    
    1d51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1d58:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1d5f:	90                   	nop

00001d60 <stat>:

int
stat(const char *n, struct stat *st)
{
    1d60:	55                   	push   %ebp
    1d61:	89 e5                	mov    %esp,%ebp
    1d63:	56                   	push   %esi
    1d64:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1d65:	83 ec 08             	sub    $0x8,%esp
    1d68:	6a 00                	push   $0x0
    1d6a:	ff 75 08             	push   0x8(%ebp)
    1d6d:	e8 f1 00 00 00       	call   1e63 <open>
  if(fd < 0)
    1d72:	83 c4 10             	add    $0x10,%esp
    1d75:	85 c0                	test   %eax,%eax
    1d77:	78 27                	js     1da0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1d79:	83 ec 08             	sub    $0x8,%esp
    1d7c:	ff 75 0c             	push   0xc(%ebp)
    1d7f:	89 c3                	mov    %eax,%ebx
    1d81:	50                   	push   %eax
    1d82:	e8 f4 00 00 00       	call   1e7b <fstat>
  close(fd);
    1d87:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    1d8a:	89 c6                	mov    %eax,%esi
  close(fd);
    1d8c:	e8 ba 00 00 00       	call   1e4b <close>
  return r;
    1d91:	83 c4 10             	add    $0x10,%esp
}
    1d94:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1d97:	89 f0                	mov    %esi,%eax
    1d99:	5b                   	pop    %ebx
    1d9a:	5e                   	pop    %esi
    1d9b:	5d                   	pop    %ebp
    1d9c:	c3                   	ret    
    1d9d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1da0:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1da5:	eb ed                	jmp    1d94 <stat+0x34>
    1da7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1dae:	66 90                	xchg   %ax,%ax

00001db0 <atoi>:

int
atoi(const char *s)
{
    1db0:	55                   	push   %ebp
    1db1:	89 e5                	mov    %esp,%ebp
    1db3:	53                   	push   %ebx
    1db4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1db7:	0f be 02             	movsbl (%edx),%eax
    1dba:	8d 48 d0             	lea    -0x30(%eax),%ecx
    1dbd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1dc0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1dc5:	77 1e                	ja     1de5 <atoi+0x35>
    1dc7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1dce:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1dd0:	83 c2 01             	add    $0x1,%edx
    1dd3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1dd6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    1dda:	0f be 02             	movsbl (%edx),%eax
    1ddd:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1de0:	80 fb 09             	cmp    $0x9,%bl
    1de3:	76 eb                	jbe    1dd0 <atoi+0x20>
  return n;
}
    1de5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1de8:	89 c8                	mov    %ecx,%eax
    1dea:	c9                   	leave  
    1deb:	c3                   	ret    
    1dec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001df0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1df0:	55                   	push   %ebp
    1df1:	89 e5                	mov    %esp,%ebp
    1df3:	57                   	push   %edi
    1df4:	8b 45 10             	mov    0x10(%ebp),%eax
    1df7:	8b 55 08             	mov    0x8(%ebp),%edx
    1dfa:	56                   	push   %esi
    1dfb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1dfe:	85 c0                	test   %eax,%eax
    1e00:	7e 13                	jle    1e15 <memmove+0x25>
    1e02:	01 d0                	add    %edx,%eax
  dst = vdst;
    1e04:	89 d7                	mov    %edx,%edi
    1e06:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1e0d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1e10:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1e11:	39 f8                	cmp    %edi,%eax
    1e13:	75 fb                	jne    1e10 <memmove+0x20>
  return vdst;
}
    1e15:	5e                   	pop    %esi
    1e16:	89 d0                	mov    %edx,%eax
    1e18:	5f                   	pop    %edi
    1e19:	5d                   	pop    %ebp
    1e1a:	c3                   	ret    

00001e1b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1e1b:	b8 01 00 00 00       	mov    $0x1,%eax
    1e20:	cd 40                	int    $0x40
    1e22:	c3                   	ret    

00001e23 <exit>:
SYSCALL(exit)
    1e23:	b8 02 00 00 00       	mov    $0x2,%eax
    1e28:	cd 40                	int    $0x40
    1e2a:	c3                   	ret    

00001e2b <wait>:
SYSCALL(wait)
    1e2b:	b8 03 00 00 00       	mov    $0x3,%eax
    1e30:	cd 40                	int    $0x40
    1e32:	c3                   	ret    

00001e33 <pipe>:
SYSCALL(pipe)
    1e33:	b8 04 00 00 00       	mov    $0x4,%eax
    1e38:	cd 40                	int    $0x40
    1e3a:	c3                   	ret    

00001e3b <read>:
SYSCALL(read)
    1e3b:	b8 05 00 00 00       	mov    $0x5,%eax
    1e40:	cd 40                	int    $0x40
    1e42:	c3                   	ret    

00001e43 <write>:
SYSCALL(write)
    1e43:	b8 10 00 00 00       	mov    $0x10,%eax
    1e48:	cd 40                	int    $0x40
    1e4a:	c3                   	ret    

00001e4b <close>:
SYSCALL(close)
    1e4b:	b8 15 00 00 00       	mov    $0x15,%eax
    1e50:	cd 40                	int    $0x40
    1e52:	c3                   	ret    

00001e53 <kill>:
SYSCALL(kill)
    1e53:	b8 06 00 00 00       	mov    $0x6,%eax
    1e58:	cd 40                	int    $0x40
    1e5a:	c3                   	ret    

00001e5b <exec>:
SYSCALL(exec)
    1e5b:	b8 07 00 00 00       	mov    $0x7,%eax
    1e60:	cd 40                	int    $0x40
    1e62:	c3                   	ret    

00001e63 <open>:
SYSCALL(open)
    1e63:	b8 0f 00 00 00       	mov    $0xf,%eax
    1e68:	cd 40                	int    $0x40
    1e6a:	c3                   	ret    

00001e6b <mknod>:
SYSCALL(mknod)
    1e6b:	b8 11 00 00 00       	mov    $0x11,%eax
    1e70:	cd 40                	int    $0x40
    1e72:	c3                   	ret    

00001e73 <unlink>:
SYSCALL(unlink)
    1e73:	b8 12 00 00 00       	mov    $0x12,%eax
    1e78:	cd 40                	int    $0x40
    1e7a:	c3                   	ret    

00001e7b <fstat>:
SYSCALL(fstat)
    1e7b:	b8 08 00 00 00       	mov    $0x8,%eax
    1e80:	cd 40                	int    $0x40
    1e82:	c3                   	ret    

00001e83 <link>:
SYSCALL(link)
    1e83:	b8 13 00 00 00       	mov    $0x13,%eax
    1e88:	cd 40                	int    $0x40
    1e8a:	c3                   	ret    

00001e8b <mkdir>:
SYSCALL(mkdir)
    1e8b:	b8 14 00 00 00       	mov    $0x14,%eax
    1e90:	cd 40                	int    $0x40
    1e92:	c3                   	ret    

00001e93 <chdir>:
SYSCALL(chdir)
    1e93:	b8 09 00 00 00       	mov    $0x9,%eax
    1e98:	cd 40                	int    $0x40
    1e9a:	c3                   	ret    

00001e9b <dup>:
SYSCALL(dup)
    1e9b:	b8 0a 00 00 00       	mov    $0xa,%eax
    1ea0:	cd 40                	int    $0x40
    1ea2:	c3                   	ret    

00001ea3 <getpid>:
SYSCALL(getpid)
    1ea3:	b8 0b 00 00 00       	mov    $0xb,%eax
    1ea8:	cd 40                	int    $0x40
    1eaa:	c3                   	ret    

00001eab <sbrk>:
SYSCALL(sbrk)
    1eab:	b8 0c 00 00 00       	mov    $0xc,%eax
    1eb0:	cd 40                	int    $0x40
    1eb2:	c3                   	ret    

00001eb3 <sleep>:
SYSCALL(sleep)
    1eb3:	b8 0d 00 00 00       	mov    $0xd,%eax
    1eb8:	cd 40                	int    $0x40
    1eba:	c3                   	ret    

00001ebb <uptime>:
SYSCALL(uptime)
    1ebb:	b8 0e 00 00 00       	mov    $0xe,%eax
    1ec0:	cd 40                	int    $0x40
    1ec2:	c3                   	ret    

00001ec3 <getpinfo>:

SYSCALL(getpinfo)
    1ec3:	b8 16 00 00 00       	mov    $0x16,%eax
    1ec8:	cd 40                	int    $0x40
    1eca:	c3                   	ret    

00001ecb <settickets>:
SYSCALL(settickets)
    1ecb:	b8 17 00 00 00       	mov    $0x17,%eax
    1ed0:	cd 40                	int    $0x40
    1ed2:	c3                   	ret    
    1ed3:	66 90                	xchg   %ax,%ax
    1ed5:	66 90                	xchg   %ax,%ax
    1ed7:	66 90                	xchg   %ax,%ax
    1ed9:	66 90                	xchg   %ax,%ax
    1edb:	66 90                	xchg   %ax,%ax
    1edd:	66 90                	xchg   %ax,%ax
    1edf:	90                   	nop

00001ee0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1ee0:	55                   	push   %ebp
    1ee1:	89 e5                	mov    %esp,%ebp
    1ee3:	57                   	push   %edi
    1ee4:	56                   	push   %esi
    1ee5:	53                   	push   %ebx
    1ee6:	83 ec 3c             	sub    $0x3c,%esp
    1ee9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    1eec:	89 d1                	mov    %edx,%ecx
{
    1eee:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1ef1:	85 d2                	test   %edx,%edx
    1ef3:	0f 89 7f 00 00 00    	jns    1f78 <printint+0x98>
    1ef9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1efd:	74 79                	je     1f78 <printint+0x98>
    neg = 1;
    1eff:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1f06:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1f08:	31 db                	xor    %ebx,%ebx
    1f0a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    1f0d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1f10:	89 c8                	mov    %ecx,%eax
    1f12:	31 d2                	xor    %edx,%edx
    1f14:	89 cf                	mov    %ecx,%edi
    1f16:	f7 75 c4             	divl   -0x3c(%ebp)
    1f19:	0f b6 92 00 24 00 00 	movzbl 0x2400(%edx),%edx
    1f20:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1f23:	89 d8                	mov    %ebx,%eax
    1f25:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1f28:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    1f2b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    1f2e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1f31:	76 dd                	jbe    1f10 <printint+0x30>
  if(neg)
    1f33:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1f36:	85 c9                	test   %ecx,%ecx
    1f38:	74 0c                	je     1f46 <printint+0x66>
    buf[i++] = '-';
    1f3a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    1f3f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1f41:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1f46:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1f49:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    1f4d:	eb 07                	jmp    1f56 <printint+0x76>
    1f4f:	90                   	nop
    putc(fd, buf[i]);
    1f50:	0f b6 13             	movzbl (%ebx),%edx
    1f53:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1f56:	83 ec 04             	sub    $0x4,%esp
    1f59:	88 55 d7             	mov    %dl,-0x29(%ebp)
    1f5c:	6a 01                	push   $0x1
    1f5e:	56                   	push   %esi
    1f5f:	57                   	push   %edi
    1f60:	e8 de fe ff ff       	call   1e43 <write>
  while(--i >= 0)
    1f65:	83 c4 10             	add    $0x10,%esp
    1f68:	39 de                	cmp    %ebx,%esi
    1f6a:	75 e4                	jne    1f50 <printint+0x70>
}
    1f6c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1f6f:	5b                   	pop    %ebx
    1f70:	5e                   	pop    %esi
    1f71:	5f                   	pop    %edi
    1f72:	5d                   	pop    %ebp
    1f73:	c3                   	ret    
    1f74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1f78:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    1f7f:	eb 87                	jmp    1f08 <printint+0x28>
    1f81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1f88:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1f8f:	90                   	nop

00001f90 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1f90:	55                   	push   %ebp
    1f91:	89 e5                	mov    %esp,%ebp
    1f93:	57                   	push   %edi
    1f94:	56                   	push   %esi
    1f95:	53                   	push   %ebx
    1f96:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1f99:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    1f9c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    1f9f:	0f b6 13             	movzbl (%ebx),%edx
    1fa2:	84 d2                	test   %dl,%dl
    1fa4:	74 6a                	je     2010 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    1fa6:	8d 45 10             	lea    0x10(%ebp),%eax
    1fa9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    1fac:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    1faf:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    1fb1:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1fb4:	eb 36                	jmp    1fec <printf+0x5c>
    1fb6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1fbd:	8d 76 00             	lea    0x0(%esi),%esi
    1fc0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1fc3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1fc8:	83 f8 25             	cmp    $0x25,%eax
    1fcb:	74 15                	je     1fe2 <printf+0x52>
  write(fd, &c, 1);
    1fcd:	83 ec 04             	sub    $0x4,%esp
    1fd0:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1fd3:	6a 01                	push   $0x1
    1fd5:	57                   	push   %edi
    1fd6:	56                   	push   %esi
    1fd7:	e8 67 fe ff ff       	call   1e43 <write>
    1fdc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    1fdf:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1fe2:	0f b6 13             	movzbl (%ebx),%edx
    1fe5:	83 c3 01             	add    $0x1,%ebx
    1fe8:	84 d2                	test   %dl,%dl
    1fea:	74 24                	je     2010 <printf+0x80>
    c = fmt[i] & 0xff;
    1fec:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    1fef:	85 c9                	test   %ecx,%ecx
    1ff1:	74 cd                	je     1fc0 <printf+0x30>
      }
    } else if(state == '%'){
    1ff3:	83 f9 25             	cmp    $0x25,%ecx
    1ff6:	75 ea                	jne    1fe2 <printf+0x52>
      if(c == 'd'){
    1ff8:	83 f8 25             	cmp    $0x25,%eax
    1ffb:	0f 84 07 01 00 00    	je     2108 <printf+0x178>
    2001:	83 e8 63             	sub    $0x63,%eax
    2004:	83 f8 15             	cmp    $0x15,%eax
    2007:	77 17                	ja     2020 <printf+0x90>
    2009:	ff 24 85 a8 23 00 00 	jmp    *0x23a8(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    2010:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2013:	5b                   	pop    %ebx
    2014:	5e                   	pop    %esi
    2015:	5f                   	pop    %edi
    2016:	5d                   	pop    %ebp
    2017:	c3                   	ret    
    2018:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    201f:	90                   	nop
  write(fd, &c, 1);
    2020:	83 ec 04             	sub    $0x4,%esp
    2023:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    2026:	6a 01                	push   $0x1
    2028:	57                   	push   %edi
    2029:	56                   	push   %esi
    202a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    202e:	e8 10 fe ff ff       	call   1e43 <write>
        putc(fd, c);
    2033:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    2037:	83 c4 0c             	add    $0xc,%esp
    203a:	88 55 e7             	mov    %dl,-0x19(%ebp)
    203d:	6a 01                	push   $0x1
    203f:	57                   	push   %edi
    2040:	56                   	push   %esi
    2041:	e8 fd fd ff ff       	call   1e43 <write>
        putc(fd, c);
    2046:	83 c4 10             	add    $0x10,%esp
      state = 0;
    2049:	31 c9                	xor    %ecx,%ecx
    204b:	eb 95                	jmp    1fe2 <printf+0x52>
    204d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    2050:	83 ec 0c             	sub    $0xc,%esp
    2053:	b9 10 00 00 00       	mov    $0x10,%ecx
    2058:	6a 00                	push   $0x0
    205a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    205d:	8b 10                	mov    (%eax),%edx
    205f:	89 f0                	mov    %esi,%eax
    2061:	e8 7a fe ff ff       	call   1ee0 <printint>
        ap++;
    2066:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    206a:	83 c4 10             	add    $0x10,%esp
      state = 0;
    206d:	31 c9                	xor    %ecx,%ecx
    206f:	e9 6e ff ff ff       	jmp    1fe2 <printf+0x52>
    2074:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    2078:	8b 45 d0             	mov    -0x30(%ebp),%eax
    207b:	8b 10                	mov    (%eax),%edx
        ap++;
    207d:	83 c0 04             	add    $0x4,%eax
    2080:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    2083:	85 d2                	test   %edx,%edx
    2085:	0f 84 8d 00 00 00    	je     2118 <printf+0x188>
        while(*s != 0){
    208b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    208e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    2090:	84 c0                	test   %al,%al
    2092:	0f 84 4a ff ff ff    	je     1fe2 <printf+0x52>
    2098:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    209b:	89 d3                	mov    %edx,%ebx
    209d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    20a0:	83 ec 04             	sub    $0x4,%esp
          s++;
    20a3:	83 c3 01             	add    $0x1,%ebx
    20a6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    20a9:	6a 01                	push   $0x1
    20ab:	57                   	push   %edi
    20ac:	56                   	push   %esi
    20ad:	e8 91 fd ff ff       	call   1e43 <write>
        while(*s != 0){
    20b2:	0f b6 03             	movzbl (%ebx),%eax
    20b5:	83 c4 10             	add    $0x10,%esp
    20b8:	84 c0                	test   %al,%al
    20ba:	75 e4                	jne    20a0 <printf+0x110>
      state = 0;
    20bc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    20bf:	31 c9                	xor    %ecx,%ecx
    20c1:	e9 1c ff ff ff       	jmp    1fe2 <printf+0x52>
    20c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    20cd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    20d0:	83 ec 0c             	sub    $0xc,%esp
    20d3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    20d8:	6a 01                	push   $0x1
    20da:	e9 7b ff ff ff       	jmp    205a <printf+0xca>
    20df:	90                   	nop
        putc(fd, *ap);
    20e0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    20e3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    20e6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    20e8:	6a 01                	push   $0x1
    20ea:	57                   	push   %edi
    20eb:	56                   	push   %esi
        putc(fd, *ap);
    20ec:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    20ef:	e8 4f fd ff ff       	call   1e43 <write>
        ap++;
    20f4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    20f8:	83 c4 10             	add    $0x10,%esp
      state = 0;
    20fb:	31 c9                	xor    %ecx,%ecx
    20fd:	e9 e0 fe ff ff       	jmp    1fe2 <printf+0x52>
    2102:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    2108:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    210b:	83 ec 04             	sub    $0x4,%esp
    210e:	e9 2a ff ff ff       	jmp    203d <printf+0xad>
    2113:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    2117:	90                   	nop
          s = "(null)";
    2118:	ba a0 23 00 00       	mov    $0x23a0,%edx
        while(*s != 0){
    211d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    2120:	b8 28 00 00 00       	mov    $0x28,%eax
    2125:	89 d3                	mov    %edx,%ebx
    2127:	e9 74 ff ff ff       	jmp    20a0 <printf+0x110>
    212c:	66 90                	xchg   %ax,%ax
    212e:	66 90                	xchg   %ax,%ax

00002130 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    2130:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    2131:	a1 64 2a 00 00       	mov    0x2a64,%eax
{
    2136:	89 e5                	mov    %esp,%ebp
    2138:	57                   	push   %edi
    2139:	56                   	push   %esi
    213a:	53                   	push   %ebx
    213b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    213e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    2141:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2148:	89 c2                	mov    %eax,%edx
    214a:	8b 00                	mov    (%eax),%eax
    214c:	39 ca                	cmp    %ecx,%edx
    214e:	73 30                	jae    2180 <free+0x50>
    2150:	39 c1                	cmp    %eax,%ecx
    2152:	72 04                	jb     2158 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    2154:	39 c2                	cmp    %eax,%edx
    2156:	72 f0                	jb     2148 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    2158:	8b 73 fc             	mov    -0x4(%ebx),%esi
    215b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    215e:	39 f8                	cmp    %edi,%eax
    2160:	74 30                	je     2192 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    2162:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    2165:	8b 42 04             	mov    0x4(%edx),%eax
    2168:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    216b:	39 f1                	cmp    %esi,%ecx
    216d:	74 3a                	je     21a9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    216f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    2171:	5b                   	pop    %ebx
  freep = p;
    2172:	89 15 64 2a 00 00    	mov    %edx,0x2a64
}
    2178:	5e                   	pop    %esi
    2179:	5f                   	pop    %edi
    217a:	5d                   	pop    %ebp
    217b:	c3                   	ret    
    217c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    2180:	39 c2                	cmp    %eax,%edx
    2182:	72 c4                	jb     2148 <free+0x18>
    2184:	39 c1                	cmp    %eax,%ecx
    2186:	73 c0                	jae    2148 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    2188:	8b 73 fc             	mov    -0x4(%ebx),%esi
    218b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    218e:	39 f8                	cmp    %edi,%eax
    2190:	75 d0                	jne    2162 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    2192:	03 70 04             	add    0x4(%eax),%esi
    2195:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    2198:	8b 02                	mov    (%edx),%eax
    219a:	8b 00                	mov    (%eax),%eax
    219c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    219f:	8b 42 04             	mov    0x4(%edx),%eax
    21a2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    21a5:	39 f1                	cmp    %esi,%ecx
    21a7:	75 c6                	jne    216f <free+0x3f>
    p->s.size += bp->s.size;
    21a9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    21ac:	89 15 64 2a 00 00    	mov    %edx,0x2a64
    p->s.size += bp->s.size;
    21b2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    21b5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    21b8:	89 0a                	mov    %ecx,(%edx)
}
    21ba:	5b                   	pop    %ebx
    21bb:	5e                   	pop    %esi
    21bc:	5f                   	pop    %edi
    21bd:	5d                   	pop    %ebp
    21be:	c3                   	ret    
    21bf:	90                   	nop

000021c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    21c0:	55                   	push   %ebp
    21c1:	89 e5                	mov    %esp,%ebp
    21c3:	57                   	push   %edi
    21c4:	56                   	push   %esi
    21c5:	53                   	push   %ebx
    21c6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    21c9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    21cc:	8b 3d 64 2a 00 00    	mov    0x2a64,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    21d2:	8d 70 07             	lea    0x7(%eax),%esi
    21d5:	c1 ee 03             	shr    $0x3,%esi
    21d8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    21db:	85 ff                	test   %edi,%edi
    21dd:	0f 84 9d 00 00 00    	je     2280 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    21e3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    21e5:	8b 4a 04             	mov    0x4(%edx),%ecx
    21e8:	39 f1                	cmp    %esi,%ecx
    21ea:	73 6a                	jae    2256 <malloc+0x96>
    21ec:	bb 00 10 00 00       	mov    $0x1000,%ebx
    21f1:	39 de                	cmp    %ebx,%esi
    21f3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    21f6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    21fd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    2200:	eb 17                	jmp    2219 <malloc+0x59>
    2202:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    2208:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    220a:	8b 48 04             	mov    0x4(%eax),%ecx
    220d:	39 f1                	cmp    %esi,%ecx
    220f:	73 4f                	jae    2260 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    2211:	8b 3d 64 2a 00 00    	mov    0x2a64,%edi
    2217:	89 c2                	mov    %eax,%edx
    2219:	39 d7                	cmp    %edx,%edi
    221b:	75 eb                	jne    2208 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    221d:	83 ec 0c             	sub    $0xc,%esp
    2220:	ff 75 e4             	push   -0x1c(%ebp)
    2223:	e8 83 fc ff ff       	call   1eab <sbrk>
  if(p == (char*)-1)
    2228:	83 c4 10             	add    $0x10,%esp
    222b:	83 f8 ff             	cmp    $0xffffffff,%eax
    222e:	74 1c                	je     224c <malloc+0x8c>
  hp->s.size = nu;
    2230:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    2233:	83 ec 0c             	sub    $0xc,%esp
    2236:	83 c0 08             	add    $0x8,%eax
    2239:	50                   	push   %eax
    223a:	e8 f1 fe ff ff       	call   2130 <free>
  return freep;
    223f:	8b 15 64 2a 00 00    	mov    0x2a64,%edx
      if((p = morecore(nunits)) == 0)
    2245:	83 c4 10             	add    $0x10,%esp
    2248:	85 d2                	test   %edx,%edx
    224a:	75 bc                	jne    2208 <malloc+0x48>
        return 0;
  }
}
    224c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    224f:	31 c0                	xor    %eax,%eax
}
    2251:	5b                   	pop    %ebx
    2252:	5e                   	pop    %esi
    2253:	5f                   	pop    %edi
    2254:	5d                   	pop    %ebp
    2255:	c3                   	ret    
    if(p->s.size >= nunits){
    2256:	89 d0                	mov    %edx,%eax
    2258:	89 fa                	mov    %edi,%edx
    225a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    2260:	39 ce                	cmp    %ecx,%esi
    2262:	74 4c                	je     22b0 <malloc+0xf0>
        p->s.size -= nunits;
    2264:	29 f1                	sub    %esi,%ecx
    2266:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    2269:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    226c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    226f:	89 15 64 2a 00 00    	mov    %edx,0x2a64
}
    2275:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    2278:	83 c0 08             	add    $0x8,%eax
}
    227b:	5b                   	pop    %ebx
    227c:	5e                   	pop    %esi
    227d:	5f                   	pop    %edi
    227e:	5d                   	pop    %ebp
    227f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    2280:	c7 05 64 2a 00 00 68 	movl   $0x2a68,0x2a64
    2287:	2a 00 00 
    base.s.size = 0;
    228a:	bf 68 2a 00 00       	mov    $0x2a68,%edi
    base.s.ptr = freep = prevp = &base;
    228f:	c7 05 68 2a 00 00 68 	movl   $0x2a68,0x2a68
    2296:	2a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    2299:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    229b:	c7 05 6c 2a 00 00 00 	movl   $0x0,0x2a6c
    22a2:	00 00 00 
    if(p->s.size >= nunits){
    22a5:	e9 42 ff ff ff       	jmp    21ec <malloc+0x2c>
    22aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    22b0:	8b 08                	mov    (%eax),%ecx
    22b2:	89 0a                	mov    %ecx,(%edx)
    22b4:	eb b9                	jmp    226f <malloc+0xaf>
