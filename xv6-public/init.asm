
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
    1014:	68 e8 17 00 00       	push   $0x17e8
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
    104b:	68 f0 17 00 00       	push   $0x17f0
    1050:	6a 01                	push   $0x1
    1052:	e8 69 04 00 00       	call   14c0 <printf>
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
    1080:	68 2f 18 00 00       	push   $0x182f
    1085:	6a 01                	push   $0x1
    1087:	e8 34 04 00 00       	call   14c0 <printf>
    108c:	83 c4 10             	add    $0x10,%esp
    108f:	eb df                	jmp    1070 <main+0x70>
      printf(1, "init: fork failed\n");
    1091:	53                   	push   %ebx
    1092:	53                   	push   %ebx
    1093:	68 03 18 00 00       	push   $0x1803
    1098:	6a 01                	push   $0x1
    109a:	e8 21 04 00 00       	call   14c0 <printf>
      exit();
    109f:	e8 9f 02 00 00       	call   1343 <exit>
      exec("sh", argv);
    10a4:	50                   	push   %eax
    10a5:	50                   	push   %eax
    10a6:	68 44 1b 00 00       	push   $0x1b44
    10ab:	68 16 18 00 00       	push   $0x1816
    10b0:	e8 c6 02 00 00       	call   137b <exec>
      printf(1, "init: exec sh failed\n");
    10b5:	5a                   	pop    %edx
    10b6:	59                   	pop    %ecx
    10b7:	68 19 18 00 00       	push   $0x1819
    10bc:	6a 01                	push   $0x1
    10be:	e8 fd 03 00 00       	call   14c0 <printf>
      exit();
    10c3:	e8 7b 02 00 00       	call   1343 <exit>
    mknod("console", 1, 1);
    10c8:	50                   	push   %eax
    10c9:	6a 01                	push   $0x1
    10cb:	6a 01                	push   $0x1
    10cd:	68 e8 17 00 00       	push   $0x17e8
    10d2:	e8 b4 02 00 00       	call   138b <mknod>
    open("console", O_RDWR);
    10d7:	58                   	pop    %eax
    10d8:	5a                   	pop    %edx
    10d9:	6a 02                	push   $0x2
    10db:	68 e8 17 00 00       	push   $0x17e8
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

000013f3 <mprotect>:
SYSCALL(mprotect)
    13f3:	b8 18 00 00 00       	mov    $0x18,%eax
    13f8:	cd 40                	int    $0x40
    13fa:	c3                   	ret    

000013fb <munprotect>:
SYSCALL(munprotect)
    13fb:	b8 19 00 00 00       	mov    $0x19,%eax
    1400:	cd 40                	int    $0x40
    1402:	c3                   	ret    
    1403:	66 90                	xchg   %ax,%ax
    1405:	66 90                	xchg   %ax,%ax
    1407:	66 90                	xchg   %ax,%ax
    1409:	66 90                	xchg   %ax,%ax
    140b:	66 90                	xchg   %ax,%ax
    140d:	66 90                	xchg   %ax,%ax
    140f:	90                   	nop

