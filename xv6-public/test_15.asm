
_test_15:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "user.h"
#define PGSIZE 4096


int 
main(void){
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	push   -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	56                   	push   %esi
    100e:	53                   	push   %ebx
    100f:	51                   	push   %ecx
    1010:	83 ec 18             	sub    $0x18,%esp
    const uint PAGES_NUM = 5;
    
    // Allocate 5 pages
    char *ptr = sbrk(PGSIZE * PAGES_NUM * sizeof(char));
    1013:	68 00 50 00 00       	push   $0x5000
    1018:	e8 3e 03 00 00       	call   135b <sbrk>
    mprotect(ptr, PAGES_NUM);
    101d:	59                   	pop    %ecx
    101e:	5e                   	pop    %esi
    101f:	6a 05                	push   $0x5
    1021:	50                   	push   %eax
    char *ptr = sbrk(PGSIZE * PAGES_NUM * sizeof(char));
    1022:	89 c3                	mov    %eax,%ebx
    mprotect(ptr, PAGES_NUM);
    1024:	e8 5a 03 00 00       	call   1383 <mprotect>
    int ppid = getpid();
    1029:	e8 25 03 00 00       	call   1353 <getpid>
    102e:	89 c6                	mov    %eax,%esi

    if (fork() == 0) {
    1030:	e8 96 02 00 00       	call   12cb <fork>
    1035:	83 c4 10             	add    $0x10,%esp
    1038:	85 c0                	test   %eax,%eax
    103a:	75 22                	jne    105e <main+0x5e>
        // Should page fault as normally here
        ptr[2 * PGSIZE] = 0xAA;
    103c:	c6 83 00 20 00 00 aa 	movb   $0xaa,0x2000(%ebx)
        printf(1, "XV6_TEST_OUTPUT Seg fault failed to trigger\n");
    1043:	52                   	push   %edx
    1044:	52                   	push   %edx
    1045:	68 78 17 00 00       	push   $0x1778
    104a:	6a 01                	push   $0x1
    104c:	e8 ff 03 00 00       	call   1450 <printf>
        // Shouldn't reach here
        kill(ppid);
    1051:	89 34 24             	mov    %esi,(%esp)
    1054:	e8 aa 02 00 00       	call   1303 <kill>
        exit();
    1059:	e8 75 02 00 00       	call   12d3 <exit>
    } else {
        wait();
    105e:	e8 78 02 00 00       	call   12db <wait>
    }

    printf(1, "XV6_TEST_OUTPUT TEST PASS\n");
    1063:	50                   	push   %eax
    1064:	50                   	push   %eax
    1065:	68 a5 17 00 00       	push   $0x17a5
    106a:	6a 01                	push   $0x1
    106c:	e8 df 03 00 00       	call   1450 <printf>

    exit();
    1071:	e8 5d 02 00 00       	call   12d3 <exit>
    1076:	66 90                	xchg   %ax,%ax
    1078:	66 90                	xchg   %ax,%ax
    107a:	66 90                	xchg   %ax,%ax
    107c:	66 90                	xchg   %ax,%ax
    107e:	66 90                	xchg   %ax,%ax

00001080 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1080:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1081:	31 c0                	xor    %eax,%eax
{
    1083:	89 e5                	mov    %esp,%ebp
    1085:	53                   	push   %ebx
    1086:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1089:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    108c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1090:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1094:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1097:	83 c0 01             	add    $0x1,%eax
    109a:	84 d2                	test   %dl,%dl
    109c:	75 f2                	jne    1090 <strcpy+0x10>
    ;
  return os;
}
    109e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10a1:	89 c8                	mov    %ecx,%eax
    10a3:	c9                   	leave  
    10a4:	c3                   	ret    
    10a5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000010b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10b0:	55                   	push   %ebp
    10b1:	89 e5                	mov    %esp,%ebp
    10b3:	53                   	push   %ebx
    10b4:	8b 55 08             	mov    0x8(%ebp),%edx
    10b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    10ba:	0f b6 02             	movzbl (%edx),%eax
    10bd:	84 c0                	test   %al,%al
    10bf:	75 17                	jne    10d8 <strcmp+0x28>
    10c1:	eb 3a                	jmp    10fd <strcmp+0x4d>
    10c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10c7:	90                   	nop
    10c8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    10cc:	83 c2 01             	add    $0x1,%edx
    10cf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    10d2:	84 c0                	test   %al,%al
    10d4:	74 1a                	je     10f0 <strcmp+0x40>
    p++, q++;
    10d6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    10d8:	0f b6 19             	movzbl (%ecx),%ebx
    10db:	38 c3                	cmp    %al,%bl
    10dd:	74 e9                	je     10c8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    10df:	29 d8                	sub    %ebx,%eax
}
    10e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10e4:	c9                   	leave  
    10e5:	c3                   	ret    
    10e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10ed:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    10f0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    10f4:	31 c0                	xor    %eax,%eax
    10f6:	29 d8                	sub    %ebx,%eax
}
    10f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10fb:	c9                   	leave  
    10fc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    10fd:	0f b6 19             	movzbl (%ecx),%ebx
    1100:	31 c0                	xor    %eax,%eax
    1102:	eb db                	jmp    10df <strcmp+0x2f>
    1104:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    110b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    110f:	90                   	nop

