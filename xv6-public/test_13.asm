
_test_13:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "user.h"
#include "fcntl.h"
#include "pstat.h"

int
main(int argc, char *argv[]) {
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	push   -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	57                   	push   %edi
    100e:	56                   	push   %esi
    100f:	53                   	push   %ebx
    1010:	51                   	push   %ecx
    1011:	81 ec 50 04 00 00    	sub    $0x450,%esp
  struct pstat pstat;

  int pid1, pid2;
  int fd1, fd2;

  fd1 = open(p1_file, O_CREATE | O_WRONLY);
    1017:	68 01 02 00 00       	push   $0x201
    101c:	68 b8 18 00 00       	push   $0x18b8
    1021:	e8 2d 04 00 00       	call   1453 <open>
  if (fd1 < 0) {
    1026:	83 c4 10             	add    $0x10,%esp
    1029:	85 c0                	test   %eax,%eax
    102b:	78 7d                	js     10aa <main+0xaa>
    102d:	89 c3                	mov    %eax,%ebx
    printf(2, "Open %s failed\n", p1_file);
    exit();
  }
 
  fd2 = open(p2_file, O_CREATE | O_WRONLY);
    102f:	50                   	push   %eax
    1030:	50                   	push   %eax
    1031:	68 01 02 00 00       	push   $0x201
    1036:	68 cf 18 00 00       	push   $0x18cf
    103b:	e8 13 04 00 00       	call   1453 <open>
  if (fd2 < 0) {
    1040:	83 c4 10             	add    $0x10,%esp
  fd2 = open(p2_file, O_CREATE | O_WRONLY);
    1043:	89 c6                	mov    %eax,%esi
  if (fd2 < 0) {
    1045:	85 c0                	test   %eax,%eax
    1047:	78 4a                	js     1093 <main+0x93>
    printf(2, "Open %s failed\n", p2_file);
    exit();
  }

  pid1 = fork();
    1049:	e8 bd 03 00 00       	call   140b <fork>
    104e:	89 c7                	mov    %eax,%edi
  if (pid1 < 0) {
    1050:	85 c0                	test   %eax,%eax
    1052:	0f 88 3c 01 00 00    	js     1194 <main+0x194>
    printf(2, "Fork child process 1 failed\n");
  } else if (pid1 == 0) { // child process 1
    1058:	74 67                	je     10c1 <main+0xc1>
    settickets(1);
    while(1)
      printf(fd1, "A");
  } 
  
  pid2 = fork();
    105a:	e8 ac 03 00 00       	call   140b <fork>
  if (pid2 < 0) {
    105f:	85 c0                	test   %eax,%eax
    1061:	0f 88 7c 00 00 00    	js     10e3 <main+0xe3>
    printf(2, "Fork child process 2 failed\n");
    exit();
  } else if (pid2 == 0) { // child process 2
    1067:	0f 85 89 00 00 00    	jne    10f6 <main+0xf6>
    settickets(0);
    106d:	83 ec 0c             	sub    $0xc,%esp
    1070:	6a 00                	push   $0x0
    1072:	e8 44 04 00 00       	call   14bb <settickets>
    1077:	83 c4 10             	add    $0x10,%esp
    107a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    while (1)  
      printf(fd2, "A");
    1080:	83 ec 08             	sub    $0x8,%esp
    1083:	68 f3 18 00 00       	push   $0x18f3
    1088:	56                   	push   %esi
    1089:	e8 02 05 00 00       	call   1590 <printf>
    108e:	83 c4 10             	add    $0x10,%esp
    1091:	eb ed                	jmp    1080 <main+0x80>
    printf(2, "Open %s failed\n", p2_file);
    1093:	50                   	push   %eax
    1094:	68 cf 18 00 00       	push   $0x18cf
    1099:	68 bf 18 00 00       	push   $0x18bf
    109e:	6a 02                	push   $0x2
    10a0:	e8 eb 04 00 00       	call   1590 <printf>
    exit();
    10a5:	e8 69 03 00 00       	call   1413 <exit>
    printf(2, "Open %s failed\n", p1_file);
    10aa:	52                   	push   %edx
    10ab:	68 b8 18 00 00       	push   $0x18b8
    10b0:	68 bf 18 00 00       	push   $0x18bf
    10b5:	6a 02                	push   $0x2
    10b7:	e8 d4 04 00 00       	call   1590 <printf>
    exit();
    10bc:	e8 52 03 00 00       	call   1413 <exit>
    settickets(1);
    10c1:	83 ec 0c             	sub    $0xc,%esp
    10c4:	6a 01                	push   $0x1
    10c6:	e8 f0 03 00 00       	call   14bb <settickets>
    10cb:	83 c4 10             	add    $0x10,%esp
    10ce:	66 90                	xchg   %ax,%ax
      printf(fd1, "A");
    10d0:	83 ec 08             	sub    $0x8,%esp
    10d3:	68 f3 18 00 00       	push   $0x18f3
    10d8:	53                   	push   %ebx
    10d9:	e8 b2 04 00 00       	call   1590 <printf>
    10de:	83 c4 10             	add    $0x10,%esp
    10e1:	eb ed                	jmp    10d0 <main+0xd0>
    printf(2, "Fork child process 2 failed\n");
    10e3:	50                   	push   %eax
    10e4:	50                   	push   %eax
    10e5:	68 f5 18 00 00       	push   $0x18f5
    10ea:	6a 02                	push   $0x2
    10ec:	e8 9f 04 00 00       	call   1590 <printf>
    exit();
    10f1:	e8 1d 03 00 00       	call   1413 <exit>
  }

  sleep(1000);
    10f6:	83 ec 0c             	sub    $0xc,%esp
    10f9:	89 85 b4 fb ff ff    	mov    %eax,-0x44c(%ebp)
    10ff:	68 e8 03 00 00       	push   $0x3e8
    1104:	e8 9a 03 00 00       	call   14a3 <sleep>
  getpinfo(&pstat);
    1109:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
    110f:	89 04 24             	mov    %eax,(%esp)
    1112:	e8 9c 03 00 00       	call   14b3 <getpinfo>
  kill(pid1);
    1117:	89 3c 24             	mov    %edi,(%esp)
    111a:	e8 24 03 00 00       	call   1443 <kill>
  kill(pid2);
    111f:	8b 95 b4 fb ff ff    	mov    -0x44c(%ebp),%edx
    1125:	89 14 24             	mov    %edx,(%esp)
    1128:	e8 16 03 00 00       	call   1443 <kill>

  wait();
    112d:	e8 e9 02 00 00       	call   141b <wait>
  wait();
    1132:	e8 e4 02 00 00       	call   141b <wait>

  fstat(fd1, &f1);
    1137:	8d 85 c0 fb ff ff    	lea    -0x440(%ebp),%eax
    113d:	5a                   	pop    %edx
    113e:	59                   	pop    %ecx
    113f:	50                   	push   %eax
    1140:	53                   	push   %ebx
    1141:	e8 25 03 00 00       	call   146b <fstat>
  fstat(fd2, &f2);
    1146:	5f                   	pop    %edi
    1147:	58                   	pop    %eax
    1148:	8d 85 d4 fb ff ff    	lea    -0x42c(%ebp),%eax
    114e:	50                   	push   %eax
    114f:	56                   	push   %esi
    1150:	e8 16 03 00 00       	call   146b <fstat>
  // compare file size made by child process
  if (f1.size > f2.size) {
    1155:	8b 85 e4 fb ff ff    	mov    -0x41c(%ebp),%eax
    115b:	83 c4 10             	add    $0x10,%esp
    115e:	39 85 d0 fb ff ff    	cmp    %eax,-0x430(%ebp)
    1164:	77 44                	ja     11aa <main+0x1aa>
    printf(1, "XV6_SCHEDULER\t SUCCESS\n");
  }

  close(fd1);
    1166:	83 ec 0c             	sub    $0xc,%esp
    1169:	53                   	push   %ebx
    116a:	e8 cc 02 00 00       	call   143b <close>
  close(fd2);
    116f:	89 34 24             	mov    %esi,(%esp)
    1172:	e8 c4 02 00 00       	call   143b <close>
  
  unlink(p1_file);
    1177:	c7 04 24 b8 18 00 00 	movl   $0x18b8,(%esp)
    117e:	e8 e0 02 00 00       	call   1463 <unlink>
  unlink(p2_file);
    1183:	c7 04 24 cf 18 00 00 	movl   $0x18cf,(%esp)
    118a:	e8 d4 02 00 00       	call   1463 <unlink>

  exit();
    118f:	e8 7f 02 00 00       	call   1413 <exit>
    printf(2, "Fork child process 1 failed\n");
    1194:	50                   	push   %eax
    1195:	50                   	push   %eax
    1196:	68 d6 18 00 00       	push   $0x18d6
    119b:	6a 02                	push   $0x2
    119d:	e8 ee 03 00 00       	call   1590 <printf>
    11a2:	83 c4 10             	add    $0x10,%esp
    11a5:	e9 b0 fe ff ff       	jmp    105a <main+0x5a>
    printf(1, "XV6_SCHEDULER\t SUCCESS\n");
    11aa:	50                   	push   %eax
    11ab:	50                   	push   %eax
    11ac:	68 12 19 00 00       	push   $0x1912
    11b1:	6a 01                	push   $0x1
    11b3:	e8 d8 03 00 00       	call   1590 <printf>
    11b8:	83 c4 10             	add    $0x10,%esp
    11bb:	eb a9                	jmp    1166 <main+0x166>
    11bd:	66 90                	xchg   %ax,%ax
    11bf:	90                   	nop

000011c0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    11c0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    11c1:	31 c0                	xor    %eax,%eax
{
    11c3:	89 e5                	mov    %esp,%ebp
    11c5:	53                   	push   %ebx
    11c6:	8b 4d 08             	mov    0x8(%ebp),%ecx
    11c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    11cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    11d0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    11d4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    11d7:	83 c0 01             	add    $0x1,%eax
    11da:	84 d2                	test   %dl,%dl
    11dc:	75 f2                	jne    11d0 <strcpy+0x10>
    ;
  return os;
}
    11de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    11e1:	89 c8                	mov    %ecx,%eax
    11e3:	c9                   	leave  
    11e4:	c3                   	ret    
    11e5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000011f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	53                   	push   %ebx
    11f4:	8b 55 08             	mov    0x8(%ebp),%edx
    11f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    11fa:	0f b6 02             	movzbl (%edx),%eax
    11fd:	84 c0                	test   %al,%al
    11ff:	75 17                	jne    1218 <strcmp+0x28>
    1201:	eb 3a                	jmp    123d <strcmp+0x4d>
    1203:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1207:	90                   	nop
    1208:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    120c:	83 c2 01             	add    $0x1,%edx
    120f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    1212:	84 c0                	test   %al,%al
    1214:	74 1a                	je     1230 <strcmp+0x40>
    p++, q++;
    1216:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    1218:	0f b6 19             	movzbl (%ecx),%ebx
    121b:	38 c3                	cmp    %al,%bl
    121d:	74 e9                	je     1208 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    121f:	29 d8                	sub    %ebx,%eax
}
    1221:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1224:	c9                   	leave  
    1225:	c3                   	ret    
    1226:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    122d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    1230:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    1234:	31 c0                	xor    %eax,%eax
    1236:	29 d8                	sub    %ebx,%eax
}
    1238:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    123b:	c9                   	leave  
    123c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    123d:	0f b6 19             	movzbl (%ecx),%ebx
    1240:	31 c0                	xor    %eax,%eax
    1242:	eb db                	jmp    121f <strcmp+0x2f>
    1244:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    124b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    124f:	90                   	nop