00001410 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1410:	55                   	push   %ebp
    1411:	89 e5                	mov    %esp,%ebp
    1413:	57                   	push   %edi
    1414:	56                   	push   %esi
    1415:	53                   	push   %ebx
    1416:	83 ec 3c             	sub    $0x3c,%esp
    1419:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    141c:	89 d1                	mov    %edx,%ecx
{
    141e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1421:	85 d2                	test   %edx,%edx
    1423:	0f 89 7f 00 00 00    	jns    14a8 <printint+0x98>
    1429:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    142d:	74 79                	je     14a8 <printint+0x98>
    neg = 1;
    142f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1436:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1438:	31 db                	xor    %ebx,%ebx
    143a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    143d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1440:	89 c8                	mov    %ecx,%eax
    1442:	31 d2                	xor    %edx,%edx
    1444:	89 cf                	mov    %ecx,%edi
    1446:	f7 75 c4             	divl   -0x3c(%ebp)
    1449:	0f b6 92 98 18 00 00 	movzbl 0x1898(%edx),%edx
    1450:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1453:	89 d8                	mov    %ebx,%eax
    1455:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1458:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    145b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    145e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1461:	76 dd                	jbe    1440 <printint+0x30>
  if(neg)
    1463:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1466:	85 c9                	test   %ecx,%ecx
    1468:	74 0c                	je     1476 <printint+0x66>
    buf[i++] = '-';
    146a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    146f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1471:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1476:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1479:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    147d:	eb 07                	jmp    1486 <printint+0x76>
    147f:	90                   	nop
    putc(fd, buf[i]);
    1480:	0f b6 13             	movzbl (%ebx),%edx
    1483:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1486:	83 ec 04             	sub    $0x4,%esp
    1489:	88 55 d7             	mov    %dl,-0x29(%ebp)
    148c:	6a 01                	push   $0x1
    148e:	56                   	push   %esi
    148f:	57                   	push   %edi
    1490:	e8 ce fe ff ff       	call   1363 <write>
  while(--i >= 0)
    1495:	83 c4 10             	add    $0x10,%esp
    1498:	39 de                	cmp    %ebx,%esi
    149a:	75 e4                	jne    1480 <printint+0x70>
}
    149c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    149f:	5b                   	pop    %ebx
    14a0:	5e                   	pop    %esi
    14a1:	5f                   	pop    %edi
    14a2:	5d                   	pop    %ebp
    14a3:	c3                   	ret    
    14a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    14a8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    14af:	eb 87                	jmp    1438 <printint+0x28>
    14b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14bf:	90                   	nop