00001110 <strlen>:

uint
strlen(const char *s)
{
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    1116:	80 3a 00             	cmpb   $0x0,(%edx)
    1119:	74 15                	je     1130 <strlen+0x20>
    111b:	31 c0                	xor    %eax,%eax
    111d:	8d 76 00             	lea    0x0(%esi),%esi
    1120:	83 c0 01             	add    $0x1,%eax
    1123:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    1127:	89 c1                	mov    %eax,%ecx
    1129:	75 f5                	jne    1120 <strlen+0x10>
    ;
  return n;
}
    112b:	89 c8                	mov    %ecx,%eax
    112d:	5d                   	pop    %ebp
    112e:	c3                   	ret    
    112f:	90                   	nop
  for(n = 0; s[n]; n++)
    1130:	31 c9                	xor    %ecx,%ecx
}
    1132:	5d                   	pop    %ebp
    1133:	89 c8                	mov    %ecx,%eax
    1135:	c3                   	ret    
    1136:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    113d:	8d 76 00             	lea    0x0(%esi),%esi

00001140 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	57                   	push   %edi
    1144:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1147:	8b 4d 10             	mov    0x10(%ebp),%ecx
    114a:	8b 45 0c             	mov    0xc(%ebp),%eax
    114d:	89 d7                	mov    %edx,%edi
    114f:	fc                   	cld    
    1150:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1152:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1155:	89 d0                	mov    %edx,%eax
    1157:	c9                   	leave  
    1158:	c3                   	ret    
    1159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001160 <strchr>:

char*
strchr(const char *s, char c)
{
    1160:	55                   	push   %ebp
    1161:	89 e5                	mov    %esp,%ebp
    1163:	8b 45 08             	mov    0x8(%ebp),%eax
    1166:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    116a:	0f b6 10             	movzbl (%eax),%edx
    116d:	84 d2                	test   %dl,%dl
    116f:	75 12                	jne    1183 <strchr+0x23>
    1171:	eb 1d                	jmp    1190 <strchr+0x30>
    1173:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1177:	90                   	nop
    1178:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    117c:	83 c0 01             	add    $0x1,%eax
    117f:	84 d2                	test   %dl,%dl
    1181:	74 0d                	je     1190 <strchr+0x30>
    if(*s == c)
    1183:	38 d1                	cmp    %dl,%cl
    1185:	75 f1                	jne    1178 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1187:	5d                   	pop    %ebp
    1188:	c3                   	ret    
    1189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1190:	31 c0                	xor    %eax,%eax
}
    1192:	5d                   	pop    %ebp
    1193:	c3                   	ret    
    1194:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    119b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    119f:	90                   	nop

000011a0 <gets>:

char*
gets(char *buf, int max)
{
    11a0:	55                   	push   %ebp
    11a1:	89 e5                	mov    %esp,%ebp
    11a3:	57                   	push   %edi
    11a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    11a5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    11a8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    11a9:	31 db                	xor    %ebx,%ebx
{
    11ab:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    11ae:	eb 27                	jmp    11d7 <gets+0x37>
    cc = read(0, &c, 1);
    11b0:	83 ec 04             	sub    $0x4,%esp
    11b3:	6a 01                	push   $0x1
    11b5:	57                   	push   %edi
    11b6:	6a 00                	push   $0x0
    11b8:	e8 2e 01 00 00       	call   12eb <read>
    if(cc < 1)
    11bd:	83 c4 10             	add    $0x10,%esp
    11c0:	85 c0                	test   %eax,%eax
    11c2:	7e 1d                	jle    11e1 <gets+0x41>
      break;
    buf[i++] = c;
    11c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11c8:	8b 55 08             	mov    0x8(%ebp),%edx
    11cb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    11cf:	3c 0a                	cmp    $0xa,%al
    11d1:	74 1d                	je     11f0 <gets+0x50>
    11d3:	3c 0d                	cmp    $0xd,%al
    11d5:	74 19                	je     11f0 <gets+0x50>
  for(i=0; i+1 < max; ){
    11d7:	89 de                	mov    %ebx,%esi
    11d9:	83 c3 01             	add    $0x1,%ebx
    11dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11df:	7c cf                	jl     11b0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    11e1:	8b 45 08             	mov    0x8(%ebp),%eax
    11e4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    11e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11eb:	5b                   	pop    %ebx
    11ec:	5e                   	pop    %esi
    11ed:	5f                   	pop    %edi
    11ee:	5d                   	pop    %ebp
    11ef:	c3                   	ret    
  buf[i] = '\0';
    11f0:	8b 45 08             	mov    0x8(%ebp),%eax
    11f3:	89 de                	mov    %ebx,%esi
    11f5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    11f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11fc:	5b                   	pop    %ebx
    11fd:	5e                   	pop    %esi
    11fe:	5f                   	pop    %edi
    11ff:	5d                   	pop    %ebp
    1200:	c3                   	ret    
    1201:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1208:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    120f:	90                   	nop

00001210 <stat>:

int
stat(const char *n, struct stat *st)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	56                   	push   %esi
    1214:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1215:	83 ec 08             	sub    $0x8,%esp
    1218:	6a 00                	push   $0x0
    121a:	ff 75 08             	push   0x8(%ebp)
    121d:	e8 f1 00 00 00       	call   1313 <open>
  if(fd < 0)
    1222:	83 c4 10             	add    $0x10,%esp
    1225:	85 c0                	test   %eax,%eax
    1227:	78 27                	js     1250 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1229:	83 ec 08             	sub    $0x8,%esp
    122c:	ff 75 0c             	push   0xc(%ebp)
    122f:	89 c3                	mov    %eax,%ebx
    1231:	50                   	push   %eax
    1232:	e8 f4 00 00 00       	call   132b <fstat>
  close(fd);
    1237:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    123a:	89 c6                	mov    %eax,%esi
  close(fd);
    123c:	e8 ba 00 00 00       	call   12fb <close>
  return r;
    1241:	83 c4 10             	add    $0x10,%esp
}
    1244:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1247:	89 f0                	mov    %esi,%eax
    1249:	5b                   	pop    %ebx
    124a:	5e                   	pop    %esi
    124b:	5d                   	pop    %ebp
    124c:	c3                   	ret    
    124d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1250:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1255:	eb ed                	jmp    1244 <stat+0x34>
    1257:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    125e:	66 90                	xchg   %ax,%ax

00001260 <atoi>:

int
atoi(const char *s)
{
    1260:	55                   	push   %ebp
    1261:	89 e5                	mov    %esp,%ebp
    1263:	53                   	push   %ebx
    1264:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1267:	0f be 02             	movsbl (%edx),%eax
    126a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    126d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1270:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1275:	77 1e                	ja     1295 <atoi+0x35>
    1277:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    127e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1280:	83 c2 01             	add    $0x1,%edx
    1283:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1286:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    128a:	0f be 02             	movsbl (%edx),%eax
    128d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1290:	80 fb 09             	cmp    $0x9,%bl
    1293:	76 eb                	jbe    1280 <atoi+0x20>
  return n;
}
    1295:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1298:	89 c8                	mov    %ecx,%eax
    129a:	c9                   	leave  
    129b:	c3                   	ret    
    129c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000012a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    12a0:	55                   	push   %ebp
    12a1:	89 e5                	mov    %esp,%ebp
    12a3:	57                   	push   %edi
    12a4:	8b 45 10             	mov    0x10(%ebp),%eax
    12a7:	8b 55 08             	mov    0x8(%ebp),%edx
    12aa:	56                   	push   %esi
    12ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12ae:	85 c0                	test   %eax,%eax
    12b0:	7e 13                	jle    12c5 <memmove+0x25>
    12b2:	01 d0                	add    %edx,%eax
  dst = vdst;
    12b4:	89 d7                	mov    %edx,%edi
    12b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12bd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    12c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    12c1:	39 f8                	cmp    %edi,%eax
    12c3:	75 fb                	jne    12c0 <memmove+0x20>
  return vdst;
}
    12c5:	5e                   	pop    %esi
    12c6:	89 d0                	mov    %edx,%eax
    12c8:	5f                   	pop    %edi
    12c9:	5d                   	pop    %ebp
    12ca:	c3                   	ret    

000012cb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    12cb:	b8 01 00 00 00       	mov    $0x1,%eax
    12d0:	cd 40                	int    $0x40
    12d2:	c3                   	ret    

000012d3 <exit>:
SYSCALL(exit)
    12d3:	b8 02 00 00 00       	mov    $0x2,%eax
    12d8:	cd 40                	int    $0x40
    12da:	c3                   	ret    

000012db <wait>:
SYSCALL(wait)
    12db:	b8 03 00 00 00       	mov    $0x3,%eax
    12e0:	cd 40                	int    $0x40
    12e2:	c3                   	ret    

000012e3 <pipe>:
SYSCALL(pipe)
    12e3:	b8 04 00 00 00       	mov    $0x4,%eax
    12e8:	cd 40                	int    $0x40
    12ea:	c3                   	ret    

000012eb <read>:
SYSCALL(read)
    12eb:	b8 05 00 00 00       	mov    $0x5,%eax
    12f0:	cd 40                	int    $0x40
    12f2:	c3                   	ret    

000012f3 <write>:
SYSCALL(write)
    12f3:	b8 10 00 00 00       	mov    $0x10,%eax
    12f8:	cd 40                	int    $0x40
    12fa:	c3                   	ret    

000012fb <close>:
SYSCALL(close)
    12fb:	b8 15 00 00 00       	mov    $0x15,%eax
    1300:	cd 40                	int    $0x40
    1302:	c3                   	ret    

00001303 <kill>:
SYSCALL(kill)
    1303:	b8 06 00 00 00       	mov    $0x6,%eax
    1308:	cd 40                	int    $0x40
    130a:	c3                   	ret    

0000130b <exec>:
SYSCALL(exec)
    130b:	b8 07 00 00 00       	mov    $0x7,%eax
    1310:	cd 40                	int    $0x40
    1312:	c3                   	ret    

00001313 <open>:
SYSCALL(open)
    1313:	b8 0f 00 00 00       	mov    $0xf,%eax
    1318:	cd 40                	int    $0x40
    131a:	c3                   	ret    

0000131b <mknod>:
SYSCALL(mknod)
    131b:	b8 11 00 00 00       	mov    $0x11,%eax
    1320:	cd 40                	int    $0x40
    1322:	c3                   	ret    

00001323 <unlink>:
SYSCALL(unlink)
    1323:	b8 12 00 00 00       	mov    $0x12,%eax
    1328:	cd 40                	int    $0x40
    132a:	c3                   	ret    

0000132b <fstat>:
SYSCALL(fstat)
    132b:	b8 08 00 00 00       	mov    $0x8,%eax
    1330:	cd 40                	int    $0x40
    1332:	c3                   	ret    

00001333 <link>:
SYSCALL(link)
    1333:	b8 13 00 00 00       	mov    $0x13,%eax
    1338:	cd 40                	int    $0x40
    133a:	c3                   	ret    

0000133b <mkdir>:
SYSCALL(mkdir)
    133b:	b8 14 00 00 00       	mov    $0x14,%eax
    1340:	cd 40                	int    $0x40
    1342:	c3                   	ret    

00001343 <chdir>:
SYSCALL(chdir)
    1343:	b8 09 00 00 00       	mov    $0x9,%eax
    1348:	cd 40                	int    $0x40
    134a:	c3                   	ret    

0000134b <dup>:
SYSCALL(dup)
    134b:	b8 0a 00 00 00       	mov    $0xa,%eax
    1350:	cd 40                	int    $0x40
    1352:	c3                   	ret    

00001353 <getpid>:
SYSCALL(getpid)
    1353:	b8 0b 00 00 00       	mov    $0xb,%eax
    1358:	cd 40                	int    $0x40
    135a:	c3                   	ret    

0000135b <sbrk>:
SYSCALL(sbrk)
    135b:	b8 0c 00 00 00       	mov    $0xc,%eax
    1360:	cd 40                	int    $0x40
    1362:	c3                   	ret    

00001363 <sleep>:
SYSCALL(sleep)
    1363:	b8 0d 00 00 00       	mov    $0xd,%eax
    1368:	cd 40                	int    $0x40
    136a:	c3                   	ret    

0000136b <uptime>:
SYSCALL(uptime)
    136b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1370:	cd 40                	int    $0x40
    1372:	c3                   	ret    

00001373 <getpinfo>:

SYSCALL(getpinfo)
    1373:	b8 16 00 00 00       	mov    $0x16,%eax
    1378:	cd 40                	int    $0x40
    137a:	c3                   	ret    

0000137b <settickets>:
SYSCALL(settickets)
    137b:	b8 17 00 00 00       	mov    $0x17,%eax
    1380:	cd 40                	int    $0x40
    1382:	c3                   	ret    

00001383 <mprotect>:
SYSCALL(mprotect)
    1383:	b8 18 00 00 00       	mov    $0x18,%eax
    1388:	cd 40                	int    $0x40
    138a:	c3                   	ret    

0000138b <munprotect>:
SYSCALL(munprotect)
    138b:	b8 19 00 00 00       	mov    $0x19,%eax
    1390:	cd 40                	int    $0x40
    1392:	c3                   	ret    
    1393:	66 90                	xchg   %ax,%ax
    1395:	66 90                	xchg   %ax,%ax
    1397:	66 90                	xchg   %ax,%ax
    1399:	66 90                	xchg   %ax,%ax
    139b:	66 90                	xchg   %ax,%ax
    139d:	66 90                	xchg   %ax,%ax
    139f:	90                   	nop

000013a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    13a0:	55                   	push   %ebp
    13a1:	89 e5                	mov    %esp,%ebp
    13a3:	57                   	push   %edi
    13a4:	56                   	push   %esi
    13a5:	53                   	push   %ebx
    13a6:	83 ec 3c             	sub    $0x3c,%esp
    13a9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    13ac:	89 d1                	mov    %edx,%ecx
{
    13ae:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    13b1:	85 d2                	test   %edx,%edx
    13b3:	0f 89 7f 00 00 00    	jns    1438 <printint+0x98>
    13b9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    13bd:	74 79                	je     1438 <printint+0x98>
    neg = 1;
    13bf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    13c6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    13c8:	31 db                	xor    %ebx,%ebx
    13ca:	8d 75 d7             	lea    -0x29(%ebp),%esi
    13cd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    13d0:	89 c8                	mov    %ecx,%eax
    13d2:	31 d2                	xor    %edx,%edx
    13d4:	89 cf                	mov    %ecx,%edi
    13d6:	f7 75 c4             	divl   -0x3c(%ebp)
    13d9:	0f b6 92 20 18 00 00 	movzbl 0x1820(%edx),%edx
    13e0:	89 45 c0             	mov    %eax,-0x40(%ebp)
    13e3:	89 d8                	mov    %ebx,%eax
    13e5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    13e8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    13eb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    13ee:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    13f1:	76 dd                	jbe    13d0 <printint+0x30>
  if(neg)
    13f3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    13f6:	85 c9                	test   %ecx,%ecx
    13f8:	74 0c                	je     1406 <printint+0x66>
    buf[i++] = '-';
    13fa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    13ff:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1401:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1406:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1409:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    140d:	eb 07                	jmp    1416 <printint+0x76>
    140f:	90                   	nop
    putc(fd, buf[i]);
    1410:	0f b6 13             	movzbl (%ebx),%edx
    1413:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1416:	83 ec 04             	sub    $0x4,%esp
    1419:	88 55 d7             	mov    %dl,-0x29(%ebp)
    141c:	6a 01                	push   $0x1
    141e:	56                   	push   %esi
    141f:	57                   	push   %edi
    1420:	e8 ce fe ff ff       	call   12f3 <write>
  while(--i >= 0)
    1425:	83 c4 10             	add    $0x10,%esp
    1428:	39 de                	cmp    %ebx,%esi
    142a:	75 e4                	jne    1410 <printint+0x70>
}
    142c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    142f:	5b                   	pop    %ebx
    1430:	5e                   	pop    %esi
    1431:	5f                   	pop    %edi
    1432:	5d                   	pop    %ebp
    1433:	c3                   	ret    
    1434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1438:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    143f:	eb 87                	jmp    13c8 <printint+0x28>
    1441:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1448:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    144f:	90                   	nop

00001450 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1450:	55                   	push   %ebp
    1451:	89 e5                	mov    %esp,%ebp
    1453:	57                   	push   %edi
    1454:	56                   	push   %esi
    1455:	53                   	push   %ebx
    1456:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1459:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    145c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    145f:	0f b6 13             	movzbl (%ebx),%edx
    1462:	84 d2                	test   %dl,%dl
    1464:	74 6a                	je     14d0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    1466:	8d 45 10             	lea    0x10(%ebp),%eax
    1469:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    146c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    146f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    1471:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1474:	eb 36                	jmp    14ac <printf+0x5c>
    1476:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    147d:	8d 76 00             	lea    0x0(%esi),%esi
    1480:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1483:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1488:	83 f8 25             	cmp    $0x25,%eax
    148b:	74 15                	je     14a2 <printf+0x52>
  write(fd, &c, 1);
    148d:	83 ec 04             	sub    $0x4,%esp
    1490:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1493:	6a 01                	push   $0x1
    1495:	57                   	push   %edi
    1496:	56                   	push   %esi
    1497:	e8 57 fe ff ff       	call   12f3 <write>
    149c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    149f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    14a2:	0f b6 13             	movzbl (%ebx),%edx
    14a5:	83 c3 01             	add    $0x1,%ebx
    14a8:	84 d2                	test   %dl,%dl
    14aa:	74 24                	je     14d0 <printf+0x80>
    c = fmt[i] & 0xff;
    14ac:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    14af:	85 c9                	test   %ecx,%ecx
    14b1:	74 cd                	je     1480 <printf+0x30>
      }
    } else if(state == '%'){
    14b3:	83 f9 25             	cmp    $0x25,%ecx
    14b6:	75 ea                	jne    14a2 <printf+0x52>
      if(c == 'd'){
    14b8:	83 f8 25             	cmp    $0x25,%eax
    14bb:	0f 84 07 01 00 00    	je     15c8 <printf+0x178>
    14c1:	83 e8 63             	sub    $0x63,%eax
    14c4:	83 f8 15             	cmp    $0x15,%eax
    14c7:	77 17                	ja     14e0 <printf+0x90>
    14c9:	ff 24 85 c8 17 00 00 	jmp    *0x17c8(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    14d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14d3:	5b                   	pop    %ebx
    14d4:	5e                   	pop    %esi
    14d5:	5f                   	pop    %edi
    14d6:	5d                   	pop    %ebp
    14d7:	c3                   	ret    
    14d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14df:	90                   	nop
  write(fd, &c, 1);
    14e0:	83 ec 04             	sub    $0x4,%esp
    14e3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    14e6:	6a 01                	push   $0x1
    14e8:	57                   	push   %edi
    14e9:	56                   	push   %esi
    14ea:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    14ee:	e8 00 fe ff ff       	call   12f3 <write>
        putc(fd, c);
    14f3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    14f7:	83 c4 0c             	add    $0xc,%esp
    14fa:	88 55 e7             	mov    %dl,-0x19(%ebp)
    14fd:	6a 01                	push   $0x1
    14ff:	57                   	push   %edi
    1500:	56                   	push   %esi
    1501:	e8 ed fd ff ff       	call   12f3 <write>
        putc(fd, c);
    1506:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1509:	31 c9                	xor    %ecx,%ecx
    150b:	eb 95                	jmp    14a2 <printf+0x52>
    150d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1510:	83 ec 0c             	sub    $0xc,%esp
    1513:	b9 10 00 00 00       	mov    $0x10,%ecx
    1518:	6a 00                	push   $0x0
    151a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    151d:	8b 10                	mov    (%eax),%edx
    151f:	89 f0                	mov    %esi,%eax
    1521:	e8 7a fe ff ff       	call   13a0 <printint>
        ap++;
    1526:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    152a:	83 c4 10             	add    $0x10,%esp
      state = 0;
    152d:	31 c9                	xor    %ecx,%ecx
    152f:	e9 6e ff ff ff       	jmp    14a2 <printf+0x52>
    1534:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1538:	8b 45 d0             	mov    -0x30(%ebp),%eax
    153b:	8b 10                	mov    (%eax),%edx
        ap++;
    153d:	83 c0 04             	add    $0x4,%eax
    1540:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    1543:	85 d2                	test   %edx,%edx
    1545:	0f 84 8d 00 00 00    	je     15d8 <printf+0x188>
        while(*s != 0){
    154b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    154e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    1550:	84 c0                	test   %al,%al
    1552:	0f 84 4a ff ff ff    	je     14a2 <printf+0x52>
    1558:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    155b:	89 d3                	mov    %edx,%ebx
    155d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1560:	83 ec 04             	sub    $0x4,%esp
          s++;
    1563:	83 c3 01             	add    $0x1,%ebx
    1566:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1569:	6a 01                	push   $0x1
    156b:	57                   	push   %edi
    156c:	56                   	push   %esi
    156d:	e8 81 fd ff ff       	call   12f3 <write>
        while(*s != 0){
    1572:	0f b6 03             	movzbl (%ebx),%eax
    1575:	83 c4 10             	add    $0x10,%esp
    1578:	84 c0                	test   %al,%al
    157a:	75 e4                	jne    1560 <printf+0x110>
      state = 0;
    157c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    157f:	31 c9                	xor    %ecx,%ecx
    1581:	e9 1c ff ff ff       	jmp    14a2 <printf+0x52>
    1586:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    158d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1590:	83 ec 0c             	sub    $0xc,%esp
    1593:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1598:	6a 01                	push   $0x1
    159a:	e9 7b ff ff ff       	jmp    151a <printf+0xca>
    159f:	90                   	nop
        putc(fd, *ap);
    15a0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    15a3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    15a6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    15a8:	6a 01                	push   $0x1
    15aa:	57                   	push   %edi
    15ab:	56                   	push   %esi
        putc(fd, *ap);
    15ac:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    15af:	e8 3f fd ff ff       	call   12f3 <write>
        ap++;
    15b4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    15b8:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15bb:	31 c9                	xor    %ecx,%ecx
    15bd:	e9 e0 fe ff ff       	jmp    14a2 <printf+0x52>
    15c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    15c8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    15cb:	83 ec 04             	sub    $0x4,%esp
    15ce:	e9 2a ff ff ff       	jmp    14fd <printf+0xad>
    15d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    15d7:	90                   	nop
          s = "(null)";
    15d8:	ba c0 17 00 00       	mov    $0x17c0,%edx
        while(*s != 0){
    15dd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    15e0:	b8 28 00 00 00       	mov    $0x28,%eax
    15e5:	89 d3                	mov    %edx,%ebx
    15e7:	e9 74 ff ff ff       	jmp    1560 <printf+0x110>
    15ec:	66 90                	xchg   %ax,%ax
    15ee:	66 90                	xchg   %ax,%ax

000015f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    15f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15f1:	a1 d0 1a 00 00       	mov    0x1ad0,%eax
{
    15f6:	89 e5                	mov    %esp,%ebp
    15f8:	57                   	push   %edi
    15f9:	56                   	push   %esi
    15fa:	53                   	push   %ebx
    15fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    15fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1601:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1608:	89 c2                	mov    %eax,%edx
    160a:	8b 00                	mov    (%eax),%eax
    160c:	39 ca                	cmp    %ecx,%edx
    160e:	73 30                	jae    1640 <free+0x50>
    1610:	39 c1                	cmp    %eax,%ecx
    1612:	72 04                	jb     1618 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1614:	39 c2                	cmp    %eax,%edx
    1616:	72 f0                	jb     1608 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1618:	8b 73 fc             	mov    -0x4(%ebx),%esi
    161b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    161e:	39 f8                	cmp    %edi,%eax
    1620:	74 30                	je     1652 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    1622:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1625:	8b 42 04             	mov    0x4(%edx),%eax
    1628:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    162b:	39 f1                	cmp    %esi,%ecx
    162d:	74 3a                	je     1669 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    162f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    1631:	5b                   	pop    %ebx
  freep = p;
    1632:	89 15 d0 1a 00 00    	mov    %edx,0x1ad0
}
    1638:	5e                   	pop    %esi
    1639:	5f                   	pop    %edi
    163a:	5d                   	pop    %ebp
    163b:	c3                   	ret    
    163c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1640:	39 c2                	cmp    %eax,%edx
    1642:	72 c4                	jb     1608 <free+0x18>
    1644:	39 c1                	cmp    %eax,%ecx
    1646:	73 c0                	jae    1608 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    1648:	8b 73 fc             	mov    -0x4(%ebx),%esi
    164b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    164e:	39 f8                	cmp    %edi,%eax
    1650:	75 d0                	jne    1622 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    1652:	03 70 04             	add    0x4(%eax),%esi
    1655:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1658:	8b 02                	mov    (%edx),%eax
    165a:	8b 00                	mov    (%eax),%eax
    165c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    165f:	8b 42 04             	mov    0x4(%edx),%eax
    1662:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1665:	39 f1                	cmp    %esi,%ecx
    1667:	75 c6                	jne    162f <free+0x3f>
    p->s.size += bp->s.size;
    1669:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    166c:	89 15 d0 1a 00 00    	mov    %edx,0x1ad0
    p->s.size += bp->s.size;
    1672:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1675:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1678:	89 0a                	mov    %ecx,(%edx)
}
    167a:	5b                   	pop    %ebx
    167b:	5e                   	pop    %esi
    167c:	5f                   	pop    %edi
    167d:	5d                   	pop    %ebp
    167e:	c3                   	ret    
    167f:	90                   	nop

00001680 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1680:	55                   	push   %ebp
    1681:	89 e5                	mov    %esp,%ebp
    1683:	57                   	push   %edi
    1684:	56                   	push   %esi
    1685:	53                   	push   %ebx
    1686:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1689:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    168c:	8b 3d d0 1a 00 00    	mov    0x1ad0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1692:	8d 70 07             	lea    0x7(%eax),%esi
    1695:	c1 ee 03             	shr    $0x3,%esi
    1698:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    169b:	85 ff                	test   %edi,%edi
    169d:	0f 84 9d 00 00 00    	je     1740 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16a3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    16a5:	8b 4a 04             	mov    0x4(%edx),%ecx
    16a8:	39 f1                	cmp    %esi,%ecx
    16aa:	73 6a                	jae    1716 <malloc+0x96>
    16ac:	bb 00 10 00 00       	mov    $0x1000,%ebx
    16b1:	39 de                	cmp    %ebx,%esi
    16b3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    16b6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    16bd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    16c0:	eb 17                	jmp    16d9 <malloc+0x59>
    16c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16c8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    16ca:	8b 48 04             	mov    0x4(%eax),%ecx
    16cd:	39 f1                	cmp    %esi,%ecx
    16cf:	73 4f                	jae    1720 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    16d1:	8b 3d d0 1a 00 00    	mov    0x1ad0,%edi
    16d7:	89 c2                	mov    %eax,%edx
    16d9:	39 d7                	cmp    %edx,%edi
    16db:	75 eb                	jne    16c8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    16dd:	83 ec 0c             	sub    $0xc,%esp
    16e0:	ff 75 e4             	push   -0x1c(%ebp)
    16e3:	e8 73 fc ff ff       	call   135b <sbrk>
  if(p == (char*)-1)
    16e8:	83 c4 10             	add    $0x10,%esp
    16eb:	83 f8 ff             	cmp    $0xffffffff,%eax
    16ee:	74 1c                	je     170c <malloc+0x8c>
  hp->s.size = nu;
    16f0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    16f3:	83 ec 0c             	sub    $0xc,%esp
    16f6:	83 c0 08             	add    $0x8,%eax
    16f9:	50                   	push   %eax
    16fa:	e8 f1 fe ff ff       	call   15f0 <free>
  return freep;
    16ff:	8b 15 d0 1a 00 00    	mov    0x1ad0,%edx
      if((p = morecore(nunits)) == 0)
    1705:	83 c4 10             	add    $0x10,%esp
    1708:	85 d2                	test   %edx,%edx
    170a:	75 bc                	jne    16c8 <malloc+0x48>
        return 0;
  }
}
    170c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    170f:	31 c0                	xor    %eax,%eax
}
    1711:	5b                   	pop    %ebx
    1712:	5e                   	pop    %esi
    1713:	5f                   	pop    %edi
    1714:	5d                   	pop    %ebp
    1715:	c3                   	ret    
    if(p->s.size >= nunits){
    1716:	89 d0                	mov    %edx,%eax
    1718:	89 fa                	mov    %edi,%edx
    171a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1720:	39 ce                	cmp    %ecx,%esi
    1722:	74 4c                	je     1770 <malloc+0xf0>
        p->s.size -= nunits;
    1724:	29 f1                	sub    %esi,%ecx
    1726:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1729:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    172c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    172f:	89 15 d0 1a 00 00    	mov    %edx,0x1ad0
}
    1735:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1738:	83 c0 08             	add    $0x8,%eax
}
    173b:	5b                   	pop    %ebx
    173c:	5e                   	pop    %esi
    173d:	5f                   	pop    %edi
    173e:	5d                   	pop    %ebp
    173f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    1740:	c7 05 d0 1a 00 00 d4 	movl   $0x1ad4,0x1ad0
    1747:	1a 00 00 
    base.s.size = 0;
    174a:	bf d4 1a 00 00       	mov    $0x1ad4,%edi
    base.s.ptr = freep = prevp = &base;
    174f:	c7 05 d4 1a 00 00 d4 	movl   $0x1ad4,0x1ad4
    1756:	1a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1759:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    175b:	c7 05 d8 1a 00 00 00 	movl   $0x0,0x1ad8
    1762:	00 00 00 
    if(p->s.size >= nunits){
    1765:	e9 42 ff ff ff       	jmp    16ac <malloc+0x2c>
    176a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1770:	8b 08                	mov    (%eax),%ecx
    1772:	89 0a                	mov    %ecx,(%edx)
    1774:	eb b9                	jmp    172f <malloc+0xaf>
