# Pochita GRUB Theme

> **This is an auto-generated README**

## Installation

1. Extract the theme to your desired location:
   ```bash
   tar -xzf Pochita.tar.gz -C ~/MoFiles/grub/themes/
   ```

   Or if you already have the extracted folder, ensure the structure is:
   ```
   ~/MoFiles/grub/themes/Pochita/
   ├── theme.txt
   ├── logo.png
   ├── background.png
   ├── font.pf2
   └── select_*.png
   ```

2. Create the system GRUB themes directory (if it doesn't exist) and symlink the theme:
   ```bash
   sudo mkdir -p /usr/share/grub/themes
   sudo ln -sf ~/MoFiles/grub/themes/Pochita /usr/share/grub/themes/Pochita
   ```

3. Set the GRUB theme in `/etc/default/grub`:
   ```bash
   sudo sed -i 's|^#*GRUB_THEME=.*|GRUB_THEME="/usr/share/grub/themes/Pochita/theme.txt"|' /etc/default/grub
   ```

4. Regenerate the GRUB configuration:
   ```bash
   sudo grub-mkconfig -o /boot/grub/grub.cfg
   ```

5. Reboot your system to see the changes:
   ```bash
   sudo reboot
   ```

## Changing the Background

Replace the `background.png` file inside the theme directory with your own image (keep the same filename and format):

```bash
cp /path/to/your/image.png ~/MoFiles/grub/themes/Pochita/background.png
```

Then regenerate GRUB config and reboot:

```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo reboot
```

## Notes

- This theme has the distro icons folder (`icons/`) removed for a cleaner look.
- The main Pochita logo (`logo.png`) is retained.
- This theme supports any resolution.

## Credits

This theme is a slightly modified version of the original [HyDE](https://github.com/HyDE-Project/HyDE) project theme.
