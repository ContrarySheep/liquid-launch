require 'spec_helper'

describe ApplicationHelper do
  
  it "renders html from an xml string" do
    example_xml = File.expand_path("../../support/example.xml", __FILE__)
    plist = File.read example_xml
    helper.render_xml_as_html(plist).should eq("&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot;?&gt;<br>&lt;content&gt;<br>&nbsp;&nbsp;&lt;name&gt;Sample&lt;/name&gt;<br>&nbsp;&nbsp;&lt;subcontent&gt;<br>&nbsp;&nbsp;&nbsp;&nbsp;&lt;name&gt;Sub-Sample-1&lt;/name&gt;<br>&nbsp;&nbsp;&nbsp;&nbsp;&lt;name&gt;Sub-Sample-2&lt;/name&gt;<br>&nbsp;&nbsp;&lt;/subcontent&gt;<br>&lt;/content&gt;")
  end
  
end
