
_kill:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	push   -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	57                   	push   %edi
    100e:	56                   	push   %esi
    100f:	53                   	push   %ebx
    1010:	bb 01 00 00 00       	mov    $0x1,%ebx
    1015:	51                   	push   %ecx
    1016:	83 ec 08             	sub    $0x8,%esp
    1019:	8b 31                	mov    (%ecx),%esi
    101b:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
    101e:	83 fe 01             	cmp    $0x1,%esi
    1021:	7e 27                	jle    104a <main+0x4a>
    1023:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1027:	90                   	nop
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
    kill(atoi(argv[i]));
    1028:	83 ec 0c             	sub    $0xc,%esp
    102b:	ff 34 9f             	push   (%edi,%ebx,4)
  for(i=1; i<argc; i++)
    102e:	83 c3 01             	add    $0x1,%ebx
    kill(atoi(argv[i]));
    1031:	e8 0a 02 00 00       	call   1240 <atoi>
    1036:	89 04 24             	mov    %eax,(%esp)
    1039:	e8 a5 02 00 00       	call   12e3 <kill>
  for(i=1; i<argc; i++)
    103e:	83 c4 10             	add    $0x10,%esp
    1041:	39 de                	cmp    %ebx,%esi
    1043:	75 e3                	jne    1028 <main+0x28>
  exit();
    1045:	e8 69 02 00 00       	call   12b3 <exit>
    printf(2, "usage: kill pid...\n");
    104a:	50                   	push   %eax
    104b:	50                   	push   %eax
    104c:	68 48 17 00 00       	push   $0x1748
    1051:	6a 02                	push   $0x2
    1053:	e8 c8 03 00 00       	call   1420 <printf>
    exit();
    1058:	e8 56 02 00 00       	call   12b3 <exit>
    105d:	66 90                	xchg   %ax,%ax
    105f:	90                   	nop

00001060 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1060:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1061:	31 c0                	xor    %eax,%eax
{
    1063:	89 e5                	mov    %esp,%ebp
    1065:	53                   	push   %ebx
    1066:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1069:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    106c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1070:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1074:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1077:	83 c0 01             	add    $0x1,%eax
    107a:	84 d2                	test   %dl,%dl
    107c:	75 f2                	jne    1070 <strcpy+0x10>
    ;
  return os;
}
    107e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1081:	89 c8                	mov    %ecx,%eax
    1083:	c9                   	leave  
    1084:	c3                   	ret    
    1085:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    108c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	53                   	push   %ebx
    1094:	8b 55 08             	mov    0x8(%ebp),%edx
    1097:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    109a:	0f b6 02             	movzbl (%edx),%eax
    109d:	84 c0                	test   %al,%al
    109f:	75 17                	jne    10b8 <strcmp+0x28>
    10a1:	eb 3a                	jmp    10dd <strcmp+0x4d>
    10a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10a7:	90                   	nop
    10a8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    10ac:	83 c2 01             	add    $0x1,%edx
    10af:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    10b2:	84 c0                	test   %al,%al
    10b4:	74 1a                	je     10d0 <strcmp+0x40>
    p++, q++;
    10b6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    10b8:	0f b6 19             	movzbl (%ecx),%ebx
    10bb:	38 c3                	cmp    %al,%bl
    10bd:	74 e9                	je     10a8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    10bf:	29 d8                	sub    %ebx,%eax
}
    10c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10c4:	c9                   	leave  
    10c5:	c3                   	ret    
    10c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10cd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    10d0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    10d4:	31 c0                	xor    %eax,%eax
    10d6:	29 d8                	sub    %ebx,%eax
}
    10d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10db:	c9                   	leave  
    10dc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    10dd:	0f b6 19             	movzbl (%ecx),%ebx
    10e0:	31 c0                	xor    %eax,%eax
    10e2:	eb db                	jmp    10bf <strcmp+0x2f>
    10e4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10ef:	90                   	nop

000010f0 <strlen>:

