
_ls:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  close(fd);
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
    100f:	53                   	push   %ebx
    1010:	bb 01 00 00 00       	mov    $0x1,%ebx
    1015:	51                   	push   %ecx
    1016:	83 ec 08             	sub    $0x8,%esp
    1019:	8b 31                	mov    (%ecx),%esi
    101b:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
    101e:	83 fe 01             	cmp    $0x1,%esi
    1021:	7e 1f                	jle    1042 <main+0x42>
    1023:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1027:	90                   	nop
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
    1028:	83 ec 0c             	sub    $0xc,%esp
    102b:	ff 34 9f             	push   (%edi,%ebx,4)
  for(i=1; i<argc; i++)
    102e:	83 c3 01             	add    $0x1,%ebx
    ls(argv[i]);
    1031:	e8 ca 00 00 00       	call   1100 <ls>
  for(i=1; i<argc; i++)
    1036:	83 c4 10             	add    $0x10,%esp
    1039:	39 de                	cmp    %ebx,%esi
    103b:	75 eb                	jne    1028 <main+0x28>
  exit();
    103d:	e8 51 05 00 00       	call   1593 <exit>
    ls(".");
    1042:	83 ec 0c             	sub    $0xc,%esp
    1045:	68 70 1a 00 00       	push   $0x1a70
    104a:	e8 b1 00 00 00       	call   1100 <ls>
    exit();
    104f:	e8 3f 05 00 00       	call   1593 <exit>
    1054:	66 90                	xchg   %ax,%ax
    1056:	66 90                	xchg   %ax,%ax
    1058:	66 90                	xchg   %ax,%ax
    105a:	66 90                	xchg   %ax,%ax
    105c:	66 90                	xchg   %ax,%ax
    105e:	66 90                	xchg   %ax,%ax

