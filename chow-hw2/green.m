function x = green(A, x, b, gs_run, kmax)
    x = gs(A, x, b, gs_run);
    r1 = (b - A*x);
    Plist = cell(kmax - 1, 1);
    Alist = cell(kmax, 1);
    rlist = cell(kmax, 1);
    elist = cell(kmax, 1);

    Alist{1} = A;
    rlist{1} = r1;

    for i = 1:kmax
        e0 = zeros(length(r1), 1);
        elist{i} = gs(Alist{i}, e0, rlist{i}, gs_run);
        if length(r1) == 1
            break
        end
        len = (length(r1)-1)/2;

        P21 = prolong(len);
        Plist{i} = P21;
        Alist{i+1} = gen1d(len);
        R12 = 0.5 * P21';

        r1 = R12 * r1;
        rlist{i+1} = r1;
    end

    delx_list = cell(kmax, 1);
    delx_list{kmax} = elist{kmax};
    alpha_list = zeros(kmax - 1, 1);

    for i = (kmax - 1):-1:1
        up = (rlist{i} - Alist{i}*elist{i})' * (Plist{i}*delx_list{i+1});
        down = (Alist{i}*Plist{i}*delx_list{i+1})'*(Plist{i}*delx_list{i+1});
        alpha_list(i) = up/down;
        delx_list{i} = elist{i} + alpha_list(i)*Plist{i}*delx_list{i+1};
    end

    result = delx_list{1};
    x = result + x;
end