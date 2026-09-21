import { execSync } from 'node:child_process';
import { mkdirSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';

// 定位项目根目录（脚本位于 <root>/scripts/）
const root = join(dirname(fileURLToPath(import.meta.url)), '..');
const templateDir = join(root, 'template');
const outDir = join(root, 'docs', 'public', 'downloads');
const zipPath = join(outDir, 'template.zip');

mkdirSync(outDir, { recursive: true });

if (process.platform === 'win32') {
  console.warn('⚠️  Windows 下暂未自动打包，请手动将 template/ 打包为 docs/public/downloads/template.zip');
  process.exit(0);
}

// 在 template 目录内执行 zip。注意用 "." 而非 "./*"，才能包含 .codebuddy 这类隐藏目录。
execSync(`zip -r -q "${zipPath}" . -x "*.DS_Store" "__MACOSX/*"`, {
  cwd: templateDir,
  stdio: 'inherit',
});

console.log('✅ 已生成 docs/public/downloads/template.zip');