00001060 <fmtname>:
{
    1060:	55                   	push   %ebp
    1061:	89 e5                	mov    %esp,%ebp
    1063:	56                   	push   %esi
    1064:	53                   	push   %ebx
    1065:	8b 75 08             	mov    0x8(%ebp),%esi
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
    1068:	83 ec 0c             	sub    $0xc,%esp
    106b:	56                   	push   %esi
    106c:	e8 5f 03 00 00       	call   13d0 <strlen>
    1071:	83 c4 10             	add    $0x10,%esp
    1074:	01 f0                	add    %esi,%eax
    1076:	89 c3                	mov    %eax,%ebx
    1078:	73 0f                	jae    1089 <fmtname+0x29>
    107a:	eb 12                	jmp    108e <fmtname+0x2e>
    107c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1080:	8d 43 ff             	lea    -0x1(%ebx),%eax
    1083:	39 c6                	cmp    %eax,%esi
    1085:	77 0a                	ja     1091 <fmtname+0x31>
    1087:	89 c3                	mov    %eax,%ebx
    1089:	80 3b 2f             	cmpb   $0x2f,(%ebx)
    108c:	75 f2                	jne    1080 <fmtname+0x20>
  p++;
    108e:	83 c3 01             	add    $0x1,%ebx
  if(strlen(p) >= DIRSIZ)
    1091:	83 ec 0c             	sub    $0xc,%esp
    1094:	53                   	push   %ebx
    1095:	e8 36 03 00 00       	call   13d0 <strlen>
    109a:	83 c4 10             	add    $0x10,%esp
    109d:	83 f8 0d             	cmp    $0xd,%eax
    10a0:	77 4a                	ja     10ec <fmtname+0x8c>
  memmove(buf, p, strlen(p));
    10a2:	83 ec 0c             	sub    $0xc,%esp
    10a5:	53                   	push   %ebx
    10a6:	e8 25 03 00 00       	call   13d0 <strlen>
    10ab:	83 c4 0c             	add    $0xc,%esp
    10ae:	50                   	push   %eax
    10af:	53                   	push   %ebx
    10b0:	68 04 1e 00 00       	push   $0x1e04
    10b5:	e8 a6 04 00 00       	call   1560 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
    10ba:	89 1c 24             	mov    %ebx,(%esp)
    10bd:	e8 0e 03 00 00       	call   13d0 <strlen>
    10c2:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
    10c5:	bb 04 1e 00 00       	mov    $0x1e04,%ebx
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
    10ca:	89 c6                	mov    %eax,%esi
    10cc:	e8 ff 02 00 00       	call   13d0 <strlen>
    10d1:	ba 0e 00 00 00       	mov    $0xe,%edx
    10d6:	83 c4 0c             	add    $0xc,%esp
    10d9:	29 f2                	sub    %esi,%edx
    10db:	05 04 1e 00 00       	add    $0x1e04,%eax
    10e0:	52                   	push   %edx
    10e1:	6a 20                	push   $0x20
    10e3:	50                   	push   %eax
    10e4:	e8 17 03 00 00       	call   1400 <memset>
  return buf;
    10e9:	83 c4 10             	add    $0x10,%esp
}
    10ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
    10ef:	89 d8                	mov    %ebx,%eax
    10f1:	5b                   	pop    %ebx
    10f2:	5e                   	pop    %esi
    10f3:	5d                   	pop    %ebp
    10f4:	c3                   	ret    
    10f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001100 <ls>:
{
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	57                   	push   %edi
    1104:	56                   	push   %esi
    1105:	53                   	push   %ebx
    1106:	81 ec 64 02 00 00    	sub    $0x264,%esp
    110c:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
    110f:	6a 00                	push   $0x0
    1111:	57                   	push   %edi
    1112:	e8 bc 04 00 00       	call   15d3 <open>
    1117:	83 c4 10             	add    $0x10,%esp
    111a:	85 c0                	test   %eax,%eax
    111c:	0f 88 9e 01 00 00    	js     12c0 <ls+0x1c0>
  if(fstat(fd, &st) < 0){
    1122:	83 ec 08             	sub    $0x8,%esp
    1125:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
    112b:	89 c3                	mov    %eax,%ebx
    112d:	56                   	push   %esi
    112e:	50                   	push   %eax
    112f:	e8 b7 04 00 00       	call   15eb <fstat>
    1134:	83 c4 10             	add    $0x10,%esp
    1137:	85 c0                	test   %eax,%eax
    1139:	0f 88 c1 01 00 00    	js     1300 <ls+0x200>
  switch(st.type){
    113f:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
    1146:	66 83 f8 01          	cmp    $0x1,%ax
    114a:	74 64                	je     11b0 <ls+0xb0>
    114c:	66 83 f8 02          	cmp    $0x2,%ax
    1150:	74 1e                	je     1170 <ls+0x70>
  close(fd);
    1152:	83 ec 0c             	sub    $0xc,%esp
    1155:	53                   	push   %ebx
    1156:	e8 60 04 00 00       	call   15bb <close>
    115b:	83 c4 10             	add    $0x10,%esp
}
    115e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1161:	5b                   	pop    %ebx
    1162:	5e                   	pop    %esi
    1163:	5f                   	pop    %edi
    1164:	5d                   	pop    %ebp
    1165:	c3                   	ret    
    1166:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    116d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
    1170:	83 ec 0c             	sub    $0xc,%esp
    1173:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
    1179:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
    117f:	57                   	push   %edi
    1180:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
    1186:	e8 d5 fe ff ff       	call   1060 <fmtname>
    118b:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
    1191:	59                   	pop    %ecx
    1192:	5f                   	pop    %edi
    1193:	52                   	push   %edx
    1194:	56                   	push   %esi
    1195:	6a 02                	push   $0x2
    1197:	50                   	push   %eax
    1198:	68 50 1a 00 00       	push   $0x1a50
    119d:	6a 01                	push   $0x1
    119f:	e8 5c 05 00 00       	call   1700 <printf>
    break;
    11a4:	83 c4 20             	add    $0x20,%esp
    11a7:	eb a9                	jmp    1152 <ls+0x52>
    11a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
    11b0:	83 ec 0c             	sub    $0xc,%esp
    11b3:	57                   	push   %edi
    11b4:	e8 17 02 00 00       	call   13d0 <strlen>
    11b9:	83 c4 10             	add    $0x10,%esp
    11bc:	83 c0 10             	add    $0x10,%eax
    11bf:	3d 00 02 00 00       	cmp    $0x200,%eax
    11c4:	0f 87 16 01 00 00    	ja     12e0 <ls+0x1e0>
    strcpy(buf, path);
    11ca:	83 ec 08             	sub    $0x8,%esp
    11cd:	57                   	push   %edi
    11ce:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
    11d4:	57                   	push   %edi
    11d5:	e8 66 01 00 00       	call   1340 <strcpy>
    p = buf+strlen(buf);
    11da:	89 3c 24             	mov    %edi,(%esp)
    11dd:	e8 ee 01 00 00       	call   13d0 <strlen>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
    11e2:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
    11e5:	01 f8                	add    %edi,%eax
    *p++ = '/';
    11e7:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
    11ea:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    *p++ = '/';
    11f0:	89 8d a4 fd ff ff    	mov    %ecx,-0x25c(%ebp)
    11f6:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
    11f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1200:	83 ec 04             	sub    $0x4,%esp
    1203:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
    1209:	6a 10                	push   $0x10
    120b:	50                   	push   %eax
    120c:	53                   	push   %ebx
    120d:	e8 99 03 00 00       	call   15ab <read>
    1212:	83 c4 10             	add    $0x10,%esp
    1215:	83 f8 10             	cmp    $0x10,%eax
    1218:	0f 85 34 ff ff ff    	jne    1152 <ls+0x52>
      if(de.inum == 0)
    121e:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
    1225:	00 
    1226:	74 d8                	je     1200 <ls+0x100>
      memmove(p, de.name, DIRSIZ);
    1228:	83 ec 04             	sub    $0x4,%esp
    122b:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
    1231:	6a 0e                	push   $0xe
    1233:	50                   	push   %eax
    1234:	ff b5 a4 fd ff ff    	push   -0x25c(%ebp)
    123a:	e8 21 03 00 00       	call   1560 <memmove>
      p[DIRSIZ] = 0;
    123f:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
    1245:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
    1249:	58                   	pop    %eax
    124a:	5a                   	pop    %edx
    124b:	56                   	push   %esi
    124c:	57                   	push   %edi
    124d:	e8 7e 02 00 00       	call   14d0 <stat>
    1252:	83 c4 10             	add    $0x10,%esp
    1255:	85 c0                	test   %eax,%eax
    1257:	0f 88 cb 00 00 00    	js     1328 <ls+0x228>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    125d:	83 ec 0c             	sub    $0xc,%esp
    1260:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
    1266:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
    126c:	57                   	push   %edi
    126d:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
    1274:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
    127a:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
    1280:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
    1286:	e8 d5 fd ff ff       	call   1060 <fmtname>
    128b:	5a                   	pop    %edx
    128c:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
    1292:	59                   	pop    %ecx
    1293:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
    1299:	51                   	push   %ecx
    129a:	52                   	push   %edx
    129b:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
    12a1:	50                   	push   %eax
    12a2:	68 50 1a 00 00       	push   $0x1a50
    12a7:	6a 01                	push   $0x1
    12a9:	e8 52 04 00 00       	call   1700 <printf>
    12ae:	83 c4 20             	add    $0x20,%esp
    12b1:	e9 4a ff ff ff       	jmp    1200 <ls+0x100>
    12b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12bd:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "ls: cannot open %s\n", path);
    12c0:	83 ec 04             	sub    $0x4,%esp
    12c3:	57                   	push   %edi
    12c4:	68 28 1a 00 00       	push   $0x1a28
    12c9:	6a 02                	push   $0x2
    12cb:	e8 30 04 00 00       	call   1700 <printf>
    return;
    12d0:	83 c4 10             	add    $0x10,%esp
}
    12d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12d6:	5b                   	pop    %ebx
    12d7:	5e                   	pop    %esi
    12d8:	5f                   	pop    %edi
    12d9:	5d                   	pop    %ebp
    12da:	c3                   	ret    
    12db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12df:	90                   	nop
      printf(1, "ls: path too long\n");
    12e0:	83 ec 08             	sub    $0x8,%esp
    12e3:	68 5d 1a 00 00       	push   $0x1a5d
    12e8:	6a 01                	push   $0x1
    12ea:	e8 11 04 00 00       	call   1700 <printf>
      break;
    12ef:	83 c4 10             	add    $0x10,%esp
    12f2:	e9 5b fe ff ff       	jmp    1152 <ls+0x52>
    12f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12fe:	66 90                	xchg   %ax,%ax
    printf(2, "ls: cannot stat %s\n", path);
    1300:	83 ec 04             	sub    $0x4,%esp
    1303:	57                   	push   %edi
    1304:	68 3c 1a 00 00       	push   $0x1a3c
    1309:	6a 02                	push   $0x2
    130b:	e8 f0 03 00 00       	call   1700 <printf>
    close(fd);
    1310:	89 1c 24             	mov    %ebx,(%esp)
    1313:	e8 a3 02 00 00       	call   15bb <close>
    return;
    1318:	83 c4 10             	add    $0x10,%esp
}
    131b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    131e:	5b                   	pop    %ebx
    131f:	5e                   	pop    %esi
    1320:	5f                   	pop    %edi
    1321:	5d                   	pop    %ebp
    1322:	c3                   	ret    
    1323:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1327:	90                   	nop
        printf(1, "ls: cannot stat %s\n", buf);
    1328:	83 ec 04             	sub    $0x4,%esp
    132b:	57                   	push   %edi
    132c:	68 3c 1a 00 00       	push   $0x1a3c
    1331:	6a 01                	push   $0x1
    1333:	e8 c8 03 00 00       	call   1700 <printf>
        continue;
    1338:	83 c4 10             	add    $0x10,%esp
    133b:	e9 c0 fe ff ff       	jmp    1200 <ls+0x100>