uint
strlen(const char *s)
{
    10f0:	55                   	push   %ebp
    10f1:	89 e5                	mov    %esp,%ebp
    10f3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    10f6:	80 3a 00             	cmpb   $0x0,(%edx)
    10f9:	74 15                	je     1110 <strlen+0x20>
    10fb:	31 c0                	xor    %eax,%eax
    10fd:	8d 76 00             	lea    0x0(%esi),%esi
    1100:	83 c0 01             	add    $0x1,%eax
    1103:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    1107:	89 c1                	mov    %eax,%ecx
    1109:	75 f5                	jne    1100 <strlen+0x10>
    ;
  return n;
}
    110b:	89 c8                	mov    %ecx,%eax
    110d:	5d                   	pop    %ebp
    110e:	c3                   	ret    
    110f:	90                   	nop
  for(n = 0; s[n]; n++)
    1110:	31 c9                	xor    %ecx,%ecx
}
    1112:	5d                   	pop    %ebp
    1113:	89 c8                	mov    %ecx,%eax
    1115:	c3                   	ret    
    1116:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    111d:	8d 76 00             	lea    0x0(%esi),%esi

00001120 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	57                   	push   %edi
    1124:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1127:	8b 4d 10             	mov    0x10(%ebp),%ecx
    112a:	8b 45 0c             	mov    0xc(%ebp),%eax
    112d:	89 d7                	mov    %edx,%edi
    112f:	fc                   	cld    
    1130:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1132:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1135:	89 d0                	mov    %edx,%eax
    1137:	c9                   	leave  
    1138:	c3                   	ret    
    1139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001140 <strchr>:

char*
strchr(const char *s, char c)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	8b 45 08             	mov    0x8(%ebp),%eax
    1146:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    114a:	0f b6 10             	movzbl (%eax),%edx
    114d:	84 d2                	test   %dl,%dl
    114f:	75 12                	jne    1163 <strchr+0x23>
    1151:	eb 1d                	jmp    1170 <strchr+0x30>
    1153:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1157:	90                   	nop
    1158:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    115c:	83 c0 01             	add    $0x1,%eax
    115f:	84 d2                	test   %dl,%dl
    1161:	74 0d                	je     1170 <strchr+0x30>
    if(*s == c)
    1163:	38 d1                	cmp    %dl,%cl
    1165:	75 f1                	jne    1158 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1167:	5d                   	pop    %ebp
    1168:	c3                   	ret    
    1169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1170:	31 c0                	xor    %eax,%eax
}
    1172:	5d                   	pop    %ebp
    1173:	c3                   	ret    
    1174:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    117b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    117f:	90                   	nop

00001180 <gets>:

char*
gets(char *buf, int max)
{
    1180:	55                   	push   %ebp
    1181:	89 e5                	mov    %esp,%ebp
    1183:	57                   	push   %edi
    1184:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    1185:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    1188:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    1189:	31 db                	xor    %ebx,%ebx
{
    118b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    118e:	eb 27                	jmp    11b7 <gets+0x37>
    cc = read(0, &c, 1);
    1190:	83 ec 04             	sub    $0x4,%esp
    1193:	6a 01                	push   $0x1
    1195:	57                   	push   %edi
    1196:	6a 00                	push   $0x0
    1198:	e8 2e 01 00 00       	call   12cb <read>
    if(cc < 1)
    119d:	83 c4 10             	add    $0x10,%esp
    11a0:	85 c0                	test   %eax,%eax
    11a2:	7e 1d                	jle    11c1 <gets+0x41>
      break;
    buf[i++] = c;
    11a4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11a8:	8b 55 08             	mov    0x8(%ebp),%edx
    11ab:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    11af:	3c 0a                	cmp    $0xa,%al
    11b1:	74 1d                	je     11d0 <gets+0x50>
    11b3:	3c 0d                	cmp    $0xd,%al
    11b5:	74 19                	je     11d0 <gets+0x50>
  for(i=0; i+1 < max; ){
    11b7:	89 de                	mov    %ebx,%esi
    11b9:	83 c3 01             	add    $0x1,%ebx
    11bc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11bf:	7c cf                	jl     1190 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    11c1:	8b 45 08             	mov    0x8(%ebp),%eax
    11c4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    11c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11cb:	5b                   	pop    %ebx
    11cc:	5e                   	pop    %esi
    11cd:	5f                   	pop    %edi
    11ce:	5d                   	pop    %ebp
    11cf:	c3                   	ret    
  buf[i] = '\0';
    11d0:	8b 45 08             	mov    0x8(%ebp),%eax
    11d3:	89 de                	mov    %ebx,%esi
    11d5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    11d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11dc:	5b                   	pop    %ebx
    11dd:	5e                   	pop    %esi
    11de:	5f                   	pop    %edi
    11df:	5d                   	pop    %ebp
    11e0:	c3                   	ret    
    11e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11ef:	90                   	nop

000011f0 <stat>:

int
stat(const char *n, struct stat *st)
{
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	56                   	push   %esi
    11f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11f5:	83 ec 08             	sub    $0x8,%esp
    11f8:	6a 00                	push   $0x0
    11fa:	ff 75 08             	push   0x8(%ebp)
    11fd:	e8 f1 00 00 00       	call   12f3 <open>
  if(fd < 0)
    1202:	83 c4 10             	add    $0x10,%esp
    1205:	85 c0                	test   %eax,%eax
    1207:	78 27                	js     1230 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1209:	83 ec 08             	sub    $0x8,%esp
    120c:	ff 75 0c             	push   0xc(%ebp)
    120f:	89 c3                	mov    %eax,%ebx
    1211:	50                   	push   %eax
    1212:	e8 f4 00 00 00       	call   130b <fstat>
  close(fd);
    1217:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    121a:	89 c6                	mov    %eax,%esi
  close(fd);
    121c:	e8 ba 00 00 00       	call   12db <close>
  return r;
    1221:	83 c4 10             	add    $0x10,%esp
}
    1224:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1227:	89 f0                	mov    %esi,%eax
    1229:	5b                   	pop    %ebx
    122a:	5e                   	pop    %esi
    122b:	5d                   	pop    %ebp
    122c:	c3                   	ret    
    122d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1230:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1235:	eb ed                	jmp    1224 <stat+0x34>
    1237:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    123e:	66 90                	xchg   %ax,%ax

00001240 <atoi>:

int
atoi(const char *s)
{
    1240:	55                   	push   %ebp
    1241:	89 e5                	mov    %esp,%ebp
    1243:	53                   	push   %ebx
    1244:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1247:	0f be 02             	movsbl (%edx),%eax
    124a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    124d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1250:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1255:	77 1e                	ja     1275 <atoi+0x35>
    1257:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    125e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1260:	83 c2 01             	add    $0x1,%edx
    1263:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1266:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    126a:	0f be 02             	movsbl (%edx),%eax
    126d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1270:	80 fb 09             	cmp    $0x9,%bl
    1273:	76 eb                	jbe    1260 <atoi+0x20>
  return n;
}
    1275:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1278:	89 c8                	mov    %ecx,%eax
    127a:	c9                   	leave  
    127b:	c3                   	ret    
    127c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001280 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1280:	55                   	push   %ebp
    1281:	89 e5                	mov    %esp,%ebp
    1283:	57                   	push   %edi
    1284:	8b 45 10             	mov    0x10(%ebp),%eax
    1287:	8b 55 08             	mov    0x8(%ebp),%edx
    128a:	56                   	push   %esi
    128b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    128e:	85 c0                	test   %eax,%eax
    1290:	7e 13                	jle    12a5 <memmove+0x25>
    1292:	01 d0                	add    %edx,%eax
  dst = vdst;
    1294:	89 d7                	mov    %edx,%edi
    1296:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    129d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    12a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    12a1:	39 f8                	cmp    %edi,%eax
    12a3:	75 fb                	jne    12a0 <memmove+0x20>
  return vdst;
}
    12a5:	5e                   	pop    %esi
    12a6:	89 d0                	mov    %edx,%eax
    12a8:	5f                   	pop    %edi
    12a9:	5d                   	pop    %ebp
    12aa:	c3                   	ret    

000012ab <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    12ab:	b8 01 00 00 00       	mov    $0x1,%eax
    12b0:	cd 40                	int    $0x40
    12b2:	c3                   	ret    

000012b3 <exit>:
SYSCALL(exit)
    12b3:	b8 02 00 00 00       	mov    $0x2,%eax
    12b8:	cd 40                	int    $0x40
    12ba:	c3                   	ret    

000012bb <wait>:
SYSCALL(wait)
    12bb:	b8 03 00 00 00       	mov    $0x3,%eax
    12c0:	cd 40                	int    $0x40
    12c2:	c3                   	ret    

000012c3 <pipe>:
SYSCALL(pipe)
    12c3:	b8 04 00 00 00       	mov    $0x4,%eax
    12c8:	cd 40                	int    $0x40
    12ca:	c3                   	ret    

000012cb <read>:
SYSCALL(read)
    12cb:	b8 05 00 00 00       	mov    $0x5,%eax
    12d0:	cd 40                	int    $0x40
    12d2:	c3                   	ret    

000012d3 <write>:
SYSCALL(write)
    12d3:	b8 10 00 00 00       	mov    $0x10,%eax
    12d8:	cd 40                	int    $0x40
    12da:	c3                   	ret    

000012db <close>:
SYSCALL(close)
    12db:	b8 15 00 00 00       	mov    $0x15,%eax
    12e0:	cd 40                	int    $0x40
    12e2:	c3                   	ret    

000012e3 <kill>:
SYSCALL(kill)
    12e3:	b8 06 00 00 00       	mov    $0x6,%eax
    12e8:	cd 40                	int    $0x40
    12ea:	c3                   	ret    

000012eb <exec>:
SYSCALL(exec)
    12eb:	b8 07 00 00 00       	mov    $0x7,%eax
    12f0:	cd 40                	int    $0x40
    12f2:	c3                   	ret    

000012f3 <open>:
SYSCALL(open)
    12f3:	b8 0f 00 00 00       	mov    $0xf,%eax
    12f8:	cd 40                	int    $0x40
    12fa:	c3                   	ret    

000012fb <mknod>:
SYSCALL(mknod)
    12fb:	b8 11 00 00 00       	mov    $0x11,%eax
    1300:	cd 40                	int    $0x40
    1302:	c3                   	ret    

00001303 <unlink>:
SYSCALL(unlink)
    1303:	b8 12 00 00 00       	mov    $0x12,%eax
    1308:	cd 40                	int    $0x40
    130a:	c3                   	ret    

0000130b <fstat>:
SYSCALL(fstat)
    130b:	b8 08 00 00 00       	mov    $0x8,%eax
    1310:	cd 40                	int    $0x40
    1312:	c3                   	ret    

00001313 <link>:
SYSCALL(link)
    1313:	b8 13 00 00 00       	mov    $0x13,%eax
    1318:	cd 40                	int    $0x40
    131a:	c3                   	ret    

0000131b <mkdir>:
SYSCALL(mkdir)
    131b:	b8 14 00 00 00       	mov    $0x14,%eax
    1320:	cd 40                	int    $0x40
    1322:	c3                   	ret    

00001323 <chdir>:
SYSCALL(chdir)
    1323:	b8 09 00 00 00       	mov    $0x9,%eax
    1328:	cd 40                	int    $0x40
    132a:	c3                   	ret    

0000132b <dup>:
SYSCALL(dup)
    132b:	b8 0a 00 00 00       	mov    $0xa,%eax
    1330:	cd 40                	int    $0x40
    1332:	c3                   	ret    

00001333 <getpid>:
SYSCALL(getpid)
    1333:	b8 0b 00 00 00       	mov    $0xb,%eax
    1338:	cd 40                	int    $0x40
    133a:	c3                   	ret    

0000133b <sbrk>:
SYSCALL(sbrk)
    133b:	b8 0c 00 00 00       	mov    $0xc,%eax
    1340:	cd 40                	int    $0x40
    1342:	c3                   	ret    

00001343 <sleep>:
SYSCALL(sleep)
    1343:	b8 0d 00 00 00       	mov    $0xd,%eax
    1348:	cd 40                	int    $0x40
    134a:	c3                   	ret    

0000134b <uptime>:
SYSCALL(uptime)
    134b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1350:	cd 40                	int    $0x40
    1352:	c3                   	ret    

00001353 <getpinfo>:

SYSCALL(getpinfo)
    1353:	b8 16 00 00 00       	mov    $0x16,%eax
    1358:	cd 40                	int    $0x40
    135a:	c3                   	ret    

0000135b <settickets>:
SYSCALL(settickets)
    135b:	b8 17 00 00 00       	mov    $0x17,%eax
    1360:	cd 40                	int    $0x40
    1362:	c3                   	ret    
    1363:	66 90                	xchg   %ax,%ax
    1365:	66 90                	xchg   %ax,%ax
    1367:	66 90                	xchg   %ax,%ax
    1369:	66 90                	xchg   %ax,%ax
    136b:	66 90                	xchg   %ax,%ax
    136d:	66 90                	xchg   %ax,%ax
    136f:	90                   	nop

00001370 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1370:	55                   	push   %ebp
    1371:	89 e5                	mov    %esp,%ebp
    1373:	57                   	push   %edi
    1374:	56                   	push   %esi
    1375:	53                   	push   %ebx
    1376:	83 ec 3c             	sub    $0x3c,%esp
    1379:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    137c:	89 d1                	mov    %edx,%ecx
{
    137e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1381:	85 d2                	test   %edx,%edx
    1383:	0f 89 7f 00 00 00    	jns    1408 <printint+0x98>
    1389:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    138d:	74 79                	je     1408 <printint+0x98>
    neg = 1;
    138f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1396:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1398:	31 db                	xor    %ebx,%ebx
    139a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    139d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    13a0:	89 c8                	mov    %ecx,%eax
    13a2:	31 d2                	xor    %edx,%edx
    13a4:	89 cf                	mov    %ecx,%edi
    13a6:	f7 75 c4             	divl   -0x3c(%ebp)
    13a9:	0f b6 92 bc 17 00 00 	movzbl 0x17bc(%edx),%edx
    13b0:	89 45 c0             	mov    %eax,-0x40(%ebp)
    13b3:	89 d8                	mov    %ebx,%eax
    13b5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    13b8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    13bb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    13be:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    13c1:	76 dd                	jbe    13a0 <printint+0x30>
  if(neg)
    13c3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    13c6:	85 c9                	test   %ecx,%ecx
    13c8:	74 0c                	je     13d6 <printint+0x66>
    buf[i++] = '-';
    13ca:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    13cf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    13d1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    13d6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    13d9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    13dd:	eb 07                	jmp    13e6 <printint+0x76>
    13df:	90                   	nop
    putc(fd, buf[i]);
    13e0:	0f b6 13             	movzbl (%ebx),%edx
    13e3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    13e6:	83 ec 04             	sub    $0x4,%esp
    13e9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    13ec:	6a 01                	push   $0x1
    13ee:	56                   	push   %esi
    13ef:	57                   	push   %edi
    13f0:	e8 de fe ff ff       	call   12d3 <write>
  while(--i >= 0)
    13f5:	83 c4 10             	add    $0x10,%esp
    13f8:	39 de                	cmp    %ebx,%esi
    13fa:	75 e4                	jne    13e0 <printint+0x70>
}
    13fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    13ff:	5b                   	pop    %ebx
    1400:	5e                   	pop    %esi
    1401:	5f                   	pop    %edi
    1402:	5d                   	pop    %ebp
    1403:	c3                   	ret    
    1404:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1408:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    140f:	eb 87                	jmp    1398 <printint+0x28>
    1411:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1418:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    141f:	90                   	nop

00001420 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1420:	55                   	push   %ebp
    1421:	89 e5                	mov    %esp,%ebp
    1423:	57                   	push   %edi
    1424:	56                   	push   %esi
    1425:	53                   	push   %ebx
    1426:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1429:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    142c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    142f:	0f b6 13             	movzbl (%ebx),%edx
    1432:	84 d2                	test   %dl,%dl
    1434:	74 6a                	je     14a0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    1436:	8d 45 10             	lea    0x10(%ebp),%eax
    1439:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    143c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    143f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    1441:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1444:	eb 36                	jmp    147c <printf+0x5c>
    1446:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    144d:	8d 76 00             	lea    0x0(%esi),%esi
    1450:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1453:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1458:	83 f8 25             	cmp    $0x25,%eax
    145b:	74 15                	je     1472 <printf+0x52>
  write(fd, &c, 1);
    145d:	83 ec 04             	sub    $0x4,%esp
    1460:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1463:	6a 01                	push   $0x1
    1465:	57                   	push   %edi
    1466:	56                   	push   %esi
    1467:	e8 67 fe ff ff       	call   12d3 <write>
    146c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    146f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1472:	0f b6 13             	movzbl (%ebx),%edx
    1475:	83 c3 01             	add    $0x1,%ebx
    1478:	84 d2                	test   %dl,%dl
    147a:	74 24                	je     14a0 <printf+0x80>
    c = fmt[i] & 0xff;
    147c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    147f:	85 c9                	test   %ecx,%ecx
    1481:	74 cd                	je     1450 <printf+0x30>
      }
    } else if(state == '%'){
    1483:	83 f9 25             	cmp    $0x25,%ecx
    1486:	75 ea                	jne    1472 <printf+0x52>
      if(c == 'd'){
    1488:	83 f8 25             	cmp    $0x25,%eax
    148b:	0f 84 07 01 00 00    	je     1598 <printf+0x178>
    1491:	83 e8 63             	sub    $0x63,%eax
    1494:	83 f8 15             	cmp    $0x15,%eax
    1497:	77 17                	ja     14b0 <printf+0x90>
    1499:	ff 24 85 64 17 00 00 	jmp    *0x1764(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    14a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14a3:	5b                   	pop    %ebx
    14a4:	5e                   	pop    %esi
    14a5:	5f                   	pop    %edi
    14a6:	5d                   	pop    %ebp
    14a7:	c3                   	ret    
    14a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14af:	90                   	nop
  write(fd, &c, 1);
    14b0:	83 ec 04             	sub    $0x4,%esp
    14b3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    14b6:	6a 01                	push   $0x1
    14b8:	57                   	push   %edi
    14b9:	56                   	push   %esi
    14ba:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    14be:	e8 10 fe ff ff       	call   12d3 <write>
        putc(fd, c);
    14c3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    14c7:	83 c4 0c             	add    $0xc,%esp
    14ca:	88 55 e7             	mov    %dl,-0x19(%ebp)
    14cd:	6a 01                	push   $0x1
    14cf:	57                   	push   %edi
    14d0:	56                   	push   %esi
    14d1:	e8 fd fd ff ff       	call   12d3 <write>
        putc(fd, c);
    14d6:	83 c4 10             	add    $0x10,%esp
      state = 0;
    14d9:	31 c9                	xor    %ecx,%ecx
    14db:	eb 95                	jmp    1472 <printf+0x52>
    14dd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    14e0:	83 ec 0c             	sub    $0xc,%esp
    14e3:	b9 10 00 00 00       	mov    $0x10,%ecx
    14e8:	6a 00                	push   $0x0
    14ea:	8b 45 d0             	mov    -0x30(%ebp),%eax
    14ed:	8b 10                	mov    (%eax),%edx
    14ef:	89 f0                	mov    %esi,%eax
    14f1:	e8 7a fe ff ff       	call   1370 <printint>
        ap++;
    14f6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    14fa:	83 c4 10             	add    $0x10,%esp
      state = 0;
    14fd:	31 c9                	xor    %ecx,%ecx
    14ff:	e9 6e ff ff ff       	jmp    1472 <printf+0x52>
    1504:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1508:	8b 45 d0             	mov    -0x30(%ebp),%eax
    150b:	8b 10                	mov    (%eax),%edx
        ap++;
    150d:	83 c0 04             	add    $0x4,%eax
    1510:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    1513:	85 d2                	test   %edx,%edx
    1515:	0f 84 8d 00 00 00    	je     15a8 <printf+0x188>
        while(*s != 0){
    151b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    151e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    1520:	84 c0                	test   %al,%al
    1522:	0f 84 4a ff ff ff    	je     1472 <printf+0x52>
    1528:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    152b:	89 d3                	mov    %edx,%ebx
    152d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1530:	83 ec 04             	sub    $0x4,%esp
          s++;
    1533:	83 c3 01             	add    $0x1,%ebx
    1536:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1539:	6a 01                	push   $0x1
    153b:	57                   	push   %edi
    153c:	56                   	push   %esi
    153d:	e8 91 fd ff ff       	call   12d3 <write>
        while(*s != 0){
    1542:	0f b6 03             	movzbl (%ebx),%eax
    1545:	83 c4 10             	add    $0x10,%esp
    1548:	84 c0                	test   %al,%al
    154a:	75 e4                	jne    1530 <printf+0x110>
      state = 0;
    154c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    154f:	31 c9                	xor    %ecx,%ecx
    1551:	e9 1c ff ff ff       	jmp    1472 <printf+0x52>
    1556:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    155d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1560:	83 ec 0c             	sub    $0xc,%esp
    1563:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1568:	6a 01                	push   $0x1
    156a:	e9 7b ff ff ff       	jmp    14ea <printf+0xca>
    156f:	90                   	nop
        putc(fd, *ap);
    1570:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1573:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1576:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1578:	6a 01                	push   $0x1
    157a:	57                   	push   %edi
    157b:	56                   	push   %esi
        putc(fd, *ap);
    157c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    157f:	e8 4f fd ff ff       	call   12d3 <write>
        ap++;
    1584:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1588:	83 c4 10             	add    $0x10,%esp
      state = 0;
    158b:	31 c9                	xor    %ecx,%ecx
    158d:	e9 e0 fe ff ff       	jmp    1472 <printf+0x52>
    1592:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    1598:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    159b:	83 ec 04             	sub    $0x4,%esp
    159e:	e9 2a ff ff ff       	jmp    14cd <printf+0xad>
    15a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    15a7:	90                   	nop
          s = "(null)";
    15a8:	ba 5c 17 00 00       	mov    $0x175c,%edx
        while(*s != 0){
    15ad:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    15b0:	b8 28 00 00 00       	mov    $0x28,%eax
    15b5:	89 d3                	mov    %edx,%ebx
    15b7:	e9 74 ff ff ff       	jmp    1530 <printf+0x110>
    15bc:	66 90                	xchg   %ax,%ax
    15be:	66 90                	xchg   %ax,%ax

000015c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    15c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15c1:	a1 74 1a 00 00       	mov    0x1a74,%eax
{
    15c6:	89 e5                	mov    %esp,%ebp
    15c8:	57                   	push   %edi
    15c9:	56                   	push   %esi
    15ca:	53                   	push   %ebx
    15cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    15ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15d8:	89 c2                	mov    %eax,%edx
    15da:	8b 00                	mov    (%eax),%eax
    15dc:	39 ca                	cmp    %ecx,%edx
    15de:	73 30                	jae    1610 <free+0x50>
    15e0:	39 c1                	cmp    %eax,%ecx
    15e2:	72 04                	jb     15e8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15e4:	39 c2                	cmp    %eax,%edx
    15e6:	72 f0                	jb     15d8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    15e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    15eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    15ee:	39 f8                	cmp    %edi,%eax
    15f0:	74 30                	je     1622 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    15f2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    15f5:	8b 42 04             	mov    0x4(%edx),%eax
    15f8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    15fb:	39 f1                	cmp    %esi,%ecx
    15fd:	74 3a                	je     1639 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    15ff:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    1601:	5b                   	pop    %ebx
  freep = p;
    1602:	89 15 74 1a 00 00    	mov    %edx,0x1a74
}
    1608:	5e                   	pop    %esi
    1609:	5f                   	pop    %edi
    160a:	5d                   	pop    %ebp
    160b:	c3                   	ret    
    160c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1610:	39 c2                	cmp    %eax,%edx
    1612:	72 c4                	jb     15d8 <free+0x18>
    1614:	39 c1                	cmp    %eax,%ecx
    1616:	73 c0                	jae    15d8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    1618:	8b 73 fc             	mov    -0x4(%ebx),%esi
    161b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    161e:	39 f8                	cmp    %edi,%eax
    1620:	75 d0                	jne    15f2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    1622:	03 70 04             	add    0x4(%eax),%esi
    1625:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1628:	8b 02                	mov    (%edx),%eax
    162a:	8b 00                	mov    (%eax),%eax
    162c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    162f:	8b 42 04             	mov    0x4(%edx),%eax
    1632:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1635:	39 f1                	cmp    %esi,%ecx
    1637:	75 c6                	jne    15ff <free+0x3f>
    p->s.size += bp->s.size;
    1639:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    163c:	89 15 74 1a 00 00    	mov    %edx,0x1a74
    p->s.size += bp->s.size;
    1642:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1645:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1648:	89 0a                	mov    %ecx,(%edx)
}
    164a:	5b                   	pop    %ebx
    164b:	5e                   	pop    %esi
    164c:	5f                   	pop    %edi
    164d:	5d                   	pop    %ebp
    164e:	c3                   	ret    
    164f:	90                   	nop

00001650 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1650:	55                   	push   %ebp
    1651:	89 e5                	mov    %esp,%ebp
    1653:	57                   	push   %edi
    1654:	56                   	push   %esi
    1655:	53                   	push   %ebx
    1656:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1659:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    165c:	8b 3d 74 1a 00 00    	mov    0x1a74,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1662:	8d 70 07             	lea    0x7(%eax),%esi
    1665:	c1 ee 03             	shr    $0x3,%esi
    1668:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    166b:	85 ff                	test   %edi,%edi
    166d:	0f 84 9d 00 00 00    	je     1710 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1673:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1675:	8b 4a 04             	mov    0x4(%edx),%ecx
    1678:	39 f1                	cmp    %esi,%ecx
    167a:	73 6a                	jae    16e6 <malloc+0x96>
    167c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1681:	39 de                	cmp    %ebx,%esi
    1683:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1686:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    168d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1690:	eb 17                	jmp    16a9 <malloc+0x59>
    1692:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1698:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    169a:	8b 48 04             	mov    0x4(%eax),%ecx
    169d:	39 f1                	cmp    %esi,%ecx
    169f:	73 4f                	jae    16f0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    16a1:	8b 3d 74 1a 00 00    	mov    0x1a74,%edi
    16a7:	89 c2                	mov    %eax,%edx
    16a9:	39 d7                	cmp    %edx,%edi
    16ab:	75 eb                	jne    1698 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    16ad:	83 ec 0c             	sub    $0xc,%esp
    16b0:	ff 75 e4             	push   -0x1c(%ebp)
    16b3:	e8 83 fc ff ff       	call   133b <sbrk>
  if(p == (char*)-1)
    16b8:	83 c4 10             	add    $0x10,%esp
    16bb:	83 f8 ff             	cmp    $0xffffffff,%eax
    16be:	74 1c                	je     16dc <malloc+0x8c>
  hp->s.size = nu;
    16c0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    16c3:	83 ec 0c             	sub    $0xc,%esp
    16c6:	83 c0 08             	add    $0x8,%eax
    16c9:	50                   	push   %eax
    16ca:	e8 f1 fe ff ff       	call   15c0 <free>
  return freep;
    16cf:	8b 15 74 1a 00 00    	mov    0x1a74,%edx
      if((p = morecore(nunits)) == 0)
    16d5:	83 c4 10             	add    $0x10,%esp
    16d8:	85 d2                	test   %edx,%edx
    16da:	75 bc                	jne    1698 <malloc+0x48>
        return 0;
  }
}
    16dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    16df:	31 c0                	xor    %eax,%eax
}
    16e1:	5b                   	pop    %ebx
    16e2:	5e                   	pop    %esi
    16e3:	5f                   	pop    %edi
    16e4:	5d                   	pop    %ebp
    16e5:	c3                   	ret    
    if(p->s.size >= nunits){
    16e6:	89 d0                	mov    %edx,%eax
    16e8:	89 fa                	mov    %edi,%edx
    16ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    16f0:	39 ce                	cmp    %ecx,%esi
    16f2:	74 4c                	je     1740 <malloc+0xf0>
        p->s.size -= nunits;
    16f4:	29 f1                	sub    %esi,%ecx
    16f6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    16f9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    16fc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    16ff:	89 15 74 1a 00 00    	mov    %edx,0x1a74
}
    1705:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1708:	83 c0 08             	add    $0x8,%eax
}
    170b:	5b                   	pop    %ebx
    170c:	5e                   	pop    %esi
    170d:	5f                   	pop    %edi
    170e:	5d                   	pop    %ebp
    170f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    1710:	c7 05 74 1a 00 00 78 	movl   $0x1a78,0x1a74
    1717:	1a 00 00 
    base.s.size = 0;
    171a:	bf 78 1a 00 00       	mov    $0x1a78,%edi
    base.s.ptr = freep = prevp = &base;
    171f:	c7 05 78 1a 00 00 78 	movl   $0x1a78,0x1a78
    1726:	1a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1729:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    172b:	c7 05 7c 1a 00 00 00 	movl   $0x0,0x1a7c
    1732:	00 00 00 
    if(p->s.size >= nunits){
    1735:	e9 42 ff ff ff       	jmp    167c <malloc+0x2c>
    173a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1740:	8b 08                	mov    (%eax),%ecx
    1742:	89 0a                	mov    %ecx,(%edx)
    1744:	eb b9                	jmp    16ff <malloc+0xaf>