000014c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    14c0:	55                   	push   %ebp
    14c1:	89 e5                	mov    %esp,%ebp
    14c3:	57                   	push   %edi
    14c4:	56                   	push   %esi
    14c5:	53                   	push   %ebx
    14c6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    14cc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    14cf:	0f b6 13             	movzbl (%ebx),%edx
    14d2:	84 d2                	test   %dl,%dl
    14d4:	74 6a                	je     1540 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    14d6:	8d 45 10             	lea    0x10(%ebp),%eax
    14d9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    14dc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    14df:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    14e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
    14e4:	eb 36                	jmp    151c <printf+0x5c>
    14e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14ed:	8d 76 00             	lea    0x0(%esi),%esi
    14f0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    14f3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    14f8:	83 f8 25             	cmp    $0x25,%eax
    14fb:	74 15                	je     1512 <printf+0x52>
  write(fd, &c, 1);
    14fd:	83 ec 04             	sub    $0x4,%esp
    1500:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1503:	6a 01                	push   $0x1
    1505:	57                   	push   %edi
    1506:	56                   	push   %esi
    1507:	e8 57 fe ff ff       	call   1363 <write>
    150c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    150f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1512:	0f b6 13             	movzbl (%ebx),%edx
    1515:	83 c3 01             	add    $0x1,%ebx
    1518:	84 d2                	test   %dl,%dl
    151a:	74 24                	je     1540 <printf+0x80>
    c = fmt[i] & 0xff;
    151c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    151f:	85 c9                	test   %ecx,%ecx
    1521:	74 cd                	je     14f0 <printf+0x30>
      }
    } else if(state == '%'){
    1523:	83 f9 25             	cmp    $0x25,%ecx
    1526:	75 ea                	jne    1512 <printf+0x52>
      if(c == 'd'){
    1528:	83 f8 25             	cmp    $0x25,%eax
    152b:	0f 84 07 01 00 00    	je     1638 <printf+0x178>
    1531:	83 e8 63             	sub    $0x63,%eax
    1534:	83 f8 15             	cmp    $0x15,%eax
    1537:	77 17                	ja     1550 <printf+0x90>
    1539:	ff 24 85 40 18 00 00 	jmp    *0x1840(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1540:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1543:	5b                   	pop    %ebx
    1544:	5e                   	pop    %esi
    1545:	5f                   	pop    %edi
    1546:	5d                   	pop    %ebp
    1547:	c3                   	ret    
    1548:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    154f:	90                   	nop
  write(fd, &c, 1);
    1550:	83 ec 04             	sub    $0x4,%esp
    1553:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    1556:	6a 01                	push   $0x1
    1558:	57                   	push   %edi
    1559:	56                   	push   %esi
    155a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    155e:	e8 00 fe ff ff       	call   1363 <write>
        putc(fd, c);
    1563:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    1567:	83 c4 0c             	add    $0xc,%esp
    156a:	88 55 e7             	mov    %dl,-0x19(%ebp)
    156d:	6a 01                	push   $0x1
    156f:	57                   	push   %edi
    1570:	56                   	push   %esi
    1571:	e8 ed fd ff ff       	call   1363 <write>
        putc(fd, c);
    1576:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1579:	31 c9                	xor    %ecx,%ecx
    157b:	eb 95                	jmp    1512 <printf+0x52>
    157d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1580:	83 ec 0c             	sub    $0xc,%esp
    1583:	b9 10 00 00 00       	mov    $0x10,%ecx
    1588:	6a 00                	push   $0x0
    158a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    158d:	8b 10                	mov    (%eax),%edx
    158f:	89 f0                	mov    %esi,%eax
    1591:	e8 7a fe ff ff       	call   1410 <printint>
        ap++;
    1596:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    159a:	83 c4 10             	add    $0x10,%esp
      state = 0;
    159d:	31 c9                	xor    %ecx,%ecx
    159f:	e9 6e ff ff ff       	jmp    1512 <printf+0x52>
    15a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    15a8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    15ab:	8b 10                	mov    (%eax),%edx
        ap++;
    15ad:	83 c0 04             	add    $0x4,%eax
    15b0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    15b3:	85 d2                	test   %edx,%edx
    15b5:	0f 84 8d 00 00 00    	je     1648 <printf+0x188>
        while(*s != 0){
    15bb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    15be:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    15c0:	84 c0                	test   %al,%al
    15c2:	0f 84 4a ff ff ff    	je     1512 <printf+0x52>
    15c8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    15cb:	89 d3                	mov    %edx,%ebx
    15cd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    15d0:	83 ec 04             	sub    $0x4,%esp
          s++;
    15d3:	83 c3 01             	add    $0x1,%ebx
    15d6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    15d9:	6a 01                	push   $0x1
    15db:	57                   	push   %edi
    15dc:	56                   	push   %esi
    15dd:	e8 81 fd ff ff       	call   1363 <write>
        while(*s != 0){
    15e2:	0f b6 03             	movzbl (%ebx),%eax
    15e5:	83 c4 10             	add    $0x10,%esp
    15e8:	84 c0                	test   %al,%al
    15ea:	75 e4                	jne    15d0 <printf+0x110>
      state = 0;
    15ec:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    15ef:	31 c9                	xor    %ecx,%ecx
    15f1:	e9 1c ff ff ff       	jmp    1512 <printf+0x52>
    15f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15fd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1600:	83 ec 0c             	sub    $0xc,%esp
    1603:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1608:	6a 01                	push   $0x1
    160a:	e9 7b ff ff ff       	jmp    158a <printf+0xca>
    160f:	90                   	nop
        putc(fd, *ap);
    1610:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1613:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1616:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1618:	6a 01                	push   $0x1
    161a:	57                   	push   %edi
    161b:	56                   	push   %esi
        putc(fd, *ap);
    161c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    161f:	e8 3f fd ff ff       	call   1363 <write>
        ap++;
    1624:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1628:	83 c4 10             	add    $0x10,%esp
      state = 0;
    162b:	31 c9                	xor    %ecx,%ecx
    162d:	e9 e0 fe ff ff       	jmp    1512 <printf+0x52>
    1632:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    1638:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    163b:	83 ec 04             	sub    $0x4,%esp
    163e:	e9 2a ff ff ff       	jmp    156d <printf+0xad>
    1643:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1647:	90                   	nop
          s = "(null)";
    1648:	ba 38 18 00 00       	mov    $0x1838,%edx
        while(*s != 0){
    164d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    1650:	b8 28 00 00 00       	mov    $0x28,%eax
    1655:	89 d3                	mov    %edx,%ebx
    1657:	e9 74 ff ff ff       	jmp    15d0 <printf+0x110>
    165c:	66 90                	xchg   %ax,%ax
    165e:	66 90                	xchg   %ax,%ax

00001660 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1660:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1661:	a1 4c 1b 00 00       	mov    0x1b4c,%eax
{
    1666:	89 e5                	mov    %esp,%ebp
    1668:	57                   	push   %edi
    1669:	56                   	push   %esi
    166a:	53                   	push   %ebx
    166b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    166e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1671:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1678:	89 c2                	mov    %eax,%edx
    167a:	8b 00                	mov    (%eax),%eax
    167c:	39 ca                	cmp    %ecx,%edx
    167e:	73 30                	jae    16b0 <free+0x50>
    1680:	39 c1                	cmp    %eax,%ecx
    1682:	72 04                	jb     1688 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1684:	39 c2                	cmp    %eax,%edx
    1686:	72 f0                	jb     1678 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1688:	8b 73 fc             	mov    -0x4(%ebx),%esi
    168b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    168e:	39 f8                	cmp    %edi,%eax
    1690:	74 30                	je     16c2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    1692:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1695:	8b 42 04             	mov    0x4(%edx),%eax
    1698:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    169b:	39 f1                	cmp    %esi,%ecx
    169d:	74 3a                	je     16d9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    169f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    16a1:	5b                   	pop    %ebx
  freep = p;
    16a2:	89 15 4c 1b 00 00    	mov    %edx,0x1b4c
}
    16a8:	5e                   	pop    %esi
    16a9:	5f                   	pop    %edi
    16aa:	5d                   	pop    %ebp
    16ab:	c3                   	ret    
    16ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16b0:	39 c2                	cmp    %eax,%edx
    16b2:	72 c4                	jb     1678 <free+0x18>
    16b4:	39 c1                	cmp    %eax,%ecx
    16b6:	73 c0                	jae    1678 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    16b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    16be:	39 f8                	cmp    %edi,%eax
    16c0:	75 d0                	jne    1692 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    16c2:	03 70 04             	add    0x4(%eax),%esi
    16c5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    16c8:	8b 02                	mov    (%edx),%eax
    16ca:	8b 00                	mov    (%eax),%eax
    16cc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    16cf:	8b 42 04             	mov    0x4(%edx),%eax
    16d2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    16d5:	39 f1                	cmp    %esi,%ecx
    16d7:	75 c6                	jne    169f <free+0x3f>
    p->s.size += bp->s.size;
    16d9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    16dc:	89 15 4c 1b 00 00    	mov    %edx,0x1b4c
    p->s.size += bp->s.size;
    16e2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    16e5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    16e8:	89 0a                	mov    %ecx,(%edx)
}
    16ea:	5b                   	pop    %ebx
    16eb:	5e                   	pop    %esi
    16ec:	5f                   	pop    %edi
    16ed:	5d                   	pop    %ebp
    16ee:	c3                   	ret    
    16ef:	90                   	nop

000016f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    16f0:	55                   	push   %ebp
    16f1:	89 e5                	mov    %esp,%ebp
    16f3:	57                   	push   %edi
    16f4:	56                   	push   %esi
    16f5:	53                   	push   %ebx
    16f6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    16fc:	8b 3d 4c 1b 00 00    	mov    0x1b4c,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1702:	8d 70 07             	lea    0x7(%eax),%esi
    1705:	c1 ee 03             	shr    $0x3,%esi
    1708:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    170b:	85 ff                	test   %edi,%edi
    170d:	0f 84 9d 00 00 00    	je     17b0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1713:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1715:	8b 4a 04             	mov    0x4(%edx),%ecx
    1718:	39 f1                	cmp    %esi,%ecx
    171a:	73 6a                	jae    1786 <malloc+0x96>
    171c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1721:	39 de                	cmp    %ebx,%esi
    1723:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1726:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    172d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1730:	eb 17                	jmp    1749 <malloc+0x59>
    1732:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1738:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    173a:	8b 48 04             	mov    0x4(%eax),%ecx
    173d:	39 f1                	cmp    %esi,%ecx
    173f:	73 4f                	jae    1790 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1741:	8b 3d 4c 1b 00 00    	mov    0x1b4c,%edi
    1747:	89 c2                	mov    %eax,%edx
    1749:	39 d7                	cmp    %edx,%edi
    174b:	75 eb                	jne    1738 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    174d:	83 ec 0c             	sub    $0xc,%esp
    1750:	ff 75 e4             	push   -0x1c(%ebp)
    1753:	e8 73 fc ff ff       	call   13cb <sbrk>
  if(p == (char*)-1)
    1758:	83 c4 10             	add    $0x10,%esp
    175b:	83 f8 ff             	cmp    $0xffffffff,%eax
    175e:	74 1c                	je     177c <malloc+0x8c>
  hp->s.size = nu;
    1760:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1763:	83 ec 0c             	sub    $0xc,%esp
    1766:	83 c0 08             	add    $0x8,%eax
    1769:	50                   	push   %eax
    176a:	e8 f1 fe ff ff       	call   1660 <free>
  return freep;
    176f:	8b 15 4c 1b 00 00    	mov    0x1b4c,%edx
      if((p = morecore(nunits)) == 0)
    1775:	83 c4 10             	add    $0x10,%esp
    1778:	85 d2                	test   %edx,%edx
    177a:	75 bc                	jne    1738 <malloc+0x48>
        return 0;
  }
}
    177c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    177f:	31 c0                	xor    %eax,%eax
}
    1781:	5b                   	pop    %ebx
    1782:	5e                   	pop    %esi
    1783:	5f                   	pop    %edi
    1784:	5d                   	pop    %ebp
    1785:	c3                   	ret    
    if(p->s.size >= nunits){
    1786:	89 d0                	mov    %edx,%eax
    1788:	89 fa                	mov    %edi,%edx
    178a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1790:	39 ce                	cmp    %ecx,%esi
    1792:	74 4c                	je     17e0 <malloc+0xf0>
        p->s.size -= nunits;
    1794:	29 f1                	sub    %esi,%ecx
    1796:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1799:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    179c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    179f:	89 15 4c 1b 00 00    	mov    %edx,0x1b4c
}
    17a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    17a8:	83 c0 08             	add    $0x8,%eax
}
    17ab:	5b                   	pop    %ebx
    17ac:	5e                   	pop    %esi
    17ad:	5f                   	pop    %edi
    17ae:	5d                   	pop    %ebp
    17af:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    17b0:	c7 05 4c 1b 00 00 50 	movl   $0x1b50,0x1b4c
    17b7:	1b 00 00 
    base.s.size = 0;
    17ba:	bf 50 1b 00 00       	mov    $0x1b50,%edi
    base.s.ptr = freep = prevp = &base;
    17bf:	c7 05 50 1b 00 00 50 	movl   $0x1b50,0x1b50
    17c6:	1b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17c9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    17cb:	c7 05 54 1b 00 00 00 	movl   $0x0,0x1b54
    17d2:	00 00 00 
    if(p->s.size >= nunits){
    17d5:	e9 42 ff ff ff       	jmp    171c <malloc+0x2c>
    17da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    17e0:	8b 08                	mov    (%eax),%ecx
    17e2:	89 0a                	mov    %ecx,(%edx)
    17e4:	eb b9                	jmp    179f <malloc+0xaf>
