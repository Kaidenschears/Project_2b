
_wc:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	push   -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	57                   	push   %edi
    100e:	56                   	push   %esi
    100f:	be 01 00 00 00       	mov    $0x1,%esi
    1014:	53                   	push   %ebx
    1015:	51                   	push   %ecx
    1016:	83 ec 18             	sub    $0x18,%esp
    1019:	8b 01                	mov    (%ecx),%eax
    101b:	8b 59 04             	mov    0x4(%ecx),%ebx
    101e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1021:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
    1024:	83 f8 01             	cmp    $0x1,%eax
    1027:	7e 56                	jle    107f <main+0x7f>
    1029:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
    1030:	83 ec 08             	sub    $0x8,%esp
    1033:	6a 00                	push   $0x0
    1035:	ff 33                	push   (%ebx)
    1037:	e8 d7 03 00 00       	call   1413 <open>
    103c:	83 c4 10             	add    $0x10,%esp
    103f:	89 c7                	mov    %eax,%edi
    1041:	85 c0                	test   %eax,%eax
    1043:	78 26                	js     106b <main+0x6b>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
    1045:	83 ec 08             	sub    $0x8,%esp
    1048:	ff 33                	push   (%ebx)
  for(i = 1; i < argc; i++){
    104a:	83 c6 01             	add    $0x1,%esi
    104d:	83 c3 04             	add    $0x4,%ebx
    wc(fd, argv[i]);
    1050:	50                   	push   %eax
    1051:	e8 4a 00 00 00       	call   10a0 <wc>
    close(fd);
    1056:	89 3c 24             	mov    %edi,(%esp)
    1059:	e8 9d 03 00 00       	call   13fb <close>
  for(i = 1; i < argc; i++){
    105e:	83 c4 10             	add    $0x10,%esp
    1061:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
    1064:	75 ca                	jne    1030 <main+0x30>
  }
  exit();
    1066:	e8 68 03 00 00       	call   13d3 <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
    106b:	50                   	push   %eax
    106c:	ff 33                	push   (%ebx)
    106e:	68 8b 18 00 00       	push   $0x188b
    1073:	6a 01                	push   $0x1
    1075:	e8 c6 04 00 00       	call   1540 <printf>
      exit();
    107a:	e8 54 03 00 00       	call   13d3 <exit>
    wc(0, "");
    107f:	52                   	push   %edx
    1080:	52                   	push   %edx
    1081:	68 7d 18 00 00       	push   $0x187d
    1086:	6a 00                	push   $0x0
    1088:	e8 13 00 00 00       	call   10a0 <wc>
    exit();
    108d:	e8 41 03 00 00       	call   13d3 <exit>
    1092:	66 90                	xchg   %ax,%ax
    1094:	66 90                	xchg   %ax,%ax
    1096:	66 90                	xchg   %ax,%ax
    1098:	66 90                	xchg   %ax,%ax
    109a:	66 90                	xchg   %ax,%ax
    109c:	66 90                	xchg   %ax,%ax
    109e:	66 90                	xchg   %ax,%ax

000010a0 <wc>:
{
    10a0:	55                   	push   %ebp
    10a1:	89 e5                	mov    %esp,%ebp
    10a3:	57                   	push   %edi
    10a4:	56                   	push   %esi
    10a5:	53                   	push   %ebx
  l = w = c = 0;
    10a6:	31 db                	xor    %ebx,%ebx
{
    10a8:	83 ec 1c             	sub    $0x1c,%esp
  inword = 0;
    10ab:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
    10b2:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    10b9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
    10c0:	83 ec 04             	sub    $0x4,%esp
    10c3:	68 00 02 00 00       	push   $0x200
    10c8:	68 00 1c 00 00       	push   $0x1c00
    10cd:	ff 75 08             	push   0x8(%ebp)
    10d0:	e8 16 03 00 00       	call   13eb <read>
    10d5:	83 c4 10             	add    $0x10,%esp
    10d8:	89 c6                	mov    %eax,%esi
    10da:	85 c0                	test   %eax,%eax
    10dc:	7e 62                	jle    1140 <wc+0xa0>
    for(i=0; i<n; i++){
    10de:	31 ff                	xor    %edi,%edi
    10e0:	eb 14                	jmp    10f6 <wc+0x56>
    10e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        inword = 0;
    10e8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
    10ef:	83 c7 01             	add    $0x1,%edi
    10f2:	39 fe                	cmp    %edi,%esi
    10f4:	74 42                	je     1138 <wc+0x98>
      if(buf[i] == '\n')
    10f6:	0f be 87 00 1c 00 00 	movsbl 0x1c00(%edi),%eax
        l++;
    10fd:	31 c9                	xor    %ecx,%ecx
    10ff:	3c 0a                	cmp    $0xa,%al
    1101:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
    1104:	83 ec 08             	sub    $0x8,%esp
    1107:	50                   	push   %eax
        l++;
    1108:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
    110a:	68 68 18 00 00       	push   $0x1868
    110f:	e8 4c 01 00 00       	call   1260 <strchr>
    1114:	83 c4 10             	add    $0x10,%esp
    1117:	85 c0                	test   %eax,%eax
    1119:	75 cd                	jne    10e8 <wc+0x48>
      else if(!inword){
    111b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    111e:	85 d2                	test   %edx,%edx
    1120:	75 cd                	jne    10ef <wc+0x4f>
    for(i=0; i<n; i++){
    1122:	83 c7 01             	add    $0x1,%edi
        w++;
    1125:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        inword = 1;
    1129:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
    1130:	39 fe                	cmp    %edi,%esi
    1132:	75 c2                	jne    10f6 <wc+0x56>
    1134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      c++;
    1138:	01 75 dc             	add    %esi,-0x24(%ebp)
    113b:	eb 83                	jmp    10c0 <wc+0x20>
    113d:	8d 76 00             	lea    0x0(%esi),%esi
  if(n < 0){
    1140:	75 24                	jne    1166 <wc+0xc6>
  printf(1, "%d %d %d %s\n", l, w, c, name);
    1142:	83 ec 08             	sub    $0x8,%esp
    1145:	ff 75 0c             	push   0xc(%ebp)
    1148:	ff 75 dc             	push   -0x24(%ebp)
    114b:	ff 75 e0             	push   -0x20(%ebp)
    114e:	53                   	push   %ebx
    114f:	68 7e 18 00 00       	push   $0x187e
    1154:	6a 01                	push   $0x1
    1156:	e8 e5 03 00 00       	call   1540 <printf>
}
    115b:	83 c4 20             	add    $0x20,%esp
    115e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1161:	5b                   	pop    %ebx
    1162:	5e                   	pop    %esi
    1163:	5f                   	pop    %edi
    1164:	5d                   	pop    %ebp
    1165:	c3                   	ret    
    printf(1, "wc: read error\n");
    1166:	50                   	push   %eax
    1167:	50                   	push   %eax
    1168:	68 6e 18 00 00       	push   $0x186e
    116d:	6a 01                	push   $0x1
    116f:	e8 cc 03 00 00       	call   1540 <printf>
    exit();
    1174:	e8 5a 02 00 00       	call   13d3 <exit>
    1179:	66 90                	xchg   %ax,%ax
    117b:	66 90                	xchg   %ax,%ax
    117d:	66 90                	xchg   %ax,%ax
    117f:	90                   	nop

00001180 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1180:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1181:	31 c0                	xor    %eax,%eax
{
    1183:	89 e5                	mov    %esp,%ebp
    1185:	53                   	push   %ebx
    1186:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1189:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    118c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1190:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1194:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1197:	83 c0 01             	add    $0x1,%eax
    119a:	84 d2                	test   %dl,%dl
    119c:	75 f2                	jne    1190 <strcpy+0x10>
    ;
  return os;
}
    119e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    11a1:	89 c8                	mov    %ecx,%eax
    11a3:	c9                   	leave  
    11a4:	c3                   	ret    
    11a5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000011b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	53                   	push   %ebx
    11b4:	8b 55 08             	mov    0x8(%ebp),%edx
    11b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    11ba:	0f b6 02             	movzbl (%edx),%eax
    11bd:	84 c0                	test   %al,%al
    11bf:	75 17                	jne    11d8 <strcmp+0x28>
    11c1:	eb 3a                	jmp    11fd <strcmp+0x4d>
    11c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11c7:	90                   	nop
    11c8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    11cc:	83 c2 01             	add    $0x1,%edx
    11cf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    11d2:	84 c0                	test   %al,%al
    11d4:	74 1a                	je     11f0 <strcmp+0x40>
    p++, q++;
    11d6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    11d8:	0f b6 19             	movzbl (%ecx),%ebx
    11db:	38 c3                	cmp    %al,%bl
    11dd:	74 e9                	je     11c8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    11df:	29 d8                	sub    %ebx,%eax
}
    11e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    11e4:	c9                   	leave  
    11e5:	c3                   	ret    
    11e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11ed:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    11f0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    11f4:	31 c0                	xor    %eax,%eax
    11f6:	29 d8                	sub    %ebx,%eax
}
    11f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    11fb:	c9                   	leave  
    11fc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    11fd:	0f b6 19             	movzbl (%ecx),%ebx
    1200:	31 c0                	xor    %eax,%eax
    1202:	eb db                	jmp    11df <strcmp+0x2f>
    1204:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    120b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    120f:	90                   	nop

00001210 <strlen>:

uint
strlen(const char *s)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    1216:	80 3a 00             	cmpb   $0x0,(%edx)
    1219:	74 15                	je     1230 <strlen+0x20>
    121b:	31 c0                	xor    %eax,%eax
    121d:	8d 76 00             	lea    0x0(%esi),%esi
    1220:	83 c0 01             	add    $0x1,%eax
    1223:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    1227:	89 c1                	mov    %eax,%ecx
    1229:	75 f5                	jne    1220 <strlen+0x10>
    ;
  return n;
}
    122b:	89 c8                	mov    %ecx,%eax
    122d:	5d                   	pop    %ebp
    122e:	c3                   	ret    
    122f:	90                   	nop
  for(n = 0; s[n]; n++)
    1230:	31 c9                	xor    %ecx,%ecx
}
    1232:	5d                   	pop    %ebp
    1233:	89 c8                	mov    %ecx,%eax
    1235:	c3                   	ret    
    1236:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    123d:	8d 76 00             	lea    0x0(%esi),%esi

00001240 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1240:	55                   	push   %ebp
    1241:	89 e5                	mov    %esp,%ebp
    1243:	57                   	push   %edi
    1244:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1247:	8b 4d 10             	mov    0x10(%ebp),%ecx
    124a:	8b 45 0c             	mov    0xc(%ebp),%eax
    124d:	89 d7                	mov    %edx,%edi
    124f:	fc                   	cld    
    1250:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1252:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1255:	89 d0                	mov    %edx,%eax
    1257:	c9                   	leave  
    1258:	c3                   	ret    
    1259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001260 <strchr>:

char*
strchr(const char *s, char c)
{
    1260:	55                   	push   %ebp
    1261:	89 e5                	mov    %esp,%ebp
    1263:	8b 45 08             	mov    0x8(%ebp),%eax
    1266:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    126a:	0f b6 10             	movzbl (%eax),%edx
    126d:	84 d2                	test   %dl,%dl
    126f:	75 12                	jne    1283 <strchr+0x23>
    1271:	eb 1d                	jmp    1290 <strchr+0x30>
    1273:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1277:	90                   	nop
    1278:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    127c:	83 c0 01             	add    $0x1,%eax
    127f:	84 d2                	test   %dl,%dl
    1281:	74 0d                	je     1290 <strchr+0x30>
    if(*s == c)
    1283:	38 d1                	cmp    %dl,%cl
    1285:	75 f1                	jne    1278 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1287:	5d                   	pop    %ebp
    1288:	c3                   	ret    
    1289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1290:	31 c0                	xor    %eax,%eax
}
    1292:	5d                   	pop    %ebp
    1293:	c3                   	ret    
    1294:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    129b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    129f:	90                   	nop

000012a0 <gets>:

char*
gets(char *buf, int max)
{
    12a0:	55                   	push   %ebp
    12a1:	89 e5                	mov    %esp,%ebp
    12a3:	57                   	push   %edi
    12a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    12a5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    12a8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    12a9:	31 db                	xor    %ebx,%ebx
{
    12ab:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    12ae:	eb 27                	jmp    12d7 <gets+0x37>
    cc = read(0, &c, 1);
    12b0:	83 ec 04             	sub    $0x4,%esp
    12b3:	6a 01                	push   $0x1
    12b5:	57                   	push   %edi
    12b6:	6a 00                	push   $0x0
    12b8:	e8 2e 01 00 00       	call   13eb <read>
    if(cc < 1)
    12bd:	83 c4 10             	add    $0x10,%esp
    12c0:	85 c0                	test   %eax,%eax
    12c2:	7e 1d                	jle    12e1 <gets+0x41>
      break;
    buf[i++] = c;
    12c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    12c8:	8b 55 08             	mov    0x8(%ebp),%edx
    12cb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    12cf:	3c 0a                	cmp    $0xa,%al
    12d1:	74 1d                	je     12f0 <gets+0x50>
    12d3:	3c 0d                	cmp    $0xd,%al
    12d5:	74 19                	je     12f0 <gets+0x50>
  for(i=0; i+1 < max; ){
    12d7:	89 de                	mov    %ebx,%esi
    12d9:	83 c3 01             	add    $0x1,%ebx
    12dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    12df:	7c cf                	jl     12b0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    12e1:	8b 45 08             	mov    0x8(%ebp),%eax
    12e4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    12e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12eb:	5b                   	pop    %ebx
    12ec:	5e                   	pop    %esi
    12ed:	5f                   	pop    %edi
    12ee:	5d                   	pop    %ebp
    12ef:	c3                   	ret    
  buf[i] = '\0';
    12f0:	8b 45 08             	mov    0x8(%ebp),%eax
    12f3:	89 de                	mov    %ebx,%esi
    12f5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    12f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12fc:	5b                   	pop    %ebx
    12fd:	5e                   	pop    %esi
    12fe:	5f                   	pop    %edi
    12ff:	5d                   	pop    %ebp
    1300:	c3                   	ret    
    1301:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1308:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    130f:	90                   	nop

00001310 <stat>:

int
stat(const char *n, struct stat *st)
{
    1310:	55                   	push   %ebp
    1311:	89 e5                	mov    %esp,%ebp
    1313:	56                   	push   %esi
    1314:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1315:	83 ec 08             	sub    $0x8,%esp
    1318:	6a 00                	push   $0x0
    131a:	ff 75 08             	push   0x8(%ebp)
    131d:	e8 f1 00 00 00       	call   1413 <open>
  if(fd < 0)
    1322:	83 c4 10             	add    $0x10,%esp
    1325:	85 c0                	test   %eax,%eax
    1327:	78 27                	js     1350 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1329:	83 ec 08             	sub    $0x8,%esp
    132c:	ff 75 0c             	push   0xc(%ebp)
    132f:	89 c3                	mov    %eax,%ebx
    1331:	50                   	push   %eax
    1332:	e8 f4 00 00 00       	call   142b <fstat>
  close(fd);
    1337:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    133a:	89 c6                	mov    %eax,%esi
  close(fd);
    133c:	e8 ba 00 00 00       	call   13fb <close>
  return r;
    1341:	83 c4 10             	add    $0x10,%esp
}
    1344:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1347:	89 f0                	mov    %esi,%eax
    1349:	5b                   	pop    %ebx
    134a:	5e                   	pop    %esi
    134b:	5d                   	pop    %ebp
    134c:	c3                   	ret    
    134d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1350:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1355:	eb ed                	jmp    1344 <stat+0x34>
    1357:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    135e:	66 90                	xchg   %ax,%ax

00001360 <atoi>:

int
atoi(const char *s)
{
    1360:	55                   	push   %ebp
    1361:	89 e5                	mov    %esp,%ebp
    1363:	53                   	push   %ebx
    1364:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1367:	0f be 02             	movsbl (%edx),%eax
    136a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    136d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1370:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1375:	77 1e                	ja     1395 <atoi+0x35>
    1377:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    137e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1380:	83 c2 01             	add    $0x1,%edx
    1383:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1386:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    138a:	0f be 02             	movsbl (%edx),%eax
    138d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1390:	80 fb 09             	cmp    $0x9,%bl
    1393:	76 eb                	jbe    1380 <atoi+0x20>
  return n;
}
    1395:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1398:	89 c8                	mov    %ecx,%eax
    139a:	c9                   	leave  
    139b:	c3                   	ret    
    139c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000013a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    13a0:	55                   	push   %ebp
    13a1:	89 e5                	mov    %esp,%ebp
    13a3:	57                   	push   %edi
    13a4:	8b 45 10             	mov    0x10(%ebp),%eax
    13a7:	8b 55 08             	mov    0x8(%ebp),%edx
    13aa:	56                   	push   %esi
    13ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    13ae:	85 c0                	test   %eax,%eax
    13b0:	7e 13                	jle    13c5 <memmove+0x25>
    13b2:	01 d0                	add    %edx,%eax
  dst = vdst;
    13b4:	89 d7                	mov    %edx,%edi
    13b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13bd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    13c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    13c1:	39 f8                	cmp    %edi,%eax
    13c3:	75 fb                	jne    13c0 <memmove+0x20>
  return vdst;
}
    13c5:	5e                   	pop    %esi
    13c6:	89 d0                	mov    %edx,%eax
    13c8:	5f                   	pop    %edi
    13c9:	5d                   	pop    %ebp
    13ca:	c3                   	ret    

000013cb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    13cb:	b8 01 00 00 00       	mov    $0x1,%eax
    13d0:	cd 40                	int    $0x40
    13d2:	c3                   	ret    

000013d3 <exit>:
SYSCALL(exit)
    13d3:	b8 02 00 00 00       	mov    $0x2,%eax
    13d8:	cd 40                	int    $0x40
    13da:	c3                   	ret    

000013db <wait>:
SYSCALL(wait)
    13db:	b8 03 00 00 00       	mov    $0x3,%eax
    13e0:	cd 40                	int    $0x40
    13e2:	c3                   	ret    

000013e3 <pipe>:
SYSCALL(pipe)
    13e3:	b8 04 00 00 00       	mov    $0x4,%eax
    13e8:	cd 40                	int    $0x40
    13ea:	c3                   	ret    

000013eb <read>:
SYSCALL(read)
    13eb:	b8 05 00 00 00       	mov    $0x5,%eax
    13f0:	cd 40                	int    $0x40
    13f2:	c3                   	ret    

000013f3 <write>:
SYSCALL(write)
    13f3:	b8 10 00 00 00       	mov    $0x10,%eax
    13f8:	cd 40                	int    $0x40
    13fa:	c3                   	ret    

000013fb <close>:
SYSCALL(close)
    13fb:	b8 15 00 00 00       	mov    $0x15,%eax
    1400:	cd 40                	int    $0x40
    1402:	c3                   	ret    

00001403 <kill>:
SYSCALL(kill)
    1403:	b8 06 00 00 00       	mov    $0x6,%eax
    1408:	cd 40                	int    $0x40
    140a:	c3                   	ret    

0000140b <exec>:
SYSCALL(exec)
    140b:	b8 07 00 00 00       	mov    $0x7,%eax
    1410:	cd 40                	int    $0x40
    1412:	c3                   	ret    

00001413 <open>:
SYSCALL(open)
    1413:	b8 0f 00 00 00       	mov    $0xf,%eax
    1418:	cd 40                	int    $0x40
    141a:	c3                   	ret    

0000141b <mknod>:
SYSCALL(mknod)
    141b:	b8 11 00 00 00       	mov    $0x11,%eax
    1420:	cd 40                	int    $0x40
    1422:	c3                   	ret    

00001423 <unlink>:
SYSCALL(unlink)
    1423:	b8 12 00 00 00       	mov    $0x12,%eax
    1428:	cd 40                	int    $0x40
    142a:	c3                   	ret    

0000142b <fstat>:
SYSCALL(fstat)
    142b:	b8 08 00 00 00       	mov    $0x8,%eax
    1430:	cd 40                	int    $0x40
    1432:	c3                   	ret    

00001433 <link>:
SYSCALL(link)
    1433:	b8 13 00 00 00       	mov    $0x13,%eax
    1438:	cd 40                	int    $0x40
    143a:	c3                   	ret    

0000143b <mkdir>:
SYSCALL(mkdir)
    143b:	b8 14 00 00 00       	mov    $0x14,%eax
    1440:	cd 40                	int    $0x40
    1442:	c3                   	ret    

00001443 <chdir>:
SYSCALL(chdir)
    1443:	b8 09 00 00 00       	mov    $0x9,%eax
    1448:	cd 40                	int    $0x40
    144a:	c3                   	ret    

0000144b <dup>:
SYSCALL(dup)
    144b:	b8 0a 00 00 00       	mov    $0xa,%eax
    1450:	cd 40                	int    $0x40
    1452:	c3                   	ret    

00001453 <getpid>:
SYSCALL(getpid)
    1453:	b8 0b 00 00 00       	mov    $0xb,%eax
    1458:	cd 40                	int    $0x40
    145a:	c3                   	ret    

0000145b <sbrk>:
SYSCALL(sbrk)
    145b:	b8 0c 00 00 00       	mov    $0xc,%eax
    1460:	cd 40                	int    $0x40
    1462:	c3                   	ret    

00001463 <sleep>:
SYSCALL(sleep)
    1463:	b8 0d 00 00 00       	mov    $0xd,%eax
    1468:	cd 40                	int    $0x40
    146a:	c3                   	ret    

0000146b <uptime>:
SYSCALL(uptime)
    146b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1470:	cd 40                	int    $0x40
    1472:	c3                   	ret    

00001473 <getpinfo>:

SYSCALL(getpinfo)
    1473:	b8 16 00 00 00       	mov    $0x16,%eax
    1478:	cd 40                	int    $0x40
    147a:	c3                   	ret    

0000147b <settickets>:
SYSCALL(settickets)
    147b:	b8 17 00 00 00       	mov    $0x17,%eax
    1480:	cd 40                	int    $0x40
    1482:	c3                   	ret    
    1483:	66 90                	xchg   %ax,%ax
    1485:	66 90                	xchg   %ax,%ax
    1487:	66 90                	xchg   %ax,%ax
    1489:	66 90                	xchg   %ax,%ax
    148b:	66 90                	xchg   %ax,%ax
    148d:	66 90                	xchg   %ax,%ax
    148f:	90                   	nop

00001490 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1490:	55                   	push   %ebp
    1491:	89 e5                	mov    %esp,%ebp
    1493:	57                   	push   %edi
    1494:	56                   	push   %esi
    1495:	53                   	push   %ebx
    1496:	83 ec 3c             	sub    $0x3c,%esp
    1499:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    149c:	89 d1                	mov    %edx,%ecx
{
    149e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    14a1:	85 d2                	test   %edx,%edx
    14a3:	0f 89 7f 00 00 00    	jns    1528 <printint+0x98>
    14a9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    14ad:	74 79                	je     1528 <printint+0x98>
    neg = 1;
    14af:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    14b6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    14b8:	31 db                	xor    %ebx,%ebx
    14ba:	8d 75 d7             	lea    -0x29(%ebp),%esi
    14bd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    14c0:	89 c8                	mov    %ecx,%eax
    14c2:	31 d2                	xor    %edx,%edx
    14c4:	89 cf                	mov    %ecx,%edi
    14c6:	f7 75 c4             	divl   -0x3c(%ebp)
    14c9:	0f b6 92 00 19 00 00 	movzbl 0x1900(%edx),%edx
    14d0:	89 45 c0             	mov    %eax,-0x40(%ebp)
    14d3:	89 d8                	mov    %ebx,%eax
    14d5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    14d8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    14db:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    14de:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    14e1:	76 dd                	jbe    14c0 <printint+0x30>
  if(neg)
    14e3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    14e6:	85 c9                	test   %ecx,%ecx
    14e8:	74 0c                	je     14f6 <printint+0x66>
    buf[i++] = '-';
    14ea:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    14ef:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    14f1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    14f6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    14f9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    14fd:	eb 07                	jmp    1506 <printint+0x76>
    14ff:	90                   	nop
    putc(fd, buf[i]);
    1500:	0f b6 13             	movzbl (%ebx),%edx
    1503:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1506:	83 ec 04             	sub    $0x4,%esp
    1509:	88 55 d7             	mov    %dl,-0x29(%ebp)
    150c:	6a 01                	push   $0x1
    150e:	56                   	push   %esi
    150f:	57                   	push   %edi
    1510:	e8 de fe ff ff       	call   13f3 <write>
  while(--i >= 0)
    1515:	83 c4 10             	add    $0x10,%esp
    1518:	39 de                	cmp    %ebx,%esi
    151a:	75 e4                	jne    1500 <printint+0x70>
}
    151c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    151f:	5b                   	pop    %ebx
    1520:	5e                   	pop    %esi
    1521:	5f                   	pop    %edi
    1522:	5d                   	pop    %ebp
    1523:	c3                   	ret    
    1524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1528:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    152f:	eb 87                	jmp    14b8 <printint+0x28>
    1531:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1538:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    153f:	90                   	nop

00001540 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1540:	55                   	push   %ebp
    1541:	89 e5                	mov    %esp,%ebp
    1543:	57                   	push   %edi
    1544:	56                   	push   %esi
    1545:	53                   	push   %ebx
    1546:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1549:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    154c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    154f:	0f b6 13             	movzbl (%ebx),%edx
    1552:	84 d2                	test   %dl,%dl
    1554:	74 6a                	je     15c0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    1556:	8d 45 10             	lea    0x10(%ebp),%eax
    1559:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    155c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    155f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    1561:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1564:	eb 36                	jmp    159c <printf+0x5c>
    1566:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    156d:	8d 76 00             	lea    0x0(%esi),%esi
    1570:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1573:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1578:	83 f8 25             	cmp    $0x25,%eax
    157b:	74 15                	je     1592 <printf+0x52>
  write(fd, &c, 1);
    157d:	83 ec 04             	sub    $0x4,%esp
    1580:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1583:	6a 01                	push   $0x1
    1585:	57                   	push   %edi
    1586:	56                   	push   %esi
    1587:	e8 67 fe ff ff       	call   13f3 <write>
    158c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    158f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1592:	0f b6 13             	movzbl (%ebx),%edx
    1595:	83 c3 01             	add    $0x1,%ebx
    1598:	84 d2                	test   %dl,%dl
    159a:	74 24                	je     15c0 <printf+0x80>
    c = fmt[i] & 0xff;
    159c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    159f:	85 c9                	test   %ecx,%ecx
    15a1:	74 cd                	je     1570 <printf+0x30>
      }
    } else if(state == '%'){
    15a3:	83 f9 25             	cmp    $0x25,%ecx
    15a6:	75 ea                	jne    1592 <printf+0x52>
      if(c == 'd'){
    15a8:	83 f8 25             	cmp    $0x25,%eax
    15ab:	0f 84 07 01 00 00    	je     16b8 <printf+0x178>
    15b1:	83 e8 63             	sub    $0x63,%eax
    15b4:	83 f8 15             	cmp    $0x15,%eax
    15b7:	77 17                	ja     15d0 <printf+0x90>
    15b9:	ff 24 85 a8 18 00 00 	jmp    *0x18a8(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    15c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    15c3:	5b                   	pop    %ebx
    15c4:	5e                   	pop    %esi
    15c5:	5f                   	pop    %edi
    15c6:	5d                   	pop    %ebp
    15c7:	c3                   	ret    
    15c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15cf:	90                   	nop
  write(fd, &c, 1);
    15d0:	83 ec 04             	sub    $0x4,%esp
    15d3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    15d6:	6a 01                	push   $0x1
    15d8:	57                   	push   %edi
    15d9:	56                   	push   %esi
    15da:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    15de:	e8 10 fe ff ff       	call   13f3 <write>
        putc(fd, c);
    15e3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    15e7:	83 c4 0c             	add    $0xc,%esp
    15ea:	88 55 e7             	mov    %dl,-0x19(%ebp)
    15ed:	6a 01                	push   $0x1
    15ef:	57                   	push   %edi
    15f0:	56                   	push   %esi
    15f1:	e8 fd fd ff ff       	call   13f3 <write>
        putc(fd, c);
    15f6:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15f9:	31 c9                	xor    %ecx,%ecx
    15fb:	eb 95                	jmp    1592 <printf+0x52>
    15fd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1600:	83 ec 0c             	sub    $0xc,%esp
    1603:	b9 10 00 00 00       	mov    $0x10,%ecx
    1608:	6a 00                	push   $0x0
    160a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    160d:	8b 10                	mov    (%eax),%edx
    160f:	89 f0                	mov    %esi,%eax
    1611:	e8 7a fe ff ff       	call   1490 <printint>
        ap++;
    1616:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    161a:	83 c4 10             	add    $0x10,%esp
      state = 0;
    161d:	31 c9                	xor    %ecx,%ecx
    161f:	e9 6e ff ff ff       	jmp    1592 <printf+0x52>
    1624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1628:	8b 45 d0             	mov    -0x30(%ebp),%eax
    162b:	8b 10                	mov    (%eax),%edx
        ap++;
    162d:	83 c0 04             	add    $0x4,%eax
    1630:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    1633:	85 d2                	test   %edx,%edx
    1635:	0f 84 8d 00 00 00    	je     16c8 <printf+0x188>
        while(*s != 0){
    163b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    163e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    1640:	84 c0                	test   %al,%al
    1642:	0f 84 4a ff ff ff    	je     1592 <printf+0x52>
    1648:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    164b:	89 d3                	mov    %edx,%ebx
    164d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1650:	83 ec 04             	sub    $0x4,%esp
          s++;
    1653:	83 c3 01             	add    $0x1,%ebx
    1656:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1659:	6a 01                	push   $0x1
    165b:	57                   	push   %edi
    165c:	56                   	push   %esi
    165d:	e8 91 fd ff ff       	call   13f3 <write>
        while(*s != 0){
    1662:	0f b6 03             	movzbl (%ebx),%eax
    1665:	83 c4 10             	add    $0x10,%esp
    1668:	84 c0                	test   %al,%al
    166a:	75 e4                	jne    1650 <printf+0x110>
      state = 0;
    166c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    166f:	31 c9                	xor    %ecx,%ecx
    1671:	e9 1c ff ff ff       	jmp    1592 <printf+0x52>
    1676:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    167d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1680:	83 ec 0c             	sub    $0xc,%esp
    1683:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1688:	6a 01                	push   $0x1
    168a:	e9 7b ff ff ff       	jmp    160a <printf+0xca>
    168f:	90                   	nop
        putc(fd, *ap);
    1690:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1693:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1696:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1698:	6a 01                	push   $0x1
    169a:	57                   	push   %edi
    169b:	56                   	push   %esi
        putc(fd, *ap);
    169c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    169f:	e8 4f fd ff ff       	call   13f3 <write>
        ap++;
    16a4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    16a8:	83 c4 10             	add    $0x10,%esp
      state = 0;
    16ab:	31 c9                	xor    %ecx,%ecx
    16ad:	e9 e0 fe ff ff       	jmp    1592 <printf+0x52>
    16b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    16b8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    16bb:	83 ec 04             	sub    $0x4,%esp
    16be:	e9 2a ff ff ff       	jmp    15ed <printf+0xad>
    16c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    16c7:	90                   	nop
          s = "(null)";
    16c8:	ba 9f 18 00 00       	mov    $0x189f,%edx
        while(*s != 0){
    16cd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    16d0:	b8 28 00 00 00       	mov    $0x28,%eax
    16d5:	89 d3                	mov    %edx,%ebx
    16d7:	e9 74 ff ff ff       	jmp    1650 <printf+0x110>
    16dc:	66 90                	xchg   %ax,%ax
    16de:	66 90                	xchg   %ax,%ax

000016e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    16e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16e1:	a1 00 1e 00 00       	mov    0x1e00,%eax
{
    16e6:	89 e5                	mov    %esp,%ebp
    16e8:	57                   	push   %edi
    16e9:	56                   	push   %esi
    16ea:	53                   	push   %ebx
    16eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    16ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    16f8:	89 c2                	mov    %eax,%edx
    16fa:	8b 00                	mov    (%eax),%eax
    16fc:	39 ca                	cmp    %ecx,%edx
    16fe:	73 30                	jae    1730 <free+0x50>
    1700:	39 c1                	cmp    %eax,%ecx
    1702:	72 04                	jb     1708 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1704:	39 c2                	cmp    %eax,%edx
    1706:	72 f0                	jb     16f8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1708:	8b 73 fc             	mov    -0x4(%ebx),%esi
    170b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    170e:	39 f8                	cmp    %edi,%eax
    1710:	74 30                	je     1742 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    1712:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1715:	8b 42 04             	mov    0x4(%edx),%eax
    1718:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    171b:	39 f1                	cmp    %esi,%ecx
    171d:	74 3a                	je     1759 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    171f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    1721:	5b                   	pop    %ebx
  freep = p;
    1722:	89 15 00 1e 00 00    	mov    %edx,0x1e00
}
    1728:	5e                   	pop    %esi
    1729:	5f                   	pop    %edi
    172a:	5d                   	pop    %ebp
    172b:	c3                   	ret    
    172c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1730:	39 c2                	cmp    %eax,%edx
    1732:	72 c4                	jb     16f8 <free+0x18>
    1734:	39 c1                	cmp    %eax,%ecx
    1736:	73 c0                	jae    16f8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    1738:	8b 73 fc             	mov    -0x4(%ebx),%esi
    173b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    173e:	39 f8                	cmp    %edi,%eax
    1740:	75 d0                	jne    1712 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    1742:	03 70 04             	add    0x4(%eax),%esi
    1745:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1748:	8b 02                	mov    (%edx),%eax
    174a:	8b 00                	mov    (%eax),%eax
    174c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    174f:	8b 42 04             	mov    0x4(%edx),%eax
    1752:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1755:	39 f1                	cmp    %esi,%ecx
    1757:	75 c6                	jne    171f <free+0x3f>
    p->s.size += bp->s.size;
    1759:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    175c:	89 15 00 1e 00 00    	mov    %edx,0x1e00
    p->s.size += bp->s.size;
    1762:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1765:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1768:	89 0a                	mov    %ecx,(%edx)
}
    176a:	5b                   	pop    %ebx
    176b:	5e                   	pop    %esi
    176c:	5f                   	pop    %edi
    176d:	5d                   	pop    %ebp
    176e:	c3                   	ret    
    176f:	90                   	nop

00001770 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1770:	55                   	push   %ebp
    1771:	89 e5                	mov    %esp,%ebp
    1773:	57                   	push   %edi
    1774:	56                   	push   %esi
    1775:	53                   	push   %ebx
    1776:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1779:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    177c:	8b 3d 00 1e 00 00    	mov    0x1e00,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1782:	8d 70 07             	lea    0x7(%eax),%esi
    1785:	c1 ee 03             	shr    $0x3,%esi
    1788:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    178b:	85 ff                	test   %edi,%edi
    178d:	0f 84 9d 00 00 00    	je     1830 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1793:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1795:	8b 4a 04             	mov    0x4(%edx),%ecx
    1798:	39 f1                	cmp    %esi,%ecx
    179a:	73 6a                	jae    1806 <malloc+0x96>
    179c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    17a1:	39 de                	cmp    %ebx,%esi
    17a3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    17a6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    17ad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    17b0:	eb 17                	jmp    17c9 <malloc+0x59>
    17b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17b8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    17ba:	8b 48 04             	mov    0x4(%eax),%ecx
    17bd:	39 f1                	cmp    %esi,%ecx
    17bf:	73 4f                	jae    1810 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    17c1:	8b 3d 00 1e 00 00    	mov    0x1e00,%edi
    17c7:	89 c2                	mov    %eax,%edx
    17c9:	39 d7                	cmp    %edx,%edi
    17cb:	75 eb                	jne    17b8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    17cd:	83 ec 0c             	sub    $0xc,%esp
    17d0:	ff 75 e4             	push   -0x1c(%ebp)
    17d3:	e8 83 fc ff ff       	call   145b <sbrk>
  if(p == (char*)-1)
    17d8:	83 c4 10             	add    $0x10,%esp
    17db:	83 f8 ff             	cmp    $0xffffffff,%eax
    17de:	74 1c                	je     17fc <malloc+0x8c>
  hp->s.size = nu;
    17e0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    17e3:	83 ec 0c             	sub    $0xc,%esp
    17e6:	83 c0 08             	add    $0x8,%eax
    17e9:	50                   	push   %eax
    17ea:	e8 f1 fe ff ff       	call   16e0 <free>
  return freep;
    17ef:	8b 15 00 1e 00 00    	mov    0x1e00,%edx
      if((p = morecore(nunits)) == 0)
    17f5:	83 c4 10             	add    $0x10,%esp
    17f8:	85 d2                	test   %edx,%edx
    17fa:	75 bc                	jne    17b8 <malloc+0x48>
        return 0;
  }
}
    17fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    17ff:	31 c0                	xor    %eax,%eax
}
    1801:	5b                   	pop    %ebx
    1802:	5e                   	pop    %esi
    1803:	5f                   	pop    %edi
    1804:	5d                   	pop    %ebp
    1805:	c3                   	ret    
    if(p->s.size >= nunits){
    1806:	89 d0                	mov    %edx,%eax
    1808:	89 fa                	mov    %edi,%edx
    180a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1810:	39 ce                	cmp    %ecx,%esi
    1812:	74 4c                	je     1860 <malloc+0xf0>
        p->s.size -= nunits;
    1814:	29 f1                	sub    %esi,%ecx
    1816:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1819:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    181c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    181f:	89 15 00 1e 00 00    	mov    %edx,0x1e00
}
    1825:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1828:	83 c0 08             	add    $0x8,%eax
}
    182b:	5b                   	pop    %ebx
    182c:	5e                   	pop    %esi
    182d:	5f                   	pop    %edi
    182e:	5d                   	pop    %ebp
    182f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    1830:	c7 05 00 1e 00 00 04 	movl   $0x1e04,0x1e00
    1837:	1e 00 00 
    base.s.size = 0;
    183a:	bf 04 1e 00 00       	mov    $0x1e04,%edi
    base.s.ptr = freep = prevp = &base;
    183f:	c7 05 04 1e 00 00 04 	movl   $0x1e04,0x1e04
    1846:	1e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1849:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    184b:	c7 05 08 1e 00 00 00 	movl   $0x0,0x1e08
    1852:	00 00 00 
    if(p->s.size >= nunits){
    1855:	e9 42 ff ff ff       	jmp    179c <malloc+0x2c>
    185a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1860:	8b 08                	mov    (%eax),%ecx
    1862:	89 0a                	mov    %ecx,(%edx)
    1864:	eb b9                	jmp    181f <malloc+0xaf>
