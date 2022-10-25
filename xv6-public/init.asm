
_init:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	push   -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	53                   	push   %ebx
    100e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
    100f:	83 ec 08             	sub    $0x8,%esp
    1012:	6a 02                	push   $0x2
    1014:	68 d8 17 00 00       	push   $0x17d8
    1019:	e8 65 03 00 00       	call   1383 <open>
    101e:	83 c4 10             	add    $0x10,%esp
    1021:	85 c0                	test   %eax,%eax
    1023:	0f 88 9f 00 00 00    	js     10c8 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
    1029:	83 ec 0c             	sub    $0xc,%esp
    102c:	6a 00                	push   $0x0
    102e:	e8 88 03 00 00       	call   13bb <dup>
  dup(0);  // stderr
    1033:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    103a:	e8 7c 03 00 00       	call   13bb <dup>
    103f:	83 c4 10             	add    $0x10,%esp
    1042:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
    1048:	83 ec 08             	sub    $0x8,%esp
    104b:	68 e0 17 00 00       	push   $0x17e0
    1050:	6a 01                	push   $0x1
    1052:	e8 59 04 00 00       	call   14b0 <printf>
    pid = fork();
    1057:	e8 df 02 00 00       	call   133b <fork>
    if(pid < 0){
    105c:	83 c4 10             	add    $0x10,%esp
    pid = fork();
    105f:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
    1061:	85 c0                	test   %eax,%eax
    1063:	78 2c                	js     1091 <main+0x91>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
    1065:	74 3d                	je     10a4 <main+0xa4>
    1067:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    106e:	66 90                	xchg   %ax,%ax
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
    1070:	e8 d6 02 00 00       	call   134b <wait>
    1075:	85 c0                	test   %eax,%eax
    1077:	78 cf                	js     1048 <main+0x48>
    1079:	39 c3                	cmp    %eax,%ebx
    107b:	74 cb                	je     1048 <main+0x48>
      printf(1, "zombie!\n");
    107d:	83 ec 08             	sub    $0x8,%esp
    1080:	68 1f 18 00 00       	push   $0x181f
    1085:	6a 01                	push   $0x1
    1087:	e8 24 04 00 00       	call   14b0 <printf>
    108c:	83 c4 10             	add    $0x10,%esp
    108f:	eb df                	jmp    1070 <main+0x70>
      printf(1, "init: fork failed\n");
    1091:	53                   	push   %ebx
    1092:	53                   	push   %ebx
    1093:	68 f3 17 00 00       	push   $0x17f3
    1098:	6a 01                	push   $0x1
    109a:	e8 11 04 00 00       	call   14b0 <printf>
      exit();
    109f:	e8 9f 02 00 00       	call   1343 <exit>
      exec("sh", argv);
    10a4:	50                   	push   %eax
    10a5:	50                   	push   %eax
    10a6:	68 34 1b 00 00       	push   $0x1b34
    10ab:	68 06 18 00 00       	push   $0x1806
    10b0:	e8 c6 02 00 00       	call   137b <exec>
      printf(1, "init: exec sh failed\n");
    10b5:	5a                   	pop    %edx
    10b6:	59                   	pop    %ecx
    10b7:	68 09 18 00 00       	push   $0x1809
    10bc:	6a 01                	push   $0x1
    10be:	e8 ed 03 00 00       	call   14b0 <printf>
      exit();
    10c3:	e8 7b 02 00 00       	call   1343 <exit>
    mknod("console", 1, 1);
    10c8:	50                   	push   %eax
    10c9:	6a 01                	push   $0x1
    10cb:	6a 01                	push   $0x1
    10cd:	68 d8 17 00 00       	push   $0x17d8
    10d2:	e8 b4 02 00 00       	call   138b <mknod>
    open("console", O_RDWR);
    10d7:	58                   	pop    %eax
    10d8:	5a                   	pop    %edx
    10d9:	6a 02                	push   $0x2
    10db:	68 d8 17 00 00       	push   $0x17d8
    10e0:	e8 9e 02 00 00       	call   1383 <open>
    10e5:	83 c4 10             	add    $0x10,%esp
    10e8:	e9 3c ff ff ff       	jmp    1029 <main+0x29>
    10ed:	66 90                	xchg   %ax,%ax
    10ef:	90                   	nop

000010f0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    10f0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    10f1:	31 c0                	xor    %eax,%eax
{
    10f3:	89 e5                	mov    %esp,%ebp
    10f5:	53                   	push   %ebx
    10f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
    10f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    10fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1100:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1104:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1107:	83 c0 01             	add    $0x1,%eax
    110a:	84 d2                	test   %dl,%dl
    110c:	75 f2                	jne    1100 <strcpy+0x10>
    ;
  return os;
}
    110e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1111:	89 c8                	mov    %ecx,%eax
    1113:	c9                   	leave  
    1114:	c3                   	ret    
    1115:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    111c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001120 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	53                   	push   %ebx
    1124:	8b 55 08             	mov    0x8(%ebp),%edx
    1127:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    112a:	0f b6 02             	movzbl (%edx),%eax
    112d:	84 c0                	test   %al,%al
    112f:	75 17                	jne    1148 <strcmp+0x28>
    1131:	eb 3a                	jmp    116d <strcmp+0x4d>
    1133:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1137:	90                   	nop
    1138:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    113c:	83 c2 01             	add    $0x1,%edx
    113f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    1142:	84 c0                	test   %al,%al
    1144:	74 1a                	je     1160 <strcmp+0x40>
    p++, q++;
    1146:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    1148:	0f b6 19             	movzbl (%ecx),%ebx
    114b:	38 c3                	cmp    %al,%bl
    114d:	74 e9                	je     1138 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    114f:	29 d8                	sub    %ebx,%eax
}
    1151:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1154:	c9                   	leave  
    1155:	c3                   	ret    
    1156:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    115d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    1160:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    1164:	31 c0                	xor    %eax,%eax
    1166:	29 d8                	sub    %ebx,%eax
}
    1168:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    116b:	c9                   	leave  
    116c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    116d:	0f b6 19             	movzbl (%ecx),%ebx
    1170:	31 c0                	xor    %eax,%eax
    1172:	eb db                	jmp    114f <strcmp+0x2f>
    1174:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    117b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    117f:	90                   	nop

