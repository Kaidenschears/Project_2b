
_zombie:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"

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
  if(fork() > 0)
    1011:	e8 65 02 00 00       	call   127b <fork>
    1016:	85 c0                	test   %eax,%eax
    1018:	7e 0d                	jle    1027 <main+0x27>
    sleep(5);  // Let child exit before parent.
    101a:	83 ec 0c             	sub    $0xc,%esp
    101d:	6a 05                	push   $0x5
    101f:	e8 ef 02 00 00       	call   1313 <sleep>
    1024:	83 c4 10             	add    $0x10,%esp
  exit();
    1027:	e8 57 02 00 00       	call   1283 <exit>
    102c:	66 90                	xchg   %ax,%ax
    102e:	66 90                	xchg   %ax,%ax

00001030 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1030:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1031:	31 c0                	xor    %eax,%eax
{
    1033:	89 e5                	mov    %esp,%ebp
    1035:	53                   	push   %ebx
    1036:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1039:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    103c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1040:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1044:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1047:	83 c0 01             	add    $0x1,%eax
    104a:	84 d2                	test   %dl,%dl
    104c:	75 f2                	jne    1040 <strcpy+0x10>
    ;
  return os;
}
    104e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1051:	89 c8                	mov    %ecx,%eax
    1053:	c9                   	leave  
    1054:	c3                   	ret    
    1055:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    105c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001060 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1060:	55                   	push   %ebp
    1061:	89 e5                	mov    %esp,%ebp
    1063:	53                   	push   %ebx
    1064:	8b 55 08             	mov    0x8(%ebp),%edx
    1067:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    106a:	0f b6 02             	movzbl (%edx),%eax
    106d:	84 c0                	test   %al,%al
    106f:	75 17                	jne    1088 <strcmp+0x28>
    1071:	eb 3a                	jmp    10ad <strcmp+0x4d>
    1073:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1077:	90                   	nop
    1078:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    107c:	83 c2 01             	add    $0x1,%edx
    107f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    1082:	84 c0                	test   %al,%al
    1084:	74 1a                	je     10a0 <strcmp+0x40>
    p++, q++;
    1086:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    1088:	0f b6 19             	movzbl (%ecx),%ebx
    108b:	38 c3                	cmp    %al,%bl
    108d:	74 e9                	je     1078 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    108f:	29 d8                	sub    %ebx,%eax
}
    1091:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1094:	c9                   	leave  
    1095:	c3                   	ret    
    1096:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    109d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    10a0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    10a4:	31 c0                	xor    %eax,%eax
    10a6:	29 d8                	sub    %ebx,%eax
}
    10a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10ab:	c9                   	leave  
    10ac:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    10ad:	0f b6 19             	movzbl (%ecx),%ebx
    10b0:	31 c0                	xor    %eax,%eax
    10b2:	eb db                	jmp    108f <strcmp+0x2f>
    10b4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10bf:	90                   	nop

000010c0 <strlen>:

uint
strlen(const char *s)
{
    10c0:	55                   	push   %ebp
    10c1:	89 e5                	mov    %esp,%ebp
    10c3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    10c6:	80 3a 00             	cmpb   $0x0,(%edx)
    10c9:	74 15                	je     10e0 <strlen+0x20>
    10cb:	31 c0                	xor    %eax,%eax
    10cd:	8d 76 00             	lea    0x0(%esi),%esi
    10d0:	83 c0 01             	add    $0x1,%eax
    10d3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    10d7:	89 c1                	mov    %eax,%ecx
    10d9:	75 f5                	jne    10d0 <strlen+0x10>
    ;
  return n;
}
    10db:	89 c8                	mov    %ecx,%eax
    10dd:	5d                   	pop    %ebp
    10de:	c3                   	ret    
    10df:	90                   	nop
  for(n = 0; s[n]; n++)
    10e0:	31 c9                	xor    %ecx,%ecx
}
    10e2:	5d                   	pop    %ebp
    10e3:	89 c8                	mov    %ecx,%eax
    10e5:	c3                   	ret    
    10e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10ed:	8d 76 00             	lea    0x0(%esi),%esi

