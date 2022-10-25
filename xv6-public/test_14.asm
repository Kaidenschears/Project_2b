
_test_14:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:


#define PGSIZE 4096


int main(void) {
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	push   -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	53                   	push   %ebx
    100e:	51                   	push   %ecx
    const uint PAGES_NUM = 1;
    
    char *ptr = sbrk(PAGES_NUM * PGSIZE);
    100f:	83 ec 0c             	sub    $0xc,%esp
    1012:	68 00 10 00 00       	push   $0x1000
    1017:	e8 1f 03 00 00       	call   133b <sbrk>
    101c:	89 c3                	mov    %eax,%ebx
    printf(1, "XV6_TEST_OUTPUT %d\n", mprotect(ptr, -10));
    101e:	58                   	pop    %eax
    101f:	5a                   	pop    %edx
    1020:	6a f6                	push   $0xfffffff6
    1022:	53                   	push   %ebx
    1023:	e8 3b 03 00 00       	call   1363 <mprotect>
    1028:	83 c4 0c             	add    $0xc,%esp
    102b:	50                   	push   %eax
    102c:	68 58 17 00 00       	push   $0x1758
    1031:	6a 01                	push   $0x1
    1033:	e8 f8 03 00 00       	call   1430 <printf>
    printf(1, "XV6_TEST_OUTPUT %d\n", mprotect(ptr, PAGES_NUM + 10));
    1038:	59                   	pop    %ecx
    1039:	58                   	pop    %eax
    103a:	6a 0b                	push   $0xb
    103c:	53                   	push   %ebx
    103d:	e8 21 03 00 00       	call   1363 <mprotect>
    1042:	83 c4 0c             	add    $0xc,%esp
    1045:	50                   	push   %eax
    1046:	68 58 17 00 00       	push   $0x1758
    104b:	6a 01                	push   $0x1
    104d:	e8 de 03 00 00       	call   1430 <printf>
    
    exit();
    1052:	e8 5c 02 00 00       	call   12b3 <exit>
    1057:	66 90                	xchg   %ax,%ax
    1059:	66 90                	xchg   %ax,%ax
    105b:	66 90                	xchg   %ax,%ax
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

00001363 <mprotect>:
SYSCALL(mprotect)
    1363:	b8 18 00 00 00       	mov    $0x18,%eax
    1368:	cd 40                	int    $0x40
    136a:	c3                   	ret    

0000136b <munprotect>:
SYSCALL(munprotect)
    136b:	b8 19 00 00 00       	mov    $0x19,%eax
    1370:	cd 40                	int    $0x40
    1372:	c3                   	ret    
    1373:	66 90                	xchg   %ax,%ax
    1375:	66 90                	xchg   %ax,%ax
    1377:	66 90                	xchg   %ax,%ax
    1379:	66 90                	xchg   %ax,%ax
    137b:	66 90                	xchg   %ax,%ax
    137d:	66 90                	xchg   %ax,%ax
    137f:	90                   	nop

00001380 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1380:	55                   	push   %ebp
    1381:	89 e5                	mov    %esp,%ebp
    1383:	57                   	push   %edi
    1384:	56                   	push   %esi
    1385:	53                   	push   %ebx
    1386:	83 ec 3c             	sub    $0x3c,%esp
    1389:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    138c:	89 d1                	mov    %edx,%ecx
{
    138e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1391:	85 d2                	test   %edx,%edx
    1393:	0f 89 7f 00 00 00    	jns    1418 <printint+0x98>
    1399:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    139d:	74 79                	je     1418 <printint+0x98>
    neg = 1;
    139f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    13a6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    13a8:	31 db                	xor    %ebx,%ebx
    13aa:	8d 75 d7             	lea    -0x29(%ebp),%esi
    13ad:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    13b0:	89 c8                	mov    %ecx,%eax
    13b2:	31 d2                	xor    %edx,%edx
    13b4:	89 cf                	mov    %ecx,%edi
    13b6:	f7 75 c4             	divl   -0x3c(%ebp)
    13b9:	0f b6 92 cc 17 00 00 	movzbl 0x17cc(%edx),%edx
    13c0:	89 45 c0             	mov    %eax,-0x40(%ebp)
    13c3:	89 d8                	mov    %ebx,%eax
    13c5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    13c8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    13cb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    13ce:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    13d1:	76 dd                	jbe    13b0 <printint+0x30>
  if(neg)
    13d3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    13d6:	85 c9                	test   %ecx,%ecx
    13d8:	74 0c                	je     13e6 <printint+0x66>
    buf[i++] = '-';
    13da:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    13df:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    13e1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    13e6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    13e9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    13ed:	eb 07                	jmp    13f6 <printint+0x76>
    13ef:	90                   	nop
    putc(fd, buf[i]);
    13f0:	0f b6 13             	movzbl (%ebx),%edx
    13f3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    13f6:	83 ec 04             	sub    $0x4,%esp
    13f9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    13fc:	6a 01                	push   $0x1
    13fe:	56                   	push   %esi
    13ff:	57                   	push   %edi
    1400:	e8 ce fe ff ff       	call   12d3 <write>
  while(--i >= 0)
    1405:	83 c4 10             	add    $0x10,%esp
    1408:	39 de                	cmp    %ebx,%esi
    140a:	75 e4                	jne    13f0 <printint+0x70>
}
    140c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    140f:	5b                   	pop    %ebx
    1410:	5e                   	pop    %esi
    1411:	5f                   	pop    %edi
    1412:	5d                   	pop    %ebp
    1413:	c3                   	ret    
    1414:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1418:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    141f:	eb 87                	jmp    13a8 <printint+0x28>
    1421:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1428:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    142f:	90                   	nop

00001430 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1430:	55                   	push   %ebp
    1431:	89 e5                	mov    %esp,%ebp
    1433:	57                   	push   %edi
    1434:	56                   	push   %esi
    1435:	53                   	push   %ebx
    1436:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1439:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    143c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    143f:	0f b6 13             	movzbl (%ebx),%edx
    1442:	84 d2                	test   %dl,%dl
    1444:	74 6a                	je     14b0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    1446:	8d 45 10             	lea    0x10(%ebp),%eax
    1449:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    144c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    144f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    1451:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1454:	eb 36                	jmp    148c <printf+0x5c>
    1456:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    145d:	8d 76 00             	lea    0x0(%esi),%esi
    1460:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1463:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1468:	83 f8 25             	cmp    $0x25,%eax
    146b:	74 15                	je     1482 <printf+0x52>
  write(fd, &c, 1);
    146d:	83 ec 04             	sub    $0x4,%esp
    1470:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1473:	6a 01                	push   $0x1
    1475:	57                   	push   %edi
    1476:	56                   	push   %esi
    1477:	e8 57 fe ff ff       	call   12d3 <write>
    147c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    147f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1482:	0f b6 13             	movzbl (%ebx),%edx
    1485:	83 c3 01             	add    $0x1,%ebx
    1488:	84 d2                	test   %dl,%dl
    148a:	74 24                	je     14b0 <printf+0x80>
    c = fmt[i] & 0xff;
    148c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    148f:	85 c9                	test   %ecx,%ecx
    1491:	74 cd                	je     1460 <printf+0x30>
      }
    } else if(state == '%'){
    1493:	83 f9 25             	cmp    $0x25,%ecx
    1496:	75 ea                	jne    1482 <printf+0x52>
      if(c == 'd'){
    1498:	83 f8 25             	cmp    $0x25,%eax
    149b:	0f 84 07 01 00 00    	je     15a8 <printf+0x178>
    14a1:	83 e8 63             	sub    $0x63,%eax
    14a4:	83 f8 15             	cmp    $0x15,%eax
    14a7:	77 17                	ja     14c0 <printf+0x90>
    14a9:	ff 24 85 74 17 00 00 	jmp    *0x1774(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    14b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14b3:	5b                   	pop    %ebx
    14b4:	5e                   	pop    %esi
    14b5:	5f                   	pop    %edi
    14b6:	5d                   	pop    %ebp
    14b7:	c3                   	ret    
    14b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14bf:	90                   	nop
  write(fd, &c, 1);
    14c0:	83 ec 04             	sub    $0x4,%esp
    14c3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    14c6:	6a 01                	push   $0x1
    14c8:	57                   	push   %edi
    14c9:	56                   	push   %esi
    14ca:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    14ce:	e8 00 fe ff ff       	call   12d3 <write>
        putc(fd, c);
    14d3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    14d7:	83 c4 0c             	add    $0xc,%esp
    14da:	88 55 e7             	mov    %dl,-0x19(%ebp)
    14dd:	6a 01                	push   $0x1
    14df:	57                   	push   %edi
    14e0:	56                   	push   %esi
    14e1:	e8 ed fd ff ff       	call   12d3 <write>
        putc(fd, c);
    14e6:	83 c4 10             	add    $0x10,%esp
      state = 0;
    14e9:	31 c9                	xor    %ecx,%ecx
    14eb:	eb 95                	jmp    1482 <printf+0x52>
    14ed:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    14f0:	83 ec 0c             	sub    $0xc,%esp
    14f3:	b9 10 00 00 00       	mov    $0x10,%ecx
    14f8:	6a 00                	push   $0x0
    14fa:	8b 45 d0             	mov    -0x30(%ebp),%eax
    14fd:	8b 10                	mov    (%eax),%edx
    14ff:	89 f0                	mov    %esi,%eax
    1501:	e8 7a fe ff ff       	call   1380 <printint>
        ap++;
    1506:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    150a:	83 c4 10             	add    $0x10,%esp
      state = 0;
    150d:	31 c9                	xor    %ecx,%ecx
    150f:	e9 6e ff ff ff       	jmp    1482 <printf+0x52>
    1514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1518:	8b 45 d0             	mov    -0x30(%ebp),%eax
    151b:	8b 10                	mov    (%eax),%edx
        ap++;
    151d:	83 c0 04             	add    $0x4,%eax
    1520:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    1523:	85 d2                	test   %edx,%edx
    1525:	0f 84 8d 00 00 00    	je     15b8 <printf+0x188>
        while(*s != 0){
    152b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    152e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    1530:	84 c0                	test   %al,%al
    1532:	0f 84 4a ff ff ff    	je     1482 <printf+0x52>
    1538:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    153b:	89 d3                	mov    %edx,%ebx
    153d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1540:	83 ec 04             	sub    $0x4,%esp
          s++;
    1543:	83 c3 01             	add    $0x1,%ebx
    1546:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1549:	6a 01                	push   $0x1
    154b:	57                   	push   %edi
    154c:	56                   	push   %esi
    154d:	e8 81 fd ff ff       	call   12d3 <write>
        while(*s != 0){
    1552:	0f b6 03             	movzbl (%ebx),%eax
    1555:	83 c4 10             	add    $0x10,%esp
    1558:	84 c0                	test   %al,%al
    155a:	75 e4                	jne    1540 <printf+0x110>
      state = 0;
    155c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    155f:	31 c9                	xor    %ecx,%ecx
    1561:	e9 1c ff ff ff       	jmp    1482 <printf+0x52>
    1566:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    156d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1570:	83 ec 0c             	sub    $0xc,%esp
    1573:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1578:	6a 01                	push   $0x1
    157a:	e9 7b ff ff ff       	jmp    14fa <printf+0xca>
    157f:	90                   	nop
        putc(fd, *ap);
    1580:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1583:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1586:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1588:	6a 01                	push   $0x1
    158a:	57                   	push   %edi
    158b:	56                   	push   %esi
        putc(fd, *ap);
    158c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    158f:	e8 3f fd ff ff       	call   12d3 <write>
        ap++;
    1594:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1598:	83 c4 10             	add    $0x10,%esp
      state = 0;
    159b:	31 c9                	xor    %ecx,%ecx
    159d:	e9 e0 fe ff ff       	jmp    1482 <printf+0x52>
    15a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    15a8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    15ab:	83 ec 04             	sub    $0x4,%esp
    15ae:	e9 2a ff ff ff       	jmp    14dd <printf+0xad>
    15b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    15b7:	90                   	nop
          s = "(null)";
    15b8:	ba 6c 17 00 00       	mov    $0x176c,%edx
        while(*s != 0){
    15bd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    15c0:	b8 28 00 00 00       	mov    $0x28,%eax
    15c5:	89 d3                	mov    %edx,%ebx
    15c7:	e9 74 ff ff ff       	jmp    1540 <printf+0x110>
    15cc:	66 90                	xchg   %ax,%ax
    15ce:	66 90                	xchg   %ax,%ax

000015d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    15d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15d1:	a1 78 1a 00 00       	mov    0x1a78,%eax
{
    15d6:	89 e5                	mov    %esp,%ebp
    15d8:	57                   	push   %edi
    15d9:	56                   	push   %esi
    15da:	53                   	push   %ebx
    15db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    15de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15e8:	89 c2                	mov    %eax,%edx
    15ea:	8b 00                	mov    (%eax),%eax
    15ec:	39 ca                	cmp    %ecx,%edx
    15ee:	73 30                	jae    1620 <free+0x50>
    15f0:	39 c1                	cmp    %eax,%ecx
    15f2:	72 04                	jb     15f8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15f4:	39 c2                	cmp    %eax,%edx
    15f6:	72 f0                	jb     15e8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    15f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    15fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    15fe:	39 f8                	cmp    %edi,%eax
    1600:	74 30                	je     1632 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    1602:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1605:	8b 42 04             	mov    0x4(%edx),%eax
    1608:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    160b:	39 f1                	cmp    %esi,%ecx
    160d:	74 3a                	je     1649 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    160f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    1611:	5b                   	pop    %ebx
  freep = p;
    1612:	89 15 78 1a 00 00    	mov    %edx,0x1a78
}
    1618:	5e                   	pop    %esi
    1619:	5f                   	pop    %edi
    161a:	5d                   	pop    %ebp
    161b:	c3                   	ret    
    161c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1620:	39 c2                	cmp    %eax,%edx
    1622:	72 c4                	jb     15e8 <free+0x18>
    1624:	39 c1                	cmp    %eax,%ecx
    1626:	73 c0                	jae    15e8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    1628:	8b 73 fc             	mov    -0x4(%ebx),%esi
    162b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    162e:	39 f8                	cmp    %edi,%eax
    1630:	75 d0                	jne    1602 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    1632:	03 70 04             	add    0x4(%eax),%esi
    1635:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1638:	8b 02                	mov    (%edx),%eax
    163a:	8b 00                	mov    (%eax),%eax
    163c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    163f:	8b 42 04             	mov    0x4(%edx),%eax
    1642:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1645:	39 f1                	cmp    %esi,%ecx
    1647:	75 c6                	jne    160f <free+0x3f>
    p->s.size += bp->s.size;
    1649:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    164c:	89 15 78 1a 00 00    	mov    %edx,0x1a78
    p->s.size += bp->s.size;
    1652:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1655:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1658:	89 0a                	mov    %ecx,(%edx)
}
    165a:	5b                   	pop    %ebx
    165b:	5e                   	pop    %esi
    165c:	5f                   	pop    %edi
    165d:	5d                   	pop    %ebp
    165e:	c3                   	ret    
    165f:	90                   	nop

00001660 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1660:	55                   	push   %ebp
    1661:	89 e5                	mov    %esp,%ebp
    1663:	57                   	push   %edi
    1664:	56                   	push   %esi
    1665:	53                   	push   %ebx
    1666:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1669:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    166c:	8b 3d 78 1a 00 00    	mov    0x1a78,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1672:	8d 70 07             	lea    0x7(%eax),%esi
    1675:	c1 ee 03             	shr    $0x3,%esi
    1678:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    167b:	85 ff                	test   %edi,%edi
    167d:	0f 84 9d 00 00 00    	je     1720 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1683:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1685:	8b 4a 04             	mov    0x4(%edx),%ecx
    1688:	39 f1                	cmp    %esi,%ecx
    168a:	73 6a                	jae    16f6 <malloc+0x96>
    168c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1691:	39 de                	cmp    %ebx,%esi
    1693:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1696:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    169d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    16a0:	eb 17                	jmp    16b9 <malloc+0x59>
    16a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16a8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    16aa:	8b 48 04             	mov    0x4(%eax),%ecx
    16ad:	39 f1                	cmp    %esi,%ecx
    16af:	73 4f                	jae    1700 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    16b1:	8b 3d 78 1a 00 00    	mov    0x1a78,%edi
    16b7:	89 c2                	mov    %eax,%edx
    16b9:	39 d7                	cmp    %edx,%edi
    16bb:	75 eb                	jne    16a8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    16bd:	83 ec 0c             	sub    $0xc,%esp
    16c0:	ff 75 e4             	push   -0x1c(%ebp)
    16c3:	e8 73 fc ff ff       	call   133b <sbrk>
  if(p == (char*)-1)
    16c8:	83 c4 10             	add    $0x10,%esp
    16cb:	83 f8 ff             	cmp    $0xffffffff,%eax
    16ce:	74 1c                	je     16ec <malloc+0x8c>
  hp->s.size = nu;
    16d0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    16d3:	83 ec 0c             	sub    $0xc,%esp
    16d6:	83 c0 08             	add    $0x8,%eax
    16d9:	50                   	push   %eax
    16da:	e8 f1 fe ff ff       	call   15d0 <free>
  return freep;
    16df:	8b 15 78 1a 00 00    	mov    0x1a78,%edx
      if((p = morecore(nunits)) == 0)
    16e5:	83 c4 10             	add    $0x10,%esp
    16e8:	85 d2                	test   %edx,%edx
    16ea:	75 bc                	jne    16a8 <malloc+0x48>
        return 0;
  }
}
    16ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    16ef:	31 c0                	xor    %eax,%eax
}
    16f1:	5b                   	pop    %ebx
    16f2:	5e                   	pop    %esi
    16f3:	5f                   	pop    %edi
    16f4:	5d                   	pop    %ebp
    16f5:	c3                   	ret    
    if(p->s.size >= nunits){
    16f6:	89 d0                	mov    %edx,%eax
    16f8:	89 fa                	mov    %edi,%edx
    16fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1700:	39 ce                	cmp    %ecx,%esi
    1702:	74 4c                	je     1750 <malloc+0xf0>
        p->s.size -= nunits;
    1704:	29 f1                	sub    %esi,%ecx
    1706:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1709:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    170c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    170f:	89 15 78 1a 00 00    	mov    %edx,0x1a78
}
    1715:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1718:	83 c0 08             	add    $0x8,%eax
}
    171b:	5b                   	pop    %ebx
    171c:	5e                   	pop    %esi
    171d:	5f                   	pop    %edi
    171e:	5d                   	pop    %ebp
    171f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    1720:	c7 05 78 1a 00 00 7c 	movl   $0x1a7c,0x1a78
    1727:	1a 00 00 
    base.s.size = 0;
    172a:	bf 7c 1a 00 00       	mov    $0x1a7c,%edi
    base.s.ptr = freep = prevp = &base;
    172f:	c7 05 7c 1a 00 00 7c 	movl   $0x1a7c,0x1a7c
    1736:	1a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1739:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    173b:	c7 05 80 1a 00 00 00 	movl   $0x0,0x1a80
    1742:	00 00 00 
    if(p->s.size >= nunits){
    1745:	e9 42 ff ff ff       	jmp    168c <malloc+0x2c>
    174a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1750:	8b 08                	mov    (%eax),%ecx
    1752:	89 0a                	mov    %ecx,(%edx)
    1754:	eb b9                	jmp    170f <malloc+0xaf>