00001180 <strlen>:

uint
strlen(const char *s)
{
    1180:	55                   	push   %ebp
    1181:	89 e5                	mov    %esp,%ebp
    1183:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    1186:	80 3a 00             	cmpb   $0x0,(%edx)
    1189:	74 15                	je     11a0 <strlen+0x20>
    118b:	31 c0                	xor    %eax,%eax
    118d:	8d 76 00             	lea    0x0(%esi),%esi
    1190:	83 c0 01             	add    $0x1,%eax
    1193:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    1197:	89 c1                	mov    %eax,%ecx
    1199:	75 f5                	jne    1190 <strlen+0x10>
    ;
  return n;
}
    119b:	89 c8                	mov    %ecx,%eax
    119d:	5d                   	pop    %ebp
    119e:	c3                   	ret    
    119f:	90                   	nop
  for(n = 0; s[n]; n++)
    11a0:	31 c9                	xor    %ecx,%ecx
}
    11a2:	5d                   	pop    %ebp
    11a3:	89 c8                	mov    %ecx,%eax
    11a5:	c3                   	ret    
    11a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11ad:	8d 76 00             	lea    0x0(%esi),%esi

000011b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	57                   	push   %edi
    11b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    11b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11ba:	8b 45 0c             	mov    0xc(%ebp),%eax
    11bd:	89 d7                	mov    %edx,%edi
    11bf:	fc                   	cld    
    11c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    11c2:	8b 7d fc             	mov    -0x4(%ebp),%edi
    11c5:	89 d0                	mov    %edx,%eax
    11c7:	c9                   	leave  
    11c8:	c3                   	ret    
    11c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000011d0 <strchr>:

char*
strchr(const char *s, char c)
{
    11d0:	55                   	push   %ebp
    11d1:	89 e5                	mov    %esp,%ebp
    11d3:	8b 45 08             	mov    0x8(%ebp),%eax
    11d6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    11da:	0f b6 10             	movzbl (%eax),%edx
    11dd:	84 d2                	test   %dl,%dl
    11df:	75 12                	jne    11f3 <strchr+0x23>
    11e1:	eb 1d                	jmp    1200 <strchr+0x30>
    11e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11e7:	90                   	nop
    11e8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    11ec:	83 c0 01             	add    $0x1,%eax
    11ef:	84 d2                	test   %dl,%dl
    11f1:	74 0d                	je     1200 <strchr+0x30>
    if(*s == c)
    11f3:	38 d1                	cmp    %dl,%cl
    11f5:	75 f1                	jne    11e8 <strchr+0x18>
      return (char*)s;
  return 0;
}
    11f7:	5d                   	pop    %ebp
    11f8:	c3                   	ret    
    11f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1200:	31 c0                	xor    %eax,%eax
}
    1202:	5d                   	pop    %ebp
    1203:	c3                   	ret    
    1204:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    120b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    120f:	90                   	nop

00001210 <gets>:

char*
gets(char *buf, int max)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	57                   	push   %edi
    1214:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    1215:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    1218:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    1219:	31 db                	xor    %ebx,%ebx
{
    121b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    121e:	eb 27                	jmp    1247 <gets+0x37>
    cc = read(0, &c, 1);
    1220:	83 ec 04             	sub    $0x4,%esp
    1223:	6a 01                	push   $0x1
    1225:	57                   	push   %edi
    1226:	6a 00                	push   $0x0
    1228:	e8 2e 01 00 00       	call   135b <read>
    if(cc < 1)
    122d:	83 c4 10             	add    $0x10,%esp
    1230:	85 c0                	test   %eax,%eax
    1232:	7e 1d                	jle    1251 <gets+0x41>
      break;
    buf[i++] = c;
    1234:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1238:	8b 55 08             	mov    0x8(%ebp),%edx
    123b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    123f:	3c 0a                	cmp    $0xa,%al
    1241:	74 1d                	je     1260 <gets+0x50>
    1243:	3c 0d                	cmp    $0xd,%al
    1245:	74 19                	je     1260 <gets+0x50>
  for(i=0; i+1 < max; ){
    1247:	89 de                	mov    %ebx,%esi
    1249:	83 c3 01             	add    $0x1,%ebx
    124c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    124f:	7c cf                	jl     1220 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    1251:	8b 45 08             	mov    0x8(%ebp),%eax
    1254:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1258:	8d 65 f4             	lea    -0xc(%ebp),%esp
    125b:	5b                   	pop    %ebx
    125c:	5e                   	pop    %esi
    125d:	5f                   	pop    %edi
    125e:	5d                   	pop    %ebp
    125f:	c3                   	ret    
  buf[i] = '\0';
    1260:	8b 45 08             	mov    0x8(%ebp),%eax
    1263:	89 de                	mov    %ebx,%esi
    1265:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    1269:	8d 65 f4             	lea    -0xc(%ebp),%esp
    126c:	5b                   	pop    %ebx
    126d:	5e                   	pop    %esi
    126e:	5f                   	pop    %edi
    126f:	5d                   	pop    %ebp
    1270:	c3                   	ret    
    1271:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1278:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    127f:	90                   	nop

00001280 <stat>:

int
stat(const char *n, struct stat *st)
{
    1280:	55                   	push   %ebp
    1281:	89 e5                	mov    %esp,%ebp
    1283:	56                   	push   %esi
    1284:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1285:	83 ec 08             	sub    $0x8,%esp
    1288:	6a 00                	push   $0x0
    128a:	ff 75 08             	push   0x8(%ebp)
    128d:	e8 f1 00 00 00       	call   1383 <open>
  if(fd < 0)
    1292:	83 c4 10             	add    $0x10,%esp
    1295:	85 c0                	test   %eax,%eax
    1297:	78 27                	js     12c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1299:	83 ec 08             	sub    $0x8,%esp
    129c:	ff 75 0c             	push   0xc(%ebp)
    129f:	89 c3                	mov    %eax,%ebx
    12a1:	50                   	push   %eax
    12a2:	e8 f4 00 00 00       	call   139b <fstat>
  close(fd);
    12a7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    12aa:	89 c6                	mov    %eax,%esi
  close(fd);
    12ac:	e8 ba 00 00 00       	call   136b <close>
  return r;
    12b1:	83 c4 10             	add    $0x10,%esp
}
    12b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    12b7:	89 f0                	mov    %esi,%eax
    12b9:	5b                   	pop    %ebx
    12ba:	5e                   	pop    %esi
    12bb:	5d                   	pop    %ebp
    12bc:	c3                   	ret    
    12bd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    12c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
    12c5:	eb ed                	jmp    12b4 <stat+0x34>
    12c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12ce:	66 90                	xchg   %ax,%ax

000012d0 <atoi>:

int
atoi(const char *s)
{
    12d0:	55                   	push   %ebp
    12d1:	89 e5                	mov    %esp,%ebp
    12d3:	53                   	push   %ebx
    12d4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12d7:	0f be 02             	movsbl (%edx),%eax
    12da:	8d 48 d0             	lea    -0x30(%eax),%ecx
    12dd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    12e0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    12e5:	77 1e                	ja     1305 <atoi+0x35>
    12e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12ee:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    12f0:	83 c2 01             	add    $0x1,%edx
    12f3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    12f6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    12fa:	0f be 02             	movsbl (%edx),%eax
    12fd:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1300:	80 fb 09             	cmp    $0x9,%bl
    1303:	76 eb                	jbe    12f0 <atoi+0x20>
  return n;
}
    1305:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1308:	89 c8                	mov    %ecx,%eax
    130a:	c9                   	leave  
    130b:	c3                   	ret    
    130c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001310 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1310:	55                   	push   %ebp
    1311:	89 e5                	mov    %esp,%ebp
    1313:	57                   	push   %edi
    1314:	8b 45 10             	mov    0x10(%ebp),%eax
    1317:	8b 55 08             	mov    0x8(%ebp),%edx
    131a:	56                   	push   %esi
    131b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    131e:	85 c0                	test   %eax,%eax
    1320:	7e 13                	jle    1335 <memmove+0x25>
    1322:	01 d0                	add    %edx,%eax
  dst = vdst;
    1324:	89 d7                	mov    %edx,%edi
    1326:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    132d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1330:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1331:	39 f8                	cmp    %edi,%eax
    1333:	75 fb                	jne    1330 <memmove+0x20>
  return vdst;
}
    1335:	5e                   	pop    %esi
    1336:	89 d0                	mov    %edx,%eax
    1338:	5f                   	pop    %edi
    1339:	5d                   	pop    %ebp
    133a:	c3                   	ret    

0000133b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    133b:	b8 01 00 00 00       	mov    $0x1,%eax
    1340:	cd 40                	int    $0x40
    1342:	c3                   	ret    

00001343 <exit>:
SYSCALL(exit)
    1343:	b8 02 00 00 00       	mov    $0x2,%eax
    1348:	cd 40                	int    $0x40
    134a:	c3                   	ret    

0000134b <wait>:
SYSCALL(wait)
    134b:	b8 03 00 00 00       	mov    $0x3,%eax
    1350:	cd 40                	int    $0x40
    1352:	c3                   	ret    

00001353 <pipe>:
SYSCALL(pipe)
    1353:	b8 04 00 00 00       	mov    $0x4,%eax
    1358:	cd 40                	int    $0x40
    135a:	c3                   	ret    

0000135b <read>:
SYSCALL(read)
    135b:	b8 05 00 00 00       	mov    $0x5,%eax
    1360:	cd 40                	int    $0x40
    1362:	c3                   	ret    

00001363 <write>:
SYSCALL(write)
    1363:	b8 10 00 00 00       	mov    $0x10,%eax
    1368:	cd 40                	int    $0x40
    136a:	c3                   	ret    

0000136b <close>:
SYSCALL(close)
    136b:	b8 15 00 00 00       	mov    $0x15,%eax
    1370:	cd 40                	int    $0x40
    1372:	c3                   	ret    

00001373 <kill>:
SYSCALL(kill)
    1373:	b8 06 00 00 00       	mov    $0x6,%eax
    1378:	cd 40                	int    $0x40
    137a:	c3                   	ret    

0000137b <exec>:
SYSCALL(exec)
    137b:	b8 07 00 00 00       	mov    $0x7,%eax
    1380:	cd 40                	int    $0x40
    1382:	c3                   	ret    

00001383 <open>:
SYSCALL(open)
    1383:	b8 0f 00 00 00       	mov    $0xf,%eax
    1388:	cd 40                	int    $0x40
    138a:	c3                   	ret    

0000138b <mknod>:
SYSCALL(mknod)
    138b:	b8 11 00 00 00       	mov    $0x11,%eax
    1390:	cd 40                	int    $0x40
    1392:	c3                   	ret    

00001393 <unlink>:
SYSCALL(unlink)
    1393:	b8 12 00 00 00       	mov    $0x12,%eax
    1398:	cd 40                	int    $0x40
    139a:	c3                   	ret    

0000139b <fstat>:
SYSCALL(fstat)
    139b:	b8 08 00 00 00       	mov    $0x8,%eax
    13a0:	cd 40                	int    $0x40
    13a2:	c3                   	ret    

000013a3 <link>:
SYSCALL(link)
    13a3:	b8 13 00 00 00       	mov    $0x13,%eax
    13a8:	cd 40                	int    $0x40
    13aa:	c3                   	ret    

000013ab <mkdir>:
SYSCALL(mkdir)
    13ab:	b8 14 00 00 00       	mov    $0x14,%eax
    13b0:	cd 40                	int    $0x40
    13b2:	c3                   	ret    

000013b3 <chdir>:
SYSCALL(chdir)
    13b3:	b8 09 00 00 00       	mov    $0x9,%eax
    13b8:	cd 40                	int    $0x40
    13ba:	c3                   	ret    

000013bb <dup>:
SYSCALL(dup)
    13bb:	b8 0a 00 00 00       	mov    $0xa,%eax
    13c0:	cd 40                	int    $0x40
    13c2:	c3                   	ret    

000013c3 <getpid>:
SYSCALL(getpid)
    13c3:	b8 0b 00 00 00       	mov    $0xb,%eax
    13c8:	cd 40                	int    $0x40
    13ca:	c3                   	ret    

000013cb <sbrk>:
SYSCALL(sbrk)
    13cb:	b8 0c 00 00 00       	mov    $0xc,%eax
    13d0:	cd 40                	int    $0x40
    13d2:	c3                   	ret    

000013d3 <sleep>:
SYSCALL(sleep)
    13d3:	b8 0d 00 00 00       	mov    $0xd,%eax
    13d8:	cd 40                	int    $0x40
    13da:	c3                   	ret    

000013db <uptime>:
SYSCALL(uptime)
    13db:	b8 0e 00 00 00       	mov    $0xe,%eax
    13e0:	cd 40                	int    $0x40
    13e2:	c3                   	ret    

000013e3 <getpinfo>:

SYSCALL(getpinfo)
    13e3:	b8 16 00 00 00       	mov    $0x16,%eax
    13e8:	cd 40                	int    $0x40
    13ea:	c3                   	ret    

000013eb <settickets>:
SYSCALL(settickets)
    13eb:	b8 17 00 00 00       	mov    $0x17,%eax
    13f0:	cd 40                	int    $0x40
    13f2:	c3                   	ret    
    13f3:	66 90                	xchg   %ax,%ax
    13f5:	66 90                	xchg   %ax,%ax
    13f7:	66 90                	xchg   %ax,%ax
    13f9:	66 90                	xchg   %ax,%ax
    13fb:	66 90                	xchg   %ax,%ax
    13fd:	66 90                	xchg   %ax,%ax
    13ff:	90                   	nop

00001400 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1400:	55                   	push   %ebp
    1401:	89 e5                	mov    %esp,%ebp
    1403:	57                   	push   %edi
    1404:	56                   	push   %esi
    1405:	53                   	push   %ebx
    1406:	83 ec 3c             	sub    $0x3c,%esp
    1409:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    140c:	89 d1                	mov    %edx,%ecx
{
    140e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1411:	85 d2                	test   %edx,%edx
    1413:	0f 89 7f 00 00 00    	jns    1498 <printint+0x98>
    1419:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    141d:	74 79                	je     1498 <printint+0x98>
    neg = 1;
    141f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1426:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1428:	31 db                	xor    %ebx,%ebx
    142a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    142d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1430:	89 c8                	mov    %ecx,%eax
    1432:	31 d2                	xor    %edx,%edx
    1434:	89 cf                	mov    %ecx,%edi
    1436:	f7 75 c4             	divl   -0x3c(%ebp)
    1439:	0f b6 92 88 18 00 00 	movzbl 0x1888(%edx),%edx
    1440:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1443:	89 d8                	mov    %ebx,%eax
    1445:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1448:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    144b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    144e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1451:	76 dd                	jbe    1430 <printint+0x30>
  if(neg)
    1453:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1456:	85 c9                	test   %ecx,%ecx
    1458:	74 0c                	je     1466 <printint+0x66>
    buf[i++] = '-';
    145a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    145f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1461:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1466:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1469:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    146d:	eb 07                	jmp    1476 <printint+0x76>
    146f:	90                   	nop
    putc(fd, buf[i]);
    1470:	0f b6 13             	movzbl (%ebx),%edx
    1473:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1476:	83 ec 04             	sub    $0x4,%esp
    1479:	88 55 d7             	mov    %dl,-0x29(%ebp)
    147c:	6a 01                	push   $0x1
    147e:	56                   	push   %esi
    147f:	57                   	push   %edi
    1480:	e8 de fe ff ff       	call   1363 <write>
  while(--i >= 0)
    1485:	83 c4 10             	add    $0x10,%esp
    1488:	39 de                	cmp    %ebx,%esi
    148a:	75 e4                	jne    1470 <printint+0x70>
}
    148c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    148f:	5b                   	pop    %ebx
    1490:	5e                   	pop    %esi
    1491:	5f                   	pop    %edi
    1492:	5d                   	pop    %ebp
    1493:	c3                   	ret    
    1494:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1498:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    149f:	eb 87                	jmp    1428 <printint+0x28>
    14a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14af:	90                   	nop

000014b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    14b0:	55                   	push   %ebp
    14b1:	89 e5                	mov    %esp,%ebp
    14b3:	57                   	push   %edi
    14b4:	56                   	push   %esi
    14b5:	53                   	push   %ebx
    14b6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    14bc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    14bf:	0f b6 13             	movzbl (%ebx),%edx
    14c2:	84 d2                	test   %dl,%dl
    14c4:	74 6a                	je     1530 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    14c6:	8d 45 10             	lea    0x10(%ebp),%eax
    14c9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    14cc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    14cf:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    14d1:	89 45 d0             	mov    %eax,-0x30(%ebp)
    14d4:	eb 36                	jmp    150c <printf+0x5c>
    14d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14dd:	8d 76 00             	lea    0x0(%esi),%esi
    14e0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    14e3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    14e8:	83 f8 25             	cmp    $0x25,%eax
    14eb:	74 15                	je     1502 <printf+0x52>
  write(fd, &c, 1);
    14ed:	83 ec 04             	sub    $0x4,%esp
    14f0:	88 55 e7             	mov    %dl,-0x19(%ebp)
    14f3:	6a 01                	push   $0x1
    14f5:	57                   	push   %edi
    14f6:	56                   	push   %esi
    14f7:	e8 67 fe ff ff       	call   1363 <write>
    14fc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    14ff:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1502:	0f b6 13             	movzbl (%ebx),%edx
    1505:	83 c3 01             	add    $0x1,%ebx
    1508:	84 d2                	test   %dl,%dl
    150a:	74 24                	je     1530 <printf+0x80>
    c = fmt[i] & 0xff;
    150c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    150f:	85 c9                	test   %ecx,%ecx
    1511:	74 cd                	je     14e0 <printf+0x30>
      }
    } else if(state == '%'){
    1513:	83 f9 25             	cmp    $0x25,%ecx
    1516:	75 ea                	jne    1502 <printf+0x52>
      if(c == 'd'){
    1518:	83 f8 25             	cmp    $0x25,%eax
    151b:	0f 84 07 01 00 00    	je     1628 <printf+0x178>
    1521:	83 e8 63             	sub    $0x63,%eax
    1524:	83 f8 15             	cmp    $0x15,%eax
    1527:	77 17                	ja     1540 <printf+0x90>
    1529:	ff 24 85 30 18 00 00 	jmp    *0x1830(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1530:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1533:	5b                   	pop    %ebx
    1534:	5e                   	pop    %esi
    1535:	5f                   	pop    %edi
    1536:	5d                   	pop    %ebp
    1537:	c3                   	ret    
    1538:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    153f:	90                   	nop
  write(fd, &c, 1);
    1540:	83 ec 04             	sub    $0x4,%esp
    1543:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    1546:	6a 01                	push   $0x1
    1548:	57                   	push   %edi
    1549:	56                   	push   %esi
    154a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    154e:	e8 10 fe ff ff       	call   1363 <write>
        putc(fd, c);
    1553:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    1557:	83 c4 0c             	add    $0xc,%esp
    155a:	88 55 e7             	mov    %dl,-0x19(%ebp)
    155d:	6a 01                	push   $0x1
    155f:	57                   	push   %edi
    1560:	56                   	push   %esi
    1561:	e8 fd fd ff ff       	call   1363 <write>
        putc(fd, c);
    1566:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1569:	31 c9                	xor    %ecx,%ecx
    156b:	eb 95                	jmp    1502 <printf+0x52>
    156d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1570:	83 ec 0c             	sub    $0xc,%esp
    1573:	b9 10 00 00 00       	mov    $0x10,%ecx
    1578:	6a 00                	push   $0x0
    157a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    157d:	8b 10                	mov    (%eax),%edx
    157f:	89 f0                	mov    %esi,%eax
    1581:	e8 7a fe ff ff       	call   1400 <printint>
        ap++;
    1586:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    158a:	83 c4 10             	add    $0x10,%esp
      state = 0;
    158d:	31 c9                	xor    %ecx,%ecx
    158f:	e9 6e ff ff ff       	jmp    1502 <printf+0x52>
    1594:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1598:	8b 45 d0             	mov    -0x30(%ebp),%eax
    159b:	8b 10                	mov    (%eax),%edx
        ap++;
    159d:	83 c0 04             	add    $0x4,%eax
    15a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    15a3:	85 d2                	test   %edx,%edx
    15a5:	0f 84 8d 00 00 00    	je     1638 <printf+0x188>
        while(*s != 0){
    15ab:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    15ae:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    15b0:	84 c0                	test   %al,%al
    15b2:	0f 84 4a ff ff ff    	je     1502 <printf+0x52>
    15b8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    15bb:	89 d3                	mov    %edx,%ebx
    15bd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    15c0:	83 ec 04             	sub    $0x4,%esp
          s++;
    15c3:	83 c3 01             	add    $0x1,%ebx
    15c6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    15c9:	6a 01                	push   $0x1
    15cb:	57                   	push   %edi
    15cc:	56                   	push   %esi
    15cd:	e8 91 fd ff ff       	call   1363 <write>
        while(*s != 0){
    15d2:	0f b6 03             	movzbl (%ebx),%eax
    15d5:	83 c4 10             	add    $0x10,%esp
    15d8:	84 c0                	test   %al,%al
    15da:	75 e4                	jne    15c0 <printf+0x110>
      state = 0;
    15dc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    15df:	31 c9                	xor    %ecx,%ecx
    15e1:	e9 1c ff ff ff       	jmp    1502 <printf+0x52>
    15e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15ed:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    15f0:	83 ec 0c             	sub    $0xc,%esp
    15f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    15f8:	6a 01                	push   $0x1
    15fa:	e9 7b ff ff ff       	jmp    157a <printf+0xca>
    15ff:	90                   	nop
        putc(fd, *ap);
    1600:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1603:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1606:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1608:	6a 01                	push   $0x1
    160a:	57                   	push   %edi
    160b:	56                   	push   %esi
        putc(fd, *ap);
    160c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    160f:	e8 4f fd ff ff       	call   1363 <write>
        ap++;
    1614:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1618:	83 c4 10             	add    $0x10,%esp
      state = 0;
    161b:	31 c9                	xor    %ecx,%ecx
    161d:	e9 e0 fe ff ff       	jmp    1502 <printf+0x52>
    1622:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    1628:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    162b:	83 ec 04             	sub    $0x4,%esp
    162e:	e9 2a ff ff ff       	jmp    155d <printf+0xad>
    1633:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1637:	90                   	nop
          s = "(null)";
    1638:	ba 28 18 00 00       	mov    $0x1828,%edx
        while(*s != 0){
    163d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    1640:	b8 28 00 00 00       	mov    $0x28,%eax
    1645:	89 d3                	mov    %edx,%ebx
    1647:	e9 74 ff ff ff       	jmp    15c0 <printf+0x110>
    164c:	66 90                	xchg   %ax,%ax
    164e:	66 90                	xchg   %ax,%ax

00001650 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1650:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1651:	a1 3c 1b 00 00       	mov    0x1b3c,%eax
{
    1656:	89 e5                	mov    %esp,%ebp
    1658:	57                   	push   %edi
    1659:	56                   	push   %esi
    165a:	53                   	push   %ebx
    165b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    165e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1661:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1668:	89 c2                	mov    %eax,%edx
    166a:	8b 00                	mov    (%eax),%eax
    166c:	39 ca                	cmp    %ecx,%edx
    166e:	73 30                	jae    16a0 <free+0x50>
    1670:	39 c1                	cmp    %eax,%ecx
    1672:	72 04                	jb     1678 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1674:	39 c2                	cmp    %eax,%edx
    1676:	72 f0                	jb     1668 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1678:	8b 73 fc             	mov    -0x4(%ebx),%esi
    167b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    167e:	39 f8                	cmp    %edi,%eax
    1680:	74 30                	je     16b2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    1682:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1685:	8b 42 04             	mov    0x4(%edx),%eax
    1688:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    168b:	39 f1                	cmp    %esi,%ecx
    168d:	74 3a                	je     16c9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    168f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    1691:	5b                   	pop    %ebx
  freep = p;
    1692:	89 15 3c 1b 00 00    	mov    %edx,0x1b3c
}
    1698:	5e                   	pop    %esi
    1699:	5f                   	pop    %edi
    169a:	5d                   	pop    %ebp
    169b:	c3                   	ret    
    169c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16a0:	39 c2                	cmp    %eax,%edx
    16a2:	72 c4                	jb     1668 <free+0x18>
    16a4:	39 c1                	cmp    %eax,%ecx
    16a6:	73 c0                	jae    1668 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    16a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    16ae:	39 f8                	cmp    %edi,%eax
    16b0:	75 d0                	jne    1682 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    16b2:	03 70 04             	add    0x4(%eax),%esi
    16b5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    16b8:	8b 02                	mov    (%edx),%eax
    16ba:	8b 00                	mov    (%eax),%eax
    16bc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    16bf:	8b 42 04             	mov    0x4(%edx),%eax
    16c2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    16c5:	39 f1                	cmp    %esi,%ecx
    16c7:	75 c6                	jne    168f <free+0x3f>
    p->s.size += bp->s.size;
    16c9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    16cc:	89 15 3c 1b 00 00    	mov    %edx,0x1b3c
    p->s.size += bp->s.size;
    16d2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    16d5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    16d8:	89 0a                	mov    %ecx,(%edx)
}
    16da:	5b                   	pop    %ebx
    16db:	5e                   	pop    %esi
    16dc:	5f                   	pop    %edi
    16dd:	5d                   	pop    %ebp
    16de:	c3                   	ret    
    16df:	90                   	nop

000016e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    16e0:	55                   	push   %ebp
    16e1:	89 e5                	mov    %esp,%ebp
    16e3:	57                   	push   %edi
    16e4:	56                   	push   %esi
    16e5:	53                   	push   %ebx
    16e6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    16ec:	8b 3d 3c 1b 00 00    	mov    0x1b3c,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16f2:	8d 70 07             	lea    0x7(%eax),%esi
    16f5:	c1 ee 03             	shr    $0x3,%esi
    16f8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    16fb:	85 ff                	test   %edi,%edi
    16fd:	0f 84 9d 00 00 00    	je     17a0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1703:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1705:	8b 4a 04             	mov    0x4(%edx),%ecx
    1708:	39 f1                	cmp    %esi,%ecx
    170a:	73 6a                	jae    1776 <malloc+0x96>
    170c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1711:	39 de                	cmp    %ebx,%esi
    1713:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1716:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    171d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1720:	eb 17                	jmp    1739 <malloc+0x59>
    1722:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1728:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    172a:	8b 48 04             	mov    0x4(%eax),%ecx
    172d:	39 f1                	cmp    %esi,%ecx
    172f:	73 4f                	jae    1780 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1731:	8b 3d 3c 1b 00 00    	mov    0x1b3c,%edi
    1737:	89 c2                	mov    %eax,%edx
    1739:	39 d7                	cmp    %edx,%edi
    173b:	75 eb                	jne    1728 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    173d:	83 ec 0c             	sub    $0xc,%esp
    1740:	ff 75 e4             	push   -0x1c(%ebp)
    1743:	e8 83 fc ff ff       	call   13cb <sbrk>
  if(p == (char*)-1)
    1748:	83 c4 10             	add    $0x10,%esp
    174b:	83 f8 ff             	cmp    $0xffffffff,%eax
    174e:	74 1c                	je     176c <malloc+0x8c>
  hp->s.size = nu;
    1750:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1753:	83 ec 0c             	sub    $0xc,%esp
    1756:	83 c0 08             	add    $0x8,%eax
    1759:	50                   	push   %eax
    175a:	e8 f1 fe ff ff       	call   1650 <free>
  return freep;
    175f:	8b 15 3c 1b 00 00    	mov    0x1b3c,%edx
      if((p = morecore(nunits)) == 0)
    1765:	83 c4 10             	add    $0x10,%esp
    1768:	85 d2                	test   %edx,%edx
    176a:	75 bc                	jne    1728 <malloc+0x48>
        return 0;
  }
}
    176c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    176f:	31 c0                	xor    %eax,%eax
}
    1771:	5b                   	pop    %ebx
    1772:	5e                   	pop    %esi
    1773:	5f                   	pop    %edi
    1774:	5d                   	pop    %ebp
    1775:	c3                   	ret    
    if(p->s.size >= nunits){
    1776:	89 d0                	mov    %edx,%eax
    1778:	89 fa                	mov    %edi,%edx
    177a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1780:	39 ce                	cmp    %ecx,%esi
    1782:	74 4c                	je     17d0 <malloc+0xf0>
        p->s.size -= nunits;
    1784:	29 f1                	sub    %esi,%ecx
    1786:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1789:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    178c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    178f:	89 15 3c 1b 00 00    	mov    %edx,0x1b3c
}
    1795:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1798:	83 c0 08             	add    $0x8,%eax
}
    179b:	5b                   	pop    %ebx
    179c:	5e                   	pop    %esi
    179d:	5f                   	pop    %edi
    179e:	5d                   	pop    %ebp
    179f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    17a0:	c7 05 3c 1b 00 00 40 	movl   $0x1b40,0x1b3c
    17a7:	1b 00 00 
    base.s.size = 0;
    17aa:	bf 40 1b 00 00       	mov    $0x1b40,%edi
    base.s.ptr = freep = prevp = &base;
    17af:	c7 05 40 1b 00 00 40 	movl   $0x1b40,0x1b40
    17b6:	1b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17b9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    17bb:	c7 05 44 1b 00 00 00 	movl   $0x0,0x1b44
    17c2:	00 00 00 
    if(p->s.size >= nunits){
    17c5:	e9 42 ff ff ff       	jmp    170c <malloc+0x2c>
    17ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    17d0:	8b 08                	mov    (%eax),%ecx
    17d2:	89 0a                	mov    %ecx,(%edx)
    17d4:	eb b9                	jmp    178f <malloc+0xaf>
