#!/usr/bin/env python3
# create markdown documentation

import os, sys, re

docu_path = 'docs'
prompt = '>>>'

if not os.path.exists(docu_path):
    os.makedirs(docu_path)

# alias documentation
with open('%s/aliases.md' % (docu_path), mode='w', encoding='utf-8') as alias_docu_file:
    for file in sorted(os.listdir('.gitconfig.d/alias/')):
        if file == 'scripts':
            continue

        print('%s...' % (file))
        alias_docu_file.write('\n\n# %s\n' % (file))

        alias_file_str = open('.gitconfig.d/alias/%s' % (file)).read()
        for m in re.finditer(r"((?:^\s*#.*\n)+)?(\s*(.*?)\s*=.*)", alias_file_str, re.MULTILINE):
            show_alias = True
            alias_docu_str = '\n\n<a name="{0}"></a>\n## git {0}<a name="{0}"></a>\n\n'.format(m.group(3))
            if not m.group(1) is None:
                for doc in m.group(1).strip().split('\n'):
                    doc = doc.strip()
                    if doc.startswith('# ex'):
                        alias_docu_str += '\n**Example:**\n\n    %s %s\n' % (prompt, re.sub(r"^# ex\s*:?\s*", "", doc))
                    elif doc.startswith('# see'):
                        alias_docu_str += '\n**See:** [git {0}](#{0})\n'.format(re.sub(r"^# see\s*:?\s*", "", doc))
                    elif doc.startswith('# alias'):
                        alias_docu_str += '\n= [git {0}](#{0})\n'.format(re.sub(r"^# alias\s*:?\s*", "", doc))
                    elif doc.startswith('# >'):
                        alias_docu_str += '    %s\n' % (re.sub(r"^# >\s*:?\s*", "", doc))
                    elif doc.startswith('# nodoc'):
                        show_alias = False
                    elif doc.startswith('#'):
                        alias_docu_str += '%s\n' % (re.sub(r"^#\s*:?\s*", "", doc))
            alias_docu_str += '\n**Implementation:**\n\n    %s\n' % (m.group(2).strip())
            if show_alias:
                alias_docu_file.write(alias_docu_str)



# short alias documentation
with open('%s/aliases-quick.md' % (docu_path), mode='w', encoding='utf-8') as alias_quick_docu_file:
    for file in sorted(os.listdir('.gitconfig.d/alias/')):
        if file == 'scripts':
            continue

        print('%s (quick doc)...' % (file))
        alias_quick_docu_file.write('# %s\n<table>\n' % (file))

        alias_file_str = open('.gitconfig.d/alias/%s' % (file)).read()
        for m in re.finditer(r"((?:^\s*#.*\n)+)?(\s*([^ ]+?)\s*=.*)", alias_file_str, re.MULTILINE):
            show_alias = True
            alias_docu_str = '<tr><td><strong>git {0}</strong></td><td>'.format(m.group(3))
            if not m.group(1) is None:
                for doc in m.group(1).strip().split('\n'):
                    doc = doc.strip()
                    if doc.startswith('# ex'):
                        pass
                    elif doc.startswith('# see'):
                        pass
                    elif doc.startswith('# >'):
                        pass
                    elif doc.startswith('# nodoc'):
                        show_alias = False
                    elif doc.startswith('# alias'):
                        alias_docu_str += '↪ %s' % (re.sub(r"^#\s*alias\s*:?\s*", "", doc))
                        break
                    elif doc.startswith('#'):
                        alias_docu_str += '%s' % (re.sub(r"^#\s*", "", doc))
                        break
                alias_docu_str += '</td></tr>\n'
            else:
                alias_docu_str += '</td></tr>\n'
            if show_alias:
                alias_quick_docu_file.write(alias_docu_str)
        alias_quick_docu_file.write('</table>\n\n')
