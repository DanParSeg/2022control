function dexpr=derivada_t(expr,equiv)
    output=string(diff(expr,t));
    for i=1:size(equiv,1)
        eq=equiv(i,:);
        output=strrep(output,"diff("+eq(1)+"(t), t)",eq(2)+"(t)");
    end
    dexpr=output
end