00001340 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1340:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1341:	31 c0                	xor    %eax,%eax
{
    1343:	89 e5                	mov    %esp,%ebp
    1345:	53                   	push   %ebx
    1346:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1349:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    134c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1350:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1354:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1357:	83 c0 01             	add    $0x1,%eax
    135a:	84 d2                	test   %dl,%dl
    135c:	75 f2                	jne    1350 <strcpy+0x10>
    ;
  return os;
}
    135e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1361:	89 c8                	mov    %ecx,%eax
    1363:	c9                   	leave  
    1364:	c3                   	ret    
    1365:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    136c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001370 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1370:	55                   	push   %ebp
    1371:	89 e5                	mov    %esp,%ebp
    1373:	53                   	push   %ebx
    1374:	8b 55 08             	mov    0x8(%ebp),%edx
    1377:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    137a:	0f b6 02             	movzbl (%edx),%eax
    137d:	84 c0                	test   %al,%al
    137f:	75 17                	jne    1398 <strcmp+0x28>
    1381:	eb 3a                	jmp    13bd <strcmp+0x4d>
    1383:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1387:	90                   	nop
    1388:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    138c:	83 c2 01             	add    $0x1,%edx
    138f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    1392:	84 c0                	test   %al,%al
    1394:	74 1a                	je     13b0 <strcmp+0x40>
    p++, q++;
    1396:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    1398:	0f b6 19             	movzbl (%ecx),%ebx
    139b:	38 c3                	cmp    %al,%bl
    139d:	74 e9                	je     1388 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    139f:	29 d8                	sub    %ebx,%eax
}
    13a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    13a4:	c9                   	leave  
    13a5:	c3                   	ret    
    13a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13ad:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    13b0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    13b4:	31 c0                	xor    %eax,%eax
    13b6:	29 d8                	sub    %ebx,%eax
}
    13b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    13bb:	c9                   	leave  
    13bc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    13bd:	0f b6 19             	movzbl (%ecx),%ebx
    13c0:	31 c0                	xor    %eax,%eax
    13c2:	eb db                	jmp    139f <strcmp+0x2f>
    13c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    13cf:	90                   	nop

000013d0 <strlen>:

uint
strlen(const char *s)
{
    13d0:	55                   	push   %ebp
    13d1:	89 e5                	mov    %esp,%ebp
    13d3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    13d6:	80 3a 00             	cmpb   $0x0,(%edx)
    13d9:	74 15                	je     13f0 <strlen+0x20>
    13db:	31 c0                	xor    %eax,%eax
    13dd:	8d 76 00             	lea    0x0(%esi),%esi
    13e0:	83 c0 01             	add    $0x1,%eax
    13e3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    13e7:	89 c1                	mov    %eax,%ecx
    13e9:	75 f5                	jne    13e0 <strlen+0x10>
    ;
  return n;
}
    13eb:	89 c8                	mov    %ecx,%eax
    13ed:	5d                   	pop    %ebp
    13ee:	c3                   	ret    
    13ef:	90                   	nop
  for(n = 0; s[n]; n++)
    13f0:	31 c9                	xor    %ecx,%ecx
}
    13f2:	5d                   	pop    %ebp
    13f3:	89 c8                	mov    %ecx,%eax
    13f5:	c3                   	ret    
    13f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13fd:	8d 76 00             	lea    0x0(%esi),%esi