000010f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    10f0:	55                   	push   %ebp
    10f1:	89 e5                	mov    %esp,%ebp
    10f3:	57                   	push   %edi
    10f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    10f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    10fa:	8b 45 0c             	mov    0xc(%ebp),%eax
    10fd:	89 d7                	mov    %edx,%edi
    10ff:	fc                   	cld    
    1100:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1102:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1105:	89 d0                	mov    %edx,%eax
    1107:	c9                   	leave  
    1108:	c3                   	ret    
    1109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001110 <strchr>:

char*
strchr(const char *s, char c)
{
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	8b 45 08             	mov    0x8(%ebp),%eax
    1116:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    111a:	0f b6 10             	movzbl (%eax),%edx
    111d:	84 d2                	test   %dl,%dl
    111f:	75 12                	jne    1133 <strchr+0x23>
    1121:	eb 1d                	jmp    1140 <strchr+0x30>
    1123:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1127:	90                   	nop
    1128:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    112c:	83 c0 01             	add    $0x1,%eax
    112f:	84 d2                	test   %dl,%dl
    1131:	74 0d                	je     1140 <strchr+0x30>
    if(*s == c)
    1133:	38 d1                	cmp    %dl,%cl
    1135:	75 f1                	jne    1128 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1137:	5d                   	pop    %ebp
    1138:	c3                   	ret    
    1139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1140:	31 c0                	xor    %eax,%eax
}
    1142:	5d                   	pop    %ebp
    1143:	c3                   	ret    
    1144:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    114b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    114f:	90                   	nop

00001150 <gets>:

char*
gets(char *buf, int max)
{
    1150:	55                   	push   %ebp
    1151:	89 e5                	mov    %esp,%ebp
    1153:	57                   	push   %edi
    1154:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    1155:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    1158:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    1159:	31 db                	xor    %ebx,%ebx
{
    115b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    115e:	eb 27                	jmp    1187 <gets+0x37>
    cc = read(0, &c, 1);
    1160:	83 ec 04             	sub    $0x4,%esp
    1163:	6a 01                	push   $0x1
    1165:	57                   	push   %edi
    1166:	6a 00                	push   $0x0
    1168:	e8 2e 01 00 00       	call   129b <read>
    if(cc < 1)
    116d:	83 c4 10             	add    $0x10,%esp
    1170:	85 c0                	test   %eax,%eax
    1172:	7e 1d                	jle    1191 <gets+0x41>
      break;
    buf[i++] = c;
    1174:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1178:	8b 55 08             	mov    0x8(%ebp),%edx
    117b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    117f:	3c 0a                	cmp    $0xa,%al
    1181:	74 1d                	je     11a0 <gets+0x50>
    1183:	3c 0d                	cmp    $0xd,%al
    1185:	74 19                	je     11a0 <gets+0x50>
  for(i=0; i+1 < max; ){
    1187:	89 de                	mov    %ebx,%esi
    1189:	83 c3 01             	add    $0x1,%ebx
    118c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    118f:	7c cf                	jl     1160 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    1191:	8b 45 08             	mov    0x8(%ebp),%eax
    1194:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1198:	8d 65 f4             	lea    -0xc(%ebp),%esp
    119b:	5b                   	pop    %ebx
    119c:	5e                   	pop    %esi
    119d:	5f                   	pop    %edi
    119e:	5d                   	pop    %ebp
    119f:	c3                   	ret    
  buf[i] = '\0';
    11a0:	8b 45 08             	mov    0x8(%ebp),%eax
    11a3:	89 de                	mov    %ebx,%esi
    11a5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    11a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11ac:	5b                   	pop    %ebx
    11ad:	5e                   	pop    %esi
    11ae:	5f                   	pop    %edi
    11af:	5d                   	pop    %ebp
    11b0:	c3                   	ret    
    11b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11bf:	90                   	nop

000011c0 <stat>:

int
stat(const char *n, struct stat *st)
{
    11c0:	55                   	push   %ebp
    11c1:	89 e5                	mov    %esp,%ebp
    11c3:	56                   	push   %esi
    11c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11c5:	83 ec 08             	sub    $0x8,%esp
    11c8:	6a 00                	push   $0x0
    11ca:	ff 75 08             	push   0x8(%ebp)
    11cd:	e8 f1 00 00 00       	call   12c3 <open>
  if(fd < 0)
    11d2:	83 c4 10             	add    $0x10,%esp
    11d5:	85 c0                	test   %eax,%eax
    11d7:	78 27                	js     1200 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    11d9:	83 ec 08             	sub    $0x8,%esp
    11dc:	ff 75 0c             	push   0xc(%ebp)
    11df:	89 c3                	mov    %eax,%ebx
    11e1:	50                   	push   %eax
    11e2:	e8 f4 00 00 00       	call   12db <fstat>
  close(fd);
    11e7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    11ea:	89 c6                	mov    %eax,%esi
  close(fd);
    11ec:	e8 ba 00 00 00       	call   12ab <close>
  return r;
    11f1:	83 c4 10             	add    $0x10,%esp
}
    11f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    11f7:	89 f0                	mov    %esi,%eax
    11f9:	5b                   	pop    %ebx
    11fa:	5e                   	pop    %esi
    11fb:	5d                   	pop    %ebp
    11fc:	c3                   	ret    
    11fd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1200:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1205:	eb ed                	jmp    11f4 <stat+0x34>
    1207:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    120e:	66 90                	xchg   %ax,%ax

00001210 <atoi>:

int
atoi(const char *s)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	53                   	push   %ebx
    1214:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1217:	0f be 02             	movsbl (%edx),%eax
    121a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    121d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1220:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1225:	77 1e                	ja     1245 <atoi+0x35>
    1227:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    122e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1230:	83 c2 01             	add    $0x1,%edx
    1233:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1236:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    123a:	0f be 02             	movsbl (%edx),%eax
    123d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1240:	80 fb 09             	cmp    $0x9,%bl
    1243:	76 eb                	jbe    1230 <atoi+0x20>
  return n;
}
    1245:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1248:	89 c8                	mov    %ecx,%eax
    124a:	c9                   	leave  
    124b:	c3                   	ret    
    124c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001250 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1250:	55                   	push   %ebp
    1251:	89 e5                	mov    %esp,%ebp
    1253:	57                   	push   %edi
    1254:	8b 45 10             	mov    0x10(%ebp),%eax
    1257:	8b 55 08             	mov    0x8(%ebp),%edx
    125a:	56                   	push   %esi
    125b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    125e:	85 c0                	test   %eax,%eax
    1260:	7e 13                	jle    1275 <memmove+0x25>
    1262:	01 d0                	add    %edx,%eax
  dst = vdst;
    1264:	89 d7                	mov    %edx,%edi
    1266:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    126d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1270:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1271:	39 f8                	cmp    %edi,%eax
    1273:	75 fb                	jne    1270 <memmove+0x20>
  return vdst;
}
    1275:	5e                   	pop    %esi
    1276:	89 d0                	mov    %edx,%eax
    1278:	5f                   	pop    %edi
    1279:	5d                   	pop    %ebp
    127a:	c3                   	ret    

0000127b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    127b:	b8 01 00 00 00       	mov    $0x1,%eax
    1280:	cd 40                	int    $0x40
    1282:	c3                   	ret    

00001283 <exit>:
SYSCALL(exit)
    1283:	b8 02 00 00 00       	mov    $0x2,%eax
    1288:	cd 40                	int    $0x40
    128a:	c3                   	ret    

0000128b <wait>:
SYSCALL(wait)
    128b:	b8 03 00 00 00       	mov    $0x3,%eax
    1290:	cd 40                	int    $0x40
    1292:	c3                   	ret    

00001293 <pipe>:
SYSCALL(pipe)
    1293:	b8 04 00 00 00       	mov    $0x4,%eax
    1298:	cd 40                	int    $0x40
    129a:	c3                   	ret    

0000129b <read>:
SYSCALL(read)
    129b:	b8 05 00 00 00       	mov    $0x5,%eax
    12a0:	cd 40                	int    $0x40
    12a2:	c3                   	ret    

000012a3 <write>:
SYSCALL(write)
    12a3:	b8 10 00 00 00       	mov    $0x10,%eax
    12a8:	cd 40                	int    $0x40
    12aa:	c3                   	ret    

000012ab <close>:
SYSCALL(close)
    12ab:	b8 15 00 00 00       	mov    $0x15,%eax
    12b0:	cd 40                	int    $0x40
    12b2:	c3                   	ret    

000012b3 <kill>:
SYSCALL(kill)
    12b3:	b8 06 00 00 00       	mov    $0x6,%eax
    12b8:	cd 40                	int    $0x40
    12ba:	c3                   	ret    

000012bb <exec>:
SYSCALL(exec)
    12bb:	b8 07 00 00 00       	mov    $0x7,%eax
    12c0:	cd 40                	int    $0x40
    12c2:	c3                   	ret    

000012c3 <open>:
SYSCALL(open)
    12c3:	b8 0f 00 00 00       	mov    $0xf,%eax
    12c8:	cd 40                	int    $0x40
    12ca:	c3                   	ret    

000012cb <mknod>:
SYSCALL(mknod)
    12cb:	b8 11 00 00 00       	mov    $0x11,%eax
    12d0:	cd 40                	int    $0x40
    12d2:	c3                   	ret    

000012d3 <unlink>:
SYSCALL(unlink)
    12d3:	b8 12 00 00 00       	mov    $0x12,%eax
    12d8:	cd 40                	int    $0x40
    12da:	c3                   	ret    

000012db <fstat>:
SYSCALL(fstat)
    12db:	b8 08 00 00 00       	mov    $0x8,%eax
    12e0:	cd 40                	int    $0x40
    12e2:	c3                   	ret    

000012e3 <link>:
SYSCALL(link)
    12e3:	b8 13 00 00 00       	mov    $0x13,%eax
    12e8:	cd 40                	int    $0x40
    12ea:	c3                   	ret    

000012eb <mkdir>:
SYSCALL(mkdir)
    12eb:	b8 14 00 00 00       	mov    $0x14,%eax
    12f0:	cd 40                	int    $0x40
    12f2:	c3                   	ret    

000012f3 <chdir>:
SYSCALL(chdir)
    12f3:	b8 09 00 00 00       	mov    $0x9,%eax
    12f8:	cd 40                	int    $0x40
    12fa:	c3                   	ret    

000012fb <dup>:
SYSCALL(dup)
    12fb:	b8 0a 00 00 00       	mov    $0xa,%eax
    1300:	cd 40                	int    $0x40
    1302:	c3                   	ret    

00001303 <getpid>:
SYSCALL(getpid)
    1303:	b8 0b 00 00 00       	mov    $0xb,%eax
    1308:	cd 40                	int    $0x40
    130a:	c3                   	ret    

0000130b <sbrk>:
SYSCALL(sbrk)
    130b:	b8 0c 00 00 00       	mov    $0xc,%eax
    1310:	cd 40                	int    $0x40
    1312:	c3                   	ret    

00001313 <sleep>:
SYSCALL(sleep)
    1313:	b8 0d 00 00 00       	mov    $0xd,%eax
    1318:	cd 40                	int    $0x40
    131a:	c3                   	ret    

0000131b <uptime>:
SYSCALL(uptime)
    131b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1320:	cd 40                	int    $0x40
    1322:	c3                   	ret    

00001323 <getpinfo>:

SYSCALL(getpinfo)
    1323:	b8 16 00 00 00       	mov    $0x16,%eax
    1328:	cd 40                	int    $0x40
    132a:	c3                   	ret    

0000132b <settickets>:
SYSCALL(settickets)
    132b:	b8 17 00 00 00       	mov    $0x17,%eax
    1330:	cd 40                	int    $0x40
    1332:	c3                   	ret    

00001333 <mprotect>:
SYSCALL(mprotect)
    1333:	b8 18 00 00 00       	mov    $0x18,%eax
    1338:	cd 40                	int    $0x40
    133a:	c3                   	ret    

0000133b <munprotect>:
SYSCALL(munprotect)
    133b:	b8 19 00 00 00       	mov    $0x19,%eax
    1340:	cd 40                	int    $0x40
    1342:	c3                   	ret    
    1343:	66 90                	xchg   %ax,%ax
    1345:	66 90                	xchg   %ax,%ax
    1347:	66 90                	xchg   %ax,%ax
    1349:	66 90                	xchg   %ax,%ax
    134b:	66 90                	xchg   %ax,%ax
    134d:	66 90                	xchg   %ax,%ax
    134f:	90                   	nop

00001350 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1350:	55                   	push   %ebp
    1351:	89 e5                	mov    %esp,%ebp
    1353:	57                   	push   %edi
    1354:	56                   	push   %esi
    1355:	53                   	push   %ebx
    1356:	83 ec 3c             	sub    $0x3c,%esp
    1359:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    135c:	89 d1                	mov    %edx,%ecx
{
    135e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1361:	85 d2                	test   %edx,%edx
    1363:	0f 89 7f 00 00 00    	jns    13e8 <printint+0x98>
    1369:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    136d:	74 79                	je     13e8 <printint+0x98>
    neg = 1;
    136f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1376:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1378:	31 db                	xor    %ebx,%ebx
    137a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    137d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1380:	89 c8                	mov    %ecx,%eax
    1382:	31 d2                	xor    %edx,%edx
    1384:	89 cf                	mov    %ecx,%edi
    1386:	f7 75 c4             	divl   -0x3c(%ebp)
    1389:	0f b6 92 88 17 00 00 	movzbl 0x1788(%edx),%edx
    1390:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1393:	89 d8                	mov    %ebx,%eax
    1395:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1398:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    139b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    139e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    13a1:	76 dd                	jbe    1380 <printint+0x30>
  if(neg)
    13a3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    13a6:	85 c9                	test   %ecx,%ecx
    13a8:	74 0c                	je     13b6 <printint+0x66>
    buf[i++] = '-';
    13aa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    13af:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    13b1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    13b6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    13b9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    13bd:	eb 07                	jmp    13c6 <printint+0x76>
    13bf:	90                   	nop
    putc(fd, buf[i]);
    13c0:	0f b6 13             	movzbl (%ebx),%edx
    13c3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    13c6:	83 ec 04             	sub    $0x4,%esp
    13c9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    13cc:	6a 01                	push   $0x1
    13ce:	56                   	push   %esi
    13cf:	57                   	push   %edi
    13d0:	e8 ce fe ff ff       	call   12a3 <write>
  while(--i >= 0)
    13d5:	83 c4 10             	add    $0x10,%esp
    13d8:	39 de                	cmp    %ebx,%esi
    13da:	75 e4                	jne    13c0 <printint+0x70>
}
    13dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    13df:	5b                   	pop    %ebx
    13e0:	5e                   	pop    %esi
    13e1:	5f                   	pop    %edi
    13e2:	5d                   	pop    %ebp
    13e3:	c3                   	ret    
    13e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    13e8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    13ef:	eb 87                	jmp    1378 <printint+0x28>
    13f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13ff:	90                   	nop

00001400 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1400:	55                   	push   %ebp
    1401:	89 e5                	mov    %esp,%ebp
    1403:	57                   	push   %edi
    1404:	56                   	push   %esi
    1405:	53                   	push   %ebx
    1406:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1409:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    140c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    140f:	0f b6 13             	movzbl (%ebx),%edx
    1412:	84 d2                	test   %dl,%dl
    1414:	74 6a                	je     1480 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    1416:	8d 45 10             	lea    0x10(%ebp),%eax
    1419:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    141c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    141f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    1421:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1424:	eb 36                	jmp    145c <printf+0x5c>
    1426:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    142d:	8d 76 00             	lea    0x0(%esi),%esi
    1430:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1433:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1438:	83 f8 25             	cmp    $0x25,%eax
    143b:	74 15                	je     1452 <printf+0x52>
  write(fd, &c, 1);
    143d:	83 ec 04             	sub    $0x4,%esp
    1440:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1443:	6a 01                	push   $0x1
    1445:	57                   	push   %edi
    1446:	56                   	push   %esi
    1447:	e8 57 fe ff ff       	call   12a3 <write>
    144c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    144f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1452:	0f b6 13             	movzbl (%ebx),%edx
    1455:	83 c3 01             	add    $0x1,%ebx
    1458:	84 d2                	test   %dl,%dl
    145a:	74 24                	je     1480 <printf+0x80>
    c = fmt[i] & 0xff;
    145c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    145f:	85 c9                	test   %ecx,%ecx
    1461:	74 cd                	je     1430 <printf+0x30>
      }
    } else if(state == '%'){
    1463:	83 f9 25             	cmp    $0x25,%ecx
    1466:	75 ea                	jne    1452 <printf+0x52>
      if(c == 'd'){
    1468:	83 f8 25             	cmp    $0x25,%eax
    146b:	0f 84 07 01 00 00    	je     1578 <printf+0x178>
    1471:	83 e8 63             	sub    $0x63,%eax
    1474:	83 f8 15             	cmp    $0x15,%eax
    1477:	77 17                	ja     1490 <printf+0x90>
    1479:	ff 24 85 30 17 00 00 	jmp    *0x1730(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1480:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1483:	5b                   	pop    %ebx
    1484:	5e                   	pop    %esi
    1485:	5f                   	pop    %edi
    1486:	5d                   	pop    %ebp
    1487:	c3                   	ret    
    1488:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    148f:	90                   	nop
  write(fd, &c, 1);
    1490:	83 ec 04             	sub    $0x4,%esp
    1493:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    1496:	6a 01                	push   $0x1
    1498:	57                   	push   %edi
    1499:	56                   	push   %esi
    149a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    149e:	e8 00 fe ff ff       	call   12a3 <write>
        putc(fd, c);
    14a3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    14a7:	83 c4 0c             	add    $0xc,%esp
    14aa:	88 55 e7             	mov    %dl,-0x19(%ebp)
    14ad:	6a 01                	push   $0x1
    14af:	57                   	push   %edi
    14b0:	56                   	push   %esi
    14b1:	e8 ed fd ff ff       	call   12a3 <write>
        putc(fd, c);
    14b6:	83 c4 10             	add    $0x10,%esp
      state = 0;
    14b9:	31 c9                	xor    %ecx,%ecx
    14bb:	eb 95                	jmp    1452 <printf+0x52>
    14bd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    14c0:	83 ec 0c             	sub    $0xc,%esp
    14c3:	b9 10 00 00 00       	mov    $0x10,%ecx
    14c8:	6a 00                	push   $0x0
    14ca:	8b 45 d0             	mov    -0x30(%ebp),%eax
    14cd:	8b 10                	mov    (%eax),%edx
    14cf:	89 f0                	mov    %esi,%eax
    14d1:	e8 7a fe ff ff       	call   1350 <printint>
        ap++;
    14d6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    14da:	83 c4 10             	add    $0x10,%esp
      state = 0;
    14dd:	31 c9                	xor    %ecx,%ecx
    14df:	e9 6e ff ff ff       	jmp    1452 <printf+0x52>
    14e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    14e8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    14eb:	8b 10                	mov    (%eax),%edx
        ap++;
    14ed:	83 c0 04             	add    $0x4,%eax
    14f0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    14f3:	85 d2                	test   %edx,%edx
    14f5:	0f 84 8d 00 00 00    	je     1588 <printf+0x188>
        while(*s != 0){
    14fb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    14fe:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    1500:	84 c0                	test   %al,%al
    1502:	0f 84 4a ff ff ff    	je     1452 <printf+0x52>
    1508:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    150b:	89 d3                	mov    %edx,%ebx
    150d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1510:	83 ec 04             	sub    $0x4,%esp
          s++;
    1513:	83 c3 01             	add    $0x1,%ebx
    1516:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1519:	6a 01                	push   $0x1
    151b:	57                   	push   %edi
    151c:	56                   	push   %esi
    151d:	e8 81 fd ff ff       	call   12a3 <write>
        while(*s != 0){
    1522:	0f b6 03             	movzbl (%ebx),%eax
    1525:	83 c4 10             	add    $0x10,%esp
    1528:	84 c0                	test   %al,%al
    152a:	75 e4                	jne    1510 <printf+0x110>
      state = 0;
    152c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    152f:	31 c9                	xor    %ecx,%ecx
    1531:	e9 1c ff ff ff       	jmp    1452 <printf+0x52>
    1536:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    153d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1540:	83 ec 0c             	sub    $0xc,%esp
    1543:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1548:	6a 01                	push   $0x1
    154a:	e9 7b ff ff ff       	jmp    14ca <printf+0xca>
    154f:	90                   	nop
        putc(fd, *ap);
    1550:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1553:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1556:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1558:	6a 01                	push   $0x1
    155a:	57                   	push   %edi
    155b:	56                   	push   %esi
        putc(fd, *ap);
    155c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    155f:	e8 3f fd ff ff       	call   12a3 <write>
        ap++;
    1564:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1568:	83 c4 10             	add    $0x10,%esp
      state = 0;
    156b:	31 c9                	xor    %ecx,%ecx
    156d:	e9 e0 fe ff ff       	jmp    1452 <printf+0x52>
    1572:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    1578:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    157b:	83 ec 04             	sub    $0x4,%esp
    157e:	e9 2a ff ff ff       	jmp    14ad <printf+0xad>
    1583:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1587:	90                   	nop
          s = "(null)";
    1588:	ba 28 17 00 00       	mov    $0x1728,%edx
        while(*s != 0){
    158d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    1590:	b8 28 00 00 00       	mov    $0x28,%eax
    1595:	89 d3                	mov    %edx,%ebx
    1597:	e9 74 ff ff ff       	jmp    1510 <printf+0x110>
    159c:	66 90                	xchg   %ax,%ax
    159e:	66 90                	xchg   %ax,%ax

000015a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    15a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15a1:	a1 30 1a 00 00       	mov    0x1a30,%eax
{
    15a6:	89 e5                	mov    %esp,%ebp
    15a8:	57                   	push   %edi
    15a9:	56                   	push   %esi
    15aa:	53                   	push   %ebx
    15ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    15ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15b8:	89 c2                	mov    %eax,%edx
    15ba:	8b 00                	mov    (%eax),%eax
    15bc:	39 ca                	cmp    %ecx,%edx
    15be:	73 30                	jae    15f0 <free+0x50>
    15c0:	39 c1                	cmp    %eax,%ecx
    15c2:	72 04                	jb     15c8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15c4:	39 c2                	cmp    %eax,%edx
    15c6:	72 f0                	jb     15b8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    15c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    15cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    15ce:	39 f8                	cmp    %edi,%eax
    15d0:	74 30                	je     1602 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    15d2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    15d5:	8b 42 04             	mov    0x4(%edx),%eax
    15d8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    15db:	39 f1                	cmp    %esi,%ecx
    15dd:	74 3a                	je     1619 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    15df:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    15e1:	5b                   	pop    %ebx
  freep = p;
    15e2:	89 15 30 1a 00 00    	mov    %edx,0x1a30
}
    15e8:	5e                   	pop    %esi
    15e9:	5f                   	pop    %edi
    15ea:	5d                   	pop    %ebp
    15eb:	c3                   	ret    
    15ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15f0:	39 c2                	cmp    %eax,%edx
    15f2:	72 c4                	jb     15b8 <free+0x18>
    15f4:	39 c1                	cmp    %eax,%ecx
    15f6:	73 c0                	jae    15b8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    15f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    15fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    15fe:	39 f8                	cmp    %edi,%eax
    1600:	75 d0                	jne    15d2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    1602:	03 70 04             	add    0x4(%eax),%esi
    1605:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1608:	8b 02                	mov    (%edx),%eax
    160a:	8b 00                	mov    (%eax),%eax
    160c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    160f:	8b 42 04             	mov    0x4(%edx),%eax
    1612:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1615:	39 f1                	cmp    %esi,%ecx
    1617:	75 c6                	jne    15df <free+0x3f>
    p->s.size += bp->s.size;
    1619:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    161c:	89 15 30 1a 00 00    	mov    %edx,0x1a30
    p->s.size += bp->s.size;
    1622:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1625:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1628:	89 0a                	mov    %ecx,(%edx)
}
    162a:	5b                   	pop    %ebx
    162b:	5e                   	pop    %esi
    162c:	5f                   	pop    %edi
    162d:	5d                   	pop    %ebp
    162e:	c3                   	ret    
    162f:	90                   	nop

00001630 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1630:	55                   	push   %ebp
    1631:	89 e5                	mov    %esp,%ebp
    1633:	57                   	push   %edi
    1634:	56                   	push   %esi
    1635:	53                   	push   %ebx
    1636:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1639:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    163c:	8b 3d 30 1a 00 00    	mov    0x1a30,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1642:	8d 70 07             	lea    0x7(%eax),%esi
    1645:	c1 ee 03             	shr    $0x3,%esi
    1648:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    164b:	85 ff                	test   %edi,%edi
    164d:	0f 84 9d 00 00 00    	je     16f0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1653:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1655:	8b 4a 04             	mov    0x4(%edx),%ecx
    1658:	39 f1                	cmp    %esi,%ecx
    165a:	73 6a                	jae    16c6 <malloc+0x96>
    165c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1661:	39 de                	cmp    %ebx,%esi
    1663:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1666:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    166d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1670:	eb 17                	jmp    1689 <malloc+0x59>
    1672:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1678:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    167a:	8b 48 04             	mov    0x4(%eax),%ecx
    167d:	39 f1                	cmp    %esi,%ecx
    167f:	73 4f                	jae    16d0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1681:	8b 3d 30 1a 00 00    	mov    0x1a30,%edi
    1687:	89 c2                	mov    %eax,%edx
    1689:	39 d7                	cmp    %edx,%edi
    168b:	75 eb                	jne    1678 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    168d:	83 ec 0c             	sub    $0xc,%esp
    1690:	ff 75 e4             	push   -0x1c(%ebp)
    1693:	e8 73 fc ff ff       	call   130b <sbrk>
  if(p == (char*)-1)
    1698:	83 c4 10             	add    $0x10,%esp
    169b:	83 f8 ff             	cmp    $0xffffffff,%eax
    169e:	74 1c                	je     16bc <malloc+0x8c>
  hp->s.size = nu;
    16a0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    16a3:	83 ec 0c             	sub    $0xc,%esp
    16a6:	83 c0 08             	add    $0x8,%eax
    16a9:	50                   	push   %eax
    16aa:	e8 f1 fe ff ff       	call   15a0 <free>
  return freep;
    16af:	8b 15 30 1a 00 00    	mov    0x1a30,%edx
      if((p = morecore(nunits)) == 0)
    16b5:	83 c4 10             	add    $0x10,%esp
    16b8:	85 d2                	test   %edx,%edx
    16ba:	75 bc                	jne    1678 <malloc+0x48>
        return 0;
  }
}
    16bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    16bf:	31 c0                	xor    %eax,%eax
}
    16c1:	5b                   	pop    %ebx
    16c2:	5e                   	pop    %esi
    16c3:	5f                   	pop    %edi
    16c4:	5d                   	pop    %ebp
    16c5:	c3                   	ret    
    if(p->s.size >= nunits){
    16c6:	89 d0                	mov    %edx,%eax
    16c8:	89 fa                	mov    %edi,%edx
    16ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    16d0:	39 ce                	cmp    %ecx,%esi
    16d2:	74 4c                	je     1720 <malloc+0xf0>
        p->s.size -= nunits;
    16d4:	29 f1                	sub    %esi,%ecx
    16d6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    16d9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    16dc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    16df:	89 15 30 1a 00 00    	mov    %edx,0x1a30
}
    16e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    16e8:	83 c0 08             	add    $0x8,%eax
}
    16eb:	5b                   	pop    %ebx
    16ec:	5e                   	pop    %esi
    16ed:	5f                   	pop    %edi
    16ee:	5d                   	pop    %ebp
    16ef:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    16f0:	c7 05 30 1a 00 00 34 	movl   $0x1a34,0x1a30
    16f7:	1a 00 00 
    base.s.size = 0;
    16fa:	bf 34 1a 00 00       	mov    $0x1a34,%edi
    base.s.ptr = freep = prevp = &base;
    16ff:	c7 05 34 1a 00 00 34 	movl   $0x1a34,0x1a34
    1706:	1a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1709:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    170b:	c7 05 38 1a 00 00 00 	movl   $0x0,0x1a38
    1712:	00 00 00 
    if(p->s.size >= nunits){
    1715:	e9 42 ff ff ff       	jmp    165c <malloc+0x2c>
    171a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1720:	8b 08                	mov    (%eax),%ecx
    1722:	89 0a                	mov    %ecx,(%edx)
    1724:	eb b9                	jmp    16df <malloc+0xaf>
