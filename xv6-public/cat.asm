
_cat:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  }
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
    1027:	7e 54                	jle    107d <main+0x7d>
    1029:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
    1030:	83 ec 08             	sub    $0x8,%esp
    1033:	6a 00                	push   $0x0
    1035:	ff 33                	push   (%ebx)
    1037:	e8 67 03 00 00       	call   13a3 <open>
    103c:	83 c4 10             	add    $0x10,%esp
    103f:	89 c7                	mov    %eax,%edi
    1041:	85 c0                	test   %eax,%eax
    1043:	78 24                	js     1069 <main+0x69>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
    1045:	83 ec 0c             	sub    $0xc,%esp
  for(i = 1; i < argc; i++){
    1048:	83 c6 01             	add    $0x1,%esi
    104b:	83 c3 04             	add    $0x4,%ebx
    cat(fd);
    104e:	50                   	push   %eax
    104f:	e8 3c 00 00 00       	call   1090 <cat>
    close(fd);
    1054:	89 3c 24             	mov    %edi,(%esp)
    1057:	e8 2f 03 00 00       	call   138b <close>
  for(i = 1; i < argc; i++){
    105c:	83 c4 10             	add    $0x10,%esp
    105f:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
    1062:	75 cc                	jne    1030 <main+0x30>
  }
  exit();
    1064:	e8 fa 02 00 00       	call   1363 <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
    1069:	50                   	push   %eax
    106a:	ff 33                	push   (%ebx)
    106c:	68 1b 18 00 00       	push   $0x181b
    1071:	6a 01                	push   $0x1
    1073:	e8 58 04 00 00       	call   14d0 <printf>
      exit();
    1078:	e8 e6 02 00 00       	call   1363 <exit>
    cat(0);
    107d:	83 ec 0c             	sub    $0xc,%esp
    1080:	6a 00                	push   $0x0
    1082:	e8 09 00 00 00       	call   1090 <cat>
    exit();
    1087:	e8 d7 02 00 00       	call   1363 <exit>
    108c:	66 90                	xchg   %ax,%ax
    108e:	66 90                	xchg   %ax,%ax

00001090 <cat>:
{
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	56                   	push   %esi
    1094:	8b 75 08             	mov    0x8(%ebp),%esi
    1097:	53                   	push   %ebx
  while((n = read(fd, buf, sizeof(buf))) > 0) {
    1098:	eb 1d                	jmp    10b7 <cat+0x27>
    109a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (write(1, buf, n) != n) {
    10a0:	83 ec 04             	sub    $0x4,%esp
    10a3:	53                   	push   %ebx
    10a4:	68 80 1b 00 00       	push   $0x1b80
    10a9:	6a 01                	push   $0x1
    10ab:	e8 d3 02 00 00       	call   1383 <write>
    10b0:	83 c4 10             	add    $0x10,%esp
    10b3:	39 d8                	cmp    %ebx,%eax
    10b5:	75 25                	jne    10dc <cat+0x4c>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
    10b7:	83 ec 04             	sub    $0x4,%esp
    10ba:	68 00 02 00 00       	push   $0x200
    10bf:	68 80 1b 00 00       	push   $0x1b80
    10c4:	56                   	push   %esi
    10c5:	e8 b1 02 00 00       	call   137b <read>
    10ca:	83 c4 10             	add    $0x10,%esp
    10cd:	89 c3                	mov    %eax,%ebx
    10cf:	85 c0                	test   %eax,%eax
    10d1:	7f cd                	jg     10a0 <cat+0x10>
  if(n < 0){
    10d3:	75 1b                	jne    10f0 <cat+0x60>
}
    10d5:	8d 65 f8             	lea    -0x8(%ebp),%esp
    10d8:	5b                   	pop    %ebx
    10d9:	5e                   	pop    %esi
    10da:	5d                   	pop    %ebp
    10db:	c3                   	ret    
      printf(1, "cat: write error\n");
    10dc:	83 ec 08             	sub    $0x8,%esp
    10df:	68 f8 17 00 00       	push   $0x17f8
    10e4:	6a 01                	push   $0x1
    10e6:	e8 e5 03 00 00       	call   14d0 <printf>
      exit();
    10eb:	e8 73 02 00 00       	call   1363 <exit>
    printf(1, "cat: read error\n");
    10f0:	50                   	push   %eax
    10f1:	50                   	push   %eax
    10f2:	68 0a 18 00 00       	push   $0x180a
    10f7:	6a 01                	push   $0x1
    10f9:	e8 d2 03 00 00       	call   14d0 <printf>
    exit();
    10fe:	e8 60 02 00 00       	call   1363 <exit>
    1103:	66 90                	xchg   %ax,%ax
    1105:	66 90                	xchg   %ax,%ax
    1107:	66 90                	xchg   %ax,%ax
    1109:	66 90                	xchg   %ax,%ax
    110b:	66 90                	xchg   %ax,%ax
    110d:	66 90                	xchg   %ax,%ax
    110f:	90                   	nop

00001110 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1110:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1111:	31 c0                	xor    %eax,%eax
{
    1113:	89 e5                	mov    %esp,%ebp
    1115:	53                   	push   %ebx
    1116:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1119:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    111c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1120:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1124:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1127:	83 c0 01             	add    $0x1,%eax
    112a:	84 d2                	test   %dl,%dl
    112c:	75 f2                	jne    1120 <strcpy+0x10>
    ;
  return os;
}
    112e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1131:	89 c8                	mov    %ecx,%eax
    1133:	c9                   	leave  
    1134:	c3                   	ret    
    1135:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    113c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001140 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	53                   	push   %ebx
    1144:	8b 55 08             	mov    0x8(%ebp),%edx
    1147:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    114a:	0f b6 02             	movzbl (%edx),%eax
    114d:	84 c0                	test   %al,%al
    114f:	75 17                	jne    1168 <strcmp+0x28>
    1151:	eb 3a                	jmp    118d <strcmp+0x4d>
    1153:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1157:	90                   	nop
    1158:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    115c:	83 c2 01             	add    $0x1,%edx
    115f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    1162:	84 c0                	test   %al,%al
    1164:	74 1a                	je     1180 <strcmp+0x40>
    p++, q++;
    1166:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    1168:	0f b6 19             	movzbl (%ecx),%ebx
    116b:	38 c3                	cmp    %al,%bl
    116d:	74 e9                	je     1158 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    116f:	29 d8                	sub    %ebx,%eax
}
    1171:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1174:	c9                   	leave  
    1175:	c3                   	ret    
    1176:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    117d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    1180:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    1184:	31 c0                	xor    %eax,%eax
    1186:	29 d8                	sub    %ebx,%eax
}
    1188:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    118b:	c9                   	leave  
    118c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    118d:	0f b6 19             	movzbl (%ecx),%ebx
    1190:	31 c0                	xor    %eax,%eax
    1192:	eb db                	jmp    116f <strcmp+0x2f>
    1194:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    119b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    119f:	90                   	nop

000011a0 <strlen>:

uint
strlen(const char *s)
{
    11a0:	55                   	push   %ebp
    11a1:	89 e5                	mov    %esp,%ebp
    11a3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    11a6:	80 3a 00             	cmpb   $0x0,(%edx)
    11a9:	74 15                	je     11c0 <strlen+0x20>
    11ab:	31 c0                	xor    %eax,%eax
    11ad:	8d 76 00             	lea    0x0(%esi),%esi
    11b0:	83 c0 01             	add    $0x1,%eax
    11b3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    11b7:	89 c1                	mov    %eax,%ecx
    11b9:	75 f5                	jne    11b0 <strlen+0x10>
    ;
  return n;
}
    11bb:	89 c8                	mov    %ecx,%eax
    11bd:	5d                   	pop    %ebp
    11be:	c3                   	ret    
    11bf:	90                   	nop
  for(n = 0; s[n]; n++)
    11c0:	31 c9                	xor    %ecx,%ecx
}
    11c2:	5d                   	pop    %ebp
    11c3:	89 c8                	mov    %ecx,%eax
    11c5:	c3                   	ret    
    11c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11cd:	8d 76 00             	lea    0x0(%esi),%esi

000011d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11d0:	55                   	push   %ebp
    11d1:	89 e5                	mov    %esp,%ebp
    11d3:	57                   	push   %edi
    11d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    11d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11da:	8b 45 0c             	mov    0xc(%ebp),%eax
    11dd:	89 d7                	mov    %edx,%edi
    11df:	fc                   	cld    
    11e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    11e2:	8b 7d fc             	mov    -0x4(%ebp),%edi
    11e5:	89 d0                	mov    %edx,%eax
    11e7:	c9                   	leave  
    11e8:	c3                   	ret    
    11e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000011f0 <strchr>:

char*
strchr(const char *s, char c)
{
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	8b 45 08             	mov    0x8(%ebp),%eax
    11f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    11fa:	0f b6 10             	movzbl (%eax),%edx
    11fd:	84 d2                	test   %dl,%dl
    11ff:	75 12                	jne    1213 <strchr+0x23>
    1201:	eb 1d                	jmp    1220 <strchr+0x30>
    1203:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1207:	90                   	nop
    1208:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    120c:	83 c0 01             	add    $0x1,%eax
    120f:	84 d2                	test   %dl,%dl
    1211:	74 0d                	je     1220 <strchr+0x30>
    if(*s == c)
    1213:	38 d1                	cmp    %dl,%cl
    1215:	75 f1                	jne    1208 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1217:	5d                   	pop    %ebp
    1218:	c3                   	ret    
    1219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1220:	31 c0                	xor    %eax,%eax
}
    1222:	5d                   	pop    %ebp
    1223:	c3                   	ret    
    1224:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    122b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    122f:	90                   	nop

00001230 <gets>:

char*
gets(char *buf, int max)
{
    1230:	55                   	push   %ebp
    1231:	89 e5                	mov    %esp,%ebp
    1233:	57                   	push   %edi
    1234:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    1235:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    1238:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    1239:	31 db                	xor    %ebx,%ebx
{
    123b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    123e:	eb 27                	jmp    1267 <gets+0x37>
    cc = read(0, &c, 1);
    1240:	83 ec 04             	sub    $0x4,%esp
    1243:	6a 01                	push   $0x1
    1245:	57                   	push   %edi
    1246:	6a 00                	push   $0x0
    1248:	e8 2e 01 00 00       	call   137b <read>
    if(cc < 1)
    124d:	83 c4 10             	add    $0x10,%esp
    1250:	85 c0                	test   %eax,%eax
    1252:	7e 1d                	jle    1271 <gets+0x41>
      break;
    buf[i++] = c;
    1254:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1258:	8b 55 08             	mov    0x8(%ebp),%edx
    125b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    125f:	3c 0a                	cmp    $0xa,%al
    1261:	74 1d                	je     1280 <gets+0x50>
    1263:	3c 0d                	cmp    $0xd,%al
    1265:	74 19                	je     1280 <gets+0x50>
  for(i=0; i+1 < max; ){
    1267:	89 de                	mov    %ebx,%esi
    1269:	83 c3 01             	add    $0x1,%ebx
    126c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    126f:	7c cf                	jl     1240 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    1271:	8b 45 08             	mov    0x8(%ebp),%eax
    1274:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1278:	8d 65 f4             	lea    -0xc(%ebp),%esp
    127b:	5b                   	pop    %ebx
    127c:	5e                   	pop    %esi
    127d:	5f                   	pop    %edi
    127e:	5d                   	pop    %ebp
    127f:	c3                   	ret    
  buf[i] = '\0';
    1280:	8b 45 08             	mov    0x8(%ebp),%eax
    1283:	89 de                	mov    %ebx,%esi
    1285:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    1289:	8d 65 f4             	lea    -0xc(%ebp),%esp
    128c:	5b                   	pop    %ebx
    128d:	5e                   	pop    %esi
    128e:	5f                   	pop    %edi
    128f:	5d                   	pop    %ebp
    1290:	c3                   	ret    
    1291:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1298:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    129f:	90                   	nop

000012a0 <stat>:

int
stat(const char *n, struct stat *st)
{
    12a0:	55                   	push   %ebp
    12a1:	89 e5                	mov    %esp,%ebp
    12a3:	56                   	push   %esi
    12a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    12a5:	83 ec 08             	sub    $0x8,%esp
    12a8:	6a 00                	push   $0x0
    12aa:	ff 75 08             	push   0x8(%ebp)
    12ad:	e8 f1 00 00 00       	call   13a3 <open>
  if(fd < 0)
    12b2:	83 c4 10             	add    $0x10,%esp
    12b5:	85 c0                	test   %eax,%eax
    12b7:	78 27                	js     12e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    12b9:	83 ec 08             	sub    $0x8,%esp
    12bc:	ff 75 0c             	push   0xc(%ebp)
    12bf:	89 c3                	mov    %eax,%ebx
    12c1:	50                   	push   %eax
    12c2:	e8 f4 00 00 00       	call   13bb <fstat>
  close(fd);
    12c7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    12ca:	89 c6                	mov    %eax,%esi
  close(fd);
    12cc:	e8 ba 00 00 00       	call   138b <close>
  return r;
    12d1:	83 c4 10             	add    $0x10,%esp
}
    12d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    12d7:	89 f0                	mov    %esi,%eax
    12d9:	5b                   	pop    %ebx
    12da:	5e                   	pop    %esi
    12db:	5d                   	pop    %ebp
    12dc:	c3                   	ret    
    12dd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    12e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
    12e5:	eb ed                	jmp    12d4 <stat+0x34>
    12e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12ee:	66 90                	xchg   %ax,%ax

000012f0 <atoi>:

int
atoi(const char *s)
{
    12f0:	55                   	push   %ebp
    12f1:	89 e5                	mov    %esp,%ebp
    12f3:	53                   	push   %ebx
    12f4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12f7:	0f be 02             	movsbl (%edx),%eax
    12fa:	8d 48 d0             	lea    -0x30(%eax),%ecx
    12fd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1300:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1305:	77 1e                	ja     1325 <atoi+0x35>
    1307:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    130e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1310:	83 c2 01             	add    $0x1,%edx
    1313:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1316:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    131a:	0f be 02             	movsbl (%edx),%eax
    131d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1320:	80 fb 09             	cmp    $0x9,%bl
    1323:	76 eb                	jbe    1310 <atoi+0x20>
  return n;
}
    1325:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1328:	89 c8                	mov    %ecx,%eax
    132a:	c9                   	leave  
    132b:	c3                   	ret    
    132c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001330 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1330:	55                   	push   %ebp
    1331:	89 e5                	mov    %esp,%ebp
    1333:	57                   	push   %edi
    1334:	8b 45 10             	mov    0x10(%ebp),%eax
    1337:	8b 55 08             	mov    0x8(%ebp),%edx
    133a:	56                   	push   %esi
    133b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    133e:	85 c0                	test   %eax,%eax
    1340:	7e 13                	jle    1355 <memmove+0x25>
    1342:	01 d0                	add    %edx,%eax
  dst = vdst;
    1344:	89 d7                	mov    %edx,%edi
    1346:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    134d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1350:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1351:	39 f8                	cmp    %edi,%eax
    1353:	75 fb                	jne    1350 <memmove+0x20>
  return vdst;
}
    1355:	5e                   	pop    %esi
    1356:	89 d0                	mov    %edx,%eax
    1358:	5f                   	pop    %edi
    1359:	5d                   	pop    %ebp
    135a:	c3                   	ret    

0000135b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    135b:	b8 01 00 00 00       	mov    $0x1,%eax
    1360:	cd 40                	int    $0x40
    1362:	c3                   	ret    

00001363 <exit>:
SYSCALL(exit)
    1363:	b8 02 00 00 00       	mov    $0x2,%eax
    1368:	cd 40                	int    $0x40
    136a:	c3                   	ret    

0000136b <wait>:
SYSCALL(wait)
    136b:	b8 03 00 00 00       	mov    $0x3,%eax
    1370:	cd 40                	int    $0x40
    1372:	c3                   	ret    

00001373 <pipe>:
SYSCALL(pipe)
    1373:	b8 04 00 00 00       	mov    $0x4,%eax
    1378:	cd 40                	int    $0x40
    137a:	c3                   	ret    

0000137b <read>:
SYSCALL(read)
    137b:	b8 05 00 00 00       	mov    $0x5,%eax
    1380:	cd 40                	int    $0x40
    1382:	c3                   	ret    

00001383 <write>:
SYSCALL(write)
    1383:	b8 10 00 00 00       	mov    $0x10,%eax
    1388:	cd 40                	int    $0x40
    138a:	c3                   	ret    

0000138b <close>:
SYSCALL(close)
    138b:	b8 15 00 00 00       	mov    $0x15,%eax
    1390:	cd 40                	int    $0x40
    1392:	c3                   	ret    

00001393 <kill>:
SYSCALL(kill)
    1393:	b8 06 00 00 00       	mov    $0x6,%eax
    1398:	cd 40                	int    $0x40
    139a:	c3                   	ret    

0000139b <exec>:
SYSCALL(exec)
    139b:	b8 07 00 00 00       	mov    $0x7,%eax
    13a0:	cd 40                	int    $0x40
    13a2:	c3                   	ret    

000013a3 <open>:
SYSCALL(open)
    13a3:	b8 0f 00 00 00       	mov    $0xf,%eax
    13a8:	cd 40                	int    $0x40
    13aa:	c3                   	ret    

000013ab <mknod>:
SYSCALL(mknod)
    13ab:	b8 11 00 00 00       	mov    $0x11,%eax
    13b0:	cd 40                	int    $0x40
    13b2:	c3                   	ret    

000013b3 <unlink>:
SYSCALL(unlink)
    13b3:	b8 12 00 00 00       	mov    $0x12,%eax
    13b8:	cd 40                	int    $0x40
    13ba:	c3                   	ret    

000013bb <fstat>:
SYSCALL(fstat)
    13bb:	b8 08 00 00 00       	mov    $0x8,%eax
    13c0:	cd 40                	int    $0x40
    13c2:	c3                   	ret    

000013c3 <link>:
SYSCALL(link)
    13c3:	b8 13 00 00 00       	mov    $0x13,%eax
    13c8:	cd 40                	int    $0x40
    13ca:	c3                   	ret    

000013cb <mkdir>:
SYSCALL(mkdir)
    13cb:	b8 14 00 00 00       	mov    $0x14,%eax
    13d0:	cd 40                	int    $0x40
    13d2:	c3                   	ret    

000013d3 <chdir>:
SYSCALL(chdir)
    13d3:	b8 09 00 00 00       	mov    $0x9,%eax
    13d8:	cd 40                	int    $0x40
    13da:	c3                   	ret    

000013db <dup>:
SYSCALL(dup)
    13db:	b8 0a 00 00 00       	mov    $0xa,%eax
    13e0:	cd 40                	int    $0x40
    13e2:	c3                   	ret    

000013e3 <getpid>:
SYSCALL(getpid)
    13e3:	b8 0b 00 00 00       	mov    $0xb,%eax
    13e8:	cd 40                	int    $0x40
    13ea:	c3                   	ret    

000013eb <sbrk>:
SYSCALL(sbrk)
    13eb:	b8 0c 00 00 00       	mov    $0xc,%eax
    13f0:	cd 40                	int    $0x40
    13f2:	c3                   	ret    

000013f3 <sleep>:
SYSCALL(sleep)
    13f3:	b8 0d 00 00 00       	mov    $0xd,%eax
    13f8:	cd 40                	int    $0x40
    13fa:	c3                   	ret    

000013fb <uptime>:
SYSCALL(uptime)
    13fb:	b8 0e 00 00 00       	mov    $0xe,%eax
    1400:	cd 40                	int    $0x40
    1402:	c3                   	ret    

00001403 <getpinfo>:

SYSCALL(getpinfo)
    1403:	b8 16 00 00 00       	mov    $0x16,%eax
    1408:	cd 40                	int    $0x40
    140a:	c3                   	ret    

0000140b <settickets>:
SYSCALL(settickets)
    140b:	b8 17 00 00 00       	mov    $0x17,%eax
    1410:	cd 40                	int    $0x40
    1412:	c3                   	ret    
    1413:	66 90                	xchg   %ax,%ax
    1415:	66 90                	xchg   %ax,%ax
    1417:	66 90                	xchg   %ax,%ax
    1419:	66 90                	xchg   %ax,%ax
    141b:	66 90                	xchg   %ax,%ax
    141d:	66 90                	xchg   %ax,%ax
    141f:	90                   	nop

00001420 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1420:	55                   	push   %ebp
    1421:	89 e5                	mov    %esp,%ebp
    1423:	57                   	push   %edi
    1424:	56                   	push   %esi
    1425:	53                   	push   %ebx
    1426:	83 ec 3c             	sub    $0x3c,%esp
    1429:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    142c:	89 d1                	mov    %edx,%ecx
{
    142e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1431:	85 d2                	test   %edx,%edx
    1433:	0f 89 7f 00 00 00    	jns    14b8 <printint+0x98>
    1439:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    143d:	74 79                	je     14b8 <printint+0x98>
    neg = 1;
    143f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1446:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1448:	31 db                	xor    %ebx,%ebx
    144a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    144d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1450:	89 c8                	mov    %ecx,%eax
    1452:	31 d2                	xor    %edx,%edx
    1454:	89 cf                	mov    %ecx,%edi
    1456:	f7 75 c4             	divl   -0x3c(%ebp)
    1459:	0f b6 92 90 18 00 00 	movzbl 0x1890(%edx),%edx
    1460:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1463:	89 d8                	mov    %ebx,%eax
    1465:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1468:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    146b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    146e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1471:	76 dd                	jbe    1450 <printint+0x30>
  if(neg)
    1473:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1476:	85 c9                	test   %ecx,%ecx
    1478:	74 0c                	je     1486 <printint+0x66>
    buf[i++] = '-';
    147a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    147f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1481:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1486:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1489:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    148d:	eb 07                	jmp    1496 <printint+0x76>
    148f:	90                   	nop
    putc(fd, buf[i]);
    1490:	0f b6 13             	movzbl (%ebx),%edx
    1493:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1496:	83 ec 04             	sub    $0x4,%esp
    1499:	88 55 d7             	mov    %dl,-0x29(%ebp)
    149c:	6a 01                	push   $0x1
    149e:	56                   	push   %esi
    149f:	57                   	push   %edi
    14a0:	e8 de fe ff ff       	call   1383 <write>
  while(--i >= 0)
    14a5:	83 c4 10             	add    $0x10,%esp
    14a8:	39 de                	cmp    %ebx,%esi
    14aa:	75 e4                	jne    1490 <printint+0x70>
}
    14ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14af:	5b                   	pop    %ebx
    14b0:	5e                   	pop    %esi
    14b1:	5f                   	pop    %edi
    14b2:	5d                   	pop    %ebp
    14b3:	c3                   	ret    
    14b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    14b8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    14bf:	eb 87                	jmp    1448 <printint+0x28>
    14c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14cf:	90                   	nop

000014d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    14d0:	55                   	push   %ebp
    14d1:	89 e5                	mov    %esp,%ebp
    14d3:	57                   	push   %edi
    14d4:	56                   	push   %esi
    14d5:	53                   	push   %ebx
    14d6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14d9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    14dc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    14df:	0f b6 13             	movzbl (%ebx),%edx
    14e2:	84 d2                	test   %dl,%dl
    14e4:	74 6a                	je     1550 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    14e6:	8d 45 10             	lea    0x10(%ebp),%eax
    14e9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    14ec:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    14ef:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    14f1:	89 45 d0             	mov    %eax,-0x30(%ebp)
    14f4:	eb 36                	jmp    152c <printf+0x5c>
    14f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14fd:	8d 76 00             	lea    0x0(%esi),%esi
    1500:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1503:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1508:	83 f8 25             	cmp    $0x25,%eax
    150b:	74 15                	je     1522 <printf+0x52>
  write(fd, &c, 1);
    150d:	83 ec 04             	sub    $0x4,%esp
    1510:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1513:	6a 01                	push   $0x1
    1515:	57                   	push   %edi
    1516:	56                   	push   %esi
    1517:	e8 67 fe ff ff       	call   1383 <write>
    151c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    151f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1522:	0f b6 13             	movzbl (%ebx),%edx
    1525:	83 c3 01             	add    $0x1,%ebx
    1528:	84 d2                	test   %dl,%dl
    152a:	74 24                	je     1550 <printf+0x80>
    c = fmt[i] & 0xff;
    152c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    152f:	85 c9                	test   %ecx,%ecx
    1531:	74 cd                	je     1500 <printf+0x30>
      }
    } else if(state == '%'){
    1533:	83 f9 25             	cmp    $0x25,%ecx
    1536:	75 ea                	jne    1522 <printf+0x52>
      if(c == 'd'){
    1538:	83 f8 25             	cmp    $0x25,%eax
    153b:	0f 84 07 01 00 00    	je     1648 <printf+0x178>
    1541:	83 e8 63             	sub    $0x63,%eax
    1544:	83 f8 15             	cmp    $0x15,%eax
    1547:	77 17                	ja     1560 <printf+0x90>
    1549:	ff 24 85 38 18 00 00 	jmp    *0x1838(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1550:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1553:	5b                   	pop    %ebx
    1554:	5e                   	pop    %esi
    1555:	5f                   	pop    %edi
    1556:	5d                   	pop    %ebp
    1557:	c3                   	ret    
    1558:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    155f:	90                   	nop
  write(fd, &c, 1);
    1560:	83 ec 04             	sub    $0x4,%esp
    1563:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    1566:	6a 01                	push   $0x1
    1568:	57                   	push   %edi
    1569:	56                   	push   %esi
    156a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    156e:	e8 10 fe ff ff       	call   1383 <write>
        putc(fd, c);
    1573:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    1577:	83 c4 0c             	add    $0xc,%esp
    157a:	88 55 e7             	mov    %dl,-0x19(%ebp)
    157d:	6a 01                	push   $0x1
    157f:	57                   	push   %edi
    1580:	56                   	push   %esi
    1581:	e8 fd fd ff ff       	call   1383 <write>
        putc(fd, c);
    1586:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1589:	31 c9                	xor    %ecx,%ecx
    158b:	eb 95                	jmp    1522 <printf+0x52>
    158d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1590:	83 ec 0c             	sub    $0xc,%esp
    1593:	b9 10 00 00 00       	mov    $0x10,%ecx
    1598:	6a 00                	push   $0x0
    159a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    159d:	8b 10                	mov    (%eax),%edx
    159f:	89 f0                	mov    %esi,%eax
    15a1:	e8 7a fe ff ff       	call   1420 <printint>
        ap++;
    15a6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    15aa:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15ad:	31 c9                	xor    %ecx,%ecx
    15af:	e9 6e ff ff ff       	jmp    1522 <printf+0x52>
    15b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    15b8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    15bb:	8b 10                	mov    (%eax),%edx
        ap++;
    15bd:	83 c0 04             	add    $0x4,%eax
    15c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    15c3:	85 d2                	test   %edx,%edx
    15c5:	0f 84 8d 00 00 00    	je     1658 <printf+0x188>
        while(*s != 0){
    15cb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    15ce:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    15d0:	84 c0                	test   %al,%al
    15d2:	0f 84 4a ff ff ff    	je     1522 <printf+0x52>
    15d8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    15db:	89 d3                	mov    %edx,%ebx
    15dd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    15e0:	83 ec 04             	sub    $0x4,%esp
          s++;
    15e3:	83 c3 01             	add    $0x1,%ebx
    15e6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    15e9:	6a 01                	push   $0x1
    15eb:	57                   	push   %edi
    15ec:	56                   	push   %esi
    15ed:	e8 91 fd ff ff       	call   1383 <write>
        while(*s != 0){
    15f2:	0f b6 03             	movzbl (%ebx),%eax
    15f5:	83 c4 10             	add    $0x10,%esp
    15f8:	84 c0                	test   %al,%al
    15fa:	75 e4                	jne    15e0 <printf+0x110>
      state = 0;
    15fc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    15ff:	31 c9                	xor    %ecx,%ecx
    1601:	e9 1c ff ff ff       	jmp    1522 <printf+0x52>
    1606:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    160d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1610:	83 ec 0c             	sub    $0xc,%esp
    1613:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1618:	6a 01                	push   $0x1
    161a:	e9 7b ff ff ff       	jmp    159a <printf+0xca>
    161f:	90                   	nop
        putc(fd, *ap);
    1620:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1623:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1626:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1628:	6a 01                	push   $0x1
    162a:	57                   	push   %edi
    162b:	56                   	push   %esi
        putc(fd, *ap);
    162c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    162f:	e8 4f fd ff ff       	call   1383 <write>
        ap++;
    1634:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1638:	83 c4 10             	add    $0x10,%esp
      state = 0;
    163b:	31 c9                	xor    %ecx,%ecx
    163d:	e9 e0 fe ff ff       	jmp    1522 <printf+0x52>
    1642:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    1648:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    164b:	83 ec 04             	sub    $0x4,%esp
    164e:	e9 2a ff ff ff       	jmp    157d <printf+0xad>
    1653:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1657:	90                   	nop
          s = "(null)";
    1658:	ba 30 18 00 00       	mov    $0x1830,%edx
        while(*s != 0){
    165d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    1660:	b8 28 00 00 00       	mov    $0x28,%eax
    1665:	89 d3                	mov    %edx,%ebx
    1667:	e9 74 ff ff ff       	jmp    15e0 <printf+0x110>
    166c:	66 90                	xchg   %ax,%ax
    166e:	66 90                	xchg   %ax,%ax

00001670 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1670:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1671:	a1 80 1d 00 00       	mov    0x1d80,%eax
{
    1676:	89 e5                	mov    %esp,%ebp
    1678:	57                   	push   %edi
    1679:	56                   	push   %esi
    167a:	53                   	push   %ebx
    167b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    167e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1681:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1688:	89 c2                	mov    %eax,%edx
    168a:	8b 00                	mov    (%eax),%eax
    168c:	39 ca                	cmp    %ecx,%edx
    168e:	73 30                	jae    16c0 <free+0x50>
    1690:	39 c1                	cmp    %eax,%ecx
    1692:	72 04                	jb     1698 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1694:	39 c2                	cmp    %eax,%edx
    1696:	72 f0                	jb     1688 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1698:	8b 73 fc             	mov    -0x4(%ebx),%esi
    169b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    169e:	39 f8                	cmp    %edi,%eax
    16a0:	74 30                	je     16d2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    16a2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    16a5:	8b 42 04             	mov    0x4(%edx),%eax
    16a8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    16ab:	39 f1                	cmp    %esi,%ecx
    16ad:	74 3a                	je     16e9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    16af:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    16b1:	5b                   	pop    %ebx
  freep = p;
    16b2:	89 15 80 1d 00 00    	mov    %edx,0x1d80
}
    16b8:	5e                   	pop    %esi
    16b9:	5f                   	pop    %edi
    16ba:	5d                   	pop    %ebp
    16bb:	c3                   	ret    
    16bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16c0:	39 c2                	cmp    %eax,%edx
    16c2:	72 c4                	jb     1688 <free+0x18>
    16c4:	39 c1                	cmp    %eax,%ecx
    16c6:	73 c0                	jae    1688 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    16c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    16ce:	39 f8                	cmp    %edi,%eax
    16d0:	75 d0                	jne    16a2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    16d2:	03 70 04             	add    0x4(%eax),%esi
    16d5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    16d8:	8b 02                	mov    (%edx),%eax
    16da:	8b 00                	mov    (%eax),%eax
    16dc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    16df:	8b 42 04             	mov    0x4(%edx),%eax
    16e2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    16e5:	39 f1                	cmp    %esi,%ecx
    16e7:	75 c6                	jne    16af <free+0x3f>
    p->s.size += bp->s.size;
    16e9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    16ec:	89 15 80 1d 00 00    	mov    %edx,0x1d80
    p->s.size += bp->s.size;
    16f2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    16f5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    16f8:	89 0a                	mov    %ecx,(%edx)
}
    16fa:	5b                   	pop    %ebx
    16fb:	5e                   	pop    %esi
    16fc:	5f                   	pop    %edi
    16fd:	5d                   	pop    %ebp
    16fe:	c3                   	ret    
    16ff:	90                   	nop

00001700 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1700:	55                   	push   %ebp
    1701:	89 e5                	mov    %esp,%ebp
    1703:	57                   	push   %edi
    1704:	56                   	push   %esi
    1705:	53                   	push   %ebx
    1706:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1709:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    170c:	8b 3d 80 1d 00 00    	mov    0x1d80,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1712:	8d 70 07             	lea    0x7(%eax),%esi
    1715:	c1 ee 03             	shr    $0x3,%esi
    1718:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    171b:	85 ff                	test   %edi,%edi
    171d:	0f 84 9d 00 00 00    	je     17c0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1723:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1725:	8b 4a 04             	mov    0x4(%edx),%ecx
    1728:	39 f1                	cmp    %esi,%ecx
    172a:	73 6a                	jae    1796 <malloc+0x96>
    172c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1731:	39 de                	cmp    %ebx,%esi
    1733:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1736:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    173d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1740:	eb 17                	jmp    1759 <malloc+0x59>
    1742:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1748:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    174a:	8b 48 04             	mov    0x4(%eax),%ecx
    174d:	39 f1                	cmp    %esi,%ecx
    174f:	73 4f                	jae    17a0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1751:	8b 3d 80 1d 00 00    	mov    0x1d80,%edi
    1757:	89 c2                	mov    %eax,%edx
    1759:	39 d7                	cmp    %edx,%edi
    175b:	75 eb                	jne    1748 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    175d:	83 ec 0c             	sub    $0xc,%esp
    1760:	ff 75 e4             	push   -0x1c(%ebp)
    1763:	e8 83 fc ff ff       	call   13eb <sbrk>
  if(p == (char*)-1)
    1768:	83 c4 10             	add    $0x10,%esp
    176b:	83 f8 ff             	cmp    $0xffffffff,%eax
    176e:	74 1c                	je     178c <malloc+0x8c>
  hp->s.size = nu;
    1770:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1773:	83 ec 0c             	sub    $0xc,%esp
    1776:	83 c0 08             	add    $0x8,%eax
    1779:	50                   	push   %eax
    177a:	e8 f1 fe ff ff       	call   1670 <free>
  return freep;
    177f:	8b 15 80 1d 00 00    	mov    0x1d80,%edx
      if((p = morecore(nunits)) == 0)
    1785:	83 c4 10             	add    $0x10,%esp
    1788:	85 d2                	test   %edx,%edx
    178a:	75 bc                	jne    1748 <malloc+0x48>
        return 0;
  }
}
    178c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    178f:	31 c0                	xor    %eax,%eax
}
    1791:	5b                   	pop    %ebx
    1792:	5e                   	pop    %esi
    1793:	5f                   	pop    %edi
    1794:	5d                   	pop    %ebp
    1795:	c3                   	ret    
    if(p->s.size >= nunits){
    1796:	89 d0                	mov    %edx,%eax
    1798:	89 fa                	mov    %edi,%edx
    179a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    17a0:	39 ce                	cmp    %ecx,%esi
    17a2:	74 4c                	je     17f0 <malloc+0xf0>
        p->s.size -= nunits;
    17a4:	29 f1                	sub    %esi,%ecx
    17a6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    17a9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    17ac:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    17af:	89 15 80 1d 00 00    	mov    %edx,0x1d80
}
    17b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    17b8:	83 c0 08             	add    $0x8,%eax
}
    17bb:	5b                   	pop    %ebx
    17bc:	5e                   	pop    %esi
    17bd:	5f                   	pop    %edi
    17be:	5d                   	pop    %ebp
    17bf:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    17c0:	c7 05 80 1d 00 00 84 	movl   $0x1d84,0x1d80
    17c7:	1d 00 00 
    base.s.size = 0;
    17ca:	bf 84 1d 00 00       	mov    $0x1d84,%edi
    base.s.ptr = freep = prevp = &base;
    17cf:	c7 05 84 1d 00 00 84 	movl   $0x1d84,0x1d84
    17d6:	1d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17d9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    17db:	c7 05 88 1d 00 00 00 	movl   $0x0,0x1d88
    17e2:	00 00 00 
    if(p->s.size >= nunits){
    17e5:	e9 42 ff ff ff       	jmp    172c <malloc+0x2c>
    17ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    17f0:	8b 08                	mov    (%eax),%ecx
    17f2:	89 0a                	mov    %ecx,(%edx)
    17f4:	eb b9                	jmp    17af <malloc+0xaf>