00001400 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1400:	55                   	push   %ebp
    1401:	89 e5                	mov    %esp,%ebp
    1403:	57                   	push   %edi
    1404:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1407:	8b 4d 10             	mov    0x10(%ebp),%ecx
    140a:	8b 45 0c             	mov    0xc(%ebp),%eax
    140d:	89 d7                	mov    %edx,%edi
    140f:	fc                   	cld    
    1410:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1412:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1415:	89 d0                	mov    %edx,%eax
    1417:	c9                   	leave  
    1418:	c3                   	ret    
    1419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001420 <strchr>:

char*
strchr(const char *s, char c)
{
    1420:	55                   	push   %ebp
    1421:	89 e5                	mov    %esp,%ebp
    1423:	8b 45 08             	mov    0x8(%ebp),%eax
    1426:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    142a:	0f b6 10             	movzbl (%eax),%edx
    142d:	84 d2                	test   %dl,%dl
    142f:	75 12                	jne    1443 <strchr+0x23>
    1431:	eb 1d                	jmp    1450 <strchr+0x30>
    1433:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1437:	90                   	nop
    1438:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    143c:	83 c0 01             	add    $0x1,%eax
    143f:	84 d2                	test   %dl,%dl
    1441:	74 0d                	je     1450 <strchr+0x30>
    if(*s == c)
    1443:	38 d1                	cmp    %dl,%cl
    1445:	75 f1                	jne    1438 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1447:	5d                   	pop    %ebp
    1448:	c3                   	ret    
    1449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1450:	31 c0                	xor    %eax,%eax
}
    1452:	5d                   	pop    %ebp
    1453:	c3                   	ret    
    1454:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    145b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    145f:	90                   	nop

00001460 <gets>:

char*
gets(char *buf, int max)
{
    1460:	55                   	push   %ebp
    1461:	89 e5                	mov    %esp,%ebp
    1463:	57                   	push   %edi
    1464:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    1465:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    1468:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    1469:	31 db                	xor    %ebx,%ebx
{
    146b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    146e:	eb 27                	jmp    1497 <gets+0x37>
    cc = read(0, &c, 1);
    1470:	83 ec 04             	sub    $0x4,%esp
    1473:	6a 01                	push   $0x1
    1475:	57                   	push   %edi
    1476:	6a 00                	push   $0x0
    1478:	e8 2e 01 00 00       	call   15ab <read>
    if(cc < 1)
    147d:	83 c4 10             	add    $0x10,%esp
    1480:	85 c0                	test   %eax,%eax
    1482:	7e 1d                	jle    14a1 <gets+0x41>
      break;
    buf[i++] = c;
    1484:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1488:	8b 55 08             	mov    0x8(%ebp),%edx
    148b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    148f:	3c 0a                	cmp    $0xa,%al
    1491:	74 1d                	je     14b0 <gets+0x50>
    1493:	3c 0d                	cmp    $0xd,%al
    1495:	74 19                	je     14b0 <gets+0x50>
  for(i=0; i+1 < max; ){
    1497:	89 de                	mov    %ebx,%esi
    1499:	83 c3 01             	add    $0x1,%ebx
    149c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    149f:	7c cf                	jl     1470 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    14a1:	8b 45 08             	mov    0x8(%ebp),%eax
    14a4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    14a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14ab:	5b                   	pop    %ebx
    14ac:	5e                   	pop    %esi
    14ad:	5f                   	pop    %edi
    14ae:	5d                   	pop    %ebp
    14af:	c3                   	ret    
  buf[i] = '\0';
    14b0:	8b 45 08             	mov    0x8(%ebp),%eax
    14b3:	89 de                	mov    %ebx,%esi
    14b5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    14b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14bc:	5b                   	pop    %ebx
    14bd:	5e                   	pop    %esi
    14be:	5f                   	pop    %edi
    14bf:	5d                   	pop    %ebp
    14c0:	c3                   	ret    
    14c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14cf:	90                   	nop

000014d0 <stat>:

int
stat(const char *n, struct stat *st)
{
    14d0:	55                   	push   %ebp
    14d1:	89 e5                	mov    %esp,%ebp
    14d3:	56                   	push   %esi
    14d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    14d5:	83 ec 08             	sub    $0x8,%esp
    14d8:	6a 00                	push   $0x0
    14da:	ff 75 08             	push   0x8(%ebp)
    14dd:	e8 f1 00 00 00       	call   15d3 <open>
  if(fd < 0)
    14e2:	83 c4 10             	add    $0x10,%esp
    14e5:	85 c0                	test   %eax,%eax
    14e7:	78 27                	js     1510 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    14e9:	83 ec 08             	sub    $0x8,%esp
    14ec:	ff 75 0c             	push   0xc(%ebp)
    14ef:	89 c3                	mov    %eax,%ebx
    14f1:	50                   	push   %eax
    14f2:	e8 f4 00 00 00       	call   15eb <fstat>
  close(fd);
    14f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    14fa:	89 c6                	mov    %eax,%esi
  close(fd);
    14fc:	e8 ba 00 00 00       	call   15bb <close>
  return r;
    1501:	83 c4 10             	add    $0x10,%esp
}
    1504:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1507:	89 f0                	mov    %esi,%eax
    1509:	5b                   	pop    %ebx
    150a:	5e                   	pop    %esi
    150b:	5d                   	pop    %ebp
    150c:	c3                   	ret    
    150d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1510:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1515:	eb ed                	jmp    1504 <stat+0x34>
    1517:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    151e:	66 90                	xchg   %ax,%ax

00001520 <atoi>:

int
atoi(const char *s)
{
    1520:	55                   	push   %ebp
    1521:	89 e5                	mov    %esp,%ebp
    1523:	53                   	push   %ebx
    1524:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1527:	0f be 02             	movsbl (%edx),%eax
    152a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    152d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1530:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1535:	77 1e                	ja     1555 <atoi+0x35>
    1537:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    153e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1540:	83 c2 01             	add    $0x1,%edx
    1543:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1546:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    154a:	0f be 02             	movsbl (%edx),%eax
    154d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1550:	80 fb 09             	cmp    $0x9,%bl
    1553:	76 eb                	jbe    1540 <atoi+0x20>
  return n;
}
    1555:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1558:	89 c8                	mov    %ecx,%eax
    155a:	c9                   	leave  
    155b:	c3                   	ret    
    155c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001560 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1560:	55                   	push   %ebp
    1561:	89 e5                	mov    %esp,%ebp
    1563:	57                   	push   %edi
    1564:	8b 45 10             	mov    0x10(%ebp),%eax
    1567:	8b 55 08             	mov    0x8(%ebp),%edx
    156a:	56                   	push   %esi
    156b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    156e:	85 c0                	test   %eax,%eax
    1570:	7e 13                	jle    1585 <memmove+0x25>
    1572:	01 d0                	add    %edx,%eax
  dst = vdst;
    1574:	89 d7                	mov    %edx,%edi
    1576:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    157d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1580:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1581:	39 f8                	cmp    %edi,%eax
    1583:	75 fb                	jne    1580 <memmove+0x20>
  return vdst;
}
    1585:	5e                   	pop    %esi
    1586:	89 d0                	mov    %edx,%eax
    1588:	5f                   	pop    %edi
    1589:	5d                   	pop    %ebp
    158a:	c3                   	ret    

0000158b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    158b:	b8 01 00 00 00       	mov    $0x1,%eax
    1590:	cd 40                	int    $0x40
    1592:	c3                   	ret    

00001593 <exit>:
SYSCALL(exit)
    1593:	b8 02 00 00 00       	mov    $0x2,%eax
    1598:	cd 40                	int    $0x40
    159a:	c3                   	ret    

0000159b <wait>:
SYSCALL(wait)
    159b:	b8 03 00 00 00       	mov    $0x3,%eax
    15a0:	cd 40                	int    $0x40
    15a2:	c3                   	ret    

000015a3 <pipe>:
SYSCALL(pipe)
    15a3:	b8 04 00 00 00       	mov    $0x4,%eax
    15a8:	cd 40                	int    $0x40
    15aa:	c3                   	ret    

000015ab <read>:
SYSCALL(read)
    15ab:	b8 05 00 00 00       	mov    $0x5,%eax
    15b0:	cd 40                	int    $0x40
    15b2:	c3                   	ret    

000015b3 <write>:
SYSCALL(write)
    15b3:	b8 10 00 00 00       	mov    $0x10,%eax
    15b8:	cd 40                	int    $0x40
    15ba:	c3                   	ret    

000015bb <close>:
SYSCALL(close)
    15bb:	b8 15 00 00 00       	mov    $0x15,%eax
    15c0:	cd 40                	int    $0x40
    15c2:	c3                   	ret    

000015c3 <kill>:
SYSCALL(kill)
    15c3:	b8 06 00 00 00       	mov    $0x6,%eax
    15c8:	cd 40                	int    $0x40
    15ca:	c3                   	ret    

000015cb <exec>:
SYSCALL(exec)
    15cb:	b8 07 00 00 00       	mov    $0x7,%eax
    15d0:	cd 40                	int    $0x40
    15d2:	c3                   	ret    

000015d3 <open>:
SYSCALL(open)
    15d3:	b8 0f 00 00 00       	mov    $0xf,%eax
    15d8:	cd 40                	int    $0x40
    15da:	c3                   	ret    

000015db <mknod>:
SYSCALL(mknod)
    15db:	b8 11 00 00 00       	mov    $0x11,%eax
    15e0:	cd 40                	int    $0x40
    15e2:	c3                   	ret    

000015e3 <unlink>:
SYSCALL(unlink)
    15e3:	b8 12 00 00 00       	mov    $0x12,%eax
    15e8:	cd 40                	int    $0x40
    15ea:	c3                   	ret    

000015eb <fstat>:
SYSCALL(fstat)
    15eb:	b8 08 00 00 00       	mov    $0x8,%eax
    15f0:	cd 40                	int    $0x40
    15f2:	c3                   	ret    

000015f3 <link>:
SYSCALL(link)
    15f3:	b8 13 00 00 00       	mov    $0x13,%eax
    15f8:	cd 40                	int    $0x40
    15fa:	c3                   	ret    

000015fb <mkdir>:
SYSCALL(mkdir)
    15fb:	b8 14 00 00 00       	mov    $0x14,%eax
    1600:	cd 40                	int    $0x40
    1602:	c3                   	ret    

00001603 <chdir>:
SYSCALL(chdir)
    1603:	b8 09 00 00 00       	mov    $0x9,%eax
    1608:	cd 40                	int    $0x40
    160a:	c3                   	ret    

0000160b <dup>:
SYSCALL(dup)
    160b:	b8 0a 00 00 00       	mov    $0xa,%eax
    1610:	cd 40                	int    $0x40
    1612:	c3                   	ret    

00001613 <getpid>:
SYSCALL(getpid)
    1613:	b8 0b 00 00 00       	mov    $0xb,%eax
    1618:	cd 40                	int    $0x40
    161a:	c3                   	ret    

0000161b <sbrk>:
SYSCALL(sbrk)
    161b:	b8 0c 00 00 00       	mov    $0xc,%eax
    1620:	cd 40                	int    $0x40
    1622:	c3                   	ret    

00001623 <sleep>:
SYSCALL(sleep)
    1623:	b8 0d 00 00 00       	mov    $0xd,%eax
    1628:	cd 40                	int    $0x40
    162a:	c3                   	ret    

0000162b <uptime>:
SYSCALL(uptime)
    162b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1630:	cd 40                	int    $0x40
    1632:	c3                   	ret    

00001633 <getpinfo>:

SYSCALL(getpinfo)
    1633:	b8 16 00 00 00       	mov    $0x16,%eax
    1638:	cd 40                	int    $0x40
    163a:	c3                   	ret    

0000163b <settickets>:
SYSCALL(settickets)
    163b:	b8 17 00 00 00       	mov    $0x17,%eax
    1640:	cd 40                	int    $0x40
    1642:	c3                   	ret    
    1643:	66 90                	xchg   %ax,%ax
    1645:	66 90                	xchg   %ax,%ax
    1647:	66 90                	xchg   %ax,%ax
    1649:	66 90                	xchg   %ax,%ax
    164b:	66 90                	xchg   %ax,%ax
    164d:	66 90                	xchg   %ax,%ax
    164f:	90                   	nop

00001650 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1650:	55                   	push   %ebp
    1651:	89 e5                	mov    %esp,%ebp
    1653:	57                   	push   %edi
    1654:	56                   	push   %esi
    1655:	53                   	push   %ebx
    1656:	83 ec 3c             	sub    $0x3c,%esp
    1659:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    165c:	89 d1                	mov    %edx,%ecx
{
    165e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1661:	85 d2                	test   %edx,%edx
    1663:	0f 89 7f 00 00 00    	jns    16e8 <printint+0x98>
    1669:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    166d:	74 79                	je     16e8 <printint+0x98>
    neg = 1;
    166f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1676:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1678:	31 db                	xor    %ebx,%ebx
    167a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    167d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1680:	89 c8                	mov    %ecx,%eax
    1682:	31 d2                	xor    %edx,%edx
    1684:	89 cf                	mov    %ecx,%edi
    1686:	f7 75 c4             	divl   -0x3c(%ebp)
    1689:	0f b6 92 d4 1a 00 00 	movzbl 0x1ad4(%edx),%edx
    1690:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1693:	89 d8                	mov    %ebx,%eax
    1695:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1698:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    169b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    169e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    16a1:	76 dd                	jbe    1680 <printint+0x30>
  if(neg)
    16a3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    16a6:	85 c9                	test   %ecx,%ecx
    16a8:	74 0c                	je     16b6 <printint+0x66>
    buf[i++] = '-';
    16aa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    16af:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    16b1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    16b6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    16b9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    16bd:	eb 07                	jmp    16c6 <printint+0x76>
    16bf:	90                   	nop
    putc(fd, buf[i]);
    16c0:	0f b6 13             	movzbl (%ebx),%edx
    16c3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    16c6:	83 ec 04             	sub    $0x4,%esp
    16c9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    16cc:	6a 01                	push   $0x1
    16ce:	56                   	push   %esi
    16cf:	57                   	push   %edi
    16d0:	e8 de fe ff ff       	call   15b3 <write>
  while(--i >= 0)
    16d5:	83 c4 10             	add    $0x10,%esp
    16d8:	39 de                	cmp    %ebx,%esi
    16da:	75 e4                	jne    16c0 <printint+0x70>
}
    16dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    16df:	5b                   	pop    %ebx
    16e0:	5e                   	pop    %esi
    16e1:	5f                   	pop    %edi
    16e2:	5d                   	pop    %ebp
    16e3:	c3                   	ret    
    16e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    16e8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    16ef:	eb 87                	jmp    1678 <printint+0x28>
    16f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    16f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    16ff:	90                   	nop

00001700 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1700:	55                   	push   %ebp
    1701:	89 e5                	mov    %esp,%ebp
    1703:	57                   	push   %edi
    1704:	56                   	push   %esi
    1705:	53                   	push   %ebx
    1706:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1709:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    170c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    170f:	0f b6 13             	movzbl (%ebx),%edx
    1712:	84 d2                	test   %dl,%dl
    1714:	74 6a                	je     1780 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    1716:	8d 45 10             	lea    0x10(%ebp),%eax
    1719:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    171c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    171f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    1721:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1724:	eb 36                	jmp    175c <printf+0x5c>
    1726:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    172d:	8d 76 00             	lea    0x0(%esi),%esi
    1730:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1733:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1738:	83 f8 25             	cmp    $0x25,%eax
    173b:	74 15                	je     1752 <printf+0x52>
  write(fd, &c, 1);
    173d:	83 ec 04             	sub    $0x4,%esp
    1740:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1743:	6a 01                	push   $0x1
    1745:	57                   	push   %edi
    1746:	56                   	push   %esi
    1747:	e8 67 fe ff ff       	call   15b3 <write>
    174c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    174f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1752:	0f b6 13             	movzbl (%ebx),%edx
    1755:	83 c3 01             	add    $0x1,%ebx
    1758:	84 d2                	test   %dl,%dl
    175a:	74 24                	je     1780 <printf+0x80>
    c = fmt[i] & 0xff;
    175c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    175f:	85 c9                	test   %ecx,%ecx
    1761:	74 cd                	je     1730 <printf+0x30>
      }
    } else if(state == '%'){
    1763:	83 f9 25             	cmp    $0x25,%ecx
    1766:	75 ea                	jne    1752 <printf+0x52>
      if(c == 'd'){
    1768:	83 f8 25             	cmp    $0x25,%eax
    176b:	0f 84 07 01 00 00    	je     1878 <printf+0x178>
    1771:	83 e8 63             	sub    $0x63,%eax
    1774:	83 f8 15             	cmp    $0x15,%eax
    1777:	77 17                	ja     1790 <printf+0x90>
    1779:	ff 24 85 7c 1a 00 00 	jmp    *0x1a7c(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1780:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1783:	5b                   	pop    %ebx
    1784:	5e                   	pop    %esi
    1785:	5f                   	pop    %edi
    1786:	5d                   	pop    %ebp
    1787:	c3                   	ret    
    1788:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    178f:	90                   	nop
  write(fd, &c, 1);
    1790:	83 ec 04             	sub    $0x4,%esp
    1793:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    1796:	6a 01                	push   $0x1
    1798:	57                   	push   %edi
    1799:	56                   	push   %esi
    179a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    179e:	e8 10 fe ff ff       	call   15b3 <write>
        putc(fd, c);
    17a3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    17a7:	83 c4 0c             	add    $0xc,%esp
    17aa:	88 55 e7             	mov    %dl,-0x19(%ebp)
    17ad:	6a 01                	push   $0x1
    17af:	57                   	push   %edi
    17b0:	56                   	push   %esi
    17b1:	e8 fd fd ff ff       	call   15b3 <write>
        putc(fd, c);
    17b6:	83 c4 10             	add    $0x10,%esp
      state = 0;
    17b9:	31 c9                	xor    %ecx,%ecx
    17bb:	eb 95                	jmp    1752 <printf+0x52>
    17bd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    17c0:	83 ec 0c             	sub    $0xc,%esp
    17c3:	b9 10 00 00 00       	mov    $0x10,%ecx
    17c8:	6a 00                	push   $0x0
    17ca:	8b 45 d0             	mov    -0x30(%ebp),%eax
    17cd:	8b 10                	mov    (%eax),%edx
    17cf:	89 f0                	mov    %esi,%eax
    17d1:	e8 7a fe ff ff       	call   1650 <printint>
        ap++;
    17d6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    17da:	83 c4 10             	add    $0x10,%esp
      state = 0;
    17dd:	31 c9                	xor    %ecx,%ecx
    17df:	e9 6e ff ff ff       	jmp    1752 <printf+0x52>
    17e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    17e8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    17eb:	8b 10                	mov    (%eax),%edx
        ap++;
    17ed:	83 c0 04             	add    $0x4,%eax
    17f0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    17f3:	85 d2                	test   %edx,%edx
    17f5:	0f 84 8d 00 00 00    	je     1888 <printf+0x188>
        while(*s != 0){
    17fb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    17fe:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    1800:	84 c0                	test   %al,%al
    1802:	0f 84 4a ff ff ff    	je     1752 <printf+0x52>
    1808:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    180b:	89 d3                	mov    %edx,%ebx
    180d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1810:	83 ec 04             	sub    $0x4,%esp
          s++;
    1813:	83 c3 01             	add    $0x1,%ebx
    1816:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1819:	6a 01                	push   $0x1
    181b:	57                   	push   %edi
    181c:	56                   	push   %esi
    181d:	e8 91 fd ff ff       	call   15b3 <write>
        while(*s != 0){
    1822:	0f b6 03             	movzbl (%ebx),%eax
    1825:	83 c4 10             	add    $0x10,%esp
    1828:	84 c0                	test   %al,%al
    182a:	75 e4                	jne    1810 <printf+0x110>
      state = 0;
    182c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    182f:	31 c9                	xor    %ecx,%ecx
    1831:	e9 1c ff ff ff       	jmp    1752 <printf+0x52>
    1836:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    183d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1840:	83 ec 0c             	sub    $0xc,%esp
    1843:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1848:	6a 01                	push   $0x1
    184a:	e9 7b ff ff ff       	jmp    17ca <printf+0xca>
    184f:	90                   	nop
        putc(fd, *ap);
    1850:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1853:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1856:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1858:	6a 01                	push   $0x1
    185a:	57                   	push   %edi
    185b:	56                   	push   %esi
        putc(fd, *ap);
    185c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    185f:	e8 4f fd ff ff       	call   15b3 <write>
        ap++;
    1864:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1868:	83 c4 10             	add    $0x10,%esp
      state = 0;
    186b:	31 c9                	xor    %ecx,%ecx
    186d:	e9 e0 fe ff ff       	jmp    1752 <printf+0x52>
    1872:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    1878:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    187b:	83 ec 04             	sub    $0x4,%esp
    187e:	e9 2a ff ff ff       	jmp    17ad <printf+0xad>
    1883:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1887:	90                   	nop
          s = "(null)";
    1888:	ba 72 1a 00 00       	mov    $0x1a72,%edx
        while(*s != 0){
    188d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    1890:	b8 28 00 00 00       	mov    $0x28,%eax
    1895:	89 d3                	mov    %edx,%ebx
    1897:	e9 74 ff ff ff       	jmp    1810 <printf+0x110>
    189c:	66 90                	xchg   %ax,%ax
    189e:	66 90                	xchg   %ax,%ax

000018a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    18a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    18a1:	a1 14 1e 00 00       	mov    0x1e14,%eax
{
    18a6:	89 e5                	mov    %esp,%ebp
    18a8:	57                   	push   %edi
    18a9:	56                   	push   %esi
    18aa:	53                   	push   %ebx
    18ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    18ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    18b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    18b8:	89 c2                	mov    %eax,%edx
    18ba:	8b 00                	mov    (%eax),%eax
    18bc:	39 ca                	cmp    %ecx,%edx
    18be:	73 30                	jae    18f0 <free+0x50>
    18c0:	39 c1                	cmp    %eax,%ecx
    18c2:	72 04                	jb     18c8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    18c4:	39 c2                	cmp    %eax,%edx
    18c6:	72 f0                	jb     18b8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    18c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    18cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    18ce:	39 f8                	cmp    %edi,%eax
    18d0:	74 30                	je     1902 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    18d2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    18d5:	8b 42 04             	mov    0x4(%edx),%eax
    18d8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    18db:	39 f1                	cmp    %esi,%ecx
    18dd:	74 3a                	je     1919 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    18df:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    18e1:	5b                   	pop    %ebx
  freep = p;
    18e2:	89 15 14 1e 00 00    	mov    %edx,0x1e14
}
    18e8:	5e                   	pop    %esi
    18e9:	5f                   	pop    %edi
    18ea:	5d                   	pop    %ebp
    18eb:	c3                   	ret    
    18ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    18f0:	39 c2                	cmp    %eax,%edx
    18f2:	72 c4                	jb     18b8 <free+0x18>
    18f4:	39 c1                	cmp    %eax,%ecx
    18f6:	73 c0                	jae    18b8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    18f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    18fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    18fe:	39 f8                	cmp    %edi,%eax
    1900:	75 d0                	jne    18d2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    1902:	03 70 04             	add    0x4(%eax),%esi
    1905:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1908:	8b 02                	mov    (%edx),%eax
    190a:	8b 00                	mov    (%eax),%eax
    190c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    190f:	8b 42 04             	mov    0x4(%edx),%eax
    1912:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1915:	39 f1                	cmp    %esi,%ecx
    1917:	75 c6                	jne    18df <free+0x3f>
    p->s.size += bp->s.size;
    1919:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    191c:	89 15 14 1e 00 00    	mov    %edx,0x1e14
    p->s.size += bp->s.size;
    1922:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1925:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1928:	89 0a                	mov    %ecx,(%edx)
}
    192a:	5b                   	pop    %ebx
    192b:	5e                   	pop    %esi
    192c:	5f                   	pop    %edi
    192d:	5d                   	pop    %ebp
    192e:	c3                   	ret    
    192f:	90                   	nop

00001930 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1930:	55                   	push   %ebp
    1931:	89 e5                	mov    %esp,%ebp
    1933:	57                   	push   %edi
    1934:	56                   	push   %esi
    1935:	53                   	push   %ebx
    1936:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1939:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    193c:	8b 3d 14 1e 00 00    	mov    0x1e14,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1942:	8d 70 07             	lea    0x7(%eax),%esi
    1945:	c1 ee 03             	shr    $0x3,%esi
    1948:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    194b:	85 ff                	test   %edi,%edi
    194d:	0f 84 9d 00 00 00    	je     19f0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1953:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1955:	8b 4a 04             	mov    0x4(%edx),%ecx
    1958:	39 f1                	cmp    %esi,%ecx
    195a:	73 6a                	jae    19c6 <malloc+0x96>
    195c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1961:	39 de                	cmp    %ebx,%esi
    1963:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1966:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    196d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1970:	eb 17                	jmp    1989 <malloc+0x59>
    1972:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1978:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    197a:	8b 48 04             	mov    0x4(%eax),%ecx
    197d:	39 f1                	cmp    %esi,%ecx
    197f:	73 4f                	jae    19d0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1981:	8b 3d 14 1e 00 00    	mov    0x1e14,%edi
    1987:	89 c2                	mov    %eax,%edx
    1989:	39 d7                	cmp    %edx,%edi
    198b:	75 eb                	jne    1978 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    198d:	83 ec 0c             	sub    $0xc,%esp
    1990:	ff 75 e4             	push   -0x1c(%ebp)
    1993:	e8 83 fc ff ff       	call   161b <sbrk>
  if(p == (char*)-1)
    1998:	83 c4 10             	add    $0x10,%esp
    199b:	83 f8 ff             	cmp    $0xffffffff,%eax
    199e:	74 1c                	je     19bc <malloc+0x8c>
  hp->s.size = nu;
    19a0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    19a3:	83 ec 0c             	sub    $0xc,%esp
    19a6:	83 c0 08             	add    $0x8,%eax
    19a9:	50                   	push   %eax
    19aa:	e8 f1 fe ff ff       	call   18a0 <free>
  return freep;
    19af:	8b 15 14 1e 00 00    	mov    0x1e14,%edx
      if((p = morecore(nunits)) == 0)
    19b5:	83 c4 10             	add    $0x10,%esp
    19b8:	85 d2                	test   %edx,%edx
    19ba:	75 bc                	jne    1978 <malloc+0x48>
        return 0;
  }
}
    19bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    19bf:	31 c0                	xor    %eax,%eax
}
    19c1:	5b                   	pop    %ebx
    19c2:	5e                   	pop    %esi
    19c3:	5f                   	pop    %edi
    19c4:	5d                   	pop    %ebp
    19c5:	c3                   	ret    
    if(p->s.size >= nunits){
    19c6:	89 d0                	mov    %edx,%eax
    19c8:	89 fa                	mov    %edi,%edx
    19ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    19d0:	39 ce                	cmp    %ecx,%esi
    19d2:	74 4c                	je     1a20 <malloc+0xf0>
        p->s.size -= nunits;
    19d4:	29 f1                	sub    %esi,%ecx
    19d6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    19d9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    19dc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    19df:	89 15 14 1e 00 00    	mov    %edx,0x1e14
}
    19e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    19e8:	83 c0 08             	add    $0x8,%eax
}
    19eb:	5b                   	pop    %ebx
    19ec:	5e                   	pop    %esi
    19ed:	5f                   	pop    %edi
    19ee:	5d                   	pop    %ebp
    19ef:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    19f0:	c7 05 14 1e 00 00 18 	movl   $0x1e18,0x1e14
    19f7:	1e 00 00 
    base.s.size = 0;
    19fa:	bf 18 1e 00 00       	mov    $0x1e18,%edi
    base.s.ptr = freep = prevp = &base;
    19ff:	c7 05 18 1e 00 00 18 	movl   $0x1e18,0x1e18
    1a06:	1e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1a09:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    1a0b:	c7 05 1c 1e 00 00 00 	movl   $0x0,0x1e1c
    1a12:	00 00 00 
    if(p->s.size >= nunits){
    1a15:	e9 42 ff ff ff       	jmp    195c <malloc+0x2c>
    1a1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1a20:	8b 08                	mov    (%eax),%ecx
    1a22:	89 0a                	mov    %ecx,(%edx)
    1a24:	eb b9                	jmp    19df <malloc+0xaf>
