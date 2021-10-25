'use strict'

const Main = imports.ui.main

/**
 * Reference to the old activities text.
 *
 * @var Gtk.Label
 */
let oldLabel

/**
 * Get Panel "Activities" button.
 *
 * @returns Gtk.St.Bin
 */
function _getPanelActivities() {
  return Main.panel.find_child_by_name('panelActivities')
}

/**
 * This function could be called after your extension is enabled, which could
 * be done from GNOME Tweaks, when you log in or when the screen is unlocked.
 *
 * @returns void
 */
function enable() {
  const panelActivities = _getPanelActivities()

  if (!panelActivities) return

  oldLabel = panelActivities._label.text

  panelActivities._label.text = '🚀  DevHammed'
}

/**
 * This function could be called after your extension is uninstalled, disabled
 * in GNOME Tweaks, when you log out or when the screen locks.
 *
 * @returns void
 */
function disable() {
  const panelActivities = _getPanelActivities()

  if (!panelActivities) return

  panelActivities._label.text = oldLabel
}