00001250 <strlen>:

uint
strlen(const char *s)
{
    1250:	55                   	push   %ebp
    1251:	89 e5                	mov    %esp,%ebp
    1253:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    1256:	80 3a 00             	cmpb   $0x0,(%edx)
    1259:	74 15                	je     1270 <strlen+0x20>
    125b:	31 c0                	xor    %eax,%eax
    125d:	8d 76 00             	lea    0x0(%esi),%esi
    1260:	83 c0 01             	add    $0x1,%eax
    1263:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    1267:	89 c1                	mov    %eax,%ecx
    1269:	75 f5                	jne    1260 <strlen+0x10>
    ;
  return n;
}
    126b:	89 c8                	mov    %ecx,%eax
    126d:	5d                   	pop    %ebp
    126e:	c3                   	ret    
    126f:	90                   	nop
  for(n = 0; s[n]; n++)
    1270:	31 c9                	xor    %ecx,%ecx
}
    1272:	5d                   	pop    %ebp
    1273:	89 c8                	mov    %ecx,%eax
    1275:	c3                   	ret    
    1276:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    127d:	8d 76 00             	lea    0x0(%esi),%esi

00001280 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1280:	55                   	push   %ebp
    1281:	89 e5                	mov    %esp,%ebp
    1283:	57                   	push   %edi
    1284:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1287:	8b 4d 10             	mov    0x10(%ebp),%ecx
    128a:	8b 45 0c             	mov    0xc(%ebp),%eax
    128d:	89 d7                	mov    %edx,%edi
    128f:	fc                   	cld    
    1290:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1292:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1295:	89 d0                	mov    %edx,%eax
    1297:	c9                   	leave  
    1298:	c3                   	ret    
    1299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000012a0 <strchr>:

char*
strchr(const char *s, char c)
{
    12a0:	55                   	push   %ebp
    12a1:	89 e5                	mov    %esp,%ebp
    12a3:	8b 45 08             	mov    0x8(%ebp),%eax
    12a6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    12aa:	0f b6 10             	movzbl (%eax),%edx
    12ad:	84 d2                	test   %dl,%dl
    12af:	75 12                	jne    12c3 <strchr+0x23>
    12b1:	eb 1d                	jmp    12d0 <strchr+0x30>
    12b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12b7:	90                   	nop
    12b8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    12bc:	83 c0 01             	add    $0x1,%eax
    12bf:	84 d2                	test   %dl,%dl
    12c1:	74 0d                	je     12d0 <strchr+0x30>
    if(*s == c)
    12c3:	38 d1                	cmp    %dl,%cl
    12c5:	75 f1                	jne    12b8 <strchr+0x18>
      return (char*)s;
  return 0;
}
    12c7:	5d                   	pop    %ebp
    12c8:	c3                   	ret    
    12c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    12d0:	31 c0                	xor    %eax,%eax
}
    12d2:	5d                   	pop    %ebp
    12d3:	c3                   	ret    
    12d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12df:	90                   	nop

000012e0 <gets>:

char*
gets(char *buf, int max)
{
    12e0:	55                   	push   %ebp
    12e1:	89 e5                	mov    %esp,%ebp
    12e3:	57                   	push   %edi
    12e4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    12e5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    12e8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    12e9:	31 db                	xor    %ebx,%ebx
{
    12eb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    12ee:	eb 27                	jmp    1317 <gets+0x37>
    cc = read(0, &c, 1);
    12f0:	83 ec 04             	sub    $0x4,%esp
    12f3:	6a 01                	push   $0x1
    12f5:	57                   	push   %edi
    12f6:	6a 00                	push   $0x0
    12f8:	e8 2e 01 00 00       	call   142b <read>
    if(cc < 1)
    12fd:	83 c4 10             	add    $0x10,%esp
    1300:	85 c0                	test   %eax,%eax
    1302:	7e 1d                	jle    1321 <gets+0x41>
      break;
    buf[i++] = c;
    1304:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1308:	8b 55 08             	mov    0x8(%ebp),%edx
    130b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    130f:	3c 0a                	cmp    $0xa,%al
    1311:	74 1d                	je     1330 <gets+0x50>
    1313:	3c 0d                	cmp    $0xd,%al
    1315:	74 19                	je     1330 <gets+0x50>
  for(i=0; i+1 < max; ){
    1317:	89 de                	mov    %ebx,%esi
    1319:	83 c3 01             	add    $0x1,%ebx
    131c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    131f:	7c cf                	jl     12f0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    1321:	8b 45 08             	mov    0x8(%ebp),%eax
    1324:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1328:	8d 65 f4             	lea    -0xc(%ebp),%esp
    132b:	5b                   	pop    %ebx
    132c:	5e                   	pop    %esi
    132d:	5f                   	pop    %edi
    132e:	5d                   	pop    %ebp
    132f:	c3                   	ret    
  buf[i] = '\0';
    1330:	8b 45 08             	mov    0x8(%ebp),%eax
    1333:	89 de                	mov    %ebx,%esi
    1335:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    1339:	8d 65 f4             	lea    -0xc(%ebp),%esp
    133c:	5b                   	pop    %ebx
    133d:	5e                   	pop    %esi
    133e:	5f                   	pop    %edi
    133f:	5d                   	pop    %ebp
    1340:	c3                   	ret    
    1341:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1348:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    134f:	90                   	nop

00001350 <stat>:

int
stat(const char *n, struct stat *st)
{
    1350:	55                   	push   %ebp
    1351:	89 e5                	mov    %esp,%ebp
    1353:	56                   	push   %esi
    1354:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1355:	83 ec 08             	sub    $0x8,%esp
    1358:	6a 00                	push   $0x0
    135a:	ff 75 08             	push   0x8(%ebp)
    135d:	e8 f1 00 00 00       	call   1453 <open>
  if(fd < 0)
    1362:	83 c4 10             	add    $0x10,%esp
    1365:	85 c0                	test   %eax,%eax
    1367:	78 27                	js     1390 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1369:	83 ec 08             	sub    $0x8,%esp
    136c:	ff 75 0c             	push   0xc(%ebp)
    136f:	89 c3                	mov    %eax,%ebx
    1371:	50                   	push   %eax
    1372:	e8 f4 00 00 00       	call   146b <fstat>
  close(fd);
    1377:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    137a:	89 c6                	mov    %eax,%esi
  close(fd);
    137c:	e8 ba 00 00 00       	call   143b <close>
  return r;
    1381:	83 c4 10             	add    $0x10,%esp
}
    1384:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1387:	89 f0                	mov    %esi,%eax
    1389:	5b                   	pop    %ebx
    138a:	5e                   	pop    %esi
    138b:	5d                   	pop    %ebp
    138c:	c3                   	ret    
    138d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1390:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1395:	eb ed                	jmp    1384 <stat+0x34>
    1397:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    139e:	66 90                	xchg   %ax,%ax

000013a0 <atoi>:

int
atoi(const char *s)
{
    13a0:	55                   	push   %ebp
    13a1:	89 e5                	mov    %esp,%ebp
    13a3:	53                   	push   %ebx
    13a4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    13a7:	0f be 02             	movsbl (%edx),%eax
    13aa:	8d 48 d0             	lea    -0x30(%eax),%ecx
    13ad:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    13b0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    13b5:	77 1e                	ja     13d5 <atoi+0x35>
    13b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13be:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    13c0:	83 c2 01             	add    $0x1,%edx
    13c3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    13c6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    13ca:	0f be 02             	movsbl (%edx),%eax
    13cd:	8d 58 d0             	lea    -0x30(%eax),%ebx
    13d0:	80 fb 09             	cmp    $0x9,%bl
    13d3:	76 eb                	jbe    13c0 <atoi+0x20>
  return n;
}
    13d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    13d8:	89 c8                	mov    %ecx,%eax
    13da:	c9                   	leave  
    13db:	c3                   	ret    
    13dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000013e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    13e0:	55                   	push   %ebp
    13e1:	89 e5                	mov    %esp,%ebp
    13e3:	57                   	push   %edi
    13e4:	8b 45 10             	mov    0x10(%ebp),%eax
    13e7:	8b 55 08             	mov    0x8(%ebp),%edx
    13ea:	56                   	push   %esi
    13eb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    13ee:	85 c0                	test   %eax,%eax
    13f0:	7e 13                	jle    1405 <memmove+0x25>
    13f2:	01 d0                	add    %edx,%eax
  dst = vdst;
    13f4:	89 d7                	mov    %edx,%edi
    13f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13fd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1400:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1401:	39 f8                	cmp    %edi,%eax
    1403:	75 fb                	jne    1400 <memmove+0x20>
  return vdst;
}
    1405:	5e                   	pop    %esi
    1406:	89 d0                	mov    %edx,%eax
    1408:	5f                   	pop    %edi
    1409:	5d                   	pop    %ebp
    140a:	c3                   	ret    

0000140b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    140b:	b8 01 00 00 00       	mov    $0x1,%eax
    1410:	cd 40                	int    $0x40
    1412:	c3                   	ret    

00001413 <exit>:
SYSCALL(exit)
    1413:	b8 02 00 00 00       	mov    $0x2,%eax
    1418:	cd 40                	int    $0x40
    141a:	c3                   	ret    

0000141b <wait>:
SYSCALL(wait)
    141b:	b8 03 00 00 00       	mov    $0x3,%eax
    1420:	cd 40                	int    $0x40
    1422:	c3                   	ret    

00001423 <pipe>:
SYSCALL(pipe)
    1423:	b8 04 00 00 00       	mov    $0x4,%eax
    1428:	cd 40                	int    $0x40
    142a:	c3                   	ret    

0000142b <read>:
SYSCALL(read)
    142b:	b8 05 00 00 00       	mov    $0x5,%eax
    1430:	cd 40                	int    $0x40
    1432:	c3                   	ret    

00001433 <write>:
SYSCALL(write)
    1433:	b8 10 00 00 00       	mov    $0x10,%eax
    1438:	cd 40                	int    $0x40
    143a:	c3                   	ret    

0000143b <close>:
SYSCALL(close)
    143b:	b8 15 00 00 00       	mov    $0x15,%eax
    1440:	cd 40                	int    $0x40
    1442:	c3                   	ret    

00001443 <kill>:
SYSCALL(kill)
    1443:	b8 06 00 00 00       	mov    $0x6,%eax
    1448:	cd 40                	int    $0x40
    144a:	c3                   	ret    

0000144b <exec>:
SYSCALL(exec)
    144b:	b8 07 00 00 00       	mov    $0x7,%eax
    1450:	cd 40                	int    $0x40
    1452:	c3                   	ret    

00001453 <open>:
SYSCALL(open)
    1453:	b8 0f 00 00 00       	mov    $0xf,%eax
    1458:	cd 40                	int    $0x40
    145a:	c3                   	ret    

0000145b <mknod>:
SYSCALL(mknod)
    145b:	b8 11 00 00 00       	mov    $0x11,%eax
    1460:	cd 40                	int    $0x40
    1462:	c3                   	ret    

00001463 <unlink>:
SYSCALL(unlink)
    1463:	b8 12 00 00 00       	mov    $0x12,%eax
    1468:	cd 40                	int    $0x40
    146a:	c3                   	ret    

0000146b <fstat>:
SYSCALL(fstat)
    146b:	b8 08 00 00 00       	mov    $0x8,%eax
    1470:	cd 40                	int    $0x40
    1472:	c3                   	ret    

00001473 <link>:
SYSCALL(link)
    1473:	b8 13 00 00 00       	mov    $0x13,%eax
    1478:	cd 40                	int    $0x40
    147a:	c3                   	ret    

0000147b <mkdir>:
SYSCALL(mkdir)
    147b:	b8 14 00 00 00       	mov    $0x14,%eax
    1480:	cd 40                	int    $0x40
    1482:	c3                   	ret    

00001483 <chdir>:
SYSCALL(chdir)
    1483:	b8 09 00 00 00       	mov    $0x9,%eax
    1488:	cd 40                	int    $0x40
    148a:	c3                   	ret    

0000148b <dup>:
SYSCALL(dup)
    148b:	b8 0a 00 00 00       	mov    $0xa,%eax
    1490:	cd 40                	int    $0x40
    1492:	c3                   	ret    

00001493 <getpid>:
SYSCALL(getpid)
    1493:	b8 0b 00 00 00       	mov    $0xb,%eax
    1498:	cd 40                	int    $0x40
    149a:	c3                   	ret    

0000149b <sbrk>:
SYSCALL(sbrk)
    149b:	b8 0c 00 00 00       	mov    $0xc,%eax
    14a0:	cd 40                	int    $0x40
    14a2:	c3                   	ret    

000014a3 <sleep>:
SYSCALL(sleep)
    14a3:	b8 0d 00 00 00       	mov    $0xd,%eax
    14a8:	cd 40                	int    $0x40
    14aa:	c3                   	ret    

000014ab <uptime>:
SYSCALL(uptime)
    14ab:	b8 0e 00 00 00       	mov    $0xe,%eax
    14b0:	cd 40                	int    $0x40
    14b2:	c3                   	ret    

000014b3 <getpinfo>:

SYSCALL(getpinfo)
    14b3:	b8 16 00 00 00       	mov    $0x16,%eax
    14b8:	cd 40                	int    $0x40
    14ba:	c3                   	ret    

000014bb <settickets>:
SYSCALL(settickets)
    14bb:	b8 17 00 00 00       	mov    $0x17,%eax
    14c0:	cd 40                	int    $0x40
    14c2:	c3                   	ret    

000014c3 <mprotect>:
SYSCALL(mprotect)
    14c3:	b8 18 00 00 00       	mov    $0x18,%eax
    14c8:	cd 40                	int    $0x40
    14ca:	c3                   	ret    

000014cb <munprotect>:
SYSCALL(munprotect)
    14cb:	b8 19 00 00 00       	mov    $0x19,%eax
    14d0:	cd 40                	int    $0x40
    14d2:	c3                   	ret    
    14d3:	66 90                	xchg   %ax,%ax
    14d5:	66 90                	xchg   %ax,%ax
    14d7:	66 90                	xchg   %ax,%ax
    14d9:	66 90                	xchg   %ax,%ax
    14db:	66 90                	xchg   %ax,%ax
    14dd:	66 90                	xchg   %ax,%ax
    14df:	90                   	nop

000014e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    14e0:	55                   	push   %ebp
    14e1:	89 e5                	mov    %esp,%ebp
    14e3:	57                   	push   %edi
    14e4:	56                   	push   %esi
    14e5:	53                   	push   %ebx
    14e6:	83 ec 3c             	sub    $0x3c,%esp
    14e9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    14ec:	89 d1                	mov    %edx,%ecx
{
    14ee:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    14f1:	85 d2                	test   %edx,%edx
    14f3:	0f 89 7f 00 00 00    	jns    1578 <printint+0x98>
    14f9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    14fd:	74 79                	je     1578 <printint+0x98>
    neg = 1;
    14ff:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1506:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1508:	31 db                	xor    %ebx,%ebx
    150a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    150d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1510:	89 c8                	mov    %ecx,%eax
    1512:	31 d2                	xor    %edx,%edx
    1514:	89 cf                	mov    %ecx,%edi
    1516:	f7 75 c4             	divl   -0x3c(%ebp)
    1519:	0f b6 92 8c 19 00 00 	movzbl 0x198c(%edx),%edx
    1520:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1523:	89 d8                	mov    %ebx,%eax
    1525:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1528:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    152b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    152e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1531:	76 dd                	jbe    1510 <printint+0x30>
  if(neg)
    1533:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1536:	85 c9                	test   %ecx,%ecx
    1538:	74 0c                	je     1546 <printint+0x66>
    buf[i++] = '-';
    153a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    153f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1541:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1546:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1549:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    154d:	eb 07                	jmp    1556 <printint+0x76>
    154f:	90                   	nop
    putc(fd, buf[i]);
    1550:	0f b6 13             	movzbl (%ebx),%edx
    1553:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1556:	83 ec 04             	sub    $0x4,%esp
    1559:	88 55 d7             	mov    %dl,-0x29(%ebp)
    155c:	6a 01                	push   $0x1
    155e:	56                   	push   %esi
    155f:	57                   	push   %edi
    1560:	e8 ce fe ff ff       	call   1433 <write>
  while(--i >= 0)
    1565:	83 c4 10             	add    $0x10,%esp
    1568:	39 de                	cmp    %ebx,%esi
    156a:	75 e4                	jne    1550 <printint+0x70>
}
    156c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    156f:	5b                   	pop    %ebx
    1570:	5e                   	pop    %esi
    1571:	5f                   	pop    %edi
    1572:	5d                   	pop    %ebp
    1573:	c3                   	ret    
    1574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1578:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    157f:	eb 87                	jmp    1508 <printint+0x28>
    1581:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1588:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    158f:	90                   	nop

00001590 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1590:	55                   	push   %ebp
    1591:	89 e5                	mov    %esp,%ebp
    1593:	57                   	push   %edi
    1594:	56                   	push   %esi
    1595:	53                   	push   %ebx
    1596:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1599:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    159c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    159f:	0f b6 13             	movzbl (%ebx),%edx
    15a2:	84 d2                	test   %dl,%dl
    15a4:	74 6a                	je     1610 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    15a6:	8d 45 10             	lea    0x10(%ebp),%eax
    15a9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    15ac:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    15af:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    15b1:	89 45 d0             	mov    %eax,-0x30(%ebp)
    15b4:	eb 36                	jmp    15ec <printf+0x5c>
    15b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15bd:	8d 76 00             	lea    0x0(%esi),%esi
    15c0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    15c3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    15c8:	83 f8 25             	cmp    $0x25,%eax
    15cb:	74 15                	je     15e2 <printf+0x52>
  write(fd, &c, 1);
    15cd:	83 ec 04             	sub    $0x4,%esp
    15d0:	88 55 e7             	mov    %dl,-0x19(%ebp)
    15d3:	6a 01                	push   $0x1
    15d5:	57                   	push   %edi
    15d6:	56                   	push   %esi
    15d7:	e8 57 fe ff ff       	call   1433 <write>
    15dc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    15df:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    15e2:	0f b6 13             	movzbl (%ebx),%edx
    15e5:	83 c3 01             	add    $0x1,%ebx
    15e8:	84 d2                	test   %dl,%dl
    15ea:	74 24                	je     1610 <printf+0x80>
    c = fmt[i] & 0xff;
    15ec:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    15ef:	85 c9                	test   %ecx,%ecx
    15f1:	74 cd                	je     15c0 <printf+0x30>
      }
    } else if(state == '%'){
    15f3:	83 f9 25             	cmp    $0x25,%ecx
    15f6:	75 ea                	jne    15e2 <printf+0x52>
      if(c == 'd'){
    15f8:	83 f8 25             	cmp    $0x25,%eax
    15fb:	0f 84 07 01 00 00    	je     1708 <printf+0x178>
    1601:	83 e8 63             	sub    $0x63,%eax
    1604:	83 f8 15             	cmp    $0x15,%eax
    1607:	77 17                	ja     1620 <printf+0x90>
    1609:	ff 24 85 34 19 00 00 	jmp    *0x1934(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1610:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1613:	5b                   	pop    %ebx
    1614:	5e                   	pop    %esi
    1615:	5f                   	pop    %edi
    1616:	5d                   	pop    %ebp
    1617:	c3                   	ret    
    1618:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    161f:	90                   	nop
  write(fd, &c, 1);
    1620:	83 ec 04             	sub    $0x4,%esp
    1623:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    1626:	6a 01                	push   $0x1
    1628:	57                   	push   %edi
    1629:	56                   	push   %esi
    162a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    162e:	e8 00 fe ff ff       	call   1433 <write>
        putc(fd, c);
    1633:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    1637:	83 c4 0c             	add    $0xc,%esp
    163a:	88 55 e7             	mov    %dl,-0x19(%ebp)
    163d:	6a 01                	push   $0x1
    163f:	57                   	push   %edi
    1640:	56                   	push   %esi
    1641:	e8 ed fd ff ff       	call   1433 <write>
        putc(fd, c);
    1646:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1649:	31 c9                	xor    %ecx,%ecx
    164b:	eb 95                	jmp    15e2 <printf+0x52>
    164d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1650:	83 ec 0c             	sub    $0xc,%esp
    1653:	b9 10 00 00 00       	mov    $0x10,%ecx
    1658:	6a 00                	push   $0x0
    165a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    165d:	8b 10                	mov    (%eax),%edx
    165f:	89 f0                	mov    %esi,%eax
    1661:	e8 7a fe ff ff       	call   14e0 <printint>
        ap++;
    1666:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    166a:	83 c4 10             	add    $0x10,%esp
      state = 0;
    166d:	31 c9                	xor    %ecx,%ecx
    166f:	e9 6e ff ff ff       	jmp    15e2 <printf+0x52>
    1674:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1678:	8b 45 d0             	mov    -0x30(%ebp),%eax
    167b:	8b 10                	mov    (%eax),%edx
        ap++;
    167d:	83 c0 04             	add    $0x4,%eax
    1680:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    1683:	85 d2                	test   %edx,%edx
    1685:	0f 84 8d 00 00 00    	je     1718 <printf+0x188>
        while(*s != 0){
    168b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    168e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    1690:	84 c0                	test   %al,%al
    1692:	0f 84 4a ff ff ff    	je     15e2 <printf+0x52>
    1698:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    169b:	89 d3                	mov    %edx,%ebx
    169d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    16a0:	83 ec 04             	sub    $0x4,%esp
          s++;
    16a3:	83 c3 01             	add    $0x1,%ebx
    16a6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    16a9:	6a 01                	push   $0x1
    16ab:	57                   	push   %edi
    16ac:	56                   	push   %esi
    16ad:	e8 81 fd ff ff       	call   1433 <write>
        while(*s != 0){
    16b2:	0f b6 03             	movzbl (%ebx),%eax
    16b5:	83 c4 10             	add    $0x10,%esp
    16b8:	84 c0                	test   %al,%al
    16ba:	75 e4                	jne    16a0 <printf+0x110>
      state = 0;
    16bc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    16bf:	31 c9                	xor    %ecx,%ecx
    16c1:	e9 1c ff ff ff       	jmp    15e2 <printf+0x52>
    16c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    16cd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    16d0:	83 ec 0c             	sub    $0xc,%esp
    16d3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    16d8:	6a 01                	push   $0x1
    16da:	e9 7b ff ff ff       	jmp    165a <printf+0xca>
    16df:	90                   	nop
        putc(fd, *ap);
    16e0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    16e3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    16e6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    16e8:	6a 01                	push   $0x1
    16ea:	57                   	push   %edi
    16eb:	56                   	push   %esi
        putc(fd, *ap);
    16ec:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    16ef:	e8 3f fd ff ff       	call   1433 <write>
        ap++;
    16f4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    16f8:	83 c4 10             	add    $0x10,%esp
      state = 0;
    16fb:	31 c9                	xor    %ecx,%ecx
    16fd:	e9 e0 fe ff ff       	jmp    15e2 <printf+0x52>
    1702:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    1708:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    170b:	83 ec 04             	sub    $0x4,%esp
    170e:	e9 2a ff ff ff       	jmp    163d <printf+0xad>
    1713:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1717:	90                   	nop
          s = "(null)";
    1718:	ba 2a 19 00 00       	mov    $0x192a,%edx
        while(*s != 0){
    171d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    1720:	b8 28 00 00 00       	mov    $0x28,%eax
    1725:	89 d3                	mov    %edx,%ebx
    1727:	e9 74 ff ff ff       	jmp    16a0 <printf+0x110>
    172c:	66 90                	xchg   %ax,%ax
    172e:	66 90                	xchg   %ax,%ax

00001730 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1730:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1731:	a1 40 1c 00 00       	mov    0x1c40,%eax
{
    1736:	89 e5                	mov    %esp,%ebp
    1738:	57                   	push   %edi
    1739:	56                   	push   %esi
    173a:	53                   	push   %ebx
    173b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    173e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1741:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1748:	89 c2                	mov    %eax,%edx
    174a:	8b 00                	mov    (%eax),%eax
    174c:	39 ca                	cmp    %ecx,%edx
    174e:	73 30                	jae    1780 <free+0x50>
    1750:	39 c1                	cmp    %eax,%ecx
    1752:	72 04                	jb     1758 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1754:	39 c2                	cmp    %eax,%edx
    1756:	72 f0                	jb     1748 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1758:	8b 73 fc             	mov    -0x4(%ebx),%esi
    175b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    175e:	39 f8                	cmp    %edi,%eax
    1760:	74 30                	je     1792 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    1762:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1765:	8b 42 04             	mov    0x4(%edx),%eax
    1768:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    176b:	39 f1                	cmp    %esi,%ecx
    176d:	74 3a                	je     17a9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    176f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    1771:	5b                   	pop    %ebx
  freep = p;
    1772:	89 15 40 1c 00 00    	mov    %edx,0x1c40
}
    1778:	5e                   	pop    %esi
    1779:	5f                   	pop    %edi
    177a:	5d                   	pop    %ebp
    177b:	c3                   	ret    
    177c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1780:	39 c2                	cmp    %eax,%edx
    1782:	72 c4                	jb     1748 <free+0x18>
    1784:	39 c1                	cmp    %eax,%ecx
    1786:	73 c0                	jae    1748 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    1788:	8b 73 fc             	mov    -0x4(%ebx),%esi
    178b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    178e:	39 f8                	cmp    %edi,%eax
    1790:	75 d0                	jne    1762 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    1792:	03 70 04             	add    0x4(%eax),%esi
    1795:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1798:	8b 02                	mov    (%edx),%eax
    179a:	8b 00                	mov    (%eax),%eax
    179c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    179f:	8b 42 04             	mov    0x4(%edx),%eax
    17a2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    17a5:	39 f1                	cmp    %esi,%ecx
    17a7:	75 c6                	jne    176f <free+0x3f>
    p->s.size += bp->s.size;
    17a9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    17ac:	89 15 40 1c 00 00    	mov    %edx,0x1c40
    p->s.size += bp->s.size;
    17b2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    17b5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    17b8:	89 0a                	mov    %ecx,(%edx)
}
    17ba:	5b                   	pop    %ebx
    17bb:	5e                   	pop    %esi
    17bc:	5f                   	pop    %edi
    17bd:	5d                   	pop    %ebp
    17be:	c3                   	ret    
    17bf:	90                   	nop

000017c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    17c0:	55                   	push   %ebp
    17c1:	89 e5                	mov    %esp,%ebp
    17c3:	57                   	push   %edi
    17c4:	56                   	push   %esi
    17c5:	53                   	push   %ebx
    17c6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    17c9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    17cc:	8b 3d 40 1c 00 00    	mov    0x1c40,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    17d2:	8d 70 07             	lea    0x7(%eax),%esi
    17d5:	c1 ee 03             	shr    $0x3,%esi
    17d8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    17db:	85 ff                	test   %edi,%edi
    17dd:	0f 84 9d 00 00 00    	je     1880 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17e3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    17e5:	8b 4a 04             	mov    0x4(%edx),%ecx
    17e8:	39 f1                	cmp    %esi,%ecx
    17ea:	73 6a                	jae    1856 <malloc+0x96>
    17ec:	bb 00 10 00 00       	mov    $0x1000,%ebx
    17f1:	39 de                	cmp    %ebx,%esi
    17f3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    17f6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    17fd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1800:	eb 17                	jmp    1819 <malloc+0x59>
    1802:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1808:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    180a:	8b 48 04             	mov    0x4(%eax),%ecx
    180d:	39 f1                	cmp    %esi,%ecx
    180f:	73 4f                	jae    1860 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1811:	8b 3d 40 1c 00 00    	mov    0x1c40,%edi
    1817:	89 c2                	mov    %eax,%edx
    1819:	39 d7                	cmp    %edx,%edi
    181b:	75 eb                	jne    1808 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    181d:	83 ec 0c             	sub    $0xc,%esp
    1820:	ff 75 e4             	push   -0x1c(%ebp)
    1823:	e8 73 fc ff ff       	call   149b <sbrk>
  if(p == (char*)-1)
    1828:	83 c4 10             	add    $0x10,%esp
    182b:	83 f8 ff             	cmp    $0xffffffff,%eax
    182e:	74 1c                	je     184c <malloc+0x8c>
  hp->s.size = nu;
    1830:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1833:	83 ec 0c             	sub    $0xc,%esp
    1836:	83 c0 08             	add    $0x8,%eax
    1839:	50                   	push   %eax
    183a:	e8 f1 fe ff ff       	call   1730 <free>
  return freep;
    183f:	8b 15 40 1c 00 00    	mov    0x1c40,%edx
      if((p = morecore(nunits)) == 0)
    1845:	83 c4 10             	add    $0x10,%esp
    1848:	85 d2                	test   %edx,%edx
    184a:	75 bc                	jne    1808 <malloc+0x48>
        return 0;
  }
}
    184c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    184f:	31 c0                	xor    %eax,%eax
}
    1851:	5b                   	pop    %ebx
    1852:	5e                   	pop    %esi
    1853:	5f                   	pop    %edi
    1854:	5d                   	pop    %ebp
    1855:	c3                   	ret    
    if(p->s.size >= nunits){
    1856:	89 d0                	mov    %edx,%eax
    1858:	89 fa                	mov    %edi,%edx
    185a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1860:	39 ce                	cmp    %ecx,%esi
    1862:	74 4c                	je     18b0 <malloc+0xf0>
        p->s.size -= nunits;
    1864:	29 f1                	sub    %esi,%ecx
    1866:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1869:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    186c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    186f:	89 15 40 1c 00 00    	mov    %edx,0x1c40
}
    1875:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1878:	83 c0 08             	add    $0x8,%eax
}
    187b:	5b                   	pop    %ebx
    187c:	5e                   	pop    %esi
    187d:	5f                   	pop    %edi
    187e:	5d                   	pop    %ebp
    187f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    1880:	c7 05 40 1c 00 00 44 	movl   $0x1c44,0x1c40
    1887:	1c 00 00 
    base.s.size = 0;
    188a:	bf 44 1c 00 00       	mov    $0x1c44,%edi
    base.s.ptr = freep = prevp = &base;
    188f:	c7 05 44 1c 00 00 44 	movl   $0x1c44,0x1c44
    1896:	1c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1899:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    189b:	c7 05 48 1c 00 00 00 	movl   $0x0,0x1c48
    18a2:	00 00 00 
    if(p->s.size >= nunits){
    18a5:	e9 42 ff ff ff       	jmp    17ec <malloc+0x2c>
    18aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    18b0:	8b 08                	mov    (%eax),%ecx
    18b2:	89 0a                	mov    %ecx,(%edx)
    18b4:	eb b9                	jmp    186f <malloc+0xaf>
