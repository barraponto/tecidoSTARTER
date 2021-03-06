<?php
// $Id: default.profile,v 1.22 2007/12/17 12:43:34 goba Exp $

/**
 * Return an array of the modules to be enabled when this profile is installed.
 *
 * @return
 *   An array of modules to enable.
 */
function tecidoSTARTER_profile_modules() {
  return array(
    //install profile api
    //'install_profile_api',

    //core modules
    'comment', 'help', 'menu', 'path', 'search', 'taxonomy',

    //localization modules
    'locale', 'l10n_update', 'l10n_client',

    //build modules
    'ctools', 'context', 'features', 'pathauto', 'strongarm', 'views',

    //base cck modules
    'content', 'text', 'number', 'optionwidgets',

    //captcha modules
    //'captcha', 'recaptcha',

    //image modules
    //'filefield', 'filefield_paths', 'imagefield', 'imageapi', 'imageapi_gd', 'imagecache', 'imagefield_tokens', 

    //date modules
    //'date_api', 'date', 'date_timezone', 'date_popup', 'calendar', 'jquery_ui',

    //profile modules
    //'content_profile', 'context_content_profile',

    //geo modules
    //'openlayers', 'openlayers_cck', 'openlayers_views', 'openlayers_geocoder',

    //wysiwyg modules
    //'wysiwyg',

    //interface enhancement modules
    'admin', 'admin_theme', 'better_messages', 'nodeformcols', 'toolbar',

    //other contrib modules
    'adminrole', 'password', 'path_redirect', 'semanticviews', 'token', 'transliteration',
  );
}

/**
 * Return a description of the profile for the initial installation screen.
 *
 * @return
 *   An array with keys 'name' and 'description' describing this profile,
 *   and optional 'language' to override the language selection for
 *   language-specific profiles.
 */
function tecidoSTARTER_profile_details() {
  return array(
    'name' => 'Tecido Starter',
    'description' => 'Select this profile to have Tecido Starter installed.'
  );
}

/**
 * Return a list of tasks that this profile supports.
 *
 * @return
 *   A keyed array of tasks the profile will perform during
 *   the final stage. The keys of the array will be used internally,
 *   while the values will be displayed to the user in the installer
 *   task list.
 */
function tecidoSTARTER_profile_task_list() {
}

/**
 * Perform any final installation tasks for this profile.
 *
 * The installer goes through the profile-select -> locale-select
 * -> requirements -> database -> profile-install-batch
 * -> locale-initial-batch -> configure -> locale-remaining-batch
 * -> finished -> done tasks, in this order, if you don't implement
 * this function in your profile.
 *
 * If this function is implemented, you can have any number of
 * custom tasks to perform after 'configure', implementing a state
 * machine here to walk the user through those tasks. First time,
 * this function gets called with $task set to 'profile', and you
 * can advance to further tasks by setting $task to your tasks'
 * identifiers, used as array keys in the hook_profile_task_list()
 * above. You must avoid the reserved tasks listed in
 * install_reserved_tasks(). If you implement your custom tasks,
 * this function will get called in every HTTP request (for form
 * processing, printing your information screens and so on) until
 * you advance to the 'profile-finished' task, with which you
 * hand control back to the installer. Each custom page you
 * return needs to provide a way to continue, such as a form
 * submission or a link. You should also set custom page titles.
 *
 * You should define the list of custom tasks you implement by
 * returning an array of them in hook_profile_task_list(), as these
 * show up in the list of tasks on the installer user interface.
 *
 * Remember that the user will be able to reload the pages multiple
 * times, so you might want to use variable_set() and variable_get()
 * to remember your data and control further processing, if $task
 * is insufficient. Should a profile want to display a form here,
 * it can; the form should set '#redirect' to FALSE, and rely on
 * an action in the submit handler, such as variable_set(), to
 * detect submission and proceed to further tasks. See the configuration
 * form handling code in install_tasks() for an example.
 *
 * Important: Any temporary variables should be removed using
 * variable_del() before advancing to the 'profile-finished' phase.
 *
 * @param $task
 *   The current $task of the install system. When hook_profile_tasks()
 *   is first called, this is 'profile'.
 * @param $url
 *   Complete URL to be used for a link or form action on a custom page,
 *   if providing any, to allow the user to proceed with the installation.
 *
 * @return
 *   An optional HTML string to display to the user. Only used if you
 *   modify the $task, otherwise discarded.
 */
function tecidoSTARTER_profile_tasks(&$task, $url) {

  //set wysiwyg variables
  //db_query("INSERT INTO {wysiwyg} (format, editor, settings) VALUES ('%d', '%s', '%s')", 2, 'tinymce', tecidoSTARTER_wysiwyg_settings('tinymce'));

  // Update the menu router information.
  menu_rebuild();
}

/**
 * Implementation of hook_form_alter().
 *
 * Allows the profile to alter the site-configuration form. This is
 * called through custom invocation, so $form_state is not populated.
 */
function tecidoSTARTER_form_alter(&$form, $form_state, $form_id) {
  if ($form_id == 'install_configure') {
    // Set default for site name field.
    $form['site_information']['site_name']['#default_value'] = $_SERVER['SERVER_NAME'];
  }
}

/**
 * Tecido Profile Wisywyg settings support
 *
 * Returns settings for wysiwyg editors
 */
function tecidoSTARTER_wysiwyg_settings($editor) {
  switch($editor) {
    case 'tinymce':
      $settings = array(
      'default' => 1,
      'user_choose' => 0,
      'show_toggle' => 1,
      'theme' => 'advanced',
      'language' => 'en',
      'buttons' => array(
        'default' => array(
          'bold' => 1,
          'italic' => 1,
          'underline' => 1,
          'strikethrough' => 1,
          'justifyleft' => 1,
          'justifycenter' => 1,
          'justifyright' => 1,
          'justifyfull' => 1,
          'bullist' => 1,
          'numlist' => 1,
          'outdent' => 1,
          'indent' => 1,
          'undo' => 1,
          'redo' => 1,
          'link' => 1,
          'unlink' => 1,
          'blockquote' => 1, ), ),
      'toolbar_loc' => 'top',
      'toolbar_align' => 'left',
      'path_loc' => 'bottom',
      'resizing' => 1,
      'verify_html' => 1,
      'preformatted' => 0,
      'convert_fonts_to_spans' => 1,
      'remove_linebreaks' => 1,
      'apply_source_formatting' => 0,
      'paste_auto_cleanup_on_paste' => 1,
      'block_formats' => 'p,address,pre,h2,h3,h4,h5,h6,div',
      'css_setting' => 'theme',
      'css_path' => '',
      'css_classes' => '', );
      break;
    default:
      $settings = array();
      break;
    }
  return serialize($settings);
}